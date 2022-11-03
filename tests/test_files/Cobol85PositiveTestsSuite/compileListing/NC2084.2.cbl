1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:21   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:21   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2084.2
   000002         000200 PROGRAM-ID.                                                      NC2084.2
   000003         000300     NC208A.                                                      NC2084.2
   000004         000500*                                                              *  NC2084.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2084.2
   000006         000700*                                                              *  NC2084.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2084.2
   000008         000900*                                                              *  NC2084.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2084.2
   000010         001100*                                                              *  NC2084.2
   000011         001300*                                                              *  NC2084.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2084.2
   000013         001500*                                                              *  NC2084.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2084.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2084.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2084.2
   000017         001900*                                                              *  NC2084.2
   000018         002100                                                                  NC2084.2
   000019         002200*                                                              *  NC2084.2
   000020         002300*    PROGRAM NC208A TESTS FORMATS 1 AND 2 OF QUALIFICATION*       NC2084.2
   000021         002400*    USING FORMATS 1 AND 2 OF THE "MOVE" STATEMENT, FORMAT 1 OF*  NC2084.2
   000022         002500*    THE "ADD" STATEMENT AND THE FORMAT 2 "MULTIPLY" STATEMENT.*  NC2084.2
   000023         002600*                                                              *  NC2084.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2084.2
   000025         002900 CONFIGURATION SECTION.                                           NC2084.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2084.2
   000027         003100     XXXXX082.                                                    NC2084.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2084.2
   000029         003300     XXXXX083.                                                    NC2084.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2084.2
   000031         003500 FILE-CONTROL.                                                    NC2084.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2084.2 36
   000033         003700     XXXXX055.                                                    NC2084.2
   000034         003800 DATA DIVISION.                                                   NC2084.2
   000035         003900 FILE SECTION.                                                    NC2084.2
   000036         004000 FD  PRINT-FILE.                                                  NC2084.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2084.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2084.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2084.2
   000040         004400 77  QT1      PICTURE XXXX VALUE SPACE.                           NC2084.2 IMP
   000041         004500 77  QT2      PICTURE XXXX VALUE SPACE.                           NC2084.2 IMP
   000042         004600 77  QT3      PICTURE XXXX VALUE SPACE.                           NC2084.2 IMP
   000043         004700 77  QT4      PICTURE XXXX VALUE SPACE.                           NC2084.2 IMP
   000044         004800 77  QT5      PICTURE XXXX VALUE SPACE.                           NC2084.2 IMP
   000045         004900 77  WRK-XN-00001                 PICTURE X.                      NC2084.2
   000046         005000 77  WRK-DS-01V00                PICTURE S9.                      NC2084.2
   000047         005100 77  WRK-DS-02V00                PICTURE S99.                     NC2084.2
   000048         005200 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC2084.2
   000049         005300 77  WRK-DS-05V00                PICTURE S9(5).                   NC2084.2
   000050         005400 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC2084.2 IMP
   000051         005500 77  WRK-DS-09V09                PICTURE S9(9)V9(9).              NC2084.2
   000052         005600 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC2084.2 51
   000053         005700 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC2084.2
   000054         005800                                 VALUE 111111111.111111111.       NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  WRK-DS-18V00       PICTURE S9(18) VALUE 111111111111111111.  NC2084.2
   000056         006000 77  A05ONES-DS-05V00            PICTURE S9(5) VALUE 11111.       NC2084.2
   000057         006100 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC2084.2
   000058         006200 77  WRK-DS-03V00                PICTURE S999.                    NC2084.2
   000059         006300 77  WRK-DS-06V00                PICTURE S9(6).                   NC2084.2
   000060         006400 77  WRK-DS-0201P                PICTURE S99P.                    NC2084.2
   000061         006500 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC2084.2
   000062         006600 77  XRAY                    PICTURE IS X.                        NC2084.2
   000063         006700 77  W-1                     PICTURE IS 9.                        NC2084.2
   000064         006800 77  W-2                     PICTURE IS 99.                       NC2084.2
   000065         006900 77  W-3                     PICTURE IS 999.                      NC2084.2
   000066         007000 77  W-4                PICTURE 9  VALUE 0.                       NC2084.2
   000067         007100 77  W-6                     PICTURE IS 999    VALUE IS ZERO.     NC2084.2 IMP
   000068         007200 77  W-9                     PICTURE 999.                         NC2084.2
   000069         007300 77  D-5                PICTURE S999  VALUE -1.                   NC2084.2
   000070         007400 77  D-9                PICTURE 9(4)V9(4)  VALUE 111.1189.        NC2084.2
   000071         007500 77  ONE                PICTURE 9  VALUE 1.                       NC2084.2
   000072         007600 77  TWO                PICTURE S9  VALUE 2.                      NC2084.2
   000073         007700 77  THREE              PICTURE S9  VALUE 3.                      NC2084.2
   000074         007800 77  FOUR               PICTURE S9  VALUE 4.                      NC2084.2
   000075         007900 77  FIVE               PICTURE S9  VALUE 5.                      NC2084.2
   000076         008000 77  SIX                PICTURE S9  VALUE 6.                      NC2084.2
   000077         008100 77  SEVEN              PICTURE S9  VALUE 7.                      NC2084.2
   000078         008200 77  EIGHT              PICTURE 9  VALUE 8.                       NC2084.2
   000079         008300 77  NINE               PICTURE S9  VALUE 9.                      NC2084.2
   000080         008400 77  TEN                PICTURE S99  VALUE 10.                    NC2084.2
   000081         008500 77  FIFTEEN            PICTURE S99  VALUE 15.                    NC2084.2
   000082         008600 77  TWENTY             PICTURE S99  VALUE 20.                    NC2084.2
   000083         008700 77  TWENTY-5           PICTURE S99  VALUE 25.                    NC2084.2
   000084         008800 01  MOVE54.                                                      NC2084.2
   000085         008900     02 MOVE55 PICTURE X VALUE "W".                               NC2084.2
   000086         009000     02 MOVE56 PICTURE X VALUE "X".                               NC2084.2
   000087         009100     02 MOVE57.                                                   NC2084.2
   000088         009200         03 MOVE58 PICTURE X VALUE "Y".                           NC2084.2
   000089         009300         03 MOVE59 PICTURE X VALUE "Z".                           NC2084.2
   000090         009400 01  MOVE60.                                                      NC2084.2
   000091         009500     02 MOVE56 PICTURE X.                                         NC2084.2
   000092         009600     02 MOVE57.                                                   NC2084.2
   000093         009700         03 MOVE58 PICTURE X.                                     NC2084.2
   000094         009800         03 MOVE64.                                               NC2084.2
   000095         009900             04 MOVE65 PICTURE X VALUE "A".                       NC2084.2
   000096         010000 01  SEND-BREAKDOWN.                                              NC2084.2
   000097         010100     02  SEND-20  PIC X(20).                                      NC2084.2
   000098         010200     02  SEND-40  PIC X(20).                                      NC2084.2
   000099         010300     02  SEND-60  PIC X(20).                                      NC2084.2
   000100         010400 01  RECEIVE-BREAKDOWN.                                           NC2084.2
   000101         010500     02  RECEIVE-20  PIC X(20).                                   NC2084.2
   000102         010600     02  RECEIVE-40  PIC X(20).                                   NC2084.2
   000103         010700     02  RECEIVE-60  PIC X(20).                                   NC2084.2
   000104         010800 01  GRP-FOR-QUAL-FROM.                                           NC2084.2
   000105         010900     02  QUAL-TEST-SUB-GRP-1.                                     NC2084.2
   000106         011000     03  QUAL-TEST-1             PICTURE X(26) VALUE              NC2084.2
   000107         011100     "ABCDEFGHIJKLMNOPQRSTUVWXYZ".                                NC2084.2
   000108         011200     03  QUAL-TEST-1-FROM REDEFINES QUAL-TEST-1 PICTURE X(26).    NC2084.2 106
   000109         011300     03  QUAL-TEST-2             PICTURE S9(10) VALUE +9999999999.NC2084.2
   000110         011400     03  QUAL-TEST-2-FROM REDEFINES QUAL-TEST-2 PICTURE S9(10).   NC2084.2 109
   000111         011500     03  QUAL-TEST-3             PICTURE S999  VALUE 2.           NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03  QUAL-TEST-3-FROM REDEFINES QUAL-TEST-3 PICTURE S999.     NC2084.2 111
   000113         011700     02  QUAL-TEST-SUB-GRP-2.                                     NC2084.2
   000114         011800     03  QUAL-TEST-4             PICTURE X OCCURS 5 TIMES.        NC2084.2
   000115         011900     03  QUAL-TEST-4-FROM        PICTURE X OCCURS 4 TIMES.        NC2084.2
   000116         012000 01  GRP-FOR-QUAL-TO.                                             NC2084.2
   000117         012100     02  DUMMY-LEVELZ.                                            NC2084.2
   000118         012200     03  QUAL-TEST-1             PICTURE X(26).                   NC2084.2
   000119         012300     03  QUAL-TEST-1-TO REDEFINES QUAL-TEST-1 PICTURE X(26).      NC2084.2 118
   000120         012400     03  QUAL-TEST-2             PICTURE S9(10).                  NC2084.2
   000121         012500     03  QUAL-TEST-2-TO REDEFINES QUAL-TEST-2 PICTURE S9(10).     NC2084.2 120
   000122         012600     03  QUAL-TEST-3             PICTURE S999.                    NC2084.2
   000123         012700     03  QUAL-TEST-3-TO REDEFINES QUAL-TEST-3 PICTURE S999.       NC2084.2 122
   000124         012800     02  QUAL-TEST1.                                              NC2084.2
   000125         012900     03  QUAL-TEST-4             PICTURE X OCCURS 5 TIMES.        NC2084.2
   000126         013000     02  QUAL-TEST2.                                              NC2084.2
   000127         013100     03  QUAL-TEST-4-TO          PICTURE X OCCURS 4 TIMES.        NC2084.2
   000128         013200 01  GRP-MOVE-CORR-1.                                             NC2084.2
   000129         013300     09  MOVE-CORR-5              PICTURE 999    VALUE 555.       NC2084.2
   000130         013400     09  MOVE-CORR-3              PICTURE 999    VALUE 333.       NC2084.2
   000131         013500     09  MOVE-CORR-2              PICTURE 999    VALUE 222.       NC2084.2
   000132         013600     09  MOVE-CORR-1              PICTURE 999    VALUE 111.       NC2084.2
   000133         013700     09  FILLER                   PICTURE XXX    VALUE ZEROS.     NC2084.2 IMP
   000134         013800     09  MOVE-CORR-4              PICTURE XXX    VALUE "XYZ".     NC2084.2
   000135         013900     09  MOVE-CORR-6              PICTURE XXX    VALUE ALL "6".   NC2084.2
   000136         014000     09  MOVE-CORR-7              PICTURE 999    VALUE 777.       NC2084.2
   000137         014100 01  GRP-MOVE-CORR-R.                                             NC2084.2
   000138         014200     05  FILLER                   PICTURE XXX.                    NC2084.2
   000139         014300     05  MOVE-CORR-1              PICTURE XXX.                    NC2084.2
   000140         014400     05  MOVE-CORR-2              PICTURE 999.                    NC2084.2
   000141         014500     05  MOVE-CORR-3              PICTURE ZZZ.                    NC2084.2
   000142         014600     05  MOVE-CORR-4.                                             NC2084.2
   000143         014700         06 FILLER                PICTURE 999.                    NC2084.2
   000144         014800         06 FILLER                PICTURE XXX.                    NC2084.2
   000145         014900 01  GRP-TO-MOVE-CORR.                                            NC2084.2
   000146         015000     03  GRP-TO-MOVE-CORR-1.                                      NC2084.2
   000147         015100         05  MOVE-CORR-G1.                                        NC2084.2
   000148         015200             06  MOVE-CORR-G2.                                    NC2084.2
   000149         015300                 09  MOVE-CORR-E1 PICTURE 999    VALUE 111.       NC2084.2
   000150         015400                 09  MOVE-CORR-E2 PICTURE 999    VALUE 222.       NC2084.2
   000151         015500                 09  FILLER       PICTURE 999    VALUE 333.       NC2084.2
   000152         015600             06  MOVE-CORR-G3.                                    NC2084.2
   000153         015700                 07  MOVE-CORR-E3 PICTURE XXX    VALUE "123".     NC2084.2
   000154         015800                 07  MOVE-CORR-G4.                                NC2084.2
   000155         015900                     08  MOVE-CORR-G5.                            NC2084.2
   000156         016000                         09  MOVE-CORR-E4 PICTURE XXX VALUE "ABC".NC2084.2
   000157         016100                         09  MOVE-CORR-E5 PICTURE 99  VALUE 45.   NC2084.2
   000158         016200 01  GRP-TO-MOVE-CORR-TO.                                         NC2084.2
   000159         016300     02 MOVE-CORR-G1.                                             NC2084.2
   000160         016400         04 MOVE-CORR-G2.                                         NC2084.2
   000161         016500             05 MOVE-CORR-E1      PICTURE XXX.                    NC2084.2
   000162         016600             05 MOVE-CORR-E2      PICTURE 999    OCCURS 2.        NC2084.2
   000163         016700             05 FILLER            PICTURE 999.                    NC2084.2
   000164         016800         04 MOVE-CORR-G3.                                         NC2084.2
   000165         016900             06 MOVE-CORR-E3      PICTURE 999.                    NC2084.2
   000166         017000             06 MOVE-CORR-G4.                                     NC2084.2
   000167         017100                 07 MOVE-CORR-G5  PICTURE X(5).                   NC2084.2
   000168         017200 01  GRP-FOR-MULT-REC-A.                                          NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     03  WRK-DS-01V00-IN-GRP     PICTURE S9   VALUE ZERO.         NC2084.2 IMP
   000170         017400     03  WRK-DS-05V00-IN-GRP     PICTURE S9(5)  VALUE ZERO.       NC2084.2 IMP
   000171         017500     03  WRK-DS-06V06-IN-GRP     PICTURE S9(6)V9(6)  VALUE ZERO.  NC2084.2 IMP
   000172         017600 01  GRP-FOR-MULT-REC-B.                                          NC2084.2
   000173         017700     03  WRK-DS-03V10-IN-GRP     PICTURE S9(3)V9(10) VALUE ZERO.  NC2084.2 IMP
   000174         017800     03  WRK-DS-0201P-IN-GRP     PICTURE S99P        VALUE ZERO.  NC2084.2 IMP
   000175         017900     03  WRK-DS-03V00-IN-GRP     PICTURE S999        VALUE ZERO.  NC2084.2 IMP
   000176         018000 01  GRP-FOR-MULT-REC-C.                                          NC2084.2
   000177         018100     03  WRK-DS-02V00-IN-GRP     PICTURE S99  VALUE ZERO.         NC2084.2 IMP
   000178         018200     03  WRK-DS-18V00-IN-GRP     PICTURE S9(18) VALUE ZERO.       NC2084.2 IMP
   000179         018300     03  WRK-DS-09V09-IN-GRP     PICTURE S9(9)V9(9) VALUE ZERO.   NC2084.2 IMP
   000180         018400 01  WRK-DS-09V00                 PICTURE S9(9)  VALUE ZERO.      NC2084.2 IMP
   000181         018500 01  CORR-DATA-1.                                                 NC2084.2
   000182         018600     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000183         018700     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000184         018800     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000185         018900     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000186         019000     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000187         019100     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000188         019200 01  CORR-DATA-2.                                                 NC2084.2
   000189         019300     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000190         019400     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000191         019500     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000192         019600     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000193         019700     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000194         019800     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000195         019900 01  CORR-DATA-3.                                                 NC2084.2
   000196         020000     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000197         020100     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000198         020200     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000199         020300     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000200         020400     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000201         020500     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2084.2 IMP
   000202         020600 01  CORR-DATA-4.                                                 NC2084.2
   000203         020700     03 XYZ-11               PICTURE IS 99.                       NC2084.2
   000204         020800     03 XYZ-12               PICTURE IS 99.                       NC2084.2
   000205         020900     03 XYZ-13               PICTURE IS 99.                       NC2084.2
   000206         021000     03 XYZ-14               PICTURE IS 99.                       NC2084.2
   000207         021100     03 XYZ-15               PICTURE IS 99.                       NC2084.2
   000208         021200     03 XYZ-16               PICTURE IS 99.                       NC2084.2
   000209         021300 01  CORR-DATA-5.                                                 NC2084.2
   000210         021400     03 XYZ-1                PICTURE 99.                          NC2084.2
   000211         021500     03 XYZ-2                PICTURE 99.                          NC2084.2
   000212         021600     03 XYZ-13               PICTURE IS 99.                       NC2084.2
   000213         021700     03 XYZ-14               PICTURE IS 99.                       NC2084.2
   000214         021800     03 FILLER               PICTURE IS 99.                       NC2084.2
   000215         021900     03 XYZ-11               PICTURE IS 99.                       NC2084.2
   000216         022000     03 XYZ-12               PICTURE IS 99.                       NC2084.2
   000217         022100 01  CORR-DATA-6.                                                 NC2084.2
   000218         022200     03 XYZ-11               PICTURE IS 99.                       NC2084.2
   000219         022300     03 XYZ-12               PICTURE IS 99.                       NC2084.2
   000220         022400     03 FILLER               PICTURE IS 99.                       NC2084.2
   000221         022500     03 XYZ-1                PICTURE IS 99.                       NC2084.2
   000222         022600     03 XYZ-2                PICTURE IS 9(2).                     NC2084.2
   000223         022700     03 FILLER               PICTURE IS 99.                       NC2084.2
   000224         022800 01  CORR-DATA-7.                                                 NC2084.2
   000225         022900     02 XYZ-1                PICTURE 99V99     VALUE 10.45.       NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 XYZ-6                PICTURE 999V9     VALUE 100.5.       NC2084.2
   000227         023100     02 XYZ-11               PICTURE 99V9      VALUE ZERO.        NC2084.2 IMP
   000228         023200     02 XYZ-2                PICTURE 99V9      VALUE 0.9.         NC2084.2
   000229         023300 01  AN-DATANAMES.                                                NC2084.2
   000230         023400     02  ANDATA1       PICTURE X     VALUE SPACE.                 NC2084.2 IMP
   000231         023500     02  ANDATA2       PICTURE XX    VALUE SPACE.                 NC2084.2 IMP
   000232         023600     02  ANDATA3       PICTURE XXX   VALUE SPACE.                 NC2084.2 IMP
   000233         023700     02  ANDATA4       PICTURE X(4)  VALUE SPACE.                 NC2084.2 IMP
   000234         023800     02  ANDATA5       PICTURE X(5)  VALUE SPACE.                 NC2084.2 IMP
   000235         023900     02  ANDATA6       PICTURE X(6)  VALUE SPACE.                 NC2084.2 IMP
   000236         024000     02  ANDATA7       PICTURE X(7)  VALUE SPACE.                 NC2084.2 IMP
   000237         024100     02  ANDATA8       PICTURE X(8)  VALUE SPACE.                 NC2084.2 IMP
   000238         024200     02  ANDATA9       PICTURE X(9)  VALUE SPACE.                 NC2084.2 IMP
   000239         024300     02  ANDATA10      PICTURE X(10) VALUE SPACE.                 NC2084.2 IMP
   000240         024400     02  ANDATA11      PICTURE X(11) VALUE SPACE.                 NC2084.2 IMP
   000241         024500     02  ANDATA12      PICTURE X(12) VALUE SPACE.                 NC2084.2 IMP
   000242         024600     02  ANDATA13      PICTURE X(13) VALUE SPACE.                 NC2084.2 IMP
   000243         024700     02  ANDATA14      PICTURE X(14) VALUE SPACE.                 NC2084.2 IMP
   000244         024800     02  ANDATA15      PICTURE X(15) VALUE SPACE.                 NC2084.2 IMP
   000245         024900     02  ANDATA16      PICTURE X(16) VALUE SPACE.                 NC2084.2 IMP
   000246         025000     02  ANDATA17      PICTURE X(17) VALUE SPACE.                 NC2084.2 IMP
   000247         025100     02  ANDATA18      PICTURE X(18) VALUE SPACE.                 NC2084.2 IMP
   000248         025200     02  ANDATA19      PICTURE X(19) VALUE SPACE.                 NC2084.2 IMP
   000249         025300     02  ANDATA20      PICTURE X(20) VALUE SPACE.                 NC2084.2 IMP
   000250         025400     02  ANDATA21      PICTURE X(120) VALUE SPACE.                NC2084.2 IMP
   000251         025500 01  42-DATANAMES.                                                NC2084.2
   000252         025600     02  DNAME1   PICTURE 9      VALUE 1        COMPUTATIONAL.    NC2084.2
   000253         025700     02  DNAME2   PICTURE 99     VALUE 01       COMPUTATIONAL.    NC2084.2
   000254         025800     02  DNAME3   PICTURE 999    VALUE 001      COMPUTATIONAL.    NC2084.2
   000255         025900     02  DNAME4   PICTURE 9(4)   VALUE 0001     COMPUTATIONAL.    NC2084.2
   000256         026000     02  DNAME5   PICTURE 9(5)   VALUE 00001    COMPUTATIONAL.    NC2084.2
   000257         026100     02  DNAME6   PICTURE 9(6)   VALUE 000001   COMPUTATIONAL.    NC2084.2
   000258         026200     02  DNAME7   PICTURE 9(7)   VALUE 0000001  COMPUTATIONAL.    NC2084.2
   000259         026300     02  DNAME8   PICTURE 9(8)   VALUE 00000001 COMPUTATIONAL.    NC2084.2
   000260         026400     02  DNAME9   PICTURE 9(9)   VALUE 000000001.                 NC2084.2
   000261         026500     02  DNAME10  PICTURE 9(10)   VALUE 0000000001.               NC2084.2
   000262         026600     02  DNAME11  PICTURE 9(11)   VALUE 00000000001.              NC2084.2
   000263         026700     02  DNAME12  PICTURE 9(12)   VALUE 000000000001.             NC2084.2
   000264         026800     02  DNAME13  PICTURE 9(13)   VALUE 0000000000001.            NC2084.2
   000265         026900     02  DNAME14  PICTURE 9(14)   VALUE 00000000000001.           NC2084.2
   000266         027000     02  DNAME15  PICTURE 9(15)   VALUE 000000000000001.          NC2084.2
   000267         027100     02  DNAME16  PICTURE 9(16)   VALUE 0000000000000001.         NC2084.2
   000268         027200     02  DNAME17  PICTURE 9(17)   VALUE 00000000000000001.        NC2084.2
   000269         027300     02  DNAME18  PICTURE 9(18)   VALUE 000000000000000001.       NC2084.2
   000270         027400     02  DNAME19  PICTURE 9      VALUE 1.                         NC2084.2
   000271         027500     02  DNAME20  PICTURE 99     VALUE 11.                        NC2084.2
   000272         027600     02  DNAME21  PICTURE 999    VALUE 111.                       NC2084.2
   000273         027700     02  DNAME22  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000274         027800     02  DNAME23  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000275         027900     02  DNAME24  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000276         028000     02  DNAME25  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000277         028100     02  DNAME26  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000278         028200     02  DNAME27  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000279         028300     02  DNAME28  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000280         028400     02  DNAME29  PICTURE 9(18)  VALUE ZERO.                      NC2084.2 IMP
   000281         028500     02  DNAME30   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000282         028600     02  DNAME31   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     02  DNAME32   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000284         028800     02  DNAME33   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000285         028900     02  DNAME34   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000286         029000     02  DNAME35   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000287         029100     02  DNAME36   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000288         029200     02  DNAME37   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000289         029300     02  DNAME38   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000290         029400     02  DNAME39   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000291         029500     02  DNAME40   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000292         029600     02  DNAME41   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000293         029700     02  DNAME42   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2084.2 IMP
   000294         029800 01  TEST-RESULTS.                                                NC2084.2
   000295         029900     02 FILLER                   PIC X      VALUE SPACE.          NC2084.2 IMP
   000296         030000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2084.2 IMP
   000297         030100     02 FILLER                   PIC X      VALUE SPACE.          NC2084.2 IMP
   000298         030200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2084.2 IMP
   000299         030300     02 FILLER                   PIC X      VALUE SPACE.          NC2084.2 IMP
   000300         030400     02  PAR-NAME.                                                NC2084.2
   000301         030500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2084.2 IMP
   000302         030600       03  PARDOT-X              PIC X      VALUE SPACE.          NC2084.2 IMP
   000303         030700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2084.2 IMP
   000304         030800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2084.2 IMP
   000305         030900     02 RE-MARK                  PIC X(61).                       NC2084.2
   000306         031000 01  TEST-COMPUTED.                                               NC2084.2
   000307         031100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2084.2 IMP
   000308         031200     02 FILLER                   PIC X(17)  VALUE                 NC2084.2
   000309         031300            "       COMPUTED=".                                   NC2084.2
   000310         031400     02 COMPUTED-X.                                               NC2084.2
   000311         031500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2084.2 IMP
   000312         031600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2084.2 311
   000313         031700                                 PIC -9(9).9(9).                  NC2084.2
   000314         031800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2084.2 311
   000315         031900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2084.2 311
   000316         032000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2084.2 311
   000317         032100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2084.2 311
   000318         032200         04 COMPUTED-18V0                    PIC -9(18).          NC2084.2
   000319         032300         04 FILLER                           PIC X.               NC2084.2
   000320         032400     03 FILLER PIC X(50) VALUE SPACE.                             NC2084.2 IMP
   000321         032500 01  TEST-CORRECT.                                                NC2084.2
   000322         032600     02 FILLER PIC X(30) VALUE SPACE.                             NC2084.2 IMP
   000323         032700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2084.2
   000324         032800     02 CORRECT-X.                                                NC2084.2
   000325         032900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2084.2 IMP
   000326         033000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2084.2 325
   000327         033100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2084.2 325
   000328         033200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2084.2 325
   000329         033300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2084.2 325
   000330         033400     03      CR-18V0 REDEFINES CORRECT-A.                         NC2084.2 325
   000331         033500         04 CORRECT-18V0                     PIC -9(18).          NC2084.2
   000332         033600         04 FILLER                           PIC X.               NC2084.2
   000333         033700     03 FILLER PIC X(2) VALUE SPACE.                              NC2084.2 IMP
   000334         033800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2084.2 IMP
   000335         033900 01  CCVS-C-1.                                                    NC2084.2
   000336         034000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2084.2
   000337         034100-    "SS  PARAGRAPH-NAME                                          NC2084.2
   000338         034200-    "       REMARKS".                                            NC2084.2
   000339         034300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 01  CCVS-C-2.                                                    NC2084.2
   000341         034500     02 FILLER                     PIC X        VALUE SPACE.      NC2084.2 IMP
   000342         034600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2084.2
   000343         034700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2084.2 IMP
   000344         034800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2084.2
   000345         034900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2084.2 IMP
   000346         035000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2084.2 IMP
   000347         035100 01  REC-CT                        PIC 99       VALUE ZERO.       NC2084.2 IMP
   000348         035200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2084.2 IMP
   000349         035300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2084.2 IMP
   000350         035400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2084.2 IMP
   000351         035500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2084.2 IMP
   000352         035600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2084.2 IMP
   000353         035700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2084.2 IMP
   000354         035800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2084.2 IMP
   000355         035900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2084.2 IMP
   000356         036000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2084.2 IMP
   000357         036100 01  CCVS-H-1.                                                    NC2084.2
   000358         036200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2084.2 IMP
   000359         036300     02  FILLER                    PIC X(42)    VALUE             NC2084.2
   000360         036400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2084.2
   000361         036500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2084.2 IMP
   000362         036600 01  CCVS-H-2A.                                                   NC2084.2
   000363         036700   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2084.2 IMP
   000364         036800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2084.2
   000365         036900   02  FILLER                        PIC XXXX   VALUE             NC2084.2
   000366         037000     "4.2 ".                                                      NC2084.2
   000367         037100   02  FILLER                        PIC X(28)  VALUE             NC2084.2
   000368         037200            " COPY - NOT FOR DISTRIBUTION".                       NC2084.2
   000369         037300   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2084.2 IMP
   000370         037400                                                                  NC2084.2
   000371         037500 01  CCVS-H-2B.                                                   NC2084.2
   000372         037600   02  FILLER                        PIC X(15)  VALUE             NC2084.2
   000373         037700            "TEST RESULT OF ".                                    NC2084.2
   000374         037800   02  TEST-ID                       PIC X(9).                    NC2084.2
   000375         037900   02  FILLER                        PIC X(4)   VALUE             NC2084.2
   000376         038000            " IN ".                                               NC2084.2
   000377         038100   02  FILLER                        PIC X(12)  VALUE             NC2084.2
   000378         038200     " HIGH       ".                                              NC2084.2
   000379         038300   02  FILLER                        PIC X(22)  VALUE             NC2084.2
   000380         038400            " LEVEL VALIDATION FOR ".                             NC2084.2
   000381         038500   02  FILLER                        PIC X(58)  VALUE             NC2084.2
   000382         038600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2084.2
   000383         038700 01  CCVS-H-3.                                                    NC2084.2
   000384         038800     02  FILLER                      PIC X(34)  VALUE             NC2084.2
   000385         038900            " FOR OFFICIAL USE ONLY    ".                         NC2084.2
   000386         039000     02  FILLER                      PIC X(58)  VALUE             NC2084.2
   000387         039100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2084.2
   000388         039200     02  FILLER                      PIC X(28)  VALUE             NC2084.2
   000389         039300            "  COPYRIGHT   1985 ".                                NC2084.2
   000390         039400 01  CCVS-E-1.                                                    NC2084.2
   000391         039500     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2084.2 IMP
   000392         039600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2084.2
   000393         039700     02 ID-AGAIN                     PIC X(9).                    NC2084.2
   000394         039800     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2084.2 IMP
   000395         039900 01  CCVS-E-2.                                                    NC2084.2
   000396         040000     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2084.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2084.2 IMP
   000398         040200     02 CCVS-E-2-2.                                               NC2084.2
   000399         040300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2084.2 IMP
   000400         040400         03 FILLER                   PIC X      VALUE SPACE.      NC2084.2 IMP
   000401         040500         03 ENDER-DESC               PIC X(44)  VALUE             NC2084.2
   000402         040600            "ERRORS ENCOUNTERED".                                 NC2084.2
   000403         040700 01  CCVS-E-3.                                                    NC2084.2
   000404         040800     02  FILLER                      PIC X(22)  VALUE             NC2084.2
   000405         040900            " FOR OFFICIAL USE ONLY".                             NC2084.2
   000406         041000     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2084.2 IMP
   000407         041100     02  FILLER                      PIC X(58)  VALUE             NC2084.2
   000408         041200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2084.2
   000409         041300     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2084.2 IMP
   000410         041400     02 FILLER                       PIC X(15)  VALUE             NC2084.2
   000411         041500             " COPYRIGHT 1985".                                   NC2084.2
   000412         041600 01  CCVS-E-4.                                                    NC2084.2
   000413         041700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2084.2 IMP
   000414         041800     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2084.2
   000415         041900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2084.2 IMP
   000416         042000     02 FILLER                       PIC X(40)  VALUE             NC2084.2
   000417         042100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2084.2
   000418         042200 01  XXINFO.                                                      NC2084.2
   000419         042300     02 FILLER                       PIC X(19)  VALUE             NC2084.2
   000420         042400            "*** INFORMATION ***".                                NC2084.2
   000421         042500     02 INFO-TEXT.                                                NC2084.2
   000422         042600       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2084.2 IMP
   000423         042700       04 XXCOMPUTED                 PIC X(20).                   NC2084.2
   000424         042800       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2084.2 IMP
   000425         042900       04 XXCORRECT                  PIC X(20).                   NC2084.2
   000426         043000     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2084.2
   000427         043100 01  HYPHEN-LINE.                                                 NC2084.2
   000428         043200     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2084.2 IMP
   000429         043300     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2084.2
   000430         043400-    "*****************************************".                 NC2084.2
   000431         043500     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2084.2
   000432         043600-    "******************************".                            NC2084.2
   000433         043700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2084.2
   000434         043800     "NC208A".                                                    NC2084.2
   000435         043900 PROCEDURE DIVISION.                                              NC2084.2
   000436         044000 CCVS1 SECTION.                                                   NC2084.2
   000437         044100 OPEN-FILES.                                                      NC2084.2
   000438         044200     OPEN     OUTPUT PRINT-FILE.                                  NC2084.2 36
   000439         044300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2084.2 433 374 433 393
   000440         044400     MOVE    SPACE TO TEST-RESULTS.                               NC2084.2 IMP 294
   000441         044500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2084.2 466 471
   000442         044600     GO TO CCVS1-EXIT.                                            NC2084.2 548
   000443         044700 CLOSE-FILES.                                                     NC2084.2
   000444         044800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2084.2 475 496 36
   000445         044900 TERMINATE-CCVS.                                                  NC2084.2
   000446         045000     EXIT PROGRAM.                                                NC2084.2
   000447         045100 TERMINATE-CALL.                                                  NC2084.2
   000448         045200     STOP     RUN.                                                NC2084.2
   000449         045300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2084.2 298 350
   000450         045400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2084.2 298 351
   000451         045500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2084.2 298 349
   000452         045600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2084.2 298 348
   000453         045700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2084.2 305
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 PRINT-DETAIL.                                                    NC2084.2
   000455         045900     IF REC-CT NOT EQUAL TO ZERO                                  NC2084.2 347 IMP
   000456      1  046000             MOVE "." TO PARDOT-X                                 NC2084.2 302
   000457      1  046100             MOVE REC-CT TO DOTVALUE.                             NC2084.2 347 303
   000458         046200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2084.2 294 37 508
   000459         046300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2084.2 298 508
   000460      1  046400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2084.2 525 538
   000461      1  046500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2084.2 539 547
   000462         046600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2084.2 IMP 298 IMP 310
   000463         046700     MOVE SPACE TO CORRECT-X.                                     NC2084.2 IMP 324
   000464         046800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2084.2 347 IMP IMP 300
   000465         046900     MOVE     SPACE TO RE-MARK.                                   NC2084.2 IMP 305
   000466         047000 HEAD-ROUTINE.                                                    NC2084.2
   000467         047100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2084.2 357 38 508
   000468         047200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2084.2 362 38 508
   000469         047300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2084.2 371 38 508
   000470         047400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2084.2 383 38 508
   000471         047500 COLUMN-NAMES-ROUTINE.                                            NC2084.2
   000472         047600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2084.2 335 38 508
   000473         047700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2084.2 340 38 508
   000474         047800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2084.2 427 38 508
   000475         047900 END-ROUTINE.                                                     NC2084.2
   000476         048000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2084.2 427 38 508
   000477         048100 END-RTN-EXIT.                                                    NC2084.2
   000478         048200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2084.2 390 38 508
   000479         048300 END-ROUTINE-1.                                                   NC2084.2
   000480         048400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2084.2 349 353 350
   000481         048500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2084.2 353 348 353
   000482         048600      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2084.2 351 353
   000483         048700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2084.2
   000484         048800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2084.2 351 413
   000485         048900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2084.2 353 415
   000486         049000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2084.2 412 398
   000487         049100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2084.2 395 38 508
   000488         049200  END-ROUTINE-12.                                                 NC2084.2
   000489         049300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2084.2 401
   000490         049400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2084.2 349 IMP
   000491      1  049500         MOVE "NO " TO ERROR-TOTAL                                NC2084.2 399
   000492         049600         ELSE                                                     NC2084.2
   000493      1  049700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2084.2 349 399
   000494         049800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2084.2 395 38
   000495         049900     PERFORM WRITE-LINE.                                          NC2084.2 508
   000496         050000 END-ROUTINE-13.                                                  NC2084.2
   000497         050100     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2084.2 348 IMP
   000498      1  050200         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2084.2 399
   000499      1  050300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2084.2 348 399
   000500         050400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2084.2 401
   000501         050500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2084.2 395 38 508
   000502         050600      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2084.2 350 IMP
   000503      1  050700          MOVE "NO " TO ERROR-TOTAL                               NC2084.2 399
   000504      1  050800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2084.2 350 399
   000505         050900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2084.2 401
   000506         051000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2084.2 395 38 508
   000507         051100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2084.2 403 38 508
   000508         051200 WRITE-LINE.                                                      NC2084.2
   000509         051300     ADD 1 TO RECORD-COUNT.                                       NC2084.2 355
   000510         051400     IF RECORD-COUNT GREATER 50                                   NC2084.2 355
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2084.2 38 354
   000512      1  051600         MOVE SPACE TO DUMMY-RECORD                               NC2084.2 IMP 38
   000513      1  051700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2084.2 38
   000514      1  051800         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2084.2 335 38 520
   000515      1  051900         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2084.2 340 38 520
   000516      1  052000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2084.2 427 38 520
   000517      1  052100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2084.2 354 38
   000518      1  052200         MOVE ZERO TO RECORD-COUNT.                               NC2084.2 IMP 355
   000519         052300     PERFORM WRT-LN.                                              NC2084.2 520
   000520         052400 WRT-LN.                                                          NC2084.2
   000521         052500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2084.2 38
   000522         052600     MOVE SPACE TO DUMMY-RECORD.                                  NC2084.2 IMP 38
   000523         052700 BLANK-LINE-PRINT.                                                NC2084.2
   000524         052800     PERFORM WRT-LN.                                              NC2084.2 520
   000525         052900 FAIL-ROUTINE.                                                    NC2084.2
   000526         053000     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2084.2 310 IMP 533
   000527         053100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2084.2 324 IMP 533
   000528         053200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2084.2 356 426
   000529         053300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2084.2 421
   000530         053400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2084.2 418 38 508
   000531         053500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2084.2 IMP 426
   000532         053600     GO TO  FAIL-ROUTINE-EX.                                      NC2084.2 538
   000533         053700 FAIL-ROUTINE-WRITE.                                              NC2084.2
   000534         053800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2084.2 306 37 508
   000535         053900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2084.2 356 334
   000536         054000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2084.2 321 37 508
   000537         054100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2084.2 IMP 334
   000538         054200 FAIL-ROUTINE-EX. EXIT.                                           NC2084.2
   000539         054300 BAIL-OUT.                                                        NC2084.2
   000540         054400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2084.2 311 IMP 542
   000541         054500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2084.2 325 IMP 547
   000542         054600 BAIL-OUT-WRITE.                                                  NC2084.2
   000543         054700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2084.2 325 425 311 423
   000544         054800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2084.2 356 426
   000545         054900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2084.2 418 38 508
   000546         055000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2084.2 IMP 426
   000547         055100 BAIL-OUT-EX. EXIT.                                               NC2084.2
   000548         055200 CCVS1-EXIT.                                                      NC2084.2
   000549         055300     EXIT.                                                        NC2084.2
   000550         055400 QUAL-SECTION-1 SECTION.                                          NC2084.2
   000551         055500 PAR-INIT-F2-1.                                                   NC2084.2
   000552         055600     MOVE "PAR-TEST-F2-1         " TO PAR-NAME.                   NC2084.2 300
   000553         055700     MOVE "IV-20 4.3.8.1 RULE 6" TO ANSI-REFERENCE.               NC2084.2 356
   000554         055800 PAR-TEST-F2-1.                                                   NC2084.2
   000555         055900     PERFORM PAR-1A OF QUAL-SECTION-1.                            NC2084.2 571 550
   000556         056000     IF QT1 EQUAL TO "PASS"                                       NC2084.2 40
   000557      1  056100                   PERFORM PASS                                   NC2084.2 450
   000558      1  056200                   GO TO PAR-WRITE-F2-1.                          NC2084.2 567
   000559         056300     GO TO PAR-FAIL-F2-1.                                         NC2084.2 563
   000560         056400 PAR-DELETE-F2-1.                                                 NC2084.2
   000561         056500     PERFORM DE-LETE.                                             NC2084.2 452
   000562         056600     GO TO PAR-WRITE-F2-1.                                        NC2084.2 567
   000563         056700 PAR-FAIL-F2-1.                                                   NC2084.2
   000564         056800     PERFORM FAIL.                                                NC2084.2 451
   000565         056900*    NOTE                                                         NC2084.2
   000566         057000*    PERFORM PARAGRAPH IN SAME SECTION.                           NC2084.2
   000567         057100 PAR-WRITE-F2-1.                                                  NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000569         057300     GO TO PAR-1-EXIT.                                            NC2084.2 573
   000570         057400*                                                                 NC2084.2
   000571         057500 PAR-1A.                                                          NC2084.2
   000572         057600     MOVE "PASS" TO QT1.                                          NC2084.2 40
   000573         057700 PAR-1-EXIT.                                                      NC2084.2
   000574         057800     EXIT.                                                        NC2084.2
   000575         057900*                                                                 NC2084.2
   000576         058000 PAR-INIT-F2-2.                                                   NC2084.2
   000577         058100     MOVE "PAR-TEST-F2-2" TO PAR-NAME.                            NC2084.2 300
   000578         058200     MOVE "IV-20 4.3.8.1 RULE 6" TO ANSI-REFERENCE.               NC2084.2 356
   000579         058300 PAR-TEST-F2-2.                                                   NC2084.2
   000580         058400     PERFORM PAR-2A OF QUAL-SECTION-2.                            NC2084.2 657 654
   000581         058500     IF QT2 EQUAL TO "PASS"                                       NC2084.2 41
   000582      1  058600                PERFORM PASS                                      NC2084.2 450
   000583      1  058700                GO TO PAR-WRITE-F2-2.                             NC2084.2 592
   000584         058800     GO TO PAR-FAIL-F2-2.                                         NC2084.2 588
   000585         058900 PAR-DELETE-F2-2.                                                 NC2084.2
   000586         059000     PERFORM DE-LETE.                                             NC2084.2 452
   000587         059100     GO TO PAR-WRITE-F2-2.                                        NC2084.2 592
   000588         059200 PAR-FAIL-F2-2.                                                   NC2084.2
   000589         059300     PERFORM FAIL.                                                NC2084.2 451
   000590         059400*    NOTE                                                         NC2084.2
   000591         059500*    PERFORM PARAGRAPH IN A DIFFERENT SECTION.                    NC2084.2
   000592         059600 PAR-WRITE-F2-2.                                                  NC2084.2
   000593         059700     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000594         059800     GO TO PAR-2-EXIT.                                            NC2084.2 597
   000595         059900 PAR-2A.                                                          NC2084.2
   000596         060000     MOVE "FAIL" TO QT2.                                          NC2084.2 41
   000597         060100 PAR-2-EXIT.                                                      NC2084.2
   000598         060200     EXIT.                                                        NC2084.2
   000599         060300*                                                                 NC2084.2
   000600         060400 PAR-INIT-F2-3.                                                   NC2084.2
   000601         060500     MOVE "PAR-TEST-F2-3" TO PAR-NAME.                            NC2084.2 300
   000602         060600     MOVE "IV-20 4.3.8.1 RULE 6" TO ANSI-REFERENCE.               NC2084.2 356
   000603         060700 PAR-TEST-F2-3.                                                   NC2084.2
   000604         060800     GO TO PAR-3B IN QUAL-SECTION-1.                              NC2084.2 610 550
   000605         060900*    NOTE                                                         NC2084.2
   000606         061000*    GO TO IN SAME SECTION.                                       NC2084.2
   000607         061100 PAR-3A.                                                          NC2084.2
   000608         061200     MOVE "FAIL" TO QT3.                                          NC2084.2 42
   000609         061300     GO TO PAR-3C.                                                NC2084.2 612
   000610         061400 PAR-3B.                                                          NC2084.2
   000611         061500     MOVE "PASS" TO QT3.                                          NC2084.2 42
   000612         061600 PAR-3C.                                                          NC2084.2
   000613         061700     IF QT3 EQUAL TO "PASS"                                       NC2084.2 42
   000614      1  061800               PERFORM PASS                                       NC2084.2 450
   000615      1  061900               GO TO PAR-WRITE-F2-3.                              NC2084.2 622
   000616         062000     GO TO PAR-FAIL-F2-3.                                         NC2084.2 620
   000617         062100 PAR-DELETE-F2-3.                                                 NC2084.2
   000618         062200     PERFORM DE-LETE.                                             NC2084.2 452
   000619         062300     GO TO PAR-WRITE-F2-3.                                        NC2084.2 622
   000620         062400 PAR-FAIL-F2-3.                                                   NC2084.2
   000621         062500     PERFORM FAIL.                                                NC2084.2 451
   000622         062600 PAR-WRITE-F2-3.                                                  NC2084.2
   000623         062700     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000624         062800 PAR-3-EXIT.                                                      NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     EXIT.                                                        NC2084.2
   000626         063000*                                                                 NC2084.2
   000627         063100 PAR-INIT-F2-4.                                                   NC2084.2
   000628         063200     MOVE "PAR-TEST-F2-4" TO PAR-NAME.                            NC2084.2 300
   000629         063300     MOVE "IV-20 4.3.8.1 RULE 6" TO ANSI-REFERENCE.               NC2084.2 356
   000630         063400 PAR-TEST-F2-4.                                                   NC2084.2
   000631         063500     GO TO PAR-4B IN QUAL-SECTION-2.                              NC2084.2 671 654
   000632         063600*    NOTE                                                         NC2084.2
   000633         063700*    GO TO IN DIFFERENT SECTION.                                  NC2084.2
   000634         063800 PAR-4A.                                                          NC2084.2
   000635         063900     MOVE "FAIL" TO QT4.                                          NC2084.2 43
   000636         064000     GO TO PAR-4C.                                                NC2084.2 639
   000637         064100 PAR-4B.                                                          NC2084.2
   000638         064200     MOVE "FAIL" TO QT4.                                          NC2084.2 43
   000639         064300 PAR-4C.                                                          NC2084.2
   000640         064400     IF QT4 EQUAL TO "PASS"                                       NC2084.2 43
   000641      1  064500             PERFORM PASS                                         NC2084.2 450
   000642      1  064600             GO TO PAR-WRITE-F2-4.                                NC2084.2 649
   000643         064700     GO TO PAR-FAIL-F2-4.                                         NC2084.2 647
   000644         064800 PAR-DELETE-F2-4.                                                 NC2084.2
   000645         064900     PERFORM DE-LETE.                                             NC2084.2 452
   000646         065000     GO TO PAR-WRITE-F2-4.                                        NC2084.2 649
   000647         065100 PAR-FAIL-F2-4.                                                   NC2084.2
   000648         065200     PERFORM FAIL.                                                NC2084.2 451
   000649         065300 PAR-WRITE-F2-4.                                                  NC2084.2
   000650         065400     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000651         065500 PAR-4-EXIT.                                                      NC2084.2
   000652         065600     PERFORM END-ROUTINE.                                         NC2084.2 475
   000653         065700     GO TO QUAL-EXIT.                                             NC2084.2 674
   000654         065800 QUAL-SECTION-2 SECTION.                                          NC2084.2
   000655         065900 PAR-1A.                                                          NC2084.2
   000656         066000     MOVE "FAIL" TO QT1.                                          NC2084.2 40
   000657         066100 PAR-2A.                                                          NC2084.2
   000658         066200     MOVE "PASS" TO QT2.                                          NC2084.2 41
   000659         066300 PAR-3B.                                                          NC2084.2
   000660         066400     MOVE "FAIL" TO QT3.                                          NC2084.2 42
   000661         066500     GO TO PAR-3C OF QUAL-SECTION-1.                              NC2084.2 612 550
   000662         066600 PAR-3C.                                                          NC2084.2
   000663         066700     PERFORM FAIL.                                                NC2084.2 451
   000664         066800*    NOTE  THIS PARAGRAPH SHOULD NEVER BE ENTERED.                NC2084.2
   000665         066900     GO TO PAR-INIT-F2-4 IN QUAL-SECTION-1.                       NC2084.2 627 550
   000666         067000 PAR-4.                                                           NC2084.2
   000667         067100     GO TO QUAL-EXIT.                                             NC2084.2 674
   000668         067200*    NOTE                                                         NC2084.2
   000669         067300*                  IF                                             NC2084.2
   000670         067400*    GO TO DIFFERENT SECTION FAILS END QUALIFICATION TEST.        NC2084.2
   000671         067500 PAR-4B.                                                          NC2084.2
   000672         067600     MOVE "PASS" TO QT4.                                          NC2084.2 43
   000673         067700     GO TO PAR-4C IN QUAL-SECTION-1.                              NC2084.2 639 550
   000674         067800 QUAL-EXIT.                                                       NC2084.2
   000675         067900     EXIT.                                                        NC2084.2
   000676         068000 DATA-NAME-QUAL SECTION.                                          NC2084.2
   000677         068100 QAL-INIT-F1-1.                                                   NC2084.2
   000678         068200     MOVE "QAL-TEST-F1-1      " TO PAR-NAME.                      NC2084.2 300
   000679         068300     MOVE SPACE TO TEST-RESULTS.                                  NC2084.2 IMP 294
   000680         068400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000681         068500     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600 QAL-TEST-F1-1.                                                   NC2084.2
   000683         068700     MOVE "123456789" TO QUAL-TEST-SUB-GRP-2.                     NC2084.2 113
   000684         068800     MOVE ZERO TO GRP-FOR-QUAL-TO.                                NC2084.2 IMP 116
   000685         068900     MOVE 2 TO WRK-DS-01V00.                                      NC2084.2 46
   000686         069000     MOVE QUAL-TEST-1 OF GRP-FOR-QUAL-FROM                        NC2084.2 106 104
   000687         069100         TO QUAL-TEST-1 OF GRP-FOR-QUAL-TO.                       NC2084.2 118 116
   000688         069200     IF QUAL-TEST-1 OF GRP-FOR-QUAL-TO EQUAL TO                   NC2084.2 118 116
   000689         069300         "ABCDEFGHIJKLMNOPQRSTUVWXYZ"                             NC2084.2
   000690      1  069400         PERFORM PASS                                             NC2084.2 450
   000691      1  069500         GO TO QAL-WRITE-F1-1.                                    NC2084.2 710
   000692         069600     GO TO QAL-FAIL-F1-1.                                         NC2084.2 696
   000693         069700 QAL-DELETE-F1-1.                                                 NC2084.2
   000694         069800     PERFORM DE-LETE.                                             NC2084.2 452
   000695         069900     GO TO QAL-WRITE-F1-1.                                        NC2084.2 710
   000696         070000 QAL-FAIL-F1-1.                                                   NC2084.2
   000697         070100     MOVE "ABCDEFGGHIJKLMNOPQRSTUVWXYZ" TO SEND-BREAKDOWN         NC2084.2 96
   000698         070200     MOVE QUAL-TEST-1 OF GRP-FOR-QUAL-TO TO RECEIVE-BREAKDOWN     NC2084.2 118 116 100
   000699         070300     PERFORM FAIL                                                 NC2084.2 451
   000700         070400     MOVE SEND-20 TO CORRECT-A                                    NC2084.2 97 325
   000701         070500     MOVE RECEIVE-20 TO COMPUTED-A                                NC2084.2 101 311
   000702         070600     MOVE "1ST 20 POSITIONS OF ANSWERS" TO RE-MARK                NC2084.2 305
   000703         070700     MOVE TEST-RESULTS TO PRINT-REC.                              NC2084.2 294 37
   000704         070800     WRITE PRINT-REC                                              NC2084.2 37
   000705         070900     MOVE SPACES TO P-OR-F                                        NC2084.2 IMP 298
   000706         071000     MOVE SEND-40 TO CORRECT-A                                    NC2084.2 98 325
   000707         071100     MOVE RECEIVE-40 TO COMPUTED-A                                NC2084.2 102 311
   000708         071200     MOVE "QAL-TEST-F1-1      " TO PAR-NAME.                      NC2084.2 300
   000709         071300     MOVE "2ND 20 POSITIONS OF ANSWERS" TO RE-MARK.               NC2084.2 305
   000710         071400 QAL-WRITE-F1-1.                                                  NC2084.2
   000711         071500     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000712         071600*                                                                 NC2084.2
   000713         071700 QAL-INIT-F1-2.                                                   NC2084.2
   000714         071800     MOVE "QAL-TEST-F1-2      " TO PAR-NAME.                      NC2084.2 300
   000715         071900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000716         072000     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000717         072100     MOVE ZERO TO QUAL-TEST-2-TO.                                 NC2084.2 IMP 121
   000718         072200 QAL-TEST-F1-2.                                                   NC2084.2
   000719         072300     ADD QUAL-TEST-2 OF GRP-FOR-QUAL-FROM                         NC2084.2 109 104
   000720         072400         TO QUAL-TEST-2 OF GRP-FOR-QUAL-TO.                       NC2084.2 120 116
   000721         072500     IF QUAL-TEST-2 OF GRP-FOR-QUAL-TO EQUAL TO 9999999999        NC2084.2 120 116
   000722      1  072600         PERFORM PASS                                             NC2084.2 450
   000723      1  072700         GO TO QAL-WRITE-F1-2.                                    NC2084.2 732
   000724         072800     GO TO QAL-FAIL-F1-2.                                         NC2084.2 728
   000725         072900 QAL-DELETE-F1-2.                                                 NC2084.2
   000726         073000     PERFORM DE-LETE.                                             NC2084.2 452
   000727         073100     GO TO QAL-WRITE-F1-2.                                        NC2084.2 732
   000728         073200 QAL-FAIL-F1-2.                                                   NC2084.2
   000729         073300     MOVE 9999999999 TO CORRECT-18V0.                             NC2084.2 331
   000730         073400     MOVE QUAL-TEST-2 OF GRP-FOR-QUAL-TO TO COMPUTED-18V0.        NC2084.2 120 116 318
   000731         073500     PERFORM FAIL.                                                NC2084.2 451
   000732         073600 QAL-WRITE-F1-2.                                                  NC2084.2
   000733         073700     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000734         073800*                                                                 NC2084.2
   000735         073900 QAL-INIT-F1-3.                                                   NC2084.2
   000736         074000     MOVE "QAL-TEST-F1-3      " TO PAR-NAME.                      NC2084.2 300
   000737         074100     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000738         074200     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300 QAL-TEST-F1-3.                                                   NC2084.2
   000740         074400     MULTIPLY QUAL-TEST-3 OF GRP-FOR-QUAL-FROM BY WRK-DS-01V00    NC2084.2 111 104 46
   000741         074500         GIVING QUAL-TEST-3 OF GRP-FOR-QUAL-TO.                   NC2084.2 122 116
   000742         074600     IF QUAL-TEST-3 OF GRP-FOR-QUAL-TO EQUAL TO 004               NC2084.2 122 116
   000743      1  074700         PERFORM PASS                                             NC2084.2 450
   000744      1  074800         GO TO QAL-WRITE-F1-3.                                    NC2084.2 753
   000745         074900     GO TO QAL-FAIL-F1-3.                                         NC2084.2 749
   000746         075000 QAL-DELETE-F1-3.                                                 NC2084.2
   000747         075100     PERFORM DE-LETE.                                             NC2084.2 452
   000748         075200     GO TO QAL-WRITE-F1-3.                                        NC2084.2 753
   000749         075300 QAL-FAIL-F1-3.                                                   NC2084.2
   000750         075400     MOVE 004 TO CORRECT-N.                                       NC2084.2 326
   000751         075500     MOVE QUAL-TEST-3 OF GRP-FOR-QUAL-TO TO COMPUTED-N.           NC2084.2 122 116 312
   000752         075600     PERFORM FAIL.                                                NC2084.2 451
   000753         075700 QAL-WRITE-F1-3.                                                  NC2084.2
   000754         075800     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000755         075900*                                                                 NC2084.2
   000756         076000 QAL-INIT-F1-4.                                                   NC2084.2
   000757         076100     MOVE "QAL-TEST-F1-4      " TO PAR-NAME.                      NC2084.2 300
   000758         076200     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000759         076300     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000760         076400 QAL-TEST-F1-4.                                                   NC2084.2
   000761         076500     MOVE QUAL-TEST-4 OF GRP-FOR-QUAL-FROM (WRK-DS-01V00)         NC2084.2 114 104 46
   000762         076600         TO QUAL-TEST-4 OF GRP-FOR-QUAL-TO (WRK-DS-01V00).        NC2084.2 125 116 46
   000763         076700     IF QUAL-TEST1  OF GRP-FOR-QUAL-TO EQUAL TO "02000"           NC2084.2 124 116
   000764      1  076800         PERFORM PASS                                             NC2084.2 450
   000765      1  076900         GO TO QAL-WRITE-F1-4.                                    NC2084.2 774
   000766         077000     GO TO QAL-FAIL-F1-4.                                         NC2084.2 770
   000767         077100 QAL-DELETE-F1-4.                                                 NC2084.2
   000768         077200     PERFORM DE-LETE.                                             NC2084.2 452
   000769         077300     GO TO QAL-WRITE-F1-4.                                        NC2084.2 774
   000770         077400 QAL-FAIL-F1-4.                                                   NC2084.2
   000771         077500     MOVE "02000" TO CORRECT-A.                                   NC2084.2 325
   000772         077600     MOVE QUAL-TEST1  OF GRP-FOR-QUAL-TO TO COMPUTED-A.           NC2084.2 124 116 311
   000773         077700     PERFORM FAIL.                                                NC2084.2 451
   000774         077800 QAL-WRITE-F1-4.                                                  NC2084.2
   000775         077900     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000776         078000*                                                                 NC2084.2
   000777         078100 QAL-INIT-F1-5.                                                   NC2084.2
   000778         078200     MOVE "QAL-TEST-F1-5      " TO PAR-NAME.                      NC2084.2 300
   000779         078300     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000780         078400     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000781         078500 QAL-TEST-F1-5.                                                   NC2084.2
   000782         078600     MOVE QUAL-TEST-1-FROM IN GRP-FOR-QUAL-FROM TO                NC2084.2 108 104
   000783         078700         QUAL-TEST-1-TO IN GRP-FOR-QUAL-TO.                       NC2084.2 119 116
   000784         078800     IF QUAL-TEST-1-TO IN GRP-FOR-QUAL-TO EQUAL TO                NC2084.2 119 116
   000785         078900         "ABCDEFGHIJKLMNOPQRSTUVWXYZ"                             NC2084.2
   000786      1  079000         PERFORM PASS                                             NC2084.2 450
   000787      1  079100         GO TO QAL-WRITE-F1-5.                                    NC2084.2 805
   000788         079200     GO TO QAL-FAIL-F1-5.                                         NC2084.2 792
   000789         079300 QAL-DELETE-F1-5.                                                 NC2084.2
   000790         079400     PERFORM DE-LETE.                                             NC2084.2 452
   000791         079500     GO TO QAL-WRITE-F1-5.                                        NC2084.2 805
   000792         079600 QAL-FAIL-F1-5.                                                   NC2084.2
   000793         079700     MOVE "ABCDEFGHIJKLMNOPQRSTUVWXYZ" TO SEND-BREAKDOWN.         NC2084.2 96
   000794         079800     MOVE QUAL-TEST-1-TO IN GRP-FOR-QUAL-TO TO RECEIVE-BREAKDOWN. NC2084.2 119 116 100
   000795         079900     PERFORM FAIL.                                                NC2084.2 451
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE SEND-20 TO CORRECT-A.                                   NC2084.2 97 325
   000797         080100     MOVE RECEIVE-20 TO COMPUTED-A.                               NC2084.2 101 311
   000798         080200     PERFORM QAL-WRITE-F1-5.                                      NC2084.2 805
   000799         080300     MOVE SPACES TO P-OR-F.                                       NC2084.2 IMP 298
   000800         080400     MOVE SEND-40 TO CORRECT-A.                                   NC2084.2 98 325
   000801         080500     MOVE RECEIVE-40 TO COMPUTED-A.                               NC2084.2 102 311
   000802         080600     MOVE "2ND 20 POSITIONS OF ANSWERS" TO RE-MARK.               NC2084.2 305
   000803         080700     MOVE TEST-RESULTS TO PRINT-REC.                              NC2084.2 294 37
   000804         080800     WRITE PRINT-REC.                                             NC2084.2 37
   000805         080900 QAL-WRITE-F1-5.                                                  NC2084.2
   000806         081000     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000807         081100*                                                                 NC2084.2
   000808         081200 QAL-INIT-F1-6.                                                   NC2084.2
   000809         081300     MOVE "QAL-TEST-F1-6      " TO PAR-NAME.                      NC2084.2 300
   000810         081400     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000811         081500     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000812         081600 QAL-TEST-F1-6.                                                   NC2084.2
   000813         081700     MOVE 0000000000 TO QUAL-TEST-2-TO IN GRP-FOR-QUAL-TO.        NC2084.2 121 116
   000814         081800     ADD QUAL-TEST-2-FROM IN GRP-FOR-QUAL-FROM TO                 NC2084.2 110 104
   000815         081900         QUAL-TEST-2-TO IN GRP-FOR-QUAL-TO.                       NC2084.2 121 116
   000816         082000     IF QUAL-TEST-2-TO IN GRP-FOR-QUAL-TO EQUAL TO 9999999999     NC2084.2 121 116
   000817      1  082100         PERFORM PASS                                             NC2084.2 450
   000818      1  082200         GO TO QAL-WRITE-F1-6.                                    NC2084.2 827
   000819         082300     GO TO QAL-FAIL-F1-6.                                         NC2084.2 823
   000820         082400 QAL-DELETE-F1-6.                                                 NC2084.2
   000821         082500     PERFORM DE-LETE.                                             NC2084.2 452
   000822         082600     GO TO QAL-WRITE-F1-6.                                        NC2084.2 827
   000823         082700 QAL-FAIL-F1-6.                                                   NC2084.2
   000824         082800     MOVE 9999999999 TO CORRECT-18V0.                             NC2084.2 331
   000825         082900     MOVE QUAL-TEST-2-TO IN GRP-FOR-QUAL-TO TO COMPUTED-18V0.     NC2084.2 121 116 318
   000826         083000     PERFORM FAIL.                                                NC2084.2 451
   000827         083100 QAL-WRITE-F1-6.                                                  NC2084.2
   000828         083200     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000829         083300*                                                                 NC2084.2
   000830         083400 QAL-INIT-F1-7.                                                   NC2084.2
   000831         083500     MOVE "QAL-TEST-F1-7      " TO PAR-NAME.                      NC2084.2 300
   000832         083600     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000833         083700     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000834         083800 QAL-TEST-F1-7.                                                   NC2084.2
   000835         083900     MULTIPLY QUAL-TEST-3-FROM IN GRP-FOR-QUAL-FROM BY            NC2084.2 112 104
   000836         084000         WRK-DS-01V00 GIVING QUAL-TEST-3-TO IN GRP-FOR-QUAL-TO.   NC2084.2 46 123 116
   000837         084100     IF QUAL-TEST-3-TO IN GRP-FOR-QUAL-TO EQUAL TO 004            NC2084.2 123 116
   000838      1  084200         PERFORM PASS                                             NC2084.2 450
   000839      1  084300         GO TO QAL-WRITE-F1-7.                                    NC2084.2 848
   000840         084400     GO TO QAL-FAIL-F1-7.                                         NC2084.2 844
   000841         084500 QAL-DELETE-F1-7.                                                 NC2084.2
   000842         084600     PERFORM DE-LETE.                                             NC2084.2 452
   000843         084700     GO TO QAL-WRITE-F1-7.                                        NC2084.2 848
   000844         084800 QAL-FAIL-F1-7.                                                   NC2084.2
   000845         084900     MOVE 004 TO CORRECT-N.                                       NC2084.2 326
   000846         085000     MOVE QUAL-TEST-3-TO IN GRP-FOR-QUAL-TO TO COMPUTED-N.        NC2084.2 123 116 312
   000847         085100     PERFORM FAIL.                                                NC2084.2 451
   000848         085200 QAL-WRITE-F1-7.                                                  NC2084.2
   000849         085300     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000850         085400*                                                                 NC2084.2
   000851         085500 QAL-INIT-F1-8.                                                   NC2084.2
   000852         085600     MOVE "QAL-TEST-F1-8      " TO PAR-NAME.                      NC2084.2 300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000854         085800     MOVE "DATA-NAME QUAL      " TO FEATURE.                      NC2084.2 296
   000855         085900 QAL-TEST-F1-8.                                                   NC2084.2
   000856         086000     MOVE QUAL-TEST-4-FROM IN GRP-FOR-QUAL-FROM (WRK-DS-01V00)    NC2084.2 115 104 46
   000857         086100         TO QUAL-TEST-4-TO IN GRP-FOR-QUAL-TO (WRK-DS-01V00).     NC2084.2 127 116 46
   000858         086200     IF QUAL-TEST2     IN GRP-FOR-QUAL-TO EQUAL TO "0700"         NC2084.2 126 116
   000859      1  086300         PERFORM PASS                                             NC2084.2 450
   000860      1  086400         GO TO QAL-WRITE-F1-8.                                    NC2084.2 869
   000861         086500     GO TO QAL-FAIL-F1-8.                                         NC2084.2 865
   000862         086600 QAL-DELETE-F1-8.                                                 NC2084.2
   000863         086700     PERFORM DE-LETE.                                             NC2084.2 452
   000864         086800     GO TO QAL-WRITE-F1-8.                                        NC2084.2 869
   000865         086900 QAL-FAIL-F1-8.                                                   NC2084.2
   000866         087000     MOVE "0700" TO CORRECT-A.                                    NC2084.2 325
   000867         087100     MOVE QUAL-TEST2 TO COMPUTED-A.                               NC2084.2 126 311
   000868         087200     PERFORM FAIL.                                                NC2084.2 451
   000869         087300 QAL-WRITE-F1-8.                                                  NC2084.2
   000870         087400     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000871         087500     PERFORM END-ROUTINE.                                         NC2084.2 475
   000872         087600*                                                                 NC2084.2
   000873         087700 MOVE-CORR-ROUTINE SECTION.                                       NC2084.2
   000874         087800 MOV-INIT-F1-1.                                                   NC2084.2
   000875         087900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000876         088000     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   000877         088100     MOVE THREE TO XYZ-1 OF CORR-DATA-1.                          NC2084.2 73 182 181
   000878         088200     MOVE FOUR TO XYZ-2 OF CORR-DATA-1.                           NC2084.2 74 183 181
   000879         088300     MOVE TEN TO XYZ-3 OF CORR-DATA-1.                            NC2084.2 80 184 181
   000880         088400     MOVE ZERO TO XYZ-4 OF CORR-DATA-1.                           NC2084.2 IMP 185 181
   000881         088500     MOVE 01 TO XYZ-5 OF CORR-DATA-1.                             NC2084.2 186 181
   000882         088600     MOVE 00 TO XYZ-6 OF CORR-DATA-1.                             NC2084.2 187 181
   000883         088700 MOV-INIT-F1-1-1.                                                 NC2084.2
   000884         088800     MOVE "MOV-TEST-F1-1-1" TO PAR-NAME.                          NC2084.2 300
   000885         088900 MOV-TEST-F1-1-1.                                                 NC2084.2
   000886         089000     MOVE CORRESPONDING CORR-DATA-1 TO CORR-DATA-2.               NC2084.2 181 188
   000887         089100                   IF XYZ-2 OF CORR-DATA-2 EQUAL TO 4             NC2084.2 190 188
   000888      1  089200     PERFORM PASS ELSE                                            NC2084.2 450
   000889      1  089300     GO TO MOV-FAIL-F1-1-1.                                       NC2084.2 894
   000890         089400     GO TO MOV-WRITE-F1-1-1.                                      NC2084.2 898
   000891         089500 MOV-DELETE-F1-1-1.                                               NC2084.2
   000892         089600     PERFORM DE-LETE.                                             NC2084.2 452
   000893         089700     GO TO MOV-WRITE-F1-1-1.                                      NC2084.2 898
   000894         089800 MOV-FAIL-F1-1-1.                                                 NC2084.2
   000895         089900     PERFORM FAIL.                                                NC2084.2 451
   000896         090000     MOVE XYZ-2 OF CORR-DATA-2 TO COMPUTED-A.                     NC2084.2 190 188 311
   000897         090100     MOVE 04 TO CORRECT-A.                                        NC2084.2 325
   000898         090200 MOV-WRITE-F1-1-1.                                                NC2084.2
   000899         090300     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000900         090400*                                                                 NC2084.2
   000901         090500 MOV-INIT-F1-1-2.                                                 NC2084.2
   000902         090600     MOVE "MOV-TEST-F1-1-2" TO PAR-NAME.                          NC2084.2 300
   000903         090700 MOV-TEST-F1-1-2.                                                 NC2084.2
   000904         090800     IF XYZ-1 OF CORR-DATA-2 EQUAL TO THREE                       NC2084.2 189 188 73
   000905      1  090900              PERFORM PASS ELSE                                   NC2084.2 450
   000906      1  091000              GO TO MOV-FAIL-F1-1-2.                              NC2084.2 911
   000907         091100     GO TO MOV-WRITE-F1-1-2.                                      NC2084.2 915
   000908         091200 MOV-DELETE-F1-1-2.                                               NC2084.2
   000909         091300     PERFORM DE-LETE.                                             NC2084.2 452
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     GO TO MOV-WRITE-F1-1-2.                                      NC2084.2 915
   000911         091500 MOV-FAIL-F1-1-2.                                                 NC2084.2
   000912         091600     PERFORM FAIL.                                                NC2084.2 451
   000913         091700     MOVE XYZ-1 OF CORR-DATA-2 TO COMPUTED-A.                     NC2084.2 189 188 311
   000914         091800     MOVE THREE TO CORRECT-A.                                     NC2084.2 73 325
   000915         091900 MOV-WRITE-F1-1-2.                                                NC2084.2
   000916         092000     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000917         092100*                                                                 NC2084.2
   000918         092200 MOV-INIT-F1-1-3.                                                 NC2084.2
   000919         092300     MOVE "MOV-TEST-F1-1-3" TO PAR-NAME.                          NC2084.2 300
   000920         092400 MOV-TEST-F1-1-3.                                                 NC2084.2
   000921         092500     IF XYZ-3 OF CORR-DATA-2 EQUAL TO TEN                         NC2084.2 191 188 80
   000922      1  092600            PERFORM PASS ELSE                                     NC2084.2 450
   000923      1  092700            GO TO MOV-FAIL-F1-1-3.                                NC2084.2 928
   000924         092800     GO TO MOV-WRITE-F1-1-3.                                      NC2084.2 932
   000925         092900 MOV-DELETE-F1-1-3.                                               NC2084.2
   000926         093000     PERFORM DE-LETE.                                             NC2084.2 452
   000927         093100     GO TO MOV-WRITE-F1-1-3.                                      NC2084.2 932
   000928         093200 MOV-FAIL-F1-1-3.                                                 NC2084.2
   000929         093300     MOVE XYZ-3 OF CORR-DATA-2 TO COMPUTED-A.                     NC2084.2 191 188 311
   000930         093400     MOVE "10" TO CORRECT-A.                                      NC2084.2 325
   000931         093500     PERFORM FAIL.                                                NC2084.2 451
   000932         093600 MOV-WRITE-F1-1-3.                                                NC2084.2
   000933         093700     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000934         093800*                                                                 NC2084.2
   000935         093900 MOV-INIT-F1-1-4.                                                 NC2084.2
   000936         094000     MOVE "MOV-TEST-F1-1-4" TO PAR-NAME.                          NC2084.2 300
   000937         094100 MOV-TEST-F1-1-4.                                                 NC2084.2
   000938         094200     IF XYZ-4 OF CORR-DATA-2 EQUAL TO XYZ-4 OF                    NC2084.2 192 188 185
   000939         094300     CORR-DATA-1                                                  NC2084.2 181
   000940      1  094400             PERFORM PASS ELSE                                    NC2084.2 450
   000941      1  094500             GO TO MOV-FAIL-F1-1-4.                               NC2084.2 946
   000942         094600     GO TO MOV-WRITE-F1-1-4.                                      NC2084.2 950
   000943         094700 MOV-DELETE-F1-1-4.                                               NC2084.2
   000944         094800     PERFORM DE-LETE.                                             NC2084.2 452
   000945         094900     GO TO MOV-WRITE-F1-1-4.                                      NC2084.2 950
   000946         095000 MOV-FAIL-F1-1-4.                                                 NC2084.2
   000947         095100     PERFORM FAIL.                                                NC2084.2 451
   000948         095200     MOVE XYZ-4 OF CORR-DATA-2 TO COMPUTED-A.                     NC2084.2 192 188 311
   000949         095300     MOVE XYZ-4 OF CORR-DATA-1 TO CORRECT-A.                      NC2084.2 185 181 325
   000950         095400 MOV-WRITE-F1-1-4.                                                NC2084.2
   000951         095500     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000952         095600*                                                                 NC2084.2
   000953         095700 MOV-INIT-F1-1-5.                                                 NC2084.2
   000954         095800     MOVE "MOV-TEST-F1-1-5" TO PAR-NAME.                          NC2084.2 300
   000955         095900 MOV-TEST-F1-1-5.                                                 NC2084.2
   000956         096000     IF XYZ-5 OF CORR-DATA-2 EQUAL TO 01                          NC2084.2 193 188
   000957      1  096100             PERFORM PASS ELSE                                    NC2084.2 450
   000958      1  096200             GO TO MOV-FAIL-F1-1-5.                               NC2084.2 963
   000959         096300     GO TO MOV-WRITE-F1-1-5.                                      NC2084.2 967
   000960         096400 MOV-DELETE-F1-1-5.                                               NC2084.2
   000961         096500     PERFORM DE-LETE.                                             NC2084.2 452
   000962         096600     GO TO MOV-WRITE-F1-1-5.                                      NC2084.2 967
   000963         096700 MOV-FAIL-F1-1-5.                                                 NC2084.2
   000964         096800     MOVE XYZ-5 OF CORR-DATA-2 TO COMPUTED-A.                     NC2084.2 193 188 311
   000965         096900     MOVE "01" TO CORRECT-A.                                      NC2084.2 325
   000966         097000     PERFORM FAIL.                                                NC2084.2 451
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100 MOV-WRITE-F1-1-5.                                                NC2084.2
   000968         097200     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000969         097300*                                                                 NC2084.2
   000970         097400 MOV-INIT-F1-2.                                                   NC2084.2
   000971         097500     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   000972         097600     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   000973         097700     MOVE THREE TO XYZ-1 OF CORR-DATA-1.                          NC2084.2 73 182 181
   000974         097800     MOVE FOUR TO XYZ-2 OF CORR-DATA-1.                           NC2084.2 74 183 181
   000975         097900     MOVE TEN TO XYZ-3 OF CORR-DATA-1.                            NC2084.2 80 184 181
   000976         098000     MOVE ZERO TO XYZ-4 OF CORR-DATA-1.                           NC2084.2 IMP 185 181
   000977         098100     MOVE 01 TO XYZ-5 OF CORR-DATA-1.                             NC2084.2 186 181
   000978         098200     MOVE 00 TO XYZ-6 OF CORR-DATA-1.                             NC2084.2 187 181
   000979         098300     MOVE CORRESPONDING CORR-DATA-1 TO CORR-DATA-3.               NC2084.2 181 195
   000980         098400 MOV-INIT-F1-2-1.                                                 NC2084.2
   000981         098500     MOVE "MOV-TEST-F1-2-1" TO PAR-NAME.                          NC2084.2 300
   000982         098600 MOV-TEST-F1-2-1.                                                 NC2084.2
   000983         098700     IF XYZ-1 OF CORR-DATA-3 EQUAL TO 03                          NC2084.2 201 195
   000984      1  098800            PERFORM PASS ELSE                                     NC2084.2 450
   000985      1  098900            GO TO MOV-FAIL-F1-2-1.                                NC2084.2 990
   000986         099000     GO TO MOV-WRITE-F1-2-1.                                      NC2084.2 994
   000987         099100 MOV-DELETE-F1-2-1.                                               NC2084.2
   000988         099200     PERFORM DE-LETE.                                             NC2084.2 452
   000989         099300     GO TO MOV-WRITE-F1-2-1.                                      NC2084.2 994
   000990         099400 MOV-FAIL-F1-2-1.                                                 NC2084.2
   000991         099500     PERFORM FAIL.                                                NC2084.2 451
   000992         099600     MOVE XYZ-1 OF CORR-DATA-3 TO COMPUTED-A.                     NC2084.2 201 195 311
   000993         099700     MOVE "03" TO CORRECT-A.                                      NC2084.2 325
   000994         099800 MOV-WRITE-F1-2-1.                                                NC2084.2
   000995         099900     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   000996         100000*                                                                 NC2084.2
   000997         100100 MOV-INIT-F1-2-2.                                                 NC2084.2
   000998         100200     MOVE "MOV-TEST-F1-2-2" TO PAR-NAME.                          NC2084.2 300
   000999         100300 MOV-TEST-F1-2-2.                                                 NC2084.2
   001000         100400     IF XYZ-3 OF CORR-DATA-3 EQUAL TO 10                          NC2084.2 197 195
   001001      1  100500              PERFORM PASS ELSE                                   NC2084.2 450
   001002      1  100600              GO TO MOV-FAIL-F1-2-2.                              NC2084.2 1007
   001003         100700     GO TO MOV-WRITE-F1-2-2.                                      NC2084.2 1011
   001004         100800 MOV-DELETE-F1-2-2.                                               NC2084.2
   001005         100900     PERFORM DE-LETE.                                             NC2084.2 452
   001006         101000     GO TO MOV-WRITE-F1-2-2.                                      NC2084.2 1011
   001007         101100 MOV-FAIL-F1-2-2.                                                 NC2084.2
   001008         101200     PERFORM FAIL.                                                NC2084.2 451
   001009         101300     MOVE XYZ-3 OF CORR-DATA-3 TO COMPUTED-A.                     NC2084.2 197 195 311
   001010         101400     MOVE "10" TO CORRECT-A.                                      NC2084.2 325
   001011         101500 MOV-WRITE-F1-2-2.                                                NC2084.2
   001012         101600     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   001013         101700*                                                                 NC2084.2
   001014         101800 MOV-INIT-F1-3.                                                   NC2084.2
   001015         101900     MOVE "MOV-TEST-F1-3" TO PAR-NAME.                            NC2084.2 300
   001016         102000     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   001017         102100     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   001018         102200     MOVE ZERO TO CORR-DATA-5.                                    NC2084.2 IMP 209
   001019         102300     MOVE 123456789012 TO CORR-DATA-3.                            NC2084.2 195
   001020         102400     MOVE CORRESPONDING CORR-DATA-3 TO CORR-DATA-5.               NC2084.2 195 209
   001021         102500 MOV-TEST-F1-3.                                                   NC2084.2
   001022         102600     IF XYZ-1 OF CORR-DATA-5 EQUAL TO 12 NEXT                     NC2084.2 210 209
   001023      1  102700             SENTENCE ELSE                                        NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102800             GO TO MOV-FAIL-F1-3.                                 NC2084.2 1035
   001025         102900     IF XYZ-2 OF CORR-DATA-5 EQUAL TO 90 NEXT                     NC2084.2 211 209
   001026      1  103000             SENTENCE ELSE                                        NC2084.2
   001027      1  103100             GO TO MOV-FAIL-F1-3.                                 NC2084.2 1035
   001028         103200     IF XYZ-13 OF CORR-DATA-5 EQUAL TO 0                          NC2084.2 212 209
   001029      1  103300             PERFORM PASS ELSE                                    NC2084.2 450
   001030      1  103400             GO TO MOV-FAIL-F1-3.                                 NC2084.2 1035
   001031         103500     GO TO MOV-WRITE-F1-3.                                        NC2084.2 1039
   001032         103600 MOV-DELETE-F1-3.                                                 NC2084.2
   001033         103700     PERFORM DE-LETE.                                             NC2084.2 452
   001034         103800     GO TO MOV-WRITE-F1-3.                                        NC2084.2 1039
   001035         103900 MOV-FAIL-F1-3.                                                   NC2084.2
   001036         104000     MOVE CORR-DATA-5 TO COMPUTED-A.                              NC2084.2 209 311
   001037         104100     MOVE "9012000000000000" TO CORRECT-A.                        NC2084.2 325
   001038         104200     PERFORM FAIL.                                                NC2084.2 451
   001039         104300 MOV-WRITE-F1-3.                                                  NC2084.2
   001040         104400     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   001041         104500*                                                                 NC2084.2
   001042         104600 MOV-INIT-F1-4.                                                   NC2084.2
   001043         104700     MOVE     "MOV-TEST-F1-4 " TO PAR-NAME.                       NC2084.2 300
   001044         104800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   001045         104900     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   001046         105000     MOVE     SPACE TO GRP-MOVE-CORR-R.                           NC2084.2 IMP 137
   001047         105100     MOVE     CORRESPONDING GRP-MOVE-CORR-1 TO GRP-MOVE-CORR-R.   NC2084.2 128 137

 ==001047==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "GRP-MOVE-CORR-1" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   001048         105200 MOV-TEST-F1-4.                                                   NC2084.2
   001049         105300     IF       GRP-MOVE-CORR-R EQUAL TO "   111222333XYZ   "       NC2084.2 137
   001050      1  105400              PERFORM PASS GO TO MOV-WRITE-F1-4.                  NC2084.2 450 1059
   001051         105500     GO       TO MOVE-FAIL-F1-4.                                  NC2084.2 1055
   001052         105600 MOV-DELETE-F1-4.                                                 NC2084.2
   001053         105700     PERFORM  DE-LETE.                                            NC2084.2 452
   001054         105800     GO       TO MOV-WRITE-F1-4.                                  NC2084.2 1059
   001055         105900 MOVE-FAIL-F1-4.                                                  NC2084.2
   001056         106000     MOVE     GRP-MOVE-CORR-R TO COMPUTED-A.                      NC2084.2 137 311
   001057         106100     MOVE     "   111222333XYZ   " TO CORRECT-A.                  NC2084.2 325
   001058         106200     PERFORM  FAIL.                                               NC2084.2 451
   001059         106300 MOV-WRITE-F1-4.                                                  NC2084.2
   001060         106400     PERFORM  PRINT-DETAIL.                                       NC2084.2 454
   001061         106500*                                                                 NC2084.2
   001062         106600 MOV-INIT-F1-5.                                                   NC2084.2
   001063         106700     MOVE     "MOV-TEST-F1-5" TO PAR-NAME.                        NC2084.2 300
   001064         106800     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   001065         106900     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   001066         107000     MOVE     SPACE TO GRP-TO-MOVE-CORR-TO.                       NC2084.2 IMP 158
   001067         107100     MOVE     CORRESPONDING GRP-TO-MOVE-CORR-1 TO                 NC2084.2 146

 ==001067==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "MOVE-CORR-E2" within
                         "GRP-TO-MOVE-CORR-TO" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "MOVE-CORR-E2" was ignored.

 ==001067==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "GRP-TO-MOVE-CORR-1" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   001068         107200              GRP-TO-MOVE-CORR-TO.                                NC2084.2 158
   001069         107300 MOV-TEST-F1-5.                                                   NC2084.2
   001070         107400     IF       GRP-TO-MOVE-CORR-TO EQUAL TO "111         123ABC45" NC2084.2 158
   001071      1  107500              PERFORM PASS GO TO MOV-WRITE-F1-5.                  NC2084.2 450 1080
   001072         107600     GO       TO MOVE-FAIL-F1-5.                                  NC2084.2 1076
   001073         107700 MOV-DELETE-F1-5.                                                 NC2084.2
   001074         107800     PERFORM  DE-LETE.                                            NC2084.2 452
   001075         107900     GO       TO MOV-WRITE-F1-5.                                  NC2084.2 1080
   001076         108000 MOVE-FAIL-F1-5.                                                  NC2084.2
   001077         108100     MOVE     GRP-TO-MOVE-CORR-TO TO COMPUTED-A.                  NC2084.2 158 311
   001078         108200     MOVE     "111         123ABC45" TO CORRECT-A.                NC2084.2 325
   001079         108300     PERFORM  FAIL.                                               NC2084.2 451
   001080         108400 MOV-WRITE-F1-5.                                                  NC2084.2
   001081         108500     PERFORM  PRINT-DETAIL.                                       NC2084.2 454
   001082         108600*                                                                 NC2084.2
   001083         108700 MOV-INIT-F1-6.                                                   NC2084.2
   001084         108800     MOVE "MOV-TEST-F1-6" TO PAR-NAME.                            NC2084.2 300
   001085         108900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   001086         109000     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   001087         109100     MOVE CORRESPONDING MOVE54 TO MOVE60.                         NC2084.2 84 90
   001088         109200 MOV-TEST-F1-6.                                                   NC2084.2
   001089         109300     IF MOVE60 EQUAL TO "XYA"                                     NC2084.2 90
   001090      1  109400            PERFORM PASS                                          NC2084.2 450
   001091      1  109500            GO TO MOV-WRITE-F1-6.                                 NC2084.2 1100
   001092         109600     GO TO MOV-FAIL-F1-6.                                         NC2084.2 1096
   001093         109700 MOV-DELETE-F1-6.                                                 NC2084.2
   001094         109800     PERFORM DE-LETE.                                             NC2084.2 452
   001095         109900     GO TO  MOV-WRITE-F1-6.                                       NC2084.2 1100
   001096         110000 MOV-FAIL-F1-6.                                                   NC2084.2
   001097         110100     MOVE MOVE60 TO COMPUTED-A                                    NC2084.2 90 311
   001098         110200     MOVE "XYA" TO CORRECT-A                                      NC2084.2 325
   001099         110300     PERFORM FAIL.                                                NC2084.2 451
   001100         110400 MOV-WRITE-F1-6.                                                  NC2084.2
   001101         110500     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   001102         110600*                                                                 NC2084.2
   001103         110700 MOV-INIT-F1-7.                                                   NC2084.2
   001104         110800     MOVE "MOV-TEST-F1-7" TO PAR-NAME.                            NC2084.2 300
   001105         110900     MOVE "IV-18 4.3.8.1" TO ANSI-REFERENCE.                      NC2084.2 356
   001106         111000     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2084.2 296
   001107         111100     MOVE "*" TO MOVE56 OF MOVE60 MOVE58 OF MOVE60 MOVE65.        NC2084.2 91 90 93 90 95
   001108         111200 MOV-TEST-F1-7.                                                   NC2084.2
   001109         111300     IF MOVE60 EQUAL TO "***"                                     NC2084.2 90
   001110      1  111400            PERFORM PASS                                          NC2084.2 450
   001111      1  111500            GO TO MOV-WRITE-F1-7.                                 NC2084.2 1120
   001112         111600     GO TO MOV-FAIL-F1-7.                                         NC2084.2 1116
   001113         111700 MOV-DELETE-F1-7.                                                 NC2084.2
   001114         111800     PERFORM DE-LETE.                                             NC2084.2 452
   001115         111900     GO TO MOV-WRITE-F1-7.                                        NC2084.2 1120
   001116         112000 MOV-FAIL-F1-7.                                                   NC2084.2
   001117         112100     MOVE MOVE60 TO COMPUTED-A                                    NC2084.2 90 311
   001118         112200     MOVE "***" TO CORRECT-A                                      NC2084.2 325
   001119         112300     PERFORM FAIL.                                                NC2084.2 451
   001120         112400 MOV-WRITE-F1-7.                                                  NC2084.2
   001121         112500     PERFORM PRINT-DETAIL.                                        NC2084.2 454
   001122         112600     PERFORM END-ROUTINE.                                         NC2084.2 475
   001123         112700 NUMERIC-OPERAND-LIMITS-TESTS SECTION.                            NC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001124         112800 CCVS-EXIT SECTION.                                               NC2084.2

 ==001124==> IGYPS2015-I The paragraph or section prior to paragraph or section "CCVS-EXIT" did
                         not contain any statements.

   001125         112900 CCVS-999999.                                                     NC2084.2
   001126         113000     GO TO CLOSE-FILES.                                           NC2084.2 443
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    24
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      229   AN-DATANAMES
      230   ANDATA1
      239   ANDATA10
      240   ANDATA11
      241   ANDATA12
      242   ANDATA13
      243   ANDATA14
      244   ANDATA15
      245   ANDATA16
      246   ANDATA17
      247   ANDATA18
      248   ANDATA19
      231   ANDATA2
      249   ANDATA20
      250   ANDATA21
      232   ANDATA3
      233   ANDATA4
      234   ANDATA5
      235   ANDATA6
      236   ANDATA7
      237   ANDATA8
      238   ANDATA9
      356   ANSI-REFERENCE . . . . . . . .  528 535 544 M553 M578 M602 M629 M680 M715 M737 M758 M779 M810 M832 M853 M875
                                            M971 M1016 M1044 M1064 M1085 M1105
       50   AZERO-DS-05V05
       56   A05ONES-DS-05V00
       53   A18ONES-DS-09V09
       57   A99-DS-02V00
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
      311   COMPUTED-A . . . . . . . . . .  312 314 315 316 317 540 543 M701 M707 M772 M797 M801 M867 M896 M913 M929 M948
                                            M964 M992 M1009 M1036 M1056 M1077 M1097 M1117
      312   COMPUTED-N . . . . . . . . . .  M751 M846
      310   COMPUTED-X . . . . . . . . . .  M462 526
      314   COMPUTED-0V18
      316   COMPUTED-14V4
      318   COMPUTED-18V0. . . . . . . . .  M730 M825
      315   COMPUTED-4V14
      334   COR-ANSI-REFERENCE . . . . . .  M535 M537
      181   CORR-DATA-1. . . . . . . . . .  877 878 879 880 881 882 886 939 949 973 974 975 976 977 978 979
      188   CORR-DATA-2. . . . . . . . . .  M886 887 896 904 913 921 929 938 948 956 964
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    25
0 Defined   Cross-reference of data names   References

