1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:54   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:54   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2224.2
   000002         000200 PROGRAM-ID.                                                      IC2224.2
   000003         000300     IC222A.                                                      IC2224.2
   000004         000500*                                                              *  IC2224.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2224.2
   000006         000700*                                                              *  IC2224.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2224.2
   000008         000900*                                                              *  IC2224.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2224.2
   000010         001100*                                                              *  IC2224.2
   000011         001300*                                                              *  IC2224.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2224.2
   000013         001500*                                                              *  IC2224.2
   000014         001600*            X-55   SYSTEM PRINTER                             *  IC2224.2
   000015         001700*            X-82   SOURCE-COMPUTER                            *  IC2224.2
   000016         001800*            X-83   OBJECT-COMPUTER.                           *  IC2224.2
   000017         001900*                                                              *  IC2224.2
   000018         002100*                                                              *  IC2224.2
   000019         002200*    THE SOURCE FILE CONTAINS TWO PROGRAMS, IC222A AND         *  IC2224.2
   000020         002300*    IC222A-1, WHICH TEST LANGUAGE ELEMENTS FROM  LEVEL 2 OF   *  IC2224.2
   000021         002400*    THE INTER-PROGRAM COMMUNICATION MODULE.  THE LANGUAGE     *  IC2224.2
   000022         002500*    ELEMENTS TESTED ARE:                                      *  IC2224.2
   000023         002600*          "ON EXCEPTION"     PHRASE                           *  IC2224.2
   000024         002700*          "NOT ON EXCEPTION" PHRASE                           *  IC2224.2
   000025         002800*          "END-CALL"         PHRASE                           *  IC2224.2
   000026         002900*          "ON OVERFLOW"      PHRASE                           *  IC2224.2
   000027         003000*                                                              *  IC2224.2
   000028         003100*    THE TWO PROGRAMS SHOULD BE COMPILED IN THE SAME           *  IC2224.2
   000029         003200*    INVOCATION OF THE COMPILER TO TEST THE BATCH COMPILATION  *  IC2224.2
   000030         003300*    FEATURE AND RECOGNITION OF THE END PROGRAM HEADER.  THE   *  IC2224.2
   000031         003400*    ARRANGEMENT OF THE PROGRAMS IN THE SOURCE FILE IS:        *  IC2224.2
   000032         003500*                                                              *  IC2224.2
   000033         003600*    IDENTIFICATION DIVISION.                                  *  IC2224.2
   000034         003700*    PROGRAM-ID. IC222A.                                       *  IC2224.2
   000035         003800*          .                                                   *  IC2224.2
   000036         003900*          .                                                   *  IC2224.2
   000037         004000*          .                                                   *  IC2224.2
   000038         004100*    END PROGRAM IC222A.                                          IC2224.2
   000039         004200*    IDENTIFICATION DIVISION.                                     IC2224.2
   000040         004300*    PROGRAM-ID. IC222A-1.                                        IC2224.2
   000041         004400*          .                                                   *  IC2224.2
   000042         004500*          .                                                   *  IC2224.2
   000043         004600*          .                                                   *  IC2224.2
   000044         004700*                                                              *  IC2224.2
   000045         004800*    IC222A, THE FIRST PROGRAM IN THE FILE, CONTAINS THE       *  IC2224.2
   000046         004900*    SUBSTANTIVE TESTS.  THE ONLY FUNCTION OF THE OTHER        *  IC2224.2
   000047         005000*    PROGRAM IS TO ENSURE THAT A PROGRAM WITH KNOWN PARAMETER  *  IC2224.2
   000048         005100*    REQUIREMENTS IS AVAILABLE TO BE CALLED.  IC222A TESTS     *  IC2224.2
   000049         005200*    CONTROL FLOW THROUGH VARIANTS OF THE CALL STATEMENT WITH  *  IC2224.2
   000050         005300*    THE "ON EXCEPTION" PHRASE PRESENT OR ABSENT; THE "NOT ON  *  IC2224.2
   000051         005400*    EXCEPTION" PHRASE PRESENT OR ABSENT; AND AVAILABLE OR     *  IC2224.2
   000052         005500*    NON-AVAIABLE TARGET PROGRAMS.  EACH CALL STATEMENT HAS AN *  IC2224.2
   000053         005600*    END-CALL PHRASE, AND THERE ARE SECONDARY TESTS WHICH      *  IC2224.2
   000054         005700*    CHECK THAT STATEMENTS FOLLOWING END-CALL ARE PROPERLY     *  IC2224.2
   000055         005800*    EXECUTED.                                                 *  IC2224.2
   000056         005900*                                                                 IC2224.2
   000057         006000*    THIS TEST SET DOES NOT EXAMINE THE RESULTS RETURNED BY    *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100*    THE CALLED PROGRAM, BUT IS WHOLLY CONCERNED WITH THE FLOW *  IC2224.2
   000059         006200*    OF CONTROL IN THE CALLING PROGRAM DURING EXECUTION OF A   *  IC2224.2
   000060         006300*    CALL STATEMENT.                                           *  IC2224.2
   000061         006400*                                                              *  IC2224.2
   000062         006500*    THERE ARE EIGHT POSIBLE COMBINATIONS OF CALL STATEMENT    *  IC2224.2
   000063         006600*    FORMAT AND CALLED PROGRAM AVAILABILITY THAT COULD BE      *  IC2224.2
   000064         006700*    TESTED.  TWO OF THESE COMBINATIONS, THOSE WHERE A PROGRAM *  IC2224.2
   000065         006800*    WHICH IS NOT AVAILABLE IS CALLED THROUGH  A STATEMENT     *  IC2224.2
   000066         006900*    WHICH DOES NOT CONTAIN AN "ON EXCEPTION" PHRASE, PRODUCE  *  IC2224.2
   000067         007000*    EFFECTS WHICH THE STANDARD LEAVES UNDEFINED.  THUS THERE  *  IC2224.2
   000068         007100*    ARE SIX CASES WHICH CAN BE TESTED.  THIS TEST SUITE TESTS *  IC2224.2
   000069         007200*    ALL SIX.  IN ADDITION, IT TESTS THE TWO CASES WHERE       *  IC2224.2
   000070         007300*    "ON OVERFLOW" CAN BE USED IN PLACE OF "ON EXCEPTION".     *  IC2224.2
   000071         007400*    EACH OF THE EIGHT MAJOR TESTS IS FOLLOWED BY A            *  IC2224.2
   000072         007500*    SUBORDINATE TEST WHICH IS INTENDED TO CHECK THE WAY       *  IC2224.2
   000073         007600*    THAT CONTROL HAS FLOWED THROUGH THE PHRASES OF THE CALL   *  IC2224.2
   000074         007700*    STATEMENT.  EVERY CALL STATEMENT IN IC222A HAS AN         *  IC2224.2
   000075         007800*    "END-CALL" SCOPE DELIMITER.  THIS SCOPE DELIMITER IS      *  IC2224.2
   000076         007900*    FOLLOWED BY ONE MORE STATEMENT IN THE SENTENCE, AND THE   *  IC2224.2
   000077         008000*    SUBORDINATE TESTS CHECK THAT THIS ADDITIONAL STATEMENT    *  IC2224.2
   000078         008100*    HAS BEEN EXECUTED.                                        *  IC2224.2
   000079         008200*                                                              *  IC2224.2
   000080         008400*                                                                 IC2224.2
   000081         008500 ENVIRONMENT DIVISION.                                            IC2224.2
   000082         008600 CONFIGURATION SECTION.                                           IC2224.2
   000083         008700 SOURCE-COMPUTER.                                                 IC2224.2
   000084         008800     XXXXX082.                                                    IC2224.2
   000085         008900 OBJECT-COMPUTER.                                                 IC2224.2
   000086         009000     XXXXX083.                                                    IC2224.2
   000087         009100 INPUT-OUTPUT SECTION.                                            IC2224.2
   000088         009200 FILE-CONTROL.                                                    IC2224.2
   000089         009300     SELECT PRINT-FILE ASSIGN TO                                  IC2224.2 94
   000090         009400     XXXXX055.                                                    IC2224.2
   000091         009500*                                                                 IC2224.2
   000092         009600 DATA DIVISION.                                                   IC2224.2
   000093         009700 FILE SECTION.                                                    IC2224.2
   000094         009800 FD  PRINT-FILE.                                                  IC2224.2

 ==000094==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000095         009900 01  PRINT-REC PICTURE X(120).                                    IC2224.2
   000096         010000 01  DUMMY-RECORD PICTURE X(120).                                 IC2224.2
   000097         010100*                                                                 IC2224.2
   000098         010200 WORKING-STORAGE SECTION.                                         IC2224.2
   000099         010300 77  DN1 PICTURE S99  VALUE ZERO.                                 IC2224.2 IMP
   000100         010400 77  DN3 PICTURE S99.                                             IC2224.2
   000101         010500 77  ID1 PICTURE X(8) VALUE "IC222A-1".                           IC2224.2
   000102         010600 77  ID2 PICTURE X(8).                                            IC2224.2
   000103         010700 77  DN2 PICTURE S99                                              IC2224.2
   000104         010800         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2224.2 IMP
   000105         010900 77  DN4 PICTURE S99                                              IC2224.2
   000106         011000         USAGE IS COMPUTATIONAL.                                  IC2224.2
   000107         011100 77  CALL-FLAG PIC 9.                                             IC2224.2
   000108         011200 01  EXCEPTION-PATH-FLAG PICTURE X.                               IC2224.2
   000109         011300*                                                                 IC2224.2
   000110         011400 01  TEST-RESULTS.                                                IC2224.2
   000111         011500     02 FILLER                   PIC X      VALUE SPACE.          IC2224.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FEATURE                  PIC X(20)  VALUE SPACE.          IC2224.2 IMP
   000113         011700     02 FILLER                   PIC X      VALUE SPACE.          IC2224.2 IMP
   000114         011800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IC2224.2 IMP
   000115         011900     02 FILLER                   PIC X      VALUE SPACE.          IC2224.2 IMP
   000116         012000     02  PAR-NAME.                                                IC2224.2
   000117         012100       03 FILLER                 PIC X(19)  VALUE SPACE.          IC2224.2 IMP
   000118         012200       03  PARDOT-X              PIC X      VALUE SPACE.          IC2224.2 IMP
   000119         012300       03 DOTVALUE               PIC 99     VALUE ZERO.           IC2224.2 IMP
   000120         012400     02 FILLER                   PIC X(8)   VALUE SPACE.          IC2224.2 IMP
   000121         012500     02 RE-MARK                  PIC X(61).                       IC2224.2
   000122         012600 01  TEST-COMPUTED.                                               IC2224.2
   000123         012700     02 FILLER                   PIC X(30)  VALUE SPACE.          IC2224.2 IMP
   000124         012800     02 FILLER                   PIC X(17)  VALUE                 IC2224.2
   000125         012900            "       COMPUTED=".                                   IC2224.2
   000126         013000     02 COMPUTED-X.                                               IC2224.2
   000127         013100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IC2224.2 IMP
   000128         013200     03 COMPUTED-N               REDEFINES COMPUTED-A             IC2224.2 127
   000129         013300                                 PIC -9(9).9(9).                  IC2224.2
   000130         013400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IC2224.2 127
   000131         013500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IC2224.2 127
   000132         013600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IC2224.2 127
   000133         013700     03       CM-18V0 REDEFINES COMPUTED-A.                       IC2224.2 127
   000134         013800         04 COMPUTED-18V0                    PIC -9(18).          IC2224.2
   000135         013900         04 FILLER                           PIC X.               IC2224.2
   000136         014000     03 FILLER PIC X(50) VALUE SPACE.                             IC2224.2 IMP
   000137         014100 01  TEST-CORRECT.                                                IC2224.2
   000138         014200     02 FILLER PIC X(30) VALUE SPACE.                             IC2224.2 IMP
   000139         014300     02 FILLER PIC X(17) VALUE "       CORRECT =".                IC2224.2
   000140         014400     02 CORRECT-X.                                                IC2224.2
   000141         014500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IC2224.2 IMP
   000142         014600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IC2224.2 141
   000143         014700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IC2224.2 141
   000144         014800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IC2224.2 141
   000145         014900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IC2224.2 141
   000146         015000     03      CR-18V0 REDEFINES CORRECT-A.                         IC2224.2 141
   000147         015100         04 CORRECT-18V0                     PIC -9(18).          IC2224.2
   000148         015200         04 FILLER                           PIC X.               IC2224.2
   000149         015300     03 FILLER PIC X(2) VALUE SPACE.                              IC2224.2 IMP
   000150         015400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IC2224.2 IMP
   000151         015500 01  CCVS-C-1.                                                    IC2224.2
   000152         015600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIC2224.2
   000153         015700-    "SS  PARAGRAPH-NAME                                          IC2224.2
   000154         015800-    "       REMARKS".                                            IC2224.2
   000155         015900     02 FILLER                     PIC X(20)    VALUE SPACE.      IC2224.2 IMP
   000156         016000 01  CCVS-C-2.                                                    IC2224.2
   000157         016100     02 FILLER                     PIC X        VALUE SPACE.      IC2224.2 IMP
   000158         016200     02 FILLER                     PIC X(6)     VALUE "TESTED".   IC2224.2
   000159         016300     02 FILLER                     PIC X(15)    VALUE SPACE.      IC2224.2 IMP
   000160         016400     02 FILLER                     PIC X(4)     VALUE "FAIL".     IC2224.2
   000161         016500     02 FILLER                     PIC X(94)    VALUE SPACE.      IC2224.2 IMP
   000162         016600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IC2224.2 IMP
   000163         016700 01  REC-CT                        PIC 99       VALUE ZERO.       IC2224.2 IMP
   000164         016800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IC2224.2 IMP
   000165         016900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IC2224.2 IMP
   000166         017000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IC2224.2 IMP
   000167         017100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IC2224.2 IMP
   000168         017200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IC2224.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IC2224.2 IMP
   000170         017400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IC2224.2 IMP
   000171         017500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IC2224.2 IMP
   000172         017600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IC2224.2 IMP
   000173         017700 01  CCVS-H-1.                                                    IC2224.2
   000174         017800     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2224.2 IMP
   000175         017900     02  FILLER                    PIC X(42)    VALUE             IC2224.2
   000176         018000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IC2224.2
   000177         018100     02  FILLER                    PIC X(39)    VALUE SPACES.     IC2224.2 IMP
   000178         018200 01  CCVS-H-2A.                                                   IC2224.2
   000179         018300   02  FILLER                        PIC X(40)  VALUE SPACE.      IC2224.2 IMP
   000180         018400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IC2224.2
   000181         018500   02  FILLER                        PIC XXXX   VALUE             IC2224.2
   000182         018600     "4.2 ".                                                      IC2224.2
   000183         018700   02  FILLER                        PIC X(28)  VALUE             IC2224.2
   000184         018800            " COPY - NOT FOR DISTRIBUTION".                       IC2224.2
   000185         018900   02  FILLER                        PIC X(41)  VALUE SPACE.      IC2224.2 IMP
   000186         019000                                                                  IC2224.2
   000187         019100 01  CCVS-H-2B.                                                   IC2224.2
   000188         019200   02  FILLER                        PIC X(15)  VALUE             IC2224.2
   000189         019300            "TEST RESULT OF ".                                    IC2224.2
   000190         019400   02  TEST-ID                       PIC X(9).                    IC2224.2
   000191         019500   02  FILLER                        PIC X(4)   VALUE             IC2224.2
   000192         019600            " IN ".                                               IC2224.2
   000193         019700   02  FILLER                        PIC X(12)  VALUE             IC2224.2
   000194         019800     " HIGH       ".                                              IC2224.2
   000195         019900   02  FILLER                        PIC X(22)  VALUE             IC2224.2
   000196         020000            " LEVEL VALIDATION FOR ".                             IC2224.2
   000197         020100   02  FILLER                        PIC X(58)  VALUE             IC2224.2
   000198         020200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2224.2
   000199         020300 01  CCVS-H-3.                                                    IC2224.2
   000200         020400     02  FILLER                      PIC X(34)  VALUE             IC2224.2
   000201         020500            " FOR OFFICIAL USE ONLY    ".                         IC2224.2
   000202         020600     02  FILLER                      PIC X(58)  VALUE             IC2224.2
   000203         020700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2224.2
   000204         020800     02  FILLER                      PIC X(28)  VALUE             IC2224.2
   000205         020900            "  COPYRIGHT   1985,1986 ".                           IC2224.2
   000206         021000 01  CCVS-E-1.                                                    IC2224.2
   000207         021100     02 FILLER                       PIC X(52)  VALUE SPACE.      IC2224.2 IMP
   000208         021200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IC2224.2
   000209         021300     02 ID-AGAIN                     PIC X(9).                    IC2224.2
   000210         021400     02 FILLER                       PIC X(45)  VALUE SPACES.     IC2224.2 IMP
   000211         021500 01  CCVS-E-2.                                                    IC2224.2
   000212         021600     02  FILLER                      PIC X(31)  VALUE SPACE.      IC2224.2 IMP
   000213         021700     02  FILLER                      PIC X(21)  VALUE SPACE.      IC2224.2 IMP
   000214         021800     02 CCVS-E-2-2.                                               IC2224.2
   000215         021900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IC2224.2 IMP
   000216         022000         03 FILLER                   PIC X      VALUE SPACE.      IC2224.2 IMP
   000217         022100         03 ENDER-DESC               PIC X(44)  VALUE             IC2224.2
   000218         022200            "ERRORS ENCOUNTERED".                                 IC2224.2
   000219         022300 01  CCVS-E-3.                                                    IC2224.2
   000220         022400     02  FILLER                      PIC X(22)  VALUE             IC2224.2
   000221         022500            " FOR OFFICIAL USE ONLY".                             IC2224.2
   000222         022600     02  FILLER                      PIC X(12)  VALUE SPACE.      IC2224.2 IMP
   000223         022700     02  FILLER                      PIC X(58)  VALUE             IC2224.2
   000224         022800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2224.2
   000225         022900     02  FILLER                      PIC X(8)   VALUE SPACE.      IC2224.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02  FILLER                      PIC X(20)  VALUE             IC2224.2
   000227         023100             " COPYRIGHT 1985,1986".                              IC2224.2
   000228         023200 01  CCVS-E-4.                                                    IC2224.2
   000229         023300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IC2224.2 IMP
   000230         023400     02 FILLER                       PIC X(4)   VALUE " OF ".     IC2224.2
   000231         023500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IC2224.2 IMP
   000232         023600     02 FILLER                       PIC X(40)  VALUE             IC2224.2
   000233         023700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IC2224.2
   000234         023800 01  XXINFO.                                                      IC2224.2
   000235         023900     02 FILLER                       PIC X(19)  VALUE             IC2224.2
   000236         024000            "*** INFORMATION ***".                                IC2224.2
   000237         024100     02 INFO-TEXT.                                                IC2224.2
   000238         024200       04 FILLER                     PIC X(8)   VALUE SPACE.      IC2224.2 IMP
   000239         024300       04 XXCOMPUTED                 PIC X(20).                   IC2224.2
   000240         024400       04 FILLER                     PIC X(5)   VALUE SPACE.      IC2224.2 IMP
   000241         024500       04 XXCORRECT                  PIC X(20).                   IC2224.2
   000242         024600     02 INF-ANSI-REFERENCE           PIC X(48).                   IC2224.2
   000243         024700 01  HYPHEN-LINE.                                                 IC2224.2
   000244         024800     02 FILLER  PIC IS X VALUE IS SPACE.                          IC2224.2 IMP
   000245         024900     02 FILLER  PIC IS X(65)    VALUE IS "************************IC2224.2
   000246         025000-    "*****************************************".                 IC2224.2
   000247         025100     02 FILLER  PIC IS X(54)    VALUE IS "************************IC2224.2
   000248         025200-    "******************************".                            IC2224.2
   000249         025300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IC2224.2
   000250         025400     "IC222A".                                                    IC2224.2
   000251         025500*                                                                 IC2224.2
   000252         025600 PROCEDURE DIVISION.                                              IC2224.2
   000253         025700 CCVS1 SECTION.                                                   IC2224.2
   000254         025800 OPEN-FILES.                                                      IC2224.2
   000255         025900     OPEN    OUTPUT PRINT-FILE.                                   IC2224.2 94
   000256         026000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IC2224.2 249 190 249 209
   000257         026100     MOVE    SPACE TO TEST-RESULTS.                               IC2224.2 IMP 110
   000258         026200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IC2224.2 283 288
   000259         026300     GO TO CCVS1-EXIT.                                            IC2224.2 365
   000260         026400 CLOSE-FILES.                                                     IC2224.2
   000261         026500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IC2224.2 292 313 94
   000262         026600 TERMINATE-CCVS.                                                  IC2224.2
   000263         026700     EXIT PROGRAM.                                                IC2224.2
   000264         026800 TERMINATE-CALL.                                                  IC2224.2
   000265         026900     STOP     RUN.                                                IC2224.2
   000266         027000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IC2224.2 114 166
   000267         027100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IC2224.2 114 167
   000268         027200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IC2224.2 114 165
   000269         027300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IC2224.2 114 164
   000270         027400     MOVE "****TEST DELETED****" TO RE-MARK.                      IC2224.2 121
   000271         027500 PRINT-DETAIL.                                                    IC2224.2
   000272         027600     IF REC-CT NOT EQUAL TO ZERO                                  IC2224.2 163 IMP
   000273      1  027700             MOVE "." TO PARDOT-X                                 IC2224.2 118
   000274      1  027800             MOVE REC-CT TO DOTVALUE.                             IC2224.2 163 119
   000275         027900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IC2224.2 110 95 325
   000276         028000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IC2224.2 114 325
   000277      1  028100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IC2224.2 342 355
   000278      1  028200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IC2224.2 356 364
   000279         028300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IC2224.2 IMP 114 IMP 126
   000280         028400     MOVE SPACE TO CORRECT-X.                                     IC2224.2 IMP 140
   000281         028500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IC2224.2 163 IMP IMP 116
   000282         028600     MOVE     SPACE TO RE-MARK.                                   IC2224.2 IMP 121
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 HEAD-ROUTINE.                                                    IC2224.2
   000284         028800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2224.2 173 96 325
   000285         028900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IC2224.2 178 96 325
   000286         029000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2224.2 187 96 325
   000287         029100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IC2224.2 199 96 325
   000288         029200 COLUMN-NAMES-ROUTINE.                                            IC2224.2
   000289         029300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2224.2 151 96 325
   000290         029400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2224.2 156 96 325
   000291         029500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IC2224.2 243 96 325
   000292         029600 END-ROUTINE.                                                     IC2224.2
   000293         029700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IC2224.2 243 96 325
   000294         029800 END-RTN-EXIT.                                                    IC2224.2
   000295         029900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2224.2 206 96 325
   000296         030000 END-ROUTINE-1.                                                   IC2224.2
   000297         030100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IC2224.2 165 169 166
   000298         030200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IC2224.2 169 164 169
   000299         030300      ADD PASS-COUNTER TO ERROR-HOLD.                             IC2224.2 167 169
   000300         030400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IC2224.2
   000301         030500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IC2224.2 167 229
   000302         030600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IC2224.2 169 231
   000303         030700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IC2224.2 228 214
   000304         030800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IC2224.2 211 96 325
   000305         030900  END-ROUTINE-12.                                                 IC2224.2
   000306         031000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IC2224.2 217
   000307         031100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IC2224.2 165 IMP
   000308      1  031200         MOVE "NO " TO ERROR-TOTAL                                IC2224.2 215
   000309         031300         ELSE                                                     IC2224.2
   000310      1  031400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IC2224.2 165 215
   000311         031500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IC2224.2 211 96
   000312         031600     PERFORM WRITE-LINE.                                          IC2224.2 325
   000313         031700 END-ROUTINE-13.                                                  IC2224.2
   000314         031800     IF DELETE-COUNTER IS EQUAL TO ZERO                           IC2224.2 164 IMP
   000315      1  031900         MOVE "NO " TO ERROR-TOTAL  ELSE                          IC2224.2 215
   000316      1  032000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IC2224.2 164 215
   000317         032100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IC2224.2 217
   000318         032200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2224.2 211 96 325
   000319         032300      IF   INSPECT-COUNTER EQUAL TO ZERO                          IC2224.2 166 IMP
   000320      1  032400          MOVE "NO " TO ERROR-TOTAL                               IC2224.2 215
   000321      1  032500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IC2224.2 166 215
   000322         032600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IC2224.2 217
   000323         032700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IC2224.2 211 96 325
   000324         032800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IC2224.2 219 96 325
   000325         032900 WRITE-LINE.                                                      IC2224.2
   000326         033000     ADD 1 TO RECORD-COUNT.                                       IC2224.2 171
   000327         033100     IF RECORD-COUNT GREATER 50                                   IC2224.2 171
   000328      1  033200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IC2224.2 96 170
   000329      1  033300         MOVE SPACE TO DUMMY-RECORD                               IC2224.2 IMP 96
   000330      1  033400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IC2224.2 96
   000331      1  033500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             IC2224.2 151 96 337
   000332      1  033600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     IC2224.2 156 96 337
   000333      1  033700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IC2224.2 243 96 337
   000334      1  033800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IC2224.2 170 96
   000335      1  033900         MOVE ZERO TO RECORD-COUNT.                               IC2224.2 IMP 171
   000336         034000     PERFORM WRT-LN.                                              IC2224.2 337
   000337         034100 WRT-LN.                                                          IC2224.2
   000338         034200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IC2224.2 96
   000339         034300     MOVE SPACE TO DUMMY-RECORD.                                  IC2224.2 IMP 96
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 BLANK-LINE-PRINT.                                                IC2224.2
   000341         034500     PERFORM WRT-LN.                                              IC2224.2 337
   000342         034600 FAIL-ROUTINE.                                                    IC2224.2
   000343         034700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. IC2224.2 126 IMP 350
   000344         034800     IF   CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.  IC2224.2 140 IMP 350
   000345         034900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2224.2 172 242
   000346         035000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IC2224.2 237
   000347         035100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2224.2 234 96 325
   000348         035200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2224.2 IMP 242
   000349         035300     GO TO  FAIL-ROUTINE-EX.                                      IC2224.2 355
   000350         035400 FAIL-ROUTINE-WRITE.                                              IC2224.2
   000351         035500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IC2224.2 122 95 325
   000352         035600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IC2224.2 172 150
   000353         035700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IC2224.2 137 95 325
   000354         035800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IC2224.2 IMP 150
   000355         035900 FAIL-ROUTINE-EX. EXIT.                                           IC2224.2
   000356         036000 BAIL-OUT.                                                        IC2224.2
   000357         036100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IC2224.2 127 IMP 359
   000358         036200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IC2224.2 141 IMP 364
   000359         036300 BAIL-OUT-WRITE.                                                  IC2224.2
   000360         036400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IC2224.2 141 241 127 239
   000361         036500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IC2224.2 172 242
   000362         036600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IC2224.2 234 96 325
   000363         036700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IC2224.2 IMP 242
   000364         036800 BAIL-OUT-EX. EXIT.                                               IC2224.2
   000365         036900 CCVS1-EXIT.                                                      IC2224.2
   000366         037000     EXIT.                                                        IC2224.2
   000367         037100*                                                                 IC2224.2
   000368         037200 SECT-IC222A-001 SECTION.                                         IC2224.2
   000369         037300 CALL-INIT-1.                                                     IC2224.2
   000370         037500*                                                              *  IC2224.2
   000371         037600*    CALL A PROGRAM WHICH EXISTS AND FOR WHICH PARAMETERS      *  IC2224.2
   000372         037700*    MATCH IN NUMBER AND TYPE.  EXECUTION SHOULD BE SUCCESSFUL *  IC2224.2
   000373         037800*    AND THE STATEMENTS IN THE "ON EXCEPTION" PATH IGNORED.    *  IC2224.2
   000374         037900*    THE STATEMENT FOLLOWING THE SCOPE TERMINATOR SHOULD BE    *  IC2224.2
   000375         038000*    EXECUTED.                                                 *  IC2224.2
   000376         038100*                                                              *  IC2224.2
   000377         038300*                                                                 IC2224.2
   000378         038400     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000379         038500     MOVE   "CALL-TEST-1" TO PAR-NAME.                            IC2224.2 116
   000380         038600     MOVE   "AVAILABLE ON " TO FEATURE.                           IC2224.2 112
   000381         038700     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000382         038800     MOVE   "P" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000383         038900     MOVE   "X-27 5.2.4 (2)" TO ANSI-REFERENCE.                   IC2224.2 172
   000384         039000     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000385         039100     GO TO   CALL-TEST-1-1.                                       IC2224.2 395
   000386         039200 CALL-DELETE-1-1.                                                 IC2224.2
   000387         039300     PERFORM DE-LETE.                                             IC2224.2 269
   000388         039400     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000389         039500     ADD     1 TO REC-CT.                                         IC2224.2 163
   000390         039600*                                                                 IC2224.2
   000391         039700*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE IS           *  IC2224.2
   000392         039800*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000393         039900*                                                                 IC2224.2
   000394         040000     GO TO   CALL-DELETE-1-2.                                     IC2224.2 415
   000395         040100 CALL-TEST-1-1.                                                   IC2224.2
   000396         040200     CALL   "IC222A-1" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
 ==000396==> IGYPG0020-W Name "IC222A-1" was processed as "IC222A01".

   000397         040300             ON EXCEPTION                                         IC2224.2
   000398      1  040400                  MOVE "F" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000399         040500     END-CALL                                                     IC2224.2
   000400         040600     MOVE    1 TO CALL-FLAG.                                      IC2224.2 107
   000401         040700     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000402      1  040800             MOVE "UNEXPECTED EXECUTION OF EXCEPTION PATH"        IC2224.2
   000403      1  040900                      TO RE-MARK                                  IC2224.2 121
   000404      1  041000             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000405      1  041100             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000406      1  041200             PERFORM FAIL                                         IC2224.2 268
   000407         041300     ELSE                                                         IC2224.2
   000408      1  041400             PERFORM PASS.                                        IC2224.2 267
   000409         041500 CALL-WRITE-1-1.                                                  IC2224.2
   000410         041600     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000411         041700     ADD 1 TO REC-CT.                                             IC2224.2 163
   000412         041800*                                                                 IC2224.2
   000413         041900 CALL-INIT-1-2.                                                   IC2224.2
   000414         042000     GO TO    CALL-TEST-1-2.                                      IC2224.2 422
   000415         042100 CALL-DELETE-1-2.                                                 IC2224.2
   000416         042200     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000417         042300     PERFORM DE-LETE.                                             IC2224.2 269
   000418         042400     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000419         042500     ADD     1 TO REC-CT.                                         IC2224.2 163
   000420         042600     GO TO   CALL-EXIT-1.                                         IC2224.2 442
   000421         042700*                                                                 IC2224.2
   000422         042800 CALL-TEST-1-2.                                                   IC2224.2
   000423         043000*                                                              *  IC2224.2
   000424         043100*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000425         043200*    WAS EXECUTED.  IF THE PREVIOUS TEST PASSED, A PASS HERE   *  IC2224.2
   000426         043300*    INDICATES THAT THE SCOPE TERMINATOR HAS BEEN INTERPRETED  *  IC2224.2
   000427         043400*    CORRECTLY.  IF THE PREVIOUS TEST FAILED, A PASS HERE      *  IC2224.2
   000428         043500*    INDICATES THAT THE SCOPE TERMINATOR WAS NOT INTERPRETED   *  IC2224.2
   000429         043600*    AS "NOT ON EXCEPTION" OR "GO TO NEXT-SENTENCE".           *  IC2224.2
   000430         043700*                                                              *  IC2224.2
   000431         043900*                                                                 IC2224.2
   000432         044000     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000433         044100     IF      CALL-FLAG = 1                                        IC2224.2 107
   000434      1  044200             PERFORM PASS                                         IC2224.2 267
   000435         044300     ELSE                                                         IC2224.2
   000436      1  044400             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000437      1  044500             MOVE    1 TO CORRECT-N                               IC2224.2 142
   000438      1  044600             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000439      1  044700             PERFORM FAIL.                                        IC2224.2 268
   000440         044800     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000441         044900*                                                                 IC2224.2
   000442         045000 CALL-EXIT-1.                                                     IC2224.2
   000443         045100*                                                                 IC2224.2
   000444         045200*                                                                 IC2224.2
   000445         045300 CALL-INIT-2.                                                     IC2224.2

 ==000445==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-2" did
                         not contain any statements.

   000446         045500*                                                              *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045600*    CALL A PROGRAM WHICH DOES NOT EXIST.  PAGE X-28, 5.2.4,   *  IC2224.2
   000448         045700*    RULE (3)A STATES THAT IF A PROGRAM CANNOT BE MADE         *  IC2224.2
   000449         045800*    AVAILABLE THEN THE STATEMENTS IN THE "ON EXCEPTION"       *  IC2224.2
   000450         045900*    PHRASE MUST BE EXECUTED.                                  *  IC2224.2
   000451         046000*                                                              *  IC2224.2
   000452         046200*                                                                 IC2224.2
   000453         046300     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000454         046400     MOVE   "CALL-TEST-2" TO PAR-NAME.                            IC2224.2 116
   000455         046500     MOVE   "NO PROGRAM ON " TO FEATURE.                          IC2224.2 112
   000456         046600     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000457         046700     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000458         046800     MOVE   "X-28 5.2.4 (3)A" TO ANSI-REFERENCE.                  IC2224.2 172
   000459         046900     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000460         047000     GO TO   CALL-TEST-2-1.                                       IC2224.2 470
   000461         047100 CALL-DELETE-2-1.                                                 IC2224.2
   000462         047200     PERFORM DE-LETE.                                             IC2224.2 269
   000463         047300     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000464         047400     ADD     1 TO REC-CT.                                         IC2224.2 163
   000465         047500*                                                                 IC2224.2
   000466         047600*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000467         047700*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000468         047800*                                                                 IC2224.2
   000469         047900     GO TO   CALL-DELETE-2-2.                                     IC2224.2 490
   000470         048000 CALL-TEST-2-1.                                                   IC2224.2
   000471         048100*    CALL "NON-EXISTING-PROGRAM"                                  IC2224.2
   000472         048200     CALL   "XXXXXXXX" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105
   000473         048300             ON EXCEPTION                                         IC2224.2
   000474      1  048400                  MOVE "P" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000475         048500     END-CALL                                                     IC2224.2
   000476         048600     MOVE    1 TO CALL-FLAG.                                      IC2224.2 107
   000477         048700     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000478      1  048800             MOVE "EXCEPTION SHOULD HAVE OCCURRED" TO RE-MARK     IC2224.2 121
   000479      1  048900             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000480      1  049000             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000481      1  049100             PERFORM FAIL                                         IC2224.2 268
   000482         049200     ELSE                                                         IC2224.2
   000483      1  049300             PERFORM PASS.                                        IC2224.2 267
   000484         049400 CALL-WRITE-2-1.                                                  IC2224.2
   000485         049500     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000486         049600     ADD 1 TO REC-CT.                                             IC2224.2 163
   000487         049700*                                                                 IC2224.2
   000488         049800 CALL-INIT-2-2.                                                   IC2224.2
   000489         049900     GO TO    CALL-TEST-2-2.                                      IC2224.2 497
   000490         050000 CALL-DELETE-2-2.                                                 IC2224.2
   000491         050100     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000492         050200     PERFORM DE-LETE.                                             IC2224.2 269
   000493         050300     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000494         050400     ADD     1 TO REC-CT.                                         IC2224.2 163
   000495         050500     GO TO   CALL-EXIT-2.                                         IC2224.2 517
   000496         050600*                                                                 IC2224.2
   000497         050700 CALL-TEST-2-2.                                                   IC2224.2
   000498         050900*                                                              *  IC2224.2
   000499         051000*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000500         051100*    WAS EXECUTED.  IF THE PREVIOUS TEST FAILED, A PASS HERE   *  IC2224.2
   000501         051200*    INDICATES THAT THE SCOPE TERMINATOR HAS BEEN INTERPRETED  *  IC2224.2
   000502         051300*    CORRECTLY.  IF THE PREVIOUS TEST PASSED, A PASS HERE      *  IC2224.2
   000503         051400*    INDICATES THAT THE SCOPE TERMINATOR WAS NOT INTERPRETED   *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         051500*    AS "NOT ON EXCEPTION" OR "GO TO NEXT-SENTENCE".           *  IC2224.2
   000505         051600*                                                              *  IC2224.2
   000506         051800*                                                                 IC2224.2
   000507         051900     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000508         052000     IF      CALL-FLAG = 1                                        IC2224.2 107
   000509      1  052100             PERFORM PASS                                         IC2224.2 267
   000510         052200     ELSE                                                         IC2224.2
   000511      1  052300             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000512      1  052400             MOVE    1 TO CORRECT-N                               IC2224.2 142
   000513      1  052500             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000514      1  052600             PERFORM FAIL.                                        IC2224.2 268
   000515         052700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000516         052800*                                                                 IC2224.2
   000517         052900 CALL-EXIT-2.                                                     IC2224.2
   000518         053000*                                                                 IC2224.2
   000519         053100*                                                                 IC2224.2
   000520         053200 CALL-INIT-3.                                                     IC2224.2

 ==000520==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-3" did
                         not contain any statements.

   000521         053400*                                                              *  IC2224.2
   000522         053500*    CALL A PROGRAM WHICH EXISTS, USING A CALL STATEMENT WITH  *  IC2224.2
   000523         053600*    BOTH AN "ON EXCEPTION" PHRASE AND A "NOT ON EXCEPTION"    *  IC2224.2
   000524         053700*    PHRASE.  EXECUTION SHOULD BE SUCCESSFUL, THE              *  IC2224.2
   000525         053800*    "ON EXCEPTION" PHRASE IGNORED, AND THE STATEMENTS IN THE  *  IC2224.2
   000526         053900*    "NOT ON EXCEPTION" PHRASE EXECUTED.  THE STATEMENT        *  IC2224.2
   000527         054000*    FOLLOWING THE SCOPE TERMINATOR SHOULD BE EXECUTED.        *  IC2224.2
   000528         054100*                                                              *  IC2224.2
   000529         054300*                                                                 IC2224.2
   000530         054400     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000531         054500     MOVE   "CALL-TEST-3" TO PAR-NAME.                            IC2224.2 116
   000532         054600     MOVE   "AVAILABLE  ON NOT ON" TO FEATURE.                    IC2224.2 112
   000533         054700     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000534         054800     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000535         054900     MOVE   "X-28 5.2.4 (2)" TO ANSI-REFERENCE.                   IC2224.2 172
   000536         055000     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000537         055100     GO TO   CALL-TEST-3-1.                                       IC2224.2 547
   000538         055200 CALL-DELETE-3-1.                                                 IC2224.2
   000539         055300     PERFORM DE-LETE.                                             IC2224.2 269
   000540         055400     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000541         055500     ADD     1 TO REC-CT.                                         IC2224.2 163
   000542         055600*                                                                 IC2224.2
   000543         055700*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000544         055800*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000545         055900*                                                                 IC2224.2
   000546         056000     GO TO   CALL-DELETE-3-2.                                     IC2224.2 571
   000547         056100 CALL-TEST-3-1.                                                   IC2224.2
   000548         056200     CALL   "IC222A-1" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105

 ==000548==> IGYPG0020-W Name "IC222A-1" was processed as "IC222A01".

   000549         056300             ON EXCEPTION                                         IC2224.2
   000550      1  056400                  MOVE "F" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000551      1  056500                  ADD 2 TO CALL-FLAG                              IC2224.2 107
   000552         056600             NOT ON EXCEPTION                                     IC2224.2
   000553      1  056700                  MOVE "P" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000554      1  056800                  ADD 2 TO CALL-FLAG                              IC2224.2 107
   000555         056900     END-CALL                                                     IC2224.2
   000556         057000     ADD     1 TO CALL-FLAG.                                      IC2224.2 107
   000557         057100     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000558      1  057200             MOVE "NON-EXECUTION OF NOT EXCEPTION PATH"           IC2224.2
   000559      1  057300                   TO RE-MARK                                     IC2224.2 121
   000560      1  057400             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000561      1  057500             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000562      1  057600             PERFORM FAIL                                         IC2224.2 268
   000563         057700     ELSE                                                         IC2224.2
   000564      1  057800             PERFORM PASS.                                        IC2224.2 267
   000565         057900 CALL-WRITE-3-1.                                                  IC2224.2
   000566         058000     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000567         058100     ADD 1 TO REC-CT.                                             IC2224.2 163
   000568         058200*                                                                 IC2224.2
   000569         058300 CALL-INIT-3-2.                                                   IC2224.2
   000570         058400     GO TO    CALL-TEST-3-2.                                      IC2224.2 578
   000571         058500 CALL-DELETE-3-2.                                                 IC2224.2
   000572         058600     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000573         058700     PERFORM DE-LETE.                                             IC2224.2 269
   000574         058800     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000575         058900     ADD     1 TO REC-CT.                                         IC2224.2 163
   000576         059000     GO TO   CALL-EXIT-3.                                         IC2224.2 598
   000577         059100*                                                                 IC2224.2
   000578         059200 CALL-TEST-3-2.                                                   IC2224.2
   000579         059400*                                                              *  IC2224.2
   000580         059500*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000581         059600*    WAS EXECUTED.  IF THE PREVIOUS TEST FAILED, A PASS HERE   *  IC2224.2
   000582         059700*    INDICATES THAT THE SCOPE TERMINATOR HAS BEEN INTERPRETED  *  IC2224.2
   000583         059800*    CORRECTLY.  IF THE PREVIOUS TEST PASSED, A PASS HERE      *  IC2224.2
   000584         059900*    INDICATES THAT THE SCOPE TERMINATOR WAS NOT INTERPRETED   *  IC2224.2
   000585         060000*    AS "NOT ON EXCEPTION" OR "GO TO NEXT-SENTENCE".           *  IC2224.2
   000586         060100*                                                              *  IC2224.2
   000587         060300*                                                                 IC2224.2
   000588         060400     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000589         060500     IF      CALL-FLAG = 3                                        IC2224.2 107
   000590      1  060600             PERFORM PASS                                         IC2224.2 267
   000591         060700     ELSE                                                         IC2224.2
   000592      1  060800             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000593      1  060900             MOVE    3 TO CORRECT-N                               IC2224.2 142
   000594      1  061000             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000595      1  061100             PERFORM FAIL.                                        IC2224.2 268
   000596         061200     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000597         061300*                                                                 IC2224.2
   000598         061400 CALL-EXIT-3.                                                     IC2224.2
   000599         061500*                                                                 IC2224.2
   000600         061600*                                                                 IC2224.2
   000601         061700 CALL-INIT-4.                                                     IC2224.2

 ==000601==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-4" did
                         not contain any statements.

   000602         061900*                                                              *  IC2224.2
   000603         062000*    CALL A PROGRAM WHICH IS NOT AVAILABLE FOR EXECUTION,      *  IC2224.2
   000604         062100*    USING A CALL STATEMENT WITH BOTH AN "ON EXCEPTION" PHRASE *  IC2224.2
   000605         062200*    AND A "NOT ON EXCEPTION" PHRASE.  EXECUTION SHOULD BE     *  IC2224.2
   000606         062300*    UNSUCCESSFUL, THE STATEMENTS IN THE "ON EXCEPTION" PHRASE *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000607         062400*    EXECUTED, AND THE STATEMENTS IN THE "NOT ON EXCEPTION"    *  IC2224.2
   000608         062500*    PHRASE IGNORED.  THE STATEMENT FOLLOWING THE SCOPE        *  IC2224.2
   000609         062600*    TERMINATOR SHOULD BE EXECUTED IN EITHER CASE.             *  IC2224.2
   000610         062700*                                                              *  IC2224.2
   000611         062900*                                                                 IC2224.2
   000612         063000     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000613         063100     MOVE   "CALL-TEST-4" TO PAR-NAME.                            IC2224.2 116
   000614         063200     MOVE   "CALL ON EXCEPTION" TO FEATURE.                       IC2224.2 112
   000615         063300     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000616         063400     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000617         063500     MOVE   "X-28 5.2.4 (3)A" TO ANSI-REFERENCE.                  IC2224.2 172
   000618         063600     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000619         063700     GO TO   CALL-TEST-4-1.                                       IC2224.2 629
   000620         063800 CALL-DELETE-4-1.                                                 IC2224.2
   000621         063900     PERFORM DE-LETE.                                             IC2224.2 269
   000622         064000     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000623         064100     ADD     1 TO REC-CT.                                         IC2224.2 163
   000624         064200*                                                                 IC2224.2
   000625         064300*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000626         064400*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000627         064500*                                                                 IC2224.2
   000628         064600     GO TO   CALL-DELETE-4-2.                                     IC2224.2 654
   000629         064700 CALL-TEST-4-1.                                                   IC2224.2
   000630         064800*    CALL   "NON-EXISTENT PROGRAM"                                IC2224.2
   000631         064900     CALL   "XXXXXXXX" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105
   000632         065000             ON EXCEPTION                                         IC2224.2
   000633      1  065100                  MOVE "P" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000634      1  065200                  ADD 2 TO CALL-FLAG                              IC2224.2 107
   000635         065300             NOT ON EXCEPTION                                     IC2224.2
   000636      1  065400                  MOVE "F" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000637      1  065500                  ADD 2 TO CALL-FLAG                              IC2224.2 107
   000638         065600     END-CALL                                                     IC2224.2
   000639         065700     ADD     1 TO CALL-FLAG.                                      IC2224.2 107
   000640         065800     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000641      1  065900             MOVE "NON-EXECUTION OF EXCEPTION PATH"               IC2224.2
   000642      1  066000                   TO RE-MARK                                     IC2224.2 121
   000643      1  066100             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000644      1  066200             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000645      1  066300             PERFORM FAIL                                         IC2224.2 268
   000646         066400     ELSE                                                         IC2224.2
   000647      1  066500             PERFORM PASS.                                        IC2224.2 267
   000648         066600 CALL-WRITE-4-1.                                                  IC2224.2
   000649         066700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000650         066800     ADD 1 TO REC-CT.                                             IC2224.2 163
   000651         066900*                                                                 IC2224.2
   000652         067000 CALL-INIT-4-2.                                                   IC2224.2
   000653         067100     GO TO    CALL-TEST-4-2.                                      IC2224.2 661
   000654         067200 CALL-DELETE-4-2.                                                 IC2224.2
   000655         067300     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000656         067400     PERFORM DE-LETE.                                             IC2224.2 269
   000657         067500     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000658         067600     ADD     1 TO REC-CT.                                         IC2224.2 163
   000659         067700     GO TO   CALL-EXIT-4.                                         IC2224.2 679
   000660         067800*                                                                 IC2224.2
   000661         067900 CALL-TEST-4-2.                                                   IC2224.2
   000662         068100*                                                              *  IC2224.2
   000663         068200*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000664         068300*    WAS EXECUTED.  A PASS HERE ALSO INDICATES THAT ONE AND    *  IC2224.2
   000665         068400*    ONLY ONE OF THE "ON EXCEPTION" AND "NOT ON EXCEPTION"     *  IC2224.2
   000666         068500*    PHRASES OF THE PRECEDING CALL STATEMENT WAS EXECUTED.     *  IC2224.2
   000667         068600*                                                              *  IC2224.2
   000668         068800*                                                                 IC2224.2
   000669         068900     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000670         069000     IF      CALL-FLAG = 3                                        IC2224.2 107
   000671      1  069100             PERFORM PASS                                         IC2224.2 267
   000672         069200     ELSE                                                         IC2224.2
   000673      1  069300             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000674      1  069400             MOVE    3 TO CORRECT-N                               IC2224.2 142
   000675      1  069500             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000676      1  069600             PERFORM FAIL.                                        IC2224.2 268
   000677         069700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000678         069800*                                                                 IC2224.2
   000679         069900 CALL-EXIT-4.                                                     IC2224.2
   000680         070000*                                                                 IC2224.2
   000681         070100*                                                                 IC2224.2
   000682         070200 CALL-INIT-5.                                                     IC2224.2

 ==000682==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-5" did
                         not contain any statements.

   000683         070400*                                                              *  IC2224.2
   000684         070500*    CALL A PROGRAM WHICH IS AVAILABLE FOR EXECUTION, USING A  *  IC2224.2
   000685         070600*    CALL STATEMENT WITH A "NOT ON EXCEPTION" PHRASE BUT NO    *  IC2224.2
   000686         070700*    "ON EXCEPTION" PHRASE.  EXECUTION SHOULD BE SUCCESSFUL,   *  IC2224.2
   000687         070800*    AND THE STATEMENTS IN THE "NOT ON EXCEPTION" PHRASE       *  IC2224.2
   000688         070900*    EXECUTED.  THE STATEMENT FOLLOWING THE SCOPE TERMINATOR   *  IC2224.2
   000689         071000*    SHOULD ALSO BE EXECUTED.                                  *  IC2224.2
   000690         071100*                                                              *  IC2224.2
   000691         071300*                                                                 IC2224.2
   000692         071400     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000693         071500     MOVE   "CALL-TEST-5" TO PAR-NAME.                            IC2224.2 116
   000694         071600     MOVE   "AVAILABLE  -- NOT ON" TO FEATURE.                    IC2224.2 112
   000695         071700     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000696         071800     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000697         071900     MOVE   "X-28 5.2.4 (3)A" TO ANSI-REFERENCE.                  IC2224.2 172
   000698         072000     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000699         072100     GO TO   CALL-TEST-5-1.                                       IC2224.2 709
   000700         072200 CALL-DELETE-5-1.                                                 IC2224.2
   000701         072300     PERFORM DE-LETE.                                             IC2224.2 269
   000702         072400     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000703         072500     ADD     1 TO REC-CT.                                         IC2224.2 163
   000704         072600*                                                                 IC2224.2
   000705         072700*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000706         072800*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000707         072900*                                                                 IC2224.2
   000708         073000     GO TO   CALL-DELETE-5-2.                                     IC2224.2 730
   000709         073100 CALL-TEST-5-1.                                                   IC2224.2
   000710         073200     CALL   "IC222A-1" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105

 ==000710==> IGYPG0020-W Name "IC222A-1" was processed as "IC222A01".

   000711         073300             NOT ON EXCEPTION                                     IC2224.2
   000712      1  073400                  MOVE "P" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000713      1  073500                  ADD 2 TO CALL-FLAG                              IC2224.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000714         073600     END-CALL                                                     IC2224.2
   000715         073700     ADD     1 TO CALL-FLAG.                                      IC2224.2 107
   000716         073800     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000717      1  073900             MOVE "NON-EXECUTION OF NOT ON EXCEPTION PATH"        IC2224.2
   000718      1  074000                   TO RE-MARK                                     IC2224.2 121
   000719      1  074100             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000720      1  074200             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000721      1  074300             PERFORM FAIL                                         IC2224.2 268
   000722         074400     ELSE                                                         IC2224.2
   000723      1  074500             PERFORM PASS.                                        IC2224.2 267
   000724         074600 CALL-WRITE-5-1.                                                  IC2224.2
   000725         074700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000726         074800     ADD 1 TO REC-CT.                                             IC2224.2 163
   000727         074900*                                                                 IC2224.2
   000728         075000 CALL-INIT-5-2.                                                   IC2224.2
   000729         075100     GO TO    CALL-TEST-5-2.                                      IC2224.2 737
   000730         075200 CALL-DELETE-5-2.                                                 IC2224.2
   000731         075300     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000732         075400     PERFORM DE-LETE.                                             IC2224.2 269
   000733         075500     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000734         075600     ADD     1 TO REC-CT.                                         IC2224.2 163
   000735         075700     GO TO   CALL-EXIT-5.                                         IC2224.2 755
   000736         075800*                                                                 IC2224.2
   000737         075900 CALL-TEST-5-2.                                                   IC2224.2
   000738         076100*                                                              *  IC2224.2
   000739         076200*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000740         076300*    WAS EXECUTED.  A PASS HERE ALSO INDICATES THAT THE        *  IC2224.2
   000741         076400*    "NOT ON EXCEPTION" PHRASE OF THE PRECEDING CALL STATEMENT *  IC2224.2
   000742         076500*    WAS EXECUTED.                                             *  IC2224.2
   000743         076600*                                                              *  IC2224.2
   000744         076800*                                                                 IC2224.2
   000745         076900     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000746         077000     IF      CALL-FLAG = 3                                        IC2224.2 107
   000747      1  077100             PERFORM PASS                                         IC2224.2 267
   000748         077200     ELSE                                                         IC2224.2
   000749      1  077300             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000750      1  077400             MOVE    3 TO CORRECT-N                               IC2224.2 142
   000751      1  077500             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000752      1  077600             PERFORM FAIL.                                        IC2224.2 268
   000753         077700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000754         077800*                                                                 IC2224.2
   000755         077900 CALL-EXIT-5.                                                     IC2224.2
   000756         078000*                                                                 IC2224.2
   000757         078100*                                                                 IC2224.2
   000758         078200 CALL-INIT-6.                                                     IC2224.2

 ==000758==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-6" did
                         not contain any statements.

   000759         078400*                                                              *  IC2224.2
   000760         078500*    CALL A PROGRAM WHICH IS AVAILABLE FOR EXECUTION, USING A  *  IC2224.2
   000761         078600*    CALL STATEMENT WITH NEITHER AN "ON EXCEPTION" PHRASE NOR  *  IC2224.2
   000762         078700*    A "NOT ON EXCEPTION" PHRASE.  EXECUTION SHOULD BE         *  IC2224.2
   000763         078800*    SUCCESSFUL. THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000764         078900*    SHOULD BE EXECUTED.                                       *  IC2224.2
   000765         079000*                                                              *  IC2224.2
   000766         079200*                                                                 IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000767         079300     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000768         079400     MOVE   "CALL-TEST-6" TO PAR-NAME.                            IC2224.2 116
   000769         079500     MOVE   "AVAILABLE  -- ---" TO FEATURE.                       IC2224.2 112
   000770         079600     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000771         079700     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000772         079800     MOVE   "X-28 5.2.4 (2)" TO ANSI-REFERENCE.                   IC2224.2 172
   000773         079900     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000774         080000     GO TO   CALL-TEST-6-1.                                       IC2224.2 784
   000775         080100 CALL-DELETE-6-1.                                                 IC2224.2
   000776         080200     PERFORM DE-LETE.                                             IC2224.2 269
   000777         080300     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000778         080400     ADD     1 TO REC-CT.                                         IC2224.2 163
   000779         080500*                                                                 IC2224.2
   000780         080600*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000781         080700*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000782         080800*                                                                 IC2224.2
   000783         080900     GO TO   CALL-DELETE-6-2.                                     IC2224.2 801
   000784         081000 CALL-TEST-6-1.                                                   IC2224.2
   000785         081100     CALL   "IC222A-1" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105

 ==000785==> IGYPG0020-W Name "IC222A-1" was processed as "IC222A01".

   000786         081200     END-CALL                                                     IC2224.2
   000787         081300     ADD     1 TO CALL-FLAG.                                      IC2224.2 107
   000788         081400     IF EXCEPTION-PATH-FLAG NOT = "X"                             IC2224.2 108
   000789      1  081500             MOVE "EXCEPTION-PATH-FLAG ALTERED" TO RE-MARK        IC2224.2 121
   000790      1  081600             MOVE "X" TO CORRECT-A                                IC2224.2 141
   000791      1  081700             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000792      1  081800             PERFORM FAIL                                         IC2224.2 268
   000793         081900     ELSE                                                         IC2224.2
   000794      1  082000             PERFORM PASS.                                        IC2224.2 267
   000795         082100 CALL-WRITE-6-1.                                                  IC2224.2
   000796         082200     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000797         082300     ADD 1 TO REC-CT.                                             IC2224.2 163
   000798         082400*                                                                 IC2224.2
   000799         082500 CALL-INIT-6-2.                                                   IC2224.2
   000800         082600     GO TO    CALL-TEST-6-2.                                      IC2224.2 808
   000801         082700 CALL-DELETE-6-2.                                                 IC2224.2
   000802         082800     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000803         082900     PERFORM DE-LETE.                                             IC2224.2 269
   000804         083000     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000805         083100     ADD     1 TO REC-CT.                                         IC2224.2 163
   000806         083200     GO TO   CALL-EXIT-6.                                         IC2224.2 824
   000807         083300*                                                                 IC2224.2
   000808         083400 CALL-TEST-6-2.                                                   IC2224.2
   000809         083600*                                                              *  IC2224.2
   000810         083700*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000811         083800*    WAS EXECUTED.                                             *  IC2224.2
   000812         083900*                                                              *  IC2224.2
   000813         084100*                                                                 IC2224.2
   000814         084200     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000815         084300     IF      CALL-FLAG = 1                                        IC2224.2 107
   000816      1  084400             PERFORM PASS                                         IC2224.2 267
   000817         084500     ELSE                                                         IC2224.2
   000818      1  084600             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000819      1  084700             MOVE    1 TO CORRECT-N                               IC2224.2 142
   000820      1  084800             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000821      1  084900             PERFORM FAIL.                                        IC2224.2 268
   000822         085000     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000823         085100*                                                                 IC2224.2
   000824         085200 CALL-EXIT-6.                                                     IC2224.2
   000825         085300*                                                                 IC2224.2
   000826         085400*                                                                 IC2224.2
   000827         085500 CALL-INIT-7.                                                     IC2224.2

 ==000827==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-7" did
                         not contain any statements.

   000828         085700*                                                              *  IC2224.2
   000829         085800*    CALL A PROGRAM WHICH EXISTS AND FOR WHICH PARAMETERS      *  IC2224.2
   000830         085900*    MATCH IN NUMBER AND TYPE.  THIS TEST IS A DUPLICATION OF  *  IC2224.2
   000831         086000*    CALL-TEST-1, WITH "ON OVERFLOW" SUBSTITUTED FOR           *  IC2224.2
   000832         086100*    "ON EXCEPTION" IN THE CALL STATEMENT.                     *  IC2224.2
   000833         086200*                                                              *  IC2224.2
   000834         086400*                                                                 IC2224.2
   000835         086500     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000836         086600     MOVE   "CALL-TEST-7" TO PAR-NAME.                            IC2224.2 116
   000837         086700     MOVE   "AVAILABLE  OV ---" TO FEATURE.                       IC2224.2 112
   000838         086800     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000839         086900     MOVE   "P" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000840         087000     MOVE   "X-27 5.2.4 (2)" TO ANSI-REFERENCE.                   IC2224.2 172
   000841         087100     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000842         087200     GO TO   CALL-TEST-7-1.                                       IC2224.2 852
   000843         087300 CALL-DELETE-7-1.                                                 IC2224.2
   000844         087400     PERFORM DE-LETE.                                             IC2224.2 269
   000845         087500     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000846         087600     ADD     1 TO REC-CT.                                         IC2224.2 163
   000847         087700*                                                                 IC2224.2
   000848         087800*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000849         087900*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000850         088000*                                                                 IC2224.2
   000851         088100     GO TO   CALL-DELETE-7-2.                                     IC2224.2 872
   000852         088200 CALL-TEST-7-1.                                                   IC2224.2
   000853         088300     CALL   "IC222A-1" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105

 ==000853==> IGYPG0020-W Name "IC222A-1" was processed as "IC222A01".

   000854         088400             ON OVERFLOW                                          IC2224.2
   000855      1  088500                  MOVE "F" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000856         088600     END-CALL                                                     IC2224.2
   000857         088700     MOVE    1 TO CALL-FLAG.                                      IC2224.2 107
   000858         088800     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000859      1  088900             MOVE "UNEXPECTED EXECUTION OF EXCEPTION PATH"        IC2224.2
   000860      1  089000                      TO RE-MARK                                  IC2224.2 121
   000861      1  089100             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000862      1  089200             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000863      1  089300             PERFORM FAIL                                         IC2224.2 268
   000864         089400     ELSE                                                         IC2224.2
   000865      1  089500             PERFORM PASS.                                        IC2224.2 267
   000866         089600 CALL-WRITE-7-1.                                                  IC2224.2
   000867         089700     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000868         089800     ADD 1 TO REC-CT.                                             IC2224.2 163
   000869         089900*                                                                 IC2224.2
   000870         090000 CALL-INIT-7-2.                                                   IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000871         090100     GO TO    CALL-TEST-7-2.                                      IC2224.2 879
   000872         090200 CALL-DELETE-7-2.                                                 IC2224.2
   000873         090300     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000874         090400     PERFORM DE-LETE.                                             IC2224.2 269
   000875         090500     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000876         090600     ADD     1 TO REC-CT.                                         IC2224.2 163
   000877         090700     GO TO   CALL-EXIT-7.                                         IC2224.2 899
   000878         090800*                                                                 IC2224.2
   000879         090900 CALL-TEST-7-2.                                                   IC2224.2
   000880         091100*                                                              *  IC2224.2
   000881         091200*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000882         091300*    WAS EXECUTED.  IF THE PREVIOUS TEST PASSED, A PASS HERE   *  IC2224.2
   000883         091400*    INDICATES THAT THE SCOPE TERMINATOR HAS BEEN INTERPRETED  *  IC2224.2
   000884         091500*    CORRECTLY.  IF THE PREVIOUS TEST FAILED, A PASS HERE      *  IC2224.2
   000885         091600*    INDICATES THAT THE SCOPE TERMINATOR WAS NOT INTERPRETED   *  IC2224.2
   000886         091700*    AS "NOT ON EXCEPTION" OR "GO TO NEXT-SENTENCE".           *  IC2224.2
   000887         091800*                                                              *  IC2224.2
   000888         092000*                                                                 IC2224.2
   000889         092100     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000890         092200     IF      CALL-FLAG = 1                                        IC2224.2 107
   000891      1  092300             PERFORM PASS                                         IC2224.2 267
   000892         092400     ELSE                                                         IC2224.2
   000893      1  092500             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000894      1  092600             MOVE    1 TO CORRECT-N                               IC2224.2 142
   000895      1  092700             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000896      1  092800             PERFORM FAIL.                                        IC2224.2 268
   000897         092900     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000898         093000*                                                                 IC2224.2
   000899         093100 CALL-EXIT-7.                                                     IC2224.2
   000900         093200*                                                                 IC2224.2
   000901         093300*                                                                 IC2224.2
   000902         093400 CALL-INIT-8.                                                     IC2224.2

 ==000902==> IGYPS2015-I The paragraph or section prior to paragraph or section "CALL-INIT-8" did
                         not contain any statements.

   000903         093600*                                                              *  IC2224.2
   000904         093700*    CALL A PROGRAM WHICH DOES NOT EXIST.  PAGE X-28, 5.2.4    *  IC2224.2
   000905         093800*    RULE (3)A STATES THAT IF A PROGRAM CANNOT BE MADE        *   IC2224.2
   000906         093900*    AVAILABLE THEN THE STATEMENTS IN THE "ON EXCEPTION" OR    *  IC2224.2
   000907         094000*    "ON OVERFLOW" PHRASE MUST BE EXECUTED.  THIS TEST IS A    *  IC2224.2
   000908         094100*    DUPLICATION OF CALL-TEST-2 WITH "ON OVERFLOW" SUBSTITUTED *  IC2224.2
   000909         094200*    FOR "ON EXCEPTION" IN THE CALL STATEMENT.                 *  IC2224.2
   000910         094300*                                                              *  IC2224.2
   000911         094500*                                                                 IC2224.2
   000912         094600     MOVE    1 TO REC-CT.                                         IC2224.2 163
   000913         094700     MOVE   "CALL-TEST-8" TO PAR-NAME.                            IC2224.2 116
   000914         094800     MOVE   "NO PROGRAM OV ---" TO FEATURE.                       IC2224.2 112
   000915         094900     MOVE    0 TO CALL-FLAG.                                      IC2224.2 107
   000916         095000     MOVE   "X" TO EXCEPTION-PATH-FLAG.                           IC2224.2 108
   000917         095100     MOVE   "X-28 5.2.4 (3)A" TO ANSI-REFERENCE.                  IC2224.2 172
   000918         095200     MOVE    ZERO TO DN3, DN4.                                    IC2224.2 IMP 100 105
   000919         095300     GO TO   CALL-TEST-8-1.                                       IC2224.2 929
   000920         095400 CALL-DELETE-8-1.                                                 IC2224.2
   000921         095500     PERFORM DE-LETE.                                             IC2224.2 269
   000922         095600     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000923         095700     ADD     1 TO REC-CT.                                         IC2224.2 163
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000924         095800*                                                                 IC2224.2
   000925         095900*    IF THIS TEST IS DELETED THEN ITS SUBORDINATE TEST IS      *  IC2224.2
   000926         096000*    AUTOMATICALLY DELETED.                                    *  IC2224.2
   000927         096100*                                                                 IC2224.2
   000928         096200     GO TO   CALL-DELETE-8-2.                                     IC2224.2 949
   000929         096300 CALL-TEST-8-1.                                                   IC2224.2
   000930         096400*    CALL "NON-EXISTING-PROGRAM"                                  IC2224.2
   000931         096500     CALL   "XXXXXXXX" USING DN1, DN2, DN3, DN4                   IC2224.2 EXT 99 103 100 105
   000932         096600             ON OVERFLOW                                          IC2224.2
   000933      1  096700                  MOVE "P" TO EXCEPTION-PATH-FLAG                 IC2224.2 108
   000934         096800     END-CALL                                                     IC2224.2
   000935         096900     MOVE    1 TO CALL-FLAG.                                      IC2224.2 107
   000936         097000     IF EXCEPTION-PATH-FLAG NOT = "P"                             IC2224.2 108
   000937      1  097100             MOVE "EXCEPTION SHOULD HAVE OCCURRED" TO RE-MARK     IC2224.2 121
   000938      1  097200             MOVE "P" TO CORRECT-A                                IC2224.2 141
   000939      1  097300             MOVE EXCEPTION-PATH-FLAG TO COMPUTED-A               IC2224.2 108 127
   000940      1  097400             PERFORM FAIL                                         IC2224.2 268
   000941         097500     ELSE                                                         IC2224.2
   000942      1  097600             PERFORM PASS.                                        IC2224.2 267
   000943         097700 CALL-WRITE-8-1.                                                  IC2224.2
   000944         097800     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000945         097900     ADD 1 TO REC-CT.                                             IC2224.2 163
   000946         098000*                                                                 IC2224.2
   000947         098100 CALL-INIT-8-2.                                                   IC2224.2
   000948         098200     GO TO    CALL-TEST-8-2.                                      IC2224.2 956
   000949         098300 CALL-DELETE-8-2.                                                 IC2224.2
   000950         098400     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000951         098500     PERFORM DE-LETE.                                             IC2224.2 269
   000952         098600     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000953         098700     ADD     1 TO REC-CT.                                         IC2224.2 163
   000954         098800     GO TO   CALL-EXIT-8.                                         IC2224.2 976
   000955         098900*                                                                 IC2224.2
   000956         099000 CALL-TEST-8-2.                                                   IC2224.2
   000957         099200*                                                              *  IC2224.2
   000958         099300*    CHECKS THAT THE STATEMENT FOLLOWING THE SCOPE TERMINATOR  *  IC2224.2
   000959         099400*    WAS EXECUTED.  IF THE PREVIOUS TEST FAILED, A PASS HERE   *  IC2224.2
   000960         099500*    INDICATES THAT THE SCOPE TERMINATOR HAS BEEN INTERPRETED  *  IC2224.2
   000961         099600*    CORRECTLY.  IF THE PREVIOUS TEST PASSED, A PASS HERE      *  IC2224.2
   000962         099700*    INDICATES THAT THE SCOPE TERMINATOR WAS NOT INTERPRETED   *  IC2224.2
   000963         099800*    AS "NOT ON EXCEPTION" OR "GO TO NEXT-SENTENCE".           *  IC2224.2
   000964         099900*                                                              *  IC2224.2
   000965         100100*                                                                 IC2224.2
   000966         100200     MOVE   "END-CALL OBSERVANCE" TO FEATURE.                     IC2224.2 112
   000967         100300     IF      CALL-FLAG = 1                                        IC2224.2 107
   000968      1  100400             PERFORM PASS                                         IC2224.2 267
   000969         100500     ELSE                                                         IC2224.2
   000970      1  100600             MOVE   "INCORRECT CONTROL FLOW" TO RE-MARK           IC2224.2 121
   000971      1  100700             MOVE    1 TO CORRECT-N                               IC2224.2 142
   000972      1  100800             MOVE    CALL-FLAG TO COMPUTED-N                      IC2224.2 107 128
   000973      1  100900             PERFORM FAIL.                                        IC2224.2 268
   000974         101000     PERFORM PRINT-DETAIL.                                        IC2224.2 271
   000975         101100*                                                                 IC2224.2
   000976         101200 CALL-EXIT-8.                                                     IC2224.2
   000977         101300*                                                                 IC2224.2
   000978         101400*                                                                 IC2224.2
   000979         101500 CCVS-EXIT SECTION.                                               IC2224.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000979==> IGYPS2015-I The paragraph or section prior to paragraph or section "CCVS-EXIT" did
                         not contain any statements.

   000980         101600 CCVS-999999.                                                     IC2224.2
   000981         101700     GO TO CLOSE-FILES.                                           IC2224.2 260
   000982         101800 END PROGRAM IC222A.                                              IC2224.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      172   ANSI-REFERENCE . . . . . . . .  345 352 361 M383 M458 M535 M617 M697 M772 M840 M917
      107   CALL-FLAG. . . . . . . . . . .  M381 M400 433 438 M456 M476 508 513 M533 M551 M554 M556 589 594 M615 M634 M637
                                            M639 670 675 M695 M713 M715 746 751 M770 M787 815 820 M838 M857 890 895 M915
                                            M935 967 972
      151   CCVS-C-1 . . . . . . . . . . .  289 331
      156   CCVS-C-2 . . . . . . . . . . .  290 332
      206   CCVS-E-1 . . . . . . . . . . .  295
      211   CCVS-E-2 . . . . . . . . . . .  304 311 318 323
      214   CCVS-E-2-2 . . . . . . . . . .  M303
      219   CCVS-E-3 . . . . . . . . . . .  324
      228   CCVS-E-4 . . . . . . . . . . .  303
      229   CCVS-E-4-1 . . . . . . . . . .  M301
      231   CCVS-E-4-2 . . . . . . . . . .  M302
      173   CCVS-H-1 . . . . . . . . . . .  284
      178   CCVS-H-2A. . . . . . . . . . .  285
      187   CCVS-H-2B. . . . . . . . . . .  286
      199   CCVS-H-3 . . . . . . . . . . .  287
      249   CCVS-PGM-ID. . . . . . . . . .  256 256
      133   CM-18V0
      127   COMPUTED-A . . . . . . . . . .  128 130 131 132 133 357 360 M405 M480 M561 M644 M720 M791 M862 M939
      128   COMPUTED-N . . . . . . . . . .  M438 M513 M594 M675 M751 M820 M895 M972
      126   COMPUTED-X . . . . . . . . . .  M279 343
      130   COMPUTED-0V18
      132   COMPUTED-14V4
      134   COMPUTED-18V0
      131   COMPUTED-4V14
      150   COR-ANSI-REFERENCE . . . . . .  M352 M354
      141   CORRECT-A. . . . . . . . . . .  142 143 144 145 146 358 360 M404 M479 M560 M643 M719 M790 M861 M938
      142   CORRECT-N. . . . . . . . . . .  M437 M512 M593 M674 M750 M819 M894 M971
      140   CORRECT-X. . . . . . . . . . .  M280 344
      143   CORRECT-0V18
      145   CORRECT-14V4
      147   CORRECT-18V0
      144   CORRECT-4V14
      146   CR-18V0
      164   DELETE-COUNTER . . . . . . . .  M269 298 314 316
       99   DN1. . . . . . . . . . . . . .  396 472 548 631 710 785 853 931
      103   DN2. . . . . . . . . . . . . .  396 472 548 631 710 785 853 931
      100   DN3. . . . . . . . . . . . . .  M384 396 M459 472 M536 548 M618 631 M698 710 M773 785 M841 853 M918 931
      105   DN4. . . . . . . . . . . . . .  M384 396 M459 472 M536 548 M618 631 M698 710 M773 785 M841 853 M918 931
      119   DOTVALUE . . . . . . . . . . .  M274
      170   DUMMY-HOLD . . . . . . . . . .  M328 334
       96   DUMMY-RECORD . . . . . . . . .  M284 M285 M286 M287 M289 M290 M291 M293 M295 M304 M311 M318 M323 M324 328 M329
                                            330 M331 M332 M333 M334 338 M339 M347 M362
      217   ENDER-DESC . . . . . . . . . .  M306 M317 M322
      165   ERROR-COUNTER. . . . . . . . .  M268 297 307 310
      169   ERROR-HOLD . . . . . . . . . .  M297 M298 M298 M299 302
      215   ERROR-TOTAL. . . . . . . . . .  M308 M310 M315 M316 M320 M321
      108   EXCEPTION-PATH-FLAG. . . . . .  M382 M398 401 405 M457 M474 477 480 M534 M550 M553 557 561 M616 M633 M636 640
                                            644 M696 M712 716 720 M771 788 791 M839 M855 858 862 M916 M933 936 939
      112   FEATURE. . . . . . . . . . . .  M380 M416 M432 M455 M491 M507 M532 M572 M588 M614 M655 M669 M694 M731 M745 M769
                                            M802 M814 M837 M873 M889 M914 M950 M966
      243   HYPHEN-LINE. . . . . . . . . .  291 293 333
      209   ID-AGAIN . . . . . . . . . . .  M256
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    23
0 Defined   Cross-reference of data names   References