0     195   CORR-DATA-3. . . . . . . . . .  M979 983 992 1000 1009 M1019 1020
      202   CORR-DATA-4
      209   CORR-DATA-5. . . . . . . . . .  M1018 M1020 1022 1025 1028 1036
      217   CORR-DATA-6
      224   CORR-DATA-7
      325   CORRECT-A. . . . . . . . . . .  326 327 328 329 330 541 543 M700 M706 M771 M796 M800 M866 M897 M914 M930 M949
                                            M965 M993 M1010 M1037 M1057 M1078 M1098 M1118
      326   CORRECT-N. . . . . . . . . . .  M750 M845
      324   CORRECT-X. . . . . . . . . . .  M463 527
      327   CORRECT-0V18
      329   CORRECT-14V4
      331   CORRECT-18V0 . . . . . . . . .  M729 M824
      328   CORRECT-4V14
      330   CR-18V0
       69   D-5
       70   D-9
      348   DELETE-COUNTER . . . . . . . .  M452 481 497 499
      252   DNAME1
      261   DNAME10
      262   DNAME11
      263   DNAME12
      264   DNAME13
      265   DNAME14
      266   DNAME15
      267   DNAME16
      268   DNAME17
      269   DNAME18
      270   DNAME19
      253   DNAME2
      271   DNAME20
      272   DNAME21
      273   DNAME22
      274   DNAME23
      275   DNAME24
      276   DNAME25
      277   DNAME26
      278   DNAME27
      279   DNAME28
      280   DNAME29
      254   DNAME3
      281   DNAME30
      282   DNAME31
      283   DNAME32
      284   DNAME33
      285   DNAME34
      286   DNAME35
      287   DNAME36
      288   DNAME37
      289   DNAME38
      290   DNAME39
      255   DNAME4
      291   DNAME40
      292   DNAME41
      293   DNAME42
      256   DNAME5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    26
0 Defined   Cross-reference of data names   References

0     257   DNAME6
      258   DNAME7
      259   DNAME8
      260   DNAME9
      303   DOTVALUE . . . . . . . . . . .  M457
      354   DUMMY-HOLD . . . . . . . . . .  M511 517
      117   DUMMY-LEVELZ
       38   DUMMY-RECORD . . . . . . . . .  M467 M468 M469 M470 M472 M473 M474 M476 M478 M487 M494 M501 M506 M507 511 M512
                                            513 M514 M515 M516 M517 521 M522 M530 M545
       78   EIGHT
      401   ENDER-DESC . . . . . . . . . .  M489 M500 M505
      349   ERROR-COUNTER. . . . . . . . .  M451 480 490 493
      353   ERROR-HOLD . . . . . . . . . .  M480 M481 M481 M482 485
      399   ERROR-TOTAL. . . . . . . . . .  M491 M493 M498 M499 M503 M504
      296   FEATURE. . . . . . . . . . . .  M681 M716 M738 M759 M780 M811 M833 M854 M876 M972 M1017 M1045 M1065 M1086 M1106
       81   FIFTEEN
       75   FIVE
       74   FOUR . . . . . . . . . . . . .  878 974
      168   GRP-FOR-MULT-REC-A
      172   GRP-FOR-MULT-REC-B
      176   GRP-FOR-MULT-REC-C
      104   GRP-FOR-QUAL-FROM. . . . . . .  686 719 740 761 782 814 835 856
      116   GRP-FOR-QUAL-TO. . . . . . . .  M684 687 688 698 720 721 730 741 742 751 762 763 772 783 784 794 813 815 816
                                            825 836 837 846 857 858
      137   GRP-MOVE-CORR-R. . . . . . . .  M1046 M1047 1049 1056
      128   GRP-MOVE-CORR-1. . . . . . . .  1047
      145   GRP-TO-MOVE-CORR
      158   GRP-TO-MOVE-CORR-TO. . . . . .  M1066 M1068 1070 1077
      146   GRP-TO-MOVE-CORR-1 . . . . . .  1067
      427   HYPHEN-LINE. . . . . . . . . .  474 476 516
      393   ID-AGAIN . . . . . . . . . . .  M439
      426   INF-ANSI-REFERENCE . . . . . .  M528 M531 M544 M546
      421   INFO-TEXT. . . . . . . . . . .  M529
      350   INSPECT-COUNTER. . . . . . . .  M449 480 502 504
      149   MOVE-CORR-E1 . . . . . . . . .  1068
      161   MOVE-CORR-E1 . . . . . . . . .  M1068
      150   MOVE-CORR-E2
      162   MOVE-CORR-E2
      153   MOVE-CORR-E3 . . . . . . . . .  1068
      165   MOVE-CORR-E3 . . . . . . . . .  M1068
      156   MOVE-CORR-E4
      157   MOVE-CORR-E5
      147   MOVE-CORR-G1
      159   MOVE-CORR-G1
      148   MOVE-CORR-G2
      160   MOVE-CORR-G2
      152   MOVE-CORR-G3
      164   MOVE-CORR-G3
      154   MOVE-CORR-G4
      166   MOVE-CORR-G4
      155   MOVE-CORR-G5 . . . . . . . . .  1068
      167   MOVE-CORR-G5 . . . . . . . . .  M1068
      132   MOVE-CORR-1. . . . . . . . . .  1047
      139   MOVE-CORR-1. . . . . . . . . .  M1047
      131   MOVE-CORR-2. . . . . . . . . .  1047
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    27
0 Defined   Cross-reference of data names   References