0     101   ID1
      102   ID2
      242   INF-ANSI-REFERENCE . . . . . .  M345 M348 M361 M363
      237   INFO-TEXT. . . . . . . . . . .  M346
      166   INSPECT-COUNTER. . . . . . . .  M266 297 319 321
      114   P-OR-F . . . . . . . . . . . .  M266 M267 M268 M269 276 M279
      116   PAR-NAME . . . . . . . . . . .  M281 M379 M454 M531 M613 M693 M768 M836 M913
      118   PARDOT-X . . . . . . . . . . .  M273
      167   PASS-COUNTER . . . . . . . . .  M267 299 301
       94   PRINT-FILE . . . . . . . . . .  89 255 261
       95   PRINT-REC. . . . . . . . . . .  M275 M351 M353
      121   RE-MARK. . . . . . . . . . . .  M270 M282 M403 M436 M478 M511 M559 M592 M642 M673 M718 M749 M789 M818 M860 M893
                                            M937 M970
      163   REC-CT . . . . . . . . . . . .  272 274 281 M378 M389 M411 M419 M453 M464 M486 M494 M530 M541 M567 M575 M612
                                            M623 M650 M658 M692 M703 M726 M734 M767 M778 M797 M805 M835 M846 M868 M876 M912
                                            M923 M945 M953
      162   REC-SKL-SUB
      171   RECORD-COUNT . . . . . . . . .  M326 327 M335
      122   TEST-COMPUTED. . . . . . . . .  351
      137   TEST-CORRECT . . . . . . . . .  353
      190   TEST-ID. . . . . . . . . . . .  M256
      110   TEST-RESULTS . . . . . . . . .  M257 275
      168   TOTAL-ERROR
      239   XXCOMPUTED . . . . . . . . . .  M360
      241   XXCORRECT. . . . . . . . . . .  M360
      234   XXINFO . . . . . . . . . . . .  347 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    24
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

      356   BAIL-OUT . . . . . . . . . . .  P278
      364   BAIL-OUT-EX. . . . . . . . . .  E278 G358
      359   BAIL-OUT-WRITE . . . . . . . .  G357
      340   BLANK-LINE-PRINT
      386   CALL-DELETE-1-1
      415   CALL-DELETE-1-2. . . . . . . .  G394
      461   CALL-DELETE-2-1
      490   CALL-DELETE-2-2. . . . . . . .  G469
      538   CALL-DELETE-3-1
      571   CALL-DELETE-3-2. . . . . . . .  G546
      620   CALL-DELETE-4-1
      654   CALL-DELETE-4-2. . . . . . . .  G628
      700   CALL-DELETE-5-1
      730   CALL-DELETE-5-2. . . . . . . .  G708
      775   CALL-DELETE-6-1
      801   CALL-DELETE-6-2. . . . . . . .  G783
      843   CALL-DELETE-7-1
      872   CALL-DELETE-7-2. . . . . . . .  G851
      920   CALL-DELETE-8-1
      949   CALL-DELETE-8-2. . . . . . . .  G928
      442   CALL-EXIT-1. . . . . . . . . .  G420
      517   CALL-EXIT-2. . . . . . . . . .  G495
      598   CALL-EXIT-3. . . . . . . . . .  G576
      679   CALL-EXIT-4. . . . . . . . . .  G659
      755   CALL-EXIT-5. . . . . . . . . .  G735
      824   CALL-EXIT-6. . . . . . . . . .  G806
      899   CALL-EXIT-7. . . . . . . . . .  G877
      976   CALL-EXIT-8. . . . . . . . . .  G954
      369   CALL-INIT-1
      413   CALL-INIT-1-2
      445   CALL-INIT-2
      488   CALL-INIT-2-2
      520   CALL-INIT-3
      569   CALL-INIT-3-2
      601   CALL-INIT-4
      652   CALL-INIT-4-2
      682   CALL-INIT-5
      728   CALL-INIT-5-2
      758   CALL-INIT-6
      799   CALL-INIT-6-2
      827   CALL-INIT-7
      870   CALL-INIT-7-2
      902   CALL-INIT-8
      947   CALL-INIT-8-2
      395   CALL-TEST-1-1. . . . . . . . .  G385
      422   CALL-TEST-1-2. . . . . . . . .  G414
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    25
0 Defined   Cross-reference of procedures   References