0     140   MOVE-CORR-2. . . . . . . . . .  M1047
      130   MOVE-CORR-3. . . . . . . . . .  1047
      141   MOVE-CORR-3. . . . . . . . . .  M1047
      134   MOVE-CORR-4. . . . . . . . . .  1047
      142   MOVE-CORR-4. . . . . . . . . .  M1047
      129   MOVE-CORR-5
      135   MOVE-CORR-6
      136   MOVE-CORR-7
       84   MOVE54 . . . . . . . . . . . .  1087
       85   MOVE55
       86   MOVE56 . . . . . . . . . . . .  1087
       91   MOVE56 . . . . . . . . . . . .  M1087 M1107
       87   MOVE57
       92   MOVE57
       88   MOVE58 . . . . . . . . . . . .  1087
       93   MOVE58 . . . . . . . . . . . .  M1087 M1107
       89   MOVE59
       90   MOVE60 . . . . . . . . . . . .  M1087 1089 1097 1107 1107 1109 1117
       94   MOVE64
       95   MOVE65 . . . . . . . . . . . .  M1107
       79   NINE
       71   ONE
      298   P-OR-F . . . . . . . . . . . .  M449 M450 M451 M452 459 M462 M705 M799
      300   PAR-NAME . . . . . . . . . . .  M464 M552 M577 M601 M628 M678 M708 M714 M736 M757 M778 M809 M831 M852 M884 M902
                                            M919 M936 M954 M981 M998 M1015 M1043 M1063 M1084 M1104
      302   PARDOT-X . . . . . . . . . . .  M456
      351   PASS-COUNTER . . . . . . . . .  M450 482 484
       36   PRINT-FILE . . . . . . . . . .  32 438 444
       37   PRINT-REC. . . . . . . . . . .  M458 M534 M536 M703 704 M803 804
       40   QT1. . . . . . . . . . . . . .  556 M572 M656
       41   QT2. . . . . . . . . . . . . .  581 M596 M658
       42   QT3. . . . . . . . . . . . . .  M608 M611 613 M660
       43   QT4. . . . . . . . . . . . . .  M635 M638 640 M672
       44   QT5
      105   QUAL-TEST-SUB-GRP-1
      113   QUAL-TEST-SUB-GRP-2. . . . . .  M683
      106   QUAL-TEST-1. . . . . . . . . .  108 686
      118   QUAL-TEST-1. . . . . . . . . .  119 M687 688 698
      108   QUAL-TEST-1-FROM . . . . . . .  782
      119   QUAL-TEST-1-TO . . . . . . . .  M783 784 794
      109   QUAL-TEST-2. . . . . . . . . .  110 719
      120   QUAL-TEST-2. . . . . . . . . .  121 M720 721 730
      110   QUAL-TEST-2-FROM . . . . . . .  814
      121   QUAL-TEST-2-TO . . . . . . . .  M717 M813 M815 816 825
      111   QUAL-TEST-3. . . . . . . . . .  112 740
      122   QUAL-TEST-3. . . . . . . . . .  123 M741 742 751
      112   QUAL-TEST-3-FROM . . . . . . .  835
      123   QUAL-TEST-3-TO . . . . . . . .  M836 837 846
      114   QUAL-TEST-4. . . . . . . . . .  761
      125   QUAL-TEST-4. . . . . . . . . .  M762
      115   QUAL-TEST-4-FROM . . . . . . .  856
      127   QUAL-TEST-4-TO . . . . . . . .  M857
      124   QUAL-TEST1 . . . . . . . . . .  763 772
      126   QUAL-TEST2 . . . . . . . . . .  858 867
      305   RE-MARK. . . . . . . . . . . .  M453 M465 M702 M709 M802
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    28
0 Defined   Cross-reference of data names   References

0     347   REC-CT . . . . . . . . . . . .  455 457 464
      346   REC-SKL-SUB
      100   RECEIVE-BREAKDOWN. . . . . . .  M698 M794
      101   RECEIVE-20 . . . . . . . . . .  701 797
      102   RECEIVE-40 . . . . . . . . . .  707 801
      103   RECEIVE-60
      355   RECORD-COUNT . . . . . . . . .  M509 510 M518
       96   SEND-BREAKDOWN . . . . . . . .  M697 M793
       97   SEND-20. . . . . . . . . . . .  700 796
       98   SEND-40. . . . . . . . . . . .  706 800
       99   SEND-60
       77   SEVEN
       76   SIX
       80   TEN. . . . . . . . . . . . . .  879 921 975
      306   TEST-COMPUTED. . . . . . . . .  534
      321   TEST-CORRECT . . . . . . . . .  536
      374   TEST-ID. . . . . . . . . . . .  M439
      294   TEST-RESULTS . . . . . . . . .  M440 458 M679 703 803
       73   THREE. . . . . . . . . . . . .  877 904 914 973
      352   TOTAL-ERROR
       82   TWENTY
       83   TWENTY-5
       72   TWO
       63   W-1
       64   W-2
       65   W-3
       66   W-4
       67   W-6
       68   W-9
       46   WRK-DS-01V00 . . . . . . . . .  M685 740 761 762 836 856 857
      169   WRK-DS-01V00-IN-GRP
       47   WRK-DS-02V00
      177   WRK-DS-02V00-IN-GRP
       60   WRK-DS-0201P
      174   WRK-DS-0201P-IN-GRP
       58   WRK-DS-03V00
      175   WRK-DS-03V00-IN-GRP
       61   WRK-DS-03V10
      173   WRK-DS-03V10-IN-GRP
       49   WRK-DS-05V00
      170   WRK-DS-05V00-IN-GRP
       59   WRK-DS-06V00
       48   WRK-DS-06V06
      171   WRK-DS-06V06-IN-GRP
      180   WRK-DS-09V00
       51   WRK-DS-09V09 . . . . . . . . .  52
      179   WRK-DS-09V09-IN-GRP
       55   WRK-DS-18V00
      178   WRK-DS-18V00-IN-GRP
       52   WRK-DS-18V00-S
       45   WRK-XN-00001
       62   XRAY
      423   XXCOMPUTED . . . . . . . . . .  M543
      425   XXCORRECT. . . . . . . . . . .  M543
      418   XXINFO . . . . . . . . . . . .  530 545
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    29
0 Defined   Cross-reference of data names   References