0     470   CALL-TEST-2-1. . . . . . . . .  G460
      497   CALL-TEST-2-2. . . . . . . . .  G489
      547   CALL-TEST-3-1. . . . . . . . .  G537
      578   CALL-TEST-3-2. . . . . . . . .  G570
      629   CALL-TEST-4-1. . . . . . . . .  G619
      661   CALL-TEST-4-2. . . . . . . . .  G653
      709   CALL-TEST-5-1. . . . . . . . .  G699
      737   CALL-TEST-5-2. . . . . . . . .  G729
      784   CALL-TEST-6-1. . . . . . . . .  G774
      808   CALL-TEST-6-2. . . . . . . . .  G800
      852   CALL-TEST-7-1. . . . . . . . .  G842
      879   CALL-TEST-7-2. . . . . . . . .  G871
      929   CALL-TEST-8-1. . . . . . . . .  G919
      956   CALL-TEST-8-2. . . . . . . . .  G948
      409   CALL-WRITE-1-1
      484   CALL-WRITE-2-1
      565   CALL-WRITE-3-1
      648   CALL-WRITE-4-1
      724   CALL-WRITE-5-1
      795   CALL-WRITE-6-1
      866   CALL-WRITE-7-1
      943   CALL-WRITE-8-1
      979   CCVS-EXIT
      980   CCVS-999999
      253   CCVS1
      365   CCVS1-EXIT . . . . . . . . . .  G259
      260   CLOSE-FILES. . . . . . . . . .  G981
      288   COLUMN-NAMES-ROUTINE . . . . .  E258
      269   DE-LETE. . . . . . . . . . . .  P387 P417 P462 P492 P539 P573 P621 P656 P701 P732 P776 P803 P844 P874 P921 P951
      292   END-ROUTINE. . . . . . . . . .  P261
      296   END-ROUTINE-1
      305   END-ROUTINE-12
      313   END-ROUTINE-13 . . . . . . . .  E261
      294   END-RTN-EXIT
      268   FAIL . . . . . . . . . . . . .  P406 P439 P481 P514 P562 P595 P645 P676 P721 P752 P792 P821 P863 P896 P940 P973
      342   FAIL-ROUTINE . . . . . . . . .  P277
      355   FAIL-ROUTINE-EX. . . . . . . .  E277 G349
      350   FAIL-ROUTINE-WRITE . . . . . .  G343 G344
      283   HEAD-ROUTINE . . . . . . . . .  P258
      266   INSPT
      254   OPEN-FILES
      267   PASS . . . . . . . . . . . . .  P408 P434 P483 P509 P564 P590 P647 P671 P723 P747 P794 P816 P865 P891 P942 P968
      271   PRINT-DETAIL . . . . . . . . .  P388 P410 P418 P440 P463 P485 P493 P515 P540 P566 P574 P596 P622 P649 P657 P677
                                            P702 P725 P733 P753 P777 P796 P804 P822 P845 P867 P875 P897 P922 P944 P952 P974
      368   SECT-IC222A-001
      264   TERMINATE-CALL
      262   TERMINATE-CCVS
      325   WRITE-LINE . . . . . . . . . .  P275 P276 P284 P285 P286 P287 P289 P290 P291 P293 P295 P304 P312 P318 P323 P324
                                            P347 P351 P353 P362
      337   WRT-LN . . . . . . . . . . . .  P331 P332 P333 P336 P341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    26