0     182   XYZ-1. . . . . . . . . . . . .  M877 886 M973 979
      189   XYZ-1. . . . . . . . . . . . .  M886 904 913
      201   XYZ-1. . . . . . . . . . . . .  M979 983 992 1020
      210   XYZ-1. . . . . . . . . . . . .  M1020 1022
      221   XYZ-1
      225   XYZ-1
      203   XYZ-11
      215   XYZ-11
      218   XYZ-11
      227   XYZ-11
      204   XYZ-12
      216   XYZ-12
      219   XYZ-12
      205   XYZ-13
      212   XYZ-13 . . . . . . . . . . . .  1028
      206   XYZ-14
      213   XYZ-14
      207   XYZ-15
      208   XYZ-16
      183   XYZ-2. . . . . . . . . . . . .  M878 886 M974 979
      190   XYZ-2. . . . . . . . . . . . .  M886 887 896
      200   XYZ-2. . . . . . . . . . . . .  M979 1020
      211   XYZ-2. . . . . . . . . . . . .  M1020 1025
      222   XYZ-2
      228   XYZ-2
      184   XYZ-3. . . . . . . . . . . . .  M879 886 M975 979
      191   XYZ-3. . . . . . . . . . . . .  M886 921 929
      197   XYZ-3. . . . . . . . . . . . .  M979 1000 1009
      185   XYZ-4. . . . . . . . . . . . .  M880 886 938 949 M976 979
      192   XYZ-4. . . . . . . . . . . . .  M886 938 948
      196   XYZ-4. . . . . . . . . . . . .  M979
      186   XYZ-5. . . . . . . . . . . . .  M881 886 M977 979
      193   XYZ-5. . . . . . . . . . . . .  M886 956 964
      199   XYZ-5. . . . . . . . . . . . .  M979
      187   XYZ-6. . . . . . . . . . . . .  M882 886 M978 979
      194   XYZ-6. . . . . . . . . . . . .  M886
      198   XYZ-6. . . . . . . . . . . . .  M979
      226   XYZ-6
      251   42-DATANAMES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    30
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
     1124   CCVS-EXIT
     1125   CCVS-999999
      436   CCVS1
      548   CCVS1-EXIT . . . . . . . . . .  G442
      443   CLOSE-FILES. . . . . . . . . .  G1126
      471   COLUMN-NAMES-ROUTINE . . . . .  E441
      676   DATA-NAME-QUAL
      452   DE-LETE. . . . . . . . . . . .  P561 P586 P618 P645 P694 P726 P747 P768 P790 P821 P842 P863 P892 P909 P926 P944
                                            P961 P988 P1005 P1033 P1053 P1074 P1094 P1114
      475   END-ROUTINE. . . . . . . . . .  P444 P652 P871 P1122
      479   END-ROUTINE-1
      488   END-ROUTINE-12
      496   END-ROUTINE-13 . . . . . . . .  E444
      477   END-RTN-EXIT
      451   FAIL . . . . . . . . . . . . .  P564 P589 P621 P648 P663 P699 P731 P752 P773 P795 P826 P847 P868 P895 P912 P931
                                            P947 P966 P991 P1008 P1038 P1058 P1079 P1099 P1119
      525   FAIL-ROUTINE . . . . . . . . .  P460
      538   FAIL-ROUTINE-EX. . . . . . . .  E460 G532
      533   FAIL-ROUTINE-WRITE . . . . . .  G526 G527
      466   HEAD-ROUTINE . . . . . . . . .  P441
      449   INSPT
      891   MOV-DELETE-F1-1-1
      908   MOV-DELETE-F1-1-2
      925   MOV-DELETE-F1-1-3
      943   MOV-DELETE-F1-1-4
      960   MOV-DELETE-F1-1-5
      987   MOV-DELETE-F1-2-1
     1004   MOV-DELETE-F1-2-2
     1032   MOV-DELETE-F1-3
     1052   MOV-DELETE-F1-4
     1073   MOV-DELETE-F1-5
     1093   MOV-DELETE-F1-6
     1113   MOV-DELETE-F1-7
      894   MOV-FAIL-F1-1-1. . . . . . . .  G889
      911   MOV-FAIL-F1-1-2. . . . . . . .  G906
      928   MOV-FAIL-F1-1-3. . . . . . . .  G923
      946   MOV-FAIL-F1-1-4. . . . . . . .  G941
      963   MOV-FAIL-F1-1-5. . . . . . . .  G958
      990   MOV-FAIL-F1-2-1. . . . . . . .  G985
     1007   MOV-FAIL-F1-2-2. . . . . . . .  G1002
     1035   MOV-FAIL-F1-3. . . . . . . . .  G1024 G1027 G1030
     1096   MOV-FAIL-F1-6. . . . . . . . .  G1092
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    31
0 Defined   Cross-reference of procedures   References

0    1116   MOV-FAIL-F1-7. . . . . . . . .  G1112
      874   MOV-INIT-F1-1
      883   MOV-INIT-F1-1-1
      901   MOV-INIT-F1-1-2
      918   MOV-INIT-F1-1-3
      935   MOV-INIT-F1-1-4
      953   MOV-INIT-F1-1-5
      970   MOV-INIT-F1-2
      980   MOV-INIT-F1-2-1
      997   MOV-INIT-F1-2-2
     1014   MOV-INIT-F1-3
     1042   MOV-INIT-F1-4
     1062   MOV-INIT-F1-5
     1083   MOV-INIT-F1-6
     1103   MOV-INIT-F1-7
      885   MOV-TEST-F1-1-1
      903   MOV-TEST-F1-1-2
      920   MOV-TEST-F1-1-3
      937   MOV-TEST-F1-1-4
      955   MOV-TEST-F1-1-5
      982   MOV-TEST-F1-2-1
      999   MOV-TEST-F1-2-2
     1021   MOV-TEST-F1-3
     1048   MOV-TEST-F1-4
     1069   MOV-TEST-F1-5
     1088   MOV-TEST-F1-6
     1108   MOV-TEST-F1-7
      898   MOV-WRITE-F1-1-1 . . . . . . .  G890 G893
      915   MOV-WRITE-F1-1-2 . . . . . . .  G907 G910
      932   MOV-WRITE-F1-1-3 . . . . . . .  G924 G927
      950   MOV-WRITE-F1-1-4 . . . . . . .  G942 G945
      967   MOV-WRITE-F1-1-5 . . . . . . .  G959 G962
      994   MOV-WRITE-F1-2-1 . . . . . . .  G986 G989
     1011   MOV-WRITE-F1-2-2 . . . . . . .  G1003 G1006
     1039   MOV-WRITE-F1-3 . . . . . . . .  G1031 G1034
     1059   MOV-WRITE-F1-4 . . . . . . . .  G1050 G1054
     1080   MOV-WRITE-F1-5 . . . . . . . .  G1071 G1075
     1100   MOV-WRITE-F1-6 . . . . . . . .  G1091 G1095
     1120   MOV-WRITE-F1-7 . . . . . . . .  G1111 G1115
      873   MOVE-CORR-ROUTINE
     1055   MOVE-FAIL-F1-4 . . . . . . . .  G1051
     1076   MOVE-FAIL-F1-5 . . . . . . . .  G1072
     1123   NUMERIC-OPERAND-LIMITS-TESTS
      437   OPEN-FILES
      560   PAR-DELETE-F2-1
      585   PAR-DELETE-F2-2
      617   PAR-DELETE-F2-3
      644   PAR-DELETE-F2-4
      563   PAR-FAIL-F2-1. . . . . . . . .  G559
      588   PAR-FAIL-F2-2. . . . . . . . .  G584
      620   PAR-FAIL-F2-3. . . . . . . . .  G616
      647   PAR-FAIL-F2-4. . . . . . . . .  G643
      551   PAR-INIT-F2-1
      576   PAR-INIT-F2-2
      600   PAR-INIT-F2-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    32