0 Defined   Cross-reference of programs     References

        3   IC222A . . . . . . . . . . . .  982
 EXTERNAL   IC222A-1 . . . . . . . . . . .  396 548 710 785 853
 EXTERNAL   XXXXXXXX . . . . . . . . . . .  472 631 931
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A    Date 06/04/2022  Time 11:59:54   Page    27
0LineID  Message code  Message text

     94  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    396  IGYPG0020-W   Name "IC222A-1" was processed as "IC222A01".

                       Same message on line:    548    710    785    853

    445  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-2" did not contain any statements.

    520  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-3" did not contain any statements.

    601  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-4" did not contain any statements.

    682  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-5" did not contain any statements.

    758  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-6" did not contain any statements.

    827  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-7" did not contain any statements.

    902  IGYPS2015-I   The paragraph or section prior to paragraph or section "CALL-INIT-8" did not contain any statements.

    979  IGYPS2015-I   The paragraph or section prior to paragraph or section "CCVS-EXIT" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:      14           9              5
-* Statistics for COBOL program IC222A:
 *    Source records = 982
 *    Data Division statements = 71
 *    Procedure Division statements = 430
 *    Generated COBOL statements = 0
 *    Program complexity factor = 437
0End of compilation 1,  program IC222A,  highest severity 4.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000983         101900 IDENTIFICATION DIVISION.                                         IC2224.2
   000984         102000 PROGRAM-ID.                                                      IC2224.2
   000985         102100     IC222A-1.                                                    IC2224.2

 ==000985==> IGYDS0020-W Name "IC222A-1" was processed as "IC222A01".

   000986         102300*                                                              *  IC2224.2
   000987         102400*    THIS PROGRAM FORMS PART OF THE COBOL COMPILER VALIDATION  *  IC2224.2
   000988         102500*    SYSTEM (CCVS) USED TO TEST COBOL COMPILERS FOR            *  IC2224.2
   000989         102600*    CONFORMANCE WITH THE AMERICAN NATIONAL STANDARD           *  IC2224.2
   000990         102700*    (ANSI DOCUMENT REFERENCE: X3.23-1985) AND THE STANDARD OF *  IC2224.2
   000991         102800*    THE INTERNATIONAL ORGANIZATION FOR STANDARDISATION        *  IC2224.2
   000992         102900*    (ISO DOCUMENT REFERENCE: ISO-1989-1985).                  *  IC2224.2
   000993         103000*                                                              *  IC2224.2
   000994         103100*    THIS CCVS INCORPORATES ENHANCEMENTS TO THE CCVS FOR THE   *  IC2224.2
   000995         103200*    1974 STANDARD (ANSI DOCUMENT REFERENCE: X3.23-1974; ISO   *  IC2224.2
   000996         103300*    DOCUMENT REFERENCE: ISO-1989-1978).                       *  IC2224.2
   000997         103400*                                                              *  IC2224.2
   000998         103500*    THESE ENHANCEMENTS WERE SPECIFIED BY A PROJECT TEAM WHICH *  IC2224.2
   000999         103600*    WAS FUNDED BY THE COMMISSION FOR EUROPEAN COMMUNITIES AND *  IC2224.2
   001000         103700*    WHICH WAS RESPONSIBLE FOR TECHNICAL ISSUES TO:            *  IC2224.2
   001001         103800*                                                              *  IC2224.2
   001002         103900*          THE FEDERAL SOFTWARE TESTING CENTER                 *  IC2224.2
   001003         104000*          OFFICE OF SOFTWARE DEVELOPMENT                      *  IC2224.2
   001004         104100*                & INFORMATION TECHNOLOGY                      *  IC2224.2
   001005         104200*          TWO SKYLINE PLACE                                   *  IC2224.2
   001006         104300*          SUITE 1100                                          *  IC2224.2
   001007         104400*          5203 LEESBURG PIKE                                  *  IC2224.2
   001008         104500*          FALLS CHURCH                                        *  IC2224.2
   001009         104600*          VA 22041                                            *  IC2224.2
   001010         104700*          U.S.A.                                              *  IC2224.2
   001011         104800*                                                              *  IC2224.2
   001012         104900*    THE PROJECT TEAM MEMBERS WERE:                            *  IC2224.2
   001013         105000*                                                              *  IC2224.2
   001014         105100*          BIADI (BUREAU INTER ADMINISTRATION                  *  IC2224.2
   001015         105200*                 DE DOCUMENTATION INFORMATIQUE)               *  IC2224.2
   001016         105300*          21 RUE BARA                                         *  IC2224.2
   001017         105400*          F-92132 ISSY                                        *  IC2224.2
   001018         105500*          FRANCE                                              *  IC2224.2
   001019         105600*                                                              *  IC2224.2
   001020         105700*                                                              *  IC2224.2
   001021         105800*          GMD (GESELLSCHAFT FUR MATHEMATIK                    *  IC2224.2
   001022         105900*               UND DATENVERARBEITUNG MBH)                     *  IC2224.2
   001023         106000*          SCHLOSS BIRLINGHOVEN                                *  IC2224.2
   001024         106100*          POSTFACH 12 40                                      *  IC2224.2
   001025         106200*          D-5205 ST. AUGUSTIN 1                               *  IC2224.2
   001026         106300*          GERMANY FR                                          *  IC2224.2
   001027         106400*                                                              *  IC2224.2
   001028         106500*                                                              *  IC2224.2
   001029         106600*          NCC (THE NATIONAL COMPUTING CENTRE LTD)             *  IC2224.2
   001030         106700*          OXFORD ROAD                                         *  IC2224.2
   001031         106800*          MANCHESTER                                          *  IC2224.2
   001032         106900*          M1 7ED                                              *  IC2224.2
   001033         107000*          UNITED KINGDOM                                      *  IC2224.2
   001034         107100*                                                              *  IC2224.2
   001035         107200*                                                              *  IC2224.2
   001036         107300*    THIS TEST SUITE WAS PRODUCED BY THE NATIONAL COMPUTING    *  IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001037         107400*    CENTRE IN ENGLAND AND IS THE OFFICIAL CCVS TEST SUITE     *  IC2224.2
   001038         107500*    USED THROUGHOUT EUROPE AND THE UNITED STATES OF AMERICA.  *  IC2224.2
   001039         107600*                                                              *  IC2224.2
   001040         107700*    REVISED 1986 AUGUST                                       *  IC2224.2
   001041         107800*                                                              *  IC2224.2
   001042         108000*                                                              *  IC2224.2
   001043         108100*    VALIDATION FOR:-                                          *  IC2224.2
   001044         108200*                                                              *  IC2224.2
   001045         108300*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2224.2
   001046         108400*                                                              *  IC2224.2
   001047         108500*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2224.2
   001048         108600*                                                              *  IC2224.2
   001049         108800*                                                              *  IC2224.2
   001050         108900*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2224.2
   001051         109000*                                                              *  IC2224.2
   001052         109100*            X-82   SOURCE-COMPUTER                            *  IC2224.2
   001053         109200*            X-83   OBJECT-COMPUTER.                           *  IC2224.2
   001054         109300*                                                              *  IC2224.2
   001055         109500*                                                              *  IC2224.2
   001056         109600*    THE SOURCE FILE CONTAINS TWO PROGRAMS, IC222A AND         *  IC2224.2
   001057         109700*    IC222A-1, WHICH TEST LANGUAGE ELEMENTS FROM  LEVEL 2 OF   *  IC2224.2
   001058         109800*    THE INTER-PROGRAM COMMUNICATION MODULE.  THE LANGUAGE     *  IC2224.2
   001059         109900*    ELEMENTS TESTED ARE:                                      *  IC2224.2
   001060         110000*          "ON EXCEPTION"     PHRASE                           *  IC2224.2
   001061         110100*          "NOT ON EXCEPTION" PHRASE                           *  IC2224.2
   001062         110200*          "END-CALL"         PHRASE                           *  IC2224.2
   001063         110300*          "ON OVERFLOW"      PHRASE                           *  IC2224.2
   001064         110400*                                                                 IC2224.2
   001065         110500*    THE TWO PROGRAMS SHOULD BE COMPILED IN THE SAME           *  IC2224.2
   001066         110600*    INVOCATION OF THE COMPILER TO TEST THE BATCH COMPILATION  *  IC2224.2
   001067         110700*    FEATURE AND RECOGNITION OF THE END PROGRAM HEADER.  THE   *  IC2224.2
   001068         110800*    ARRANGEMENT OF THE PROGRAMS IN THE SOURCE FILE IS:           IC2224.2
   001069         110900*                                                                 IC2224.2
   001070         111000*    IDENTIFICATION DIVISION.                                     IC2224.2
   001071         111100*    PROGRAM-ID. IC222A.                                          IC2224.2
   001072         111200*          .                                                      IC2224.2
   001073         111300*          .                                                      IC2224.2
   001074         111400*          .                                                      IC2224.2
   001075         111500*    END PROGRAM IC222A.                                          IC2224.2
   001076         111600*    IDENTIFICATION DIVISION.                                     IC2224.2
   001077         111700*    PROGRAM-ID. IC222A-1.                                        IC2224.2
   001078         111800*          .                                                      IC2224.2
   001079         111900*          .                                                      IC2224.2
   001080         112000*          .                                                      IC2224.2
   001081         112100*                                                                 IC2224.2
   001082         112200*    A FULL DESCRIPTION OF THE TWO PROGRAMS IS INCLUDED AS     *  IC2224.2
   001083         112300*    COMMENTS IN PROGRAM IC222A.                               *  IC2224.2
   001084         112400*                                                              *  IC2224.2
   001085         112600*                                                                 IC2224.2
   001086         112700 ENVIRONMENT DIVISION.                                            IC2224.2
   001087         112800 CONFIGURATION SECTION.                                           IC2224.2
   001088         112900 SOURCE-COMPUTER.                                                 IC2224.2
   001089         113000     XXXXX082.                                                    IC2224.2
   001090         113100 OBJECT-COMPUTER.                                                 IC2224.2
   001091         113200     XXXXX083.                                                    IC2224.2
   001092         113300 INPUT-OUTPUT SECTION.                                            IC2224.2
   001093         113400 FILE-CONTROL.                                                    IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001094         113500     SELECT PRINT-FILE ASSIGN TO                                  IC2224.2 1099
   001095         113600     XXXXX055.                                                    IC2224.2
   001096         113700*                                                                 IC2224.2
   001097         113800 DATA DIVISION.                                                   IC2224.2
   001098         113900 FILE SECTION.                                                    IC2224.2
   001099         114000 FD  PRINT-FILE.                                                  IC2224.2

 ==001099==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   001100         114100 01  PRINT-REC PICTURE X(120).                                    IC2224.2
   001101         114200 01  DUMMY-RECORD PICTURE X(120).                                 IC2224.2
   001102         114300 WORKING-STORAGE SECTION.                                         IC2224.2
   001103         114400 77  WS1 PICTURE S999.                                            IC2224.2
   001104         114500 77  WS2 PICTURE S999                                             IC2224.2
   001105         114600         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2224.2 IMP
   001106         114700 LINKAGE SECTION.                                                 IC2224.2
   001107         114800 77  DN1 PICTURE S99.                                             IC2224.2
   001108         114900 77  DN2 PICTURE S99 USAGE COMPUTATIONAL.                         IC2224.2
   001109         115000 77  DN3 PICTURE S99.                                             IC2224.2
   001110         115100 77  DN4 PICTURE S99 USAGE COMPUTATIONAL.                         IC2224.2
   001111         115200*                                                                 IC2224.2
   001112         115300 PROCEDURE DIVISION USING DN1, DN2, DN3, DN4.                     IC2224.2 1107 1108 1109 1110
   001113         115400 SECT-IC222A-1-001 SECTION.                                       IC2224.2
   001114         115500 CALL-TEST-001.                                                   IC2224.2
   001115         115600     MOVE DN1 TO WS1.                                             IC2224.2 1107 1103
   001116         115700     ADD 1 TO WS1.                                                IC2224.2 1103
   001117         115800     ADD 1 TO WS2.                                                IC2224.2 1104
   001118         115900     MOVE WS1 TO DN3.                                             IC2224.2 1103 1109
   001119         116000     MOVE WS2 TO DN4.                                             IC2224.2 1104 1110
   001120         116100 CALL-EXIT-001.                                                   IC2224.2
   001121         116200     EXIT PROGRAM.                                                IC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    31
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

     1107   DN1. . . . . . . . . . . . . .  1112 1115
     1108   DN2. . . . . . . . . . . . . .  1112
     1109   DN3. . . . . . . . . . . . . .  1112 M1118
     1110   DN4. . . . . . . . . . . . . .  1112 M1119
     1101   DUMMY-RECORD
     1099   PRINT-FILE . . . . . . . . . .  1094
     1100   PRINT-REC
     1103   WS1. . . . . . . . . . . . . .  M1115 M1116 1118
     1104   WS2. . . . . . . . . . . . . .  M1117 1119
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    32
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

     1120   CALL-EXIT-001
     1114   CALL-TEST-001
     1113   SECT-IC222A-1-001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    33
0 Defined   Cross-reference of programs     References

      985   IC222A01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC222A01  Date 06/04/2022  Time 11:59:54   Page    34
0LineID  Message code  Message text

    985  IGYDS0020-W   Name "IC222A-1" was processed as "IC222A01".

   1099  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program IC222A01:
 *    Source records = 139
 *    Data Division statements = 8
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 2,  program IC222A01,  highest severity 4.
0Return code 4