0 Defined   Cross-reference of procedures   References

0     627   PAR-INIT-F2-4. . . . . . . . .  G665
      554   PAR-TEST-F2-1
      579   PAR-TEST-F2-2
      603   PAR-TEST-F2-3
      630   PAR-TEST-F2-4
      567   PAR-WRITE-F2-1 . . . . . . . .  G558 G562
      592   PAR-WRITE-F2-2 . . . . . . . .  G583 G587
      622   PAR-WRITE-F2-3 . . . . . . . .  G615 G619
      649   PAR-WRITE-F2-4 . . . . . . . .  G642 G646
      573   PAR-1-EXIT . . . . . . . . . .  G569
      571   PAR-1A                          P555
      655   PAR-1A
      597   PAR-2-EXIT . . . . . . . . . .  G594
      595   PAR-2A
      657   PAR-2A . . . . . . . . . . . .  P580
      624   PAR-3-EXIT
      607   PAR-3A
      610   PAR-3B                          G604
      659   PAR-3B
      612   PAR-3C . . . . . . . . . . . .  G609 G661
      662   PAR-3C
      666   PAR-4
      651   PAR-4-EXIT
      634   PAR-4A
      637   PAR-4B
      671   PAR-4B . . . . . . . . . . . .  G631
      639   PAR-4C . . . . . . . . . . . .  G636 G673
      450   PASS . . . . . . . . . . . . .  P557 P582 P614 P641 P690 P722 P743 P764 P786 P817 P838 P859 P888 P905 P922 P940
                                            P957 P984 P1001 P1029 P1050 P1071 P1090 P1110
      454   PRINT-DETAIL . . . . . . . . .  P568 P593 P623 P650 P711 P733 P754 P775 P806 P828 P849 P870 P899 P916 P933 P951
                                            P968 P995 P1012 P1040 P1060 P1081 P1101 P1121
      693   QAL-DELETE-F1-1
      725   QAL-DELETE-F1-2
      746   QAL-DELETE-F1-3
      767   QAL-DELETE-F1-4
      789   QAL-DELETE-F1-5
      820   QAL-DELETE-F1-6
      841   QAL-DELETE-F1-7
      862   QAL-DELETE-F1-8
      696   QAL-FAIL-F1-1. . . . . . . . .  G692
      728   QAL-FAIL-F1-2. . . . . . . . .  G724
      749   QAL-FAIL-F1-3. . . . . . . . .  G745
      770   QAL-FAIL-F1-4. . . . . . . . .  G766
      792   QAL-FAIL-F1-5. . . . . . . . .  G788
      823   QAL-FAIL-F1-6. . . . . . . . .  G819
      844   QAL-FAIL-F1-7. . . . . . . . .  G840
      865   QAL-FAIL-F1-8. . . . . . . . .  G861
      677   QAL-INIT-F1-1
      713   QAL-INIT-F1-2
      735   QAL-INIT-F1-3
      756   QAL-INIT-F1-4
      777   QAL-INIT-F1-5
      808   QAL-INIT-F1-6
      830   QAL-INIT-F1-7
      851   QAL-INIT-F1-8
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    33
0 Defined   Cross-reference of procedures   References

0     682   QAL-TEST-F1-1
      718   QAL-TEST-F1-2
      739   QAL-TEST-F1-3
      760   QAL-TEST-F1-4
      781   QAL-TEST-F1-5
      812   QAL-TEST-F1-6
      834   QAL-TEST-F1-7
      855   QAL-TEST-F1-8
      710   QAL-WRITE-F1-1 . . . . . . . .  G691 G695
      732   QAL-WRITE-F1-2 . . . . . . . .  G723 G727
      753   QAL-WRITE-F1-3 . . . . . . . .  G744 G748
      774   QAL-WRITE-F1-4 . . . . . . . .  G765 G769
      805   QAL-WRITE-F1-5 . . . . . . . .  G787 G791 P798
      827   QAL-WRITE-F1-6 . . . . . . . .  G818 G822
      848   QAL-WRITE-F1-7 . . . . . . . .  G839 G843
      869   QAL-WRITE-F1-8 . . . . . . . .  G860 G864
      674   QUAL-EXIT. . . . . . . . . . .  G653 G667
      550   QUAL-SECTION-1 . . . . . . . .  555 604 661 665 673
      654   QUAL-SECTION-2 . . . . . . . .  580 631
      447   TERMINATE-CALL
      445   TERMINATE-CCVS
      508   WRITE-LINE . . . . . . . . . .  P458 P459 P467 P468 P469 P470 P472 P473 P474 P476 P478 P487 P495 P501 P506 P507
                                            P530 P534 P536 P545
      520   WRT-LN . . . . . . . . . . . .  P514 P515 P516 P519 P524
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    34
0 Defined   Cross-reference of programs     References

        3   NC208A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC208A    Date 06/04/2022  Time 11:59:21   Page    35
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1047  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "FILLER" within "GRP-MOVE-CORR-1" did not qualify
                       according to the rules for the "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   1067  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "MOVE-CORR-E2" within "GRP-TO-MOVE-CORR-TO" did not
                       qualify according to the rules for the "CORRESPONDING" phrase.  Subordinate item "MOVE-CORR-E2" was ignored.

   1067  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "FILLER" within "GRP-TO-MOVE-CORR-1" did not qualify
                       according to the rules for the "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   1124  IGYPS2015-I   The paragraph or section prior to paragraph or section "CCVS-EXIT" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           2              3
-* Statistics for COBOL program NC208A:
 *    Source records = 1126
 *    Data Division statements = 306
 *    Procedure Division statements = 509
 *    Generated COBOL statements = 0
 *    Program complexity factor = 528
0End of compilation 1,  program NC208A,  highest severity 4.
0Return code 4
