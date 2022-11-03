1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:43   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:43   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2194.2
   000002         000200 PROGRAM-ID.                                                      NC2194.2
   000003         000300     NC219A.                                                      NC2194.2
   000004         000400*                                                                 NC2194.2
   000005         000600*                                                              *  NC2194.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2194.2
   000007         000800*                                                              *  NC2194.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2194.2
   000009         001000*                                                              *  NC2194.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2194.2
   000011         001200*                                                              *  NC2194.2
   000012         001400*                                                              *  NC2194.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2194.2
   000014         001600*                                                              *  NC2194.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2194.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2194.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2194.2
   000018         002000*                                                              *  NC2194.2
   000019         002200*    PROGRAM NC219A TESTS THE USE OF "HIGH-VALUE" & "LOW-VALUE"   NC2194.2
   000020         002300*    IN THE LITERAL PHRASE OF THE "ALPHABET" CLAUSE OF THE        NC2194.2
   000021         002400*    "SPECIAL-NAMES" PARAGRAPH AND THE "PROGRAM COLLATING         NC2194.2
   000022         002500*    SEQUENCE" OF THE "OBJECT-COMPUTER PARAGRAPH.                 NC2194.2
   000023         002600*                                                                 NC2194.2
   000024         002800*                                                                 NC2194.2
   000025         002900*                                                                 NC2194.2
   000026         003000*        ACCORDING TO THE RULES FOR PROGRAM COLLATING SEQUENCE    NC2194.2
   000027         003100*    THE LOWEST CHARACTER SHOULD BE THE LETTER  F  FOLLOWED BY    NC2194.2
   000028         003200*    THE LETTER  U  FOLLOWED IN ASCENDING ORDER BY THE LETTER  N  NC2194.2
   000029         003300*    WHICH IS SET ON AN EVEN PAR WITH THE COMPUTER VALUES FOR     NC2194.2
   000030         003400*    HIGH-VALUE AND LOW-VALUE.  THE NEXT HIGHEST CHARACTER IS THE NC2194.2
   000031         003500*    LETTER  Y.  THE REMAINDER OF THE CHARACTERS IN THE COBOL     NC2194.2
   000032         003600*    CHARACTER SET THEN FOLLOW IN ASCENDING ORDER BUT EXCLUDE     NC2194.2
   000033         003700*    THE CHARACTERS AND VALUES PREVIOUSLY METIONED (F,U,N,HIGH-   NC2194.2
   000034         003800*    VALUE, LOW-VALUE, AND Y).  LOW-VALUE FOR THE NEW PROGRAM     NC2194.2
   000035         003900*    COLLATING SEQUENCE JUST EVALUATED SHOULD BE THE LETTER F.    NC2194.2
   000036         004000*    HIGH-VALUE SHOULD NOW BE EVALUATED AS THE HIGHEST ORDER      NC2194.2
   000037         004100*    CHARACTER FROM THE REMAINDER OF THE NATIVE COLLATING SEQUENCENC2194.2
   000038         004200*    NOT INCLUDING THE CHARACTERS F,U,N,**PREVIOUS** HIGH-VALUE   NC2194.2
   000039         004300*    OR **PREVIOUS** LOW-VALUE, AND THE LETTER  Y.                NC2194.2
   000040         004400*                                                                 NC2194.2
   000041         004500*        THE ALPHABET-NAME COLLATING-SEQ-2 IS NOT USED IN         NC2194.2
   000042         004600*    THE PROGRAM EXCEPT TO TEST WHETHER THE LETTER  Q  HAS BEEN   NC2194.2
   000043         004700*    SET TO AN EQUAL PAR WITH THE NEW HIGH-VALUE AND NEW LOW-VALUENC2194.2
   000044         004800*    FOR PURPOSES OF THE PROGRAM COLLATING SEQUENCE.  THIS WOULD  NC2194.2
   000045         004900*    BE TRUE IF THE ALPHABET-NAME COLLATING-SEQ-2 WERE REFERENCED NC2194.2
   000046         005000*    IN A SORT, MERGE, OR CODE-SET CLAUSE.                        NC2194.2
   000047         005100*                                                                 NC2194.2
   000048         005200*                                                                 NC2194.2
   000049         005300*                                                                 NC2194.2
   000050         005400 ENVIRONMENT DIVISION.                                            NC2194.2
   000051         005500 CONFIGURATION SECTION.                                           NC2194.2
   000052         005600 SOURCE-COMPUTER.                                                 NC2194.2
   000053         005700     XXXXX082.                                                    NC2194.2
   000054         005800 OBJECT-COMPUTER.                                                 NC2194.2
   000055         005900     XXXXX083                                                     NC2194.2
   000056         006000     PROGRAM COLLATING SEQUENCE IS COLLATING-SEQ-1.               NC2194.2 59
   000057         006100 SPECIAL-NAMES.                                                   NC2194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200         ALPHABET                                                 NC2194.2
   000059         006300         COLLATING-SEQ-1 IS "F" "U" "N"                           NC2194.2
   000060         006400             ALSO HIGH-VALUE                                      NC2194.2 IMP
   000061         006500             ALSO LOW-VALUE                                       NC2194.2 IMP
   000062         006600             "Y"                                                  NC2194.2
   000063         006700         ALPHABET                                                 NC2194.2
   000064         006800         COLLATING-SEQ-2 IS "Q"                                   NC2194.2
   000065         006900             ALSO HIGH-VALUE                                      NC2194.2 IMP
   000066         007000             ALSO LOW-VALUE.                                      NC2194.2 IMP
   000067         007100 INPUT-OUTPUT SECTION.                                            NC2194.2
   000068         007200 FILE-CONTROL.                                                    NC2194.2
   000069         007300     SELECT PRINT-FILE ASSIGN TO                                  NC2194.2 73
   000070         007400     XXXXX055.                                                    NC2194.2
   000071         007500 DATA DIVISION.                                                   NC2194.2
   000072         007600 FILE SECTION.                                                    NC2194.2
   000073         007700 FD  PRINT-FILE.                                                  NC2194.2

 ==000073==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000074         007800 01  PRINT-REC PICTURE X(120).                                    NC2194.2
   000075         007900 01  DUMMY-RECORD PICTURE X(120).                                 NC2194.2
   000076         008000 WORKING-STORAGE SECTION.                                         NC2194.2
   000077         008100 01  F-AN-1                          PICTURE A VALUE "F".         NC2194.2
   000078         008200 01  U-AN-1                          PICTURE A VALUE "U".         NC2194.2
   000079         008300 01  N-AN-1                          PICTURE A VALUE "N".         NC2194.2
   000080         008400 01  Y-AN-1                          PICTURE A VALUE "Y".         NC2194.2
   000081         008500 01  Q-AN-1                          PICTURE A VALUE "Q".         NC2194.2
   000082         008600 01  NEW-LOW                         PICTURE X VALUE LOW-VALUE.   NC2194.2 IMP
   000083         008700 01  TEST-RESULTS.                                                NC2194.2
   000084         008800     02 FILLER                   PIC X      VALUE SPACE.          NC2194.2 IMP
   000085         008900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2194.2 IMP
   000086         009000     02 FILLER                   PIC X      VALUE SPACE.          NC2194.2 IMP
   000087         009100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2194.2 IMP
   000088         009200     02 FILLER                   PIC X      VALUE SPACE.          NC2194.2 IMP
   000089         009300     02  PAR-NAME.                                                NC2194.2
   000090         009400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2194.2 IMP
   000091         009500       03  PARDOT-X              PIC X      VALUE SPACE.          NC2194.2 IMP
   000092         009600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2194.2 IMP
   000093         009700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2194.2 IMP
   000094         009800     02 RE-MARK                  PIC X(61).                       NC2194.2
   000095         009900 01  TEST-COMPUTED.                                               NC2194.2
   000096         010000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2194.2 IMP
   000097         010100     02 FILLER                   PIC X(17)  VALUE                 NC2194.2
   000098         010200            "       COMPUTED=".                                   NC2194.2
   000099         010300     02 COMPUTED-X.                                               NC2194.2
   000100         010400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2194.2 IMP
   000101         010500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2194.2 100
   000102         010600                                 PIC -9(9).9(9).                  NC2194.2
   000103         010700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2194.2 100
   000104         010800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2194.2 100
   000105         010900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2194.2 100
   000106         011000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2194.2 100
   000107         011100         04 COMPUTED-18V0                    PIC -9(18).          NC2194.2
   000108         011200         04 FILLER                           PIC X.               NC2194.2
   000109         011300     03 FILLER PIC X(50) VALUE SPACE.                             NC2194.2 IMP
   000110         011400 01  TEST-CORRECT.                                                NC2194.2
   000111         011500     02 FILLER PIC X(30) VALUE SPACE.                             NC2194.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2194.2
   000113         011700     02 CORRECT-X.                                                NC2194.2
   000114         011800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2194.2 IMP
   000115         011900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2194.2 114
   000116         012000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2194.2 114
   000117         012100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2194.2 114
   000118         012200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2194.2 114
   000119         012300     03      CR-18V0 REDEFINES CORRECT-A.                         NC2194.2 114
   000120         012400         04 CORRECT-18V0                     PIC -9(18).          NC2194.2
   000121         012500         04 FILLER                           PIC X.               NC2194.2
   000122         012600     03 FILLER PIC X(2) VALUE SPACE.                              NC2194.2 IMP
   000123         012700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2194.2 IMP
   000124         012800 01  CCVS-C-1.                                                    NC2194.2
   000125         012900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2194.2
   000126         013000-    "SS  PARAGRAPH-NAME                                          NC2194.2
   000127         013100-    "       REMARKS".                                            NC2194.2
   000128         013200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2194.2 IMP
   000129         013300 01  CCVS-C-2.                                                    NC2194.2
   000130         013400     02 FILLER                     PIC X        VALUE SPACE.      NC2194.2 IMP
   000131         013500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2194.2
   000132         013600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2194.2 IMP
   000133         013700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2194.2
   000134         013800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2194.2 IMP
   000135         013900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2194.2 IMP
   000136         014000 01  REC-CT                        PIC 99       VALUE ZERO.       NC2194.2 IMP
   000137         014100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2194.2 IMP
   000138         014200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2194.2 IMP
   000139         014300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2194.2 IMP
   000140         014400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2194.2 IMP
   000141         014500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2194.2 IMP
   000142         014600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2194.2 IMP
   000143         014700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2194.2 IMP
   000144         014800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2194.2 IMP
   000145         014900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2194.2 IMP
   000146         015000 01  CCVS-H-1.                                                    NC2194.2
   000147         015100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2194.2 IMP
   000148         015200     02  FILLER                    PIC X(42)    VALUE             NC2194.2
   000149         015300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2194.2
   000150         015400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2194.2 IMP
   000151         015500 01  CCVS-H-2A.                                                   NC2194.2
   000152         015600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2194.2 IMP
   000153         015700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2194.2
   000154         015800   02  FILLER                        PIC XXXX   VALUE             NC2194.2
   000155         015900     "4.2 ".                                                      NC2194.2
   000156         016000   02  FILLER                        PIC X(28)  VALUE             NC2194.2
   000157         016100            " COPY - NOT FOR DISTRIBUTION".                       NC2194.2
   000158         016200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2194.2 IMP
   000159         016300                                                                  NC2194.2
   000160         016400 01  CCVS-H-2B.                                                   NC2194.2
   000161         016500   02  FILLER                        PIC X(15)  VALUE             NC2194.2
   000162         016600            "TEST RESULT OF ".                                    NC2194.2
   000163         016700   02  TEST-ID                       PIC X(9).                    NC2194.2
   000164         016800   02  FILLER                        PIC X(4)   VALUE             NC2194.2
   000165         016900            " IN ".                                               NC2194.2
   000166         017000   02  FILLER                        PIC X(12)  VALUE             NC2194.2
   000167         017100     " HIGH       ".                                              NC2194.2
   000168         017200   02  FILLER                        PIC X(22)  VALUE             NC2194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300            " LEVEL VALIDATION FOR ".                             NC2194.2
   000170         017400   02  FILLER                        PIC X(58)  VALUE             NC2194.2
   000171         017500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2194.2
   000172         017600 01  CCVS-H-3.                                                    NC2194.2
   000173         017700     02  FILLER                      PIC X(34)  VALUE             NC2194.2
   000174         017800            " FOR OFFICIAL USE ONLY    ".                         NC2194.2
   000175         017900     02  FILLER                      PIC X(58)  VALUE             NC2194.2
   000176         018000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2194.2
   000177         018100     02  FILLER                      PIC X(28)  VALUE             NC2194.2
   000178         018200            "  COPYRIGHT   1985 ".                                NC2194.2
   000179         018300 01  CCVS-E-1.                                                    NC2194.2
   000180         018400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2194.2 IMP
   000181         018500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2194.2
   000182         018600     02 ID-AGAIN                     PIC X(9).                    NC2194.2
   000183         018700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2194.2 IMP
   000184         018800 01  CCVS-E-2.                                                    NC2194.2
   000185         018900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2194.2 IMP
   000186         019000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2194.2 IMP
   000187         019100     02 CCVS-E-2-2.                                               NC2194.2
   000188         019200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2194.2 IMP
   000189         019300         03 FILLER                   PIC X      VALUE SPACE.      NC2194.2 IMP
   000190         019400         03 ENDER-DESC               PIC X(44)  VALUE             NC2194.2
   000191         019500            "ERRORS ENCOUNTERED".                                 NC2194.2
   000192         019600 01  CCVS-E-3.                                                    NC2194.2
   000193         019700     02  FILLER                      PIC X(22)  VALUE             NC2194.2
   000194         019800            " FOR OFFICIAL USE ONLY".                             NC2194.2
   000195         019900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2194.2 IMP
   000196         020000     02  FILLER                      PIC X(58)  VALUE             NC2194.2
   000197         020100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2194.2
   000198         020200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2194.2 IMP
   000199         020300     02 FILLER                       PIC X(15)  VALUE             NC2194.2
   000200         020400             " COPYRIGHT 1985".                                   NC2194.2
   000201         020500 01  CCVS-E-4.                                                    NC2194.2
   000202         020600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2194.2 IMP
   000203         020700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2194.2
   000204         020800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2194.2 IMP
   000205         020900     02 FILLER                       PIC X(40)  VALUE             NC2194.2
   000206         021000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2194.2
   000207         021100 01  XXINFO.                                                      NC2194.2
   000208         021200     02 FILLER                       PIC X(19)  VALUE             NC2194.2
   000209         021300            "*** INFORMATION ***".                                NC2194.2
   000210         021400     02 INFO-TEXT.                                                NC2194.2
   000211         021500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2194.2 IMP
   000212         021600       04 XXCOMPUTED                 PIC X(20).                   NC2194.2
   000213         021700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2194.2 IMP
   000214         021800       04 XXCORRECT                  PIC X(20).                   NC2194.2
   000215         021900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2194.2
   000216         022000 01  HYPHEN-LINE.                                                 NC2194.2
   000217         022100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2194.2 IMP
   000218         022200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2194.2
   000219         022300-    "*****************************************".                 NC2194.2
   000220         022400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2194.2
   000221         022500-    "******************************".                            NC2194.2
   000222         022600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2194.2
   000223         022700     "NC219A".                                                    NC2194.2
   000224         022800 PROCEDURE DIVISION.                                              NC2194.2
   000225         022900 CCVS1 SECTION.                                                   NC2194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 OPEN-FILES.                                                      NC2194.2
   000227         023100     OPEN     OUTPUT PRINT-FILE.                                  NC2194.2 73
   000228         023200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2194.2 222 163 222 182
   000229         023300     MOVE    SPACE TO TEST-RESULTS.                               NC2194.2 IMP 83
   000230         023400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2194.2 255 260
   000231         023500     GO TO CCVS1-EXIT.                                            NC2194.2 337
   000232         023600 CLOSE-FILES.                                                     NC2194.2
   000233         023700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2194.2 264 285 73
   000234         023800 TERMINATE-CCVS.                                                  NC2194.2
   000235         023900     EXIT PROGRAM.                                                NC2194.2
   000236         024000 TERMINATE-CALL.                                                  NC2194.2
   000237         024100     STOP     RUN.                                                NC2194.2
   000238         024200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2194.2 87 139
   000239         024300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2194.2 87 140
   000240         024400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2194.2 87 138
   000241         024500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2194.2 87 137
   000242         024600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2194.2 94
   000243         024700 PRINT-DETAIL.                                                    NC2194.2
   000244         024800     IF REC-CT NOT EQUAL TO ZERO                                  NC2194.2 136 IMP
   000245      1  024900             MOVE "." TO PARDOT-X                                 NC2194.2 91
   000246      1  025000             MOVE REC-CT TO DOTVALUE.                             NC2194.2 136 92
   000247         025100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2194.2 83 74 297
   000248         025200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2194.2 87 297
   000249      1  025300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2194.2 314 327
   000250      1  025400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2194.2 328 336
   000251         025500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2194.2 IMP 87 IMP 99
   000252         025600     MOVE SPACE TO CORRECT-X.                                     NC2194.2 IMP 113
   000253         025700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2194.2 136 IMP IMP 89
   000254         025800     MOVE     SPACE TO RE-MARK.                                   NC2194.2 IMP 94
   000255         025900 HEAD-ROUTINE.                                                    NC2194.2
   000256         026000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2194.2 146 75 297
   000257         026100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2194.2 151 75 297
   000258         026200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2194.2 160 75 297
   000259         026300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2194.2 172 75 297
   000260         026400 COLUMN-NAMES-ROUTINE.                                            NC2194.2
   000261         026500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2194.2 124 75 297
   000262         026600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2194.2 129 75 297
   000263         026700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2194.2 216 75 297
   000264         026800 END-ROUTINE.                                                     NC2194.2
   000265         026900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2194.2 216 75 297
   000266         027000 END-RTN-EXIT.                                                    NC2194.2
   000267         027100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2194.2 179 75 297
   000268         027200 END-ROUTINE-1.                                                   NC2194.2
   000269         027300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2194.2 138 142 139
   000270         027400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2194.2 142 137 142
   000271         027500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2194.2 140 142
   000272         027600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2194.2
   000273         027700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2194.2 140 202
   000274         027800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2194.2 142 204
   000275         027900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2194.2 201 187
   000276         028000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2194.2 184 75 297
   000277         028100  END-ROUTINE-12.                                                 NC2194.2
   000278         028200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2194.2 190
   000279         028300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2194.2 138 IMP
   000280      1  028400         MOVE "NO " TO ERROR-TOTAL                                NC2194.2 188
   000281         028500         ELSE                                                     NC2194.2
   000282      1  028600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2194.2 138 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2194.2 184 75
   000284         028800     PERFORM WRITE-LINE.                                          NC2194.2 297
   000285         028900 END-ROUTINE-13.                                                  NC2194.2
   000286         029000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2194.2 137 IMP
   000287      1  029100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2194.2 188
   000288      1  029200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2194.2 137 188
   000289         029300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2194.2 190
   000290         029400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2194.2 184 75 297
   000291         029500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2194.2 139 IMP
   000292      1  029600          MOVE "NO " TO ERROR-TOTAL                               NC2194.2 188
   000293      1  029700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2194.2 139 188
   000294         029800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2194.2 190
   000295         029900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2194.2 184 75 297
   000296         030000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2194.2 192 75 297
   000297         030100 WRITE-LINE.                                                      NC2194.2
   000298         030200     ADD 1 TO RECORD-COUNT.                                       NC2194.2 144
   000299         030300     IF RECORD-COUNT GREATER 50                                   NC2194.2 144
   000300      1  030400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2194.2 75 143
   000301      1  030500         MOVE SPACE TO DUMMY-RECORD                               NC2194.2 IMP 75
   000302      1  030600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2194.2 75
   000303      1  030700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2194.2 124 75 309
   000304      1  030800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2194.2 129 75 309
   000305      1  030900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2194.2 216 75 309
   000306      1  031000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2194.2 143 75
   000307      1  031100         MOVE ZERO TO RECORD-COUNT.                               NC2194.2 IMP 144
   000308         031200     PERFORM WRT-LN.                                              NC2194.2 309
   000309         031300 WRT-LN.                                                          NC2194.2
   000310         031400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2194.2 75
   000311         031500     MOVE SPACE TO DUMMY-RECORD.                                  NC2194.2 IMP 75
   000312         031600 BLANK-LINE-PRINT.                                                NC2194.2
   000313         031700     PERFORM WRT-LN.                                              NC2194.2 309
   000314         031800 FAIL-ROUTINE.                                                    NC2194.2
   000315         031900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2194.2 99 IMP 322
   000316         032000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2194.2 113 IMP 322
   000317         032100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2194.2 145 215
   000318         032200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2194.2 210
   000319         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2194.2 207 75 297
   000320         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2194.2 IMP 215
   000321         032500     GO TO  FAIL-ROUTINE-EX.                                      NC2194.2 327
   000322         032600 FAIL-ROUTINE-WRITE.                                              NC2194.2
   000323         032700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2194.2 95 74 297
   000324         032800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2194.2 145 123
   000325         032900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2194.2 110 74 297
   000326         033000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2194.2 IMP 123
   000327         033100 FAIL-ROUTINE-EX. EXIT.                                           NC2194.2
   000328         033200 BAIL-OUT.                                                        NC2194.2
   000329         033300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2194.2 100 IMP 331
   000330         033400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2194.2 114 IMP 336
   000331         033500 BAIL-OUT-WRITE.                                                  NC2194.2
   000332         033600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2194.2 114 214 100 212
   000333         033700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2194.2 145 215
   000334         033800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2194.2 207 75 297
   000335         033900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2194.2 IMP 215
   000336         034000 BAIL-OUT-EX. EXIT.                                               NC2194.2
   000337         034100 CCVS1-EXIT.                                                      NC2194.2
   000338         034200     EXIT.                                                        NC2194.2
   000339         034300 SECT-NC219A-001 SECTION.                                         NC2194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400*                                                                 NC2194.2
   000341         034500*                                                                 NC2194.2
   000342         034600*        THE LETTER  F  IS THE LOWEST CHARACTER IN THE PROGRAM    NC2194.2
   000343         034700*    COLLATING SEQUENCE FOLLOWED IN ASCENDING ORDER BY THE        NC2194.2
   000344         034800*    LETTER  U.  THIS IS SHOWN IN THE ALPHABET-NAME               NC2194.2
   000345         034900*    COLLATING-SEQ-1.                                             NC2194.2
   000346         035000*                                                                 NC2194.2
   000347         035100*            F  SHOULD BE LESS THAN  U.                           NC2194.2
   000348         035200*                                                                 NC2194.2
   000349         035300*                                                                 NC2194.2
   000350         035400 SEQ-INIT-GF-1.                                                   NC2194.2
   000351         035500     MOVE    "SEQ-TEST-GF-1" TO PAR-NAME.                         NC2194.2 89
   000352         035600     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000353         035700     MOVE    "F < U" TO FEATURE.                                  NC2194.2 85
   000354         035800 SEQ-TEST-GF-1.                                                   NC2194.2
   000355         035900     IF      F-AN-1 IS LESS THAN U-AN-1                           NC2194.2 77 78
   000356      1  036000             PERFORM PASS                                         NC2194.2 239
   000357         036100         ELSE                                                     NC2194.2
   000358      1  036200             GO TO SEQ-FAIL-GF-1.                                 NC2194.2 363
   000359         036300     GO      TO SEQ-WRITE-GF-1.                                   NC2194.2 366
   000360         036400 SEQ-DELETE-GF-1.                                                 NC2194.2
   000361         036500     PERFORM DE-LETE.                                             NC2194.2 241
   000362         036600     GO      TO SEQ-WRITE-GF-1.                                   NC2194.2 366
   000363         036700 SEQ-FAIL-GF-1.                                                   NC2194.2
   000364         036800     PERFORM FAIL                                                 NC2194.2 240
   000365         036900     MOVE "F NOT < THAN U" TO COMPUTED-A.                         NC2194.2 100
   000366         037000 SEQ-WRITE-GF-1.                                                  NC2194.2
   000367         037100     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000368         037200*                                                                 NC2194.2
   000369         037300*                                                                 NC2194.2
   000370         037400*        THE LETTER  U  IS THE SECOND LOWEST CHARACTER IN THE     NC2194.2
   000371         037500*    PROGRAM COLLATING SEQUENCE FOLLOWED IN ASCENDING ORDER BY THENC2194.2
   000372         037600*    LETTER  N.  THIS IS SHOWN IN THE ALPHABET-NAME               NC2194.2
   000373         037700*    COLLATING-SEQ-1.                                             NC2194.2
   000374         037800*                                                                 NC2194.2
   000375         037900*            U  SHOULD BE LESS THAN  N.                           NC2194.2
   000376         038000*                                                                 NC2194.2
   000377         038100*                                                                 NC2194.2
   000378         038200 SEQ-INIT-GF-2.                                                   NC2194.2
   000379         038300     MOVE    "SEQ-TEST-GF-2" TO PAR-NAME.                         NC2194.2 89
   000380         038400     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000381         038500     MOVE    "U < N" TO FEATURE.                                  NC2194.2 85
   000382         038600 SEQ-TEST-GF-2.                                                   NC2194.2
   000383         038700*                                                                 NC2194.2
   000384         038800     IF      U-AN-1 IS LESS THAN N-AN-1                           NC2194.2 78 79
   000385      1  038900             PERFORM PASS                                         NC2194.2 239
   000386         039000         ELSE                                                     NC2194.2
   000387      1  039100             GO TO SEQ-FAIL-GF-2.                                 NC2194.2 392
   000388         039200     GO      TO SEQ-WRITE-GF-2.                                   NC2194.2 395
   000389         039300 SEQ-DELETE-GF-2.                                                 NC2194.2
   000390         039400     PERFORM DE-LETE.                                             NC2194.2 241
   000391         039500     GO      TO SEQ-WRITE-GF-2.                                   NC2194.2 395
   000392         039600 SEQ-FAIL-GF-2.                                                   NC2194.2
   000393         039700     PERFORM FAIL                                                 NC2194.2 240
   000394         039800     MOVE "U NOT < THAN N" TO COMPUTED-A.                         NC2194.2 100
   000395         039900 SEQ-WRITE-GF-2.                                                  NC2194.2
   000396         040000     PERFORM PRINT-DETAIL.                                        NC2194.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100*                                                                 NC2194.2
   000398         040200*                                                                 NC2194.2
   000399         040300*        THE LETTER  N  IS SET TO AN EVEN PAR WITH THE **OLD**    NC2194.2
   000400         040400*    HIGH-VALUE BUT NOT EQUAL TO THE **NEW** HIGH-VALUE.          NC2194.2
   000401         040500*                                                                 NC2194.2
   000402         040600*            N SHOULD NOT = HIGH-VALUE.                           NC2194.2
   000403         040700*                                                                 NC2194.2
   000404         040800*                                                                 NC2194.2
   000405         040900 SEQ-INIT-GF-3.                                                   NC2194.2
   000406         041000     MOVE    "SEQ-TEST-GF-3" TO PAR-NAME.                         NC2194.2 89
   000407         041100     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000408         041200     MOVE    "N = HIGH-VALUE" TO FEATURE.                         NC2194.2 85
   000409         041300 SEQ-TEST-GF-3.                                                   NC2194.2
   000410         041400*                                                                 NC2194.2
   000411         041500     IF      N-AN-1 IS EQUAL TO HIGH-VALUE                        NC2194.2 79 IMP
   000412      1  041600             GO TO SEQ-FAIL-GF-3                                  NC2194.2 419
   000413         041700         ELSE                                                     NC2194.2
   000414      1  041800             PERFORM PASS.                                        NC2194.2 239
   000415         041900     GO      TO SEQ-WRITE-GF-3.                                   NC2194.2 422
   000416         042000 SEQ-DELETE-GF-3.                                                 NC2194.2
   000417         042100     PERFORM DE-LETE.                                             NC2194.2 241
   000418         042200     GO      TO SEQ-WRITE-GF-3.                                   NC2194.2 422
   000419         042300 SEQ-FAIL-GF-3.                                                   NC2194.2
   000420         042400     PERFORM FAIL                                                 NC2194.2 240
   000421         042500     MOVE "N = HIGH-VALUE" TO COMPUTED-A.                         NC2194.2 100
   000422         042600 SEQ-WRITE-GF-3.                                                  NC2194.2
   000423         042700     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000424         042800*                                                                 NC2194.2
   000425         042900*                                                                 NC2194.2
   000426         043000*        LOW-VALUE SHOULD BE SET TO THE LETTER  F  SINCE IT       NC2194.2
   000427         043100*    IS THE LOWEST CHARACTER IN THE PROGRAM COLLATING SEQUENCE.   NC2194.2
   000428         043200*                                                                 NC2194.2
   000429         043300*            F SHOULD BE EQUAL TO LOW-VALUE.                      NC2194.2
   000430         043400*                                                                 NC2194.2
   000431         043500*                                                                 NC2194.2
   000432         043600 SEQ-INIT-GF-4.                                                   NC2194.2
   000433         043700     MOVE    "SEQ-TEST-GF-4" TO PAR-NAME.                         NC2194.2 89
   000434         043800     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000435         043900     MOVE    "F = LOW-VALUE" TO FEATURE.                          NC2194.2 85
   000436         044000 SEQ-TEST-GF-4.                                                   NC2194.2
   000437         044100*                                                                 NC2194.2
   000438         044200     IF      F-AN-1 IS EQUAL TO LOW-VALUE                         NC2194.2 77 IMP
   000439      1  044300             PERFORM PASS                                         NC2194.2 239
   000440         044400         ELSE                                                     NC2194.2
   000441      1  044500             GO TO SEQ-FAIL-GF-4.                                 NC2194.2 446
   000442         044600     GO      TO SEQ-WRITE-GF-4.                                   NC2194.2 449
   000443         044700 SEQ-DELETE-GF-4.                                                 NC2194.2
   000444         044800     PERFORM DE-LETE.                                             NC2194.2 241
   000445         044900     GO      TO SEQ-WRITE-GF-4.                                   NC2194.2 449
   000446         045000 SEQ-FAIL-GF-4.                                                   NC2194.2
   000447         045100     PERFORM FAIL                                                 NC2194.2 240
   000448         045200     MOVE "F NOT = LOW-VALUE" TO COMPUTED-A.                      NC2194.2 100
   000449         045300 SEQ-WRITE-GF-4.                                                  NC2194.2
   000450         045400     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000451         045500*                                                                 NC2194.2
   000452         045600*                                                                 NC2194.2
   000453         045700*        THE **NEW** LOW-VALUE SHOULD BE SET TO THE LETTER  F.    NC2194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800*    THE **NEW** HIGH-VALUE SHOULD BE SET TO THE HIGHEST ORDER    NC2194.2
   000455         045900*    CHARACTER IN THE EVALUATED PROGRAM COLLATING SEQUENCE.       NC2194.2
   000456         046000*                                                                 NC2194.2
   000457         046100*            HIGH-VALUE SHOULD BE GREATER THAN LOW-VALUE.         NC2194.2
   000458         046200*                                                                 NC2194.2
   000459         046300*                                                                 NC2194.2
   000460         046400 SEQ-INIT-GF-5.                                                   NC2194.2
   000461         046500     MOVE    "SEQ-TEST-GF-5" TO PAR-NAME.                         NC2194.2 89
   000462         046600     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000463         046700     MOVE    "H-VALUE > L-VALUE" TO FEATURE.                      NC2194.2 85
   000464         046800 SEQ-TEST-GF-5.                                                   NC2194.2
   000465         046900*                                                                 NC2194.2
   000466         047000     IF      HIGH-VALUE IS GREATER THAN NEW-LOW                   NC2194.2 IMP 82
   000467      1  047100             PERFORM PASS                                         NC2194.2 239
   000468         047200         ELSE                                                     NC2194.2
   000469      1  047300             GO TO SEQ-FAIL-GF-5.                                 NC2194.2 474
   000470         047400     GO      TO SEQ-WRITE-GF-5.                                   NC2194.2 477
   000471         047500 SEQ-DELETE-GF-5.                                                 NC2194.2
   000472         047600     PERFORM DE-LETE.                                             NC2194.2 241
   000473         047700     GO      TO SEQ-WRITE-GF-5.                                   NC2194.2 477
   000474         047800 SEQ-FAIL-GF-5.                                                   NC2194.2
   000475         047900     PERFORM FAIL                                                 NC2194.2 240
   000476         048000     MOVE "H-VALU NOT > L-VALU" TO COMPUTED-A.                    NC2194.2 100
   000477         048100 SEQ-WRITE-GF-5.                                                  NC2194.2
   000478         048200     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000479         048300*                                                                 NC2194.2
   000480         048400*                                                                 NC2194.2
   000481         048500*            LOW-VALUE SHOULD BE LESS THAN HIGH-VALUE.            NC2194.2
   000482         048600*                                                                 NC2194.2
   000483         048700*                                                                 NC2194.2
   000484         048800 SEQ-INIT-GF-6.                                                   NC2194.2
   000485         048900     MOVE    "SEQ-TEST-GF-6" TO PAR-NAME.                         NC2194.2 89
   000486         049000     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000487         049100     MOVE    "L-VALUE < H-VALUE" TO FEATURE.                      NC2194.2 85
   000488         049200 SEQ-TEST-GF-6.                                                   NC2194.2
   000489         049300*                                                                 NC2194.2
   000490         049400     IF      NEW-LOW IS LESS THAN HIGH-VALUE                      NC2194.2 82 IMP
   000491      1  049500             PERFORM PASS                                         NC2194.2 239
   000492         049600         ELSE                                                     NC2194.2
   000493      1  049700             GO TO SEQ-FAIL-GF-6.                                 NC2194.2 498
   000494         049800     GO      TO SEQ-WRITE-GF-6.                                   NC2194.2 501
   000495         049900 SEQ-DELETE-GF-6.                                                 NC2194.2
   000496         050000     PERFORM DE-LETE.                                             NC2194.2 241
   000497         050100     GO      TO SEQ-WRITE-GF-6.                                   NC2194.2 501
   000498         050200 SEQ-FAIL-GF-6.                                                   NC2194.2
   000499         050300     PERFORM FAIL                                                 NC2194.2 240
   000500         050400     MOVE "L-VALU NOT < H-VALU" TO COMPUTED-A.                    NC2194.2 100
   000501         050500 SEQ-WRITE-GF-6.                                                  NC2194.2
   000502         050600     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000503         050700*                                                                 NC2194.2
   000504         050800*                                                                 NC2194.2
   000505         050900*            LOW-VALUE SHOULD NOT BE EQUAL TO HIGH-VALUE.         NC2194.2
   000506         051000*                                                                 NC2194.2
   000507         051100*                                                                 NC2194.2
   000508         051200 SEQ-INIT-GF-7.                                                   NC2194.2
   000509         051300     MOVE    "SEQ-TEST-GF-7" TO PAR-NAME.                         NC2194.2 89
   000510         051400     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     MOVE    "H-VALUE = L-VALUE" TO FEATURE.                      NC2194.2 85
   000512         051600 SEQ-TEST-GF-7.                                                   NC2194.2
   000513         051700*                                                                 NC2194.2
   000514         051800     IF      HIGH-VALUE IS EQUAL TO NEW-LOW                       NC2194.2 IMP 82
   000515      1  051900             GO TO SEQ-FAIL-GF-7                                  NC2194.2 522
   000516         052000         ELSE                                                     NC2194.2
   000517      1  052100             PERFORM PASS.                                        NC2194.2 239
   000518         052200     GO      TO SEQ-WRITE-GF-7.                                   NC2194.2 525
   000519         052300 SEQ-DELETE-GF-7.                                                 NC2194.2
   000520         052400     PERFORM DE-LETE.                                             NC2194.2 241
   000521         052500     GO      TO SEQ-WRITE-GF-7.                                   NC2194.2 525
   000522         052600 SEQ-FAIL-GF-7.                                                   NC2194.2
   000523         052700     PERFORM FAIL                                                 NC2194.2 240
   000524         052800     MOVE "H-VALUE = L-VALUE" TO COMPUTED-A.                      NC2194.2 100
   000525         052900 SEQ-WRITE-GF-7.                                                  NC2194.2
   000526         053000     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000527         053100*                                                                 NC2194.2
   000528         053200*                                                                 NC2194.2
   000529         053300*        LOW-VALUE SHOULD BE SET TO THE LETTER  F.                NC2194.2
   000530         053400*                                                                 NC2194.2
   000531         053500*            THE LETTER  Y  SHOULD NOT BE EQUAL TO LOW-VALUE.     NC2194.2
   000532         053600*                                                                 NC2194.2
   000533         053700*                                                                 NC2194.2
   000534         053800 SEQ-INIT-GF-8.                                                   NC2194.2
   000535         053900     MOVE    "SEQ-TEST-GF-8" TO PAR-NAME.                         NC2194.2 89
   000536         054000     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000537         054100     MOVE    "Y = LOW-VALUE" TO FEATURE.                          NC2194.2 85
   000538         054200 SEQ-TEST-GF-8.                                                   NC2194.2
   000539         054300*                                                                 NC2194.2
   000540         054400     IF      Y-AN-1 IS EQUAL TO LOW-VALUE                         NC2194.2 80 IMP
   000541      1  054500             GO TO SEQ-FAIL-GF-8                                  NC2194.2 548
   000542         054600         ELSE                                                     NC2194.2
   000543      1  054700             PERFORM PASS.                                        NC2194.2 239
   000544         054800     GO      TO SEQ-WRITE-GF-8.                                   NC2194.2 551
   000545         054900 SEQ-DELETE-GF-8.                                                 NC2194.2
   000546         055000     PERFORM DE-LETE.                                             NC2194.2 241
   000547         055100     GO      TO SEQ-WRITE-GF-8.                                   NC2194.2 551
   000548         055200 SEQ-FAIL-GF-8.                                                   NC2194.2
   000549         055300     PERFORM FAIL                                                 NC2194.2 240
   000550         055400     MOVE "Y = LOW-VALUE" TO COMPUTED-A.                          NC2194.2 100
   000551         055500 SEQ-WRITE-GF-8.                                                  NC2194.2
   000552         055600     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000553         055700*                                                                 NC2194.2
   000554         055800*                                                                 NC2194.2
   000555         055900*        THE LETTER  Q  IS MENTIONED IN THE ALPHABET-NAME         NC2194.2
   000556         056000*    COLLATING-SEQ-2.  THIS ALPHABET-NAME CLAUSE SHOULD HAVE NO   NC2194.2
   000557         056100*    EFFECT ON THE PROGRAM COLLATING SEQUENCE.                    NC2194.2
   000558         056200*                                                                 NC2194.2
   000559         056300*            FOR OUR PROGRAM COLLATING SEQUENCE  Q  SHOULD NOT    NC2194.2
   000560         056400*            BE THE LOW ORDER CHARACTER THEREFORE IT SHOULD NOT   NC2194.2
   000561         056500*            BE EQUAL TO THE **NEW**  LOW-VALUE.                  NC2194.2
   000562         056600*                                                                 NC2194.2
   000563         056700*                                                                 NC2194.2
   000564         056800 SEQ-INIT-GF-9.                                                   NC2194.2
   000565         056900     MOVE    "SEQ-TEST-GF-9" TO PAR-NAME.                         NC2194.2 89
   000566         057000     MOVE    "VI-16 4.5.4 GR5/7" TO ANSI-REFERENCE.               NC2194.2 145
   000567         057100     MOVE    "Q = LOW-VALUE" TO FEATURE.                          NC2194.2 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 SEQ-TEST-GF-9.                                                   NC2194.2
   000569         057300*                                                                 NC2194.2
   000570         057400     IF      Q-AN-1 IS EQUAL TO LOW-VALUE                         NC2194.2 81 IMP
   000571      1  057500             GO TO SEQ-FAIL-GF-9                                  NC2194.2 578
   000572         057600         ELSE                                                     NC2194.2
   000573      1  057700             PERFORM PASS.                                        NC2194.2 239
   000574         057800     GO      TO SEQ-WRITE-GF-9.                                   NC2194.2 581
   000575         057900 SEQ-DELETE-GF-9.                                                 NC2194.2
   000576         058000     PERFORM DE-LETE.                                             NC2194.2 241
   000577         058100     GO      TO SEQ-WRITE-GF-9.                                   NC2194.2 581
   000578         058200 SEQ-FAIL-GF-9.                                                   NC2194.2
   000579         058300     PERFORM FAIL                                                 NC2194.2 240
   000580         058400     MOVE "Q = LOW-VALUE" TO COMPUTED-A.                          NC2194.2 100
   000581         058500 SEQ-WRITE-GF-9.                                                  NC2194.2
   000582         058600     PERFORM PRINT-DETAIL.                                        NC2194.2 243
   000583         058700*                                                                 NC2194.2
   000584         058800*                                                                 NC2194.2
   000585         058900 CCVS-EXIT SECTION.                                               NC2194.2
   000586         059000 CCVS-999999.                                                     NC2194.2
   000587         059100     GO TO CLOSE-FILES.                                           NC2194.2 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      145   ANSI-REFERENCE . . . . . . . .  317 324 333 M352 M380 M407 M434 M462 M486 M510 M536 M566
      124   CCVS-C-1 . . . . . . . . . . .  261 303
      129   CCVS-C-2 . . . . . . . . . . .  262 304
      179   CCVS-E-1 . . . . . . . . . . .  267
      184   CCVS-E-2 . . . . . . . . . . .  276 283 290 295
      187   CCVS-E-2-2 . . . . . . . . . .  M275
      192   CCVS-E-3 . . . . . . . . . . .  296
      201   CCVS-E-4 . . . . . . . . . . .  275
      202   CCVS-E-4-1 . . . . . . . . . .  M273
      204   CCVS-E-4-2 . . . . . . . . . .  M274
      146   CCVS-H-1 . . . . . . . . . . .  256
      151   CCVS-H-2A. . . . . . . . . . .  257
      160   CCVS-H-2B. . . . . . . . . . .  258
      172   CCVS-H-3 . . . . . . . . . . .  259
      222   CCVS-PGM-ID. . . . . . . . . .  228 228
      106   CM-18V0
       59   COLLATING-SEQ-1. . . . . . . .  56
       64   COLLATING-SEQ-2
      100   COMPUTED-A . . . . . . . . . .  101 103 104 105 106 329 332 M365 M394 M421 M448 M476 M500 M524 M550 M580
      101   COMPUTED-N
       99   COMPUTED-X . . . . . . . . . .  M251 315
      103   COMPUTED-0V18
      105   COMPUTED-14V4
      107   COMPUTED-18V0
      104   COMPUTED-4V14
      123   COR-ANSI-REFERENCE . . . . . .  M324 M326
      114   CORRECT-A. . . . . . . . . . .  115 116 117 118 119 330 332
      115   CORRECT-N
      113   CORRECT-X. . . . . . . . . . .  M252 316
      116   CORRECT-0V18
      118   CORRECT-14V4
      120   CORRECT-18V0
      117   CORRECT-4V14
      119   CR-18V0
      137   DELETE-COUNTER . . . . . . . .  M241 270 286 288
       92   DOTVALUE . . . . . . . . . . .  M246
      143   DUMMY-HOLD . . . . . . . . . .  M300 306
       75   DUMMY-RECORD . . . . . . . . .  M256 M257 M258 M259 M261 M262 M263 M265 M267 M276 M283 M290 M295 M296 300 M301
                                            302 M303 M304 M305 M306 310 M311 M319 M334
      190   ENDER-DESC . . . . . . . . . .  M278 M289 M294
      138   ERROR-COUNTER. . . . . . . . .  M240 269 279 282
      142   ERROR-HOLD . . . . . . . . . .  M269 M270 M270 M271 274
      188   ERROR-TOTAL. . . . . . . . . .  M280 M282 M287 M288 M292 M293
       77   F-AN-1 . . . . . . . . . . . .  355 438
       85   FEATURE. . . . . . . . . . . .  M353 M381 M408 M435 M463 M487 M511 M537 M567
      216   HYPHEN-LINE. . . . . . . . . .  263 265 305
      182   ID-AGAIN . . . . . . . . . . .  M228
      215   INF-ANSI-REFERENCE . . . . . .  M317 M320 M333 M335
      210   INFO-TEXT. . . . . . . . . . .  M318
      139   INSPECT-COUNTER. . . . . . . .  M238 269 291 293
       79   N-AN-1 . . . . . . . . . . . .  384 411
       82   NEW-LOW. . . . . . . . . . . .  466 490 514
       87   P-OR-F . . . . . . . . . . . .  M238 M239 M240 M241 248 M251
       89   PAR-NAME . . . . . . . . . . .  M253 M351 M379 M406 M433 M461 M485 M509 M535 M565
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    15
0 Defined   Cross-reference of data names   References

0      91   PARDOT-X . . . . . . . . . . .  M245
      140   PASS-COUNTER . . . . . . . . .  M239 271 273
       73   PRINT-FILE . . . . . . . . . .  69 227 233
       74   PRINT-REC. . . . . . . . . . .  M247 M323 M325
       81   Q-AN-1 . . . . . . . . . . . .  570
       94   RE-MARK. . . . . . . . . . . .  M242 M254
      136   REC-CT . . . . . . . . . . . .  244 246 253
      135   REC-SKL-SUB
      144   RECORD-COUNT . . . . . . . . .  M298 299 M307
       95   TEST-COMPUTED. . . . . . . . .  323
      110   TEST-CORRECT . . . . . . . . .  325
      163   TEST-ID. . . . . . . . . . . .  M228
       83   TEST-RESULTS . . . . . . . . .  M229 247
      141   TOTAL-ERROR
       78   U-AN-1 . . . . . . . . . . . .  355 384
      212   XXCOMPUTED . . . . . . . . . .  M332
      214   XXCORRECT. . . . . . . . . . .  M332
      207   XXINFO . . . . . . . . . . . .  319 334
       80   Y-AN-1 . . . . . . . . . . . .  540
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    16
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

      328   BAIL-OUT . . . . . . . . . . .  P250
      336   BAIL-OUT-EX. . . . . . . . . .  E250 G330
      331   BAIL-OUT-WRITE . . . . . . . .  G329
      312   BLANK-LINE-PRINT
      585   CCVS-EXIT
      586   CCVS-999999
      225   CCVS1
      337   CCVS1-EXIT . . . . . . . . . .  G231
      232   CLOSE-FILES. . . . . . . . . .  G587
      260   COLUMN-NAMES-ROUTINE . . . . .  E230
      241   DE-LETE. . . . . . . . . . . .  P361 P390 P417 P444 P472 P496 P520 P546 P576
      264   END-ROUTINE. . . . . . . . . .  P233
      268   END-ROUTINE-1
      277   END-ROUTINE-12
      285   END-ROUTINE-13 . . . . . . . .  E233
      266   END-RTN-EXIT
      240   FAIL . . . . . . . . . . . . .  P364 P393 P420 P447 P475 P499 P523 P549 P579
      314   FAIL-ROUTINE . . . . . . . . .  P249
      327   FAIL-ROUTINE-EX. . . . . . . .  E249 G321
      322   FAIL-ROUTINE-WRITE . . . . . .  G315 G316
      255   HEAD-ROUTINE . . . . . . . . .  P230
      238   INSPT
      226   OPEN-FILES
      239   PASS . . . . . . . . . . . . .  P356 P385 P414 P439 P467 P491 P517 P543 P573
      243   PRINT-DETAIL . . . . . . . . .  P367 P396 P423 P450 P478 P502 P526 P552 P582
      339   SECT-NC219A-001
      360   SEQ-DELETE-GF-1
      389   SEQ-DELETE-GF-2
      416   SEQ-DELETE-GF-3
      443   SEQ-DELETE-GF-4
      471   SEQ-DELETE-GF-5
      495   SEQ-DELETE-GF-6
      519   SEQ-DELETE-GF-7
      545   SEQ-DELETE-GF-8
      575   SEQ-DELETE-GF-9
      363   SEQ-FAIL-GF-1. . . . . . . . .  G358
      392   SEQ-FAIL-GF-2. . . . . . . . .  G387
      419   SEQ-FAIL-GF-3. . . . . . . . .  G412
      446   SEQ-FAIL-GF-4. . . . . . . . .  G441
      474   SEQ-FAIL-GF-5. . . . . . . . .  G469
      498   SEQ-FAIL-GF-6. . . . . . . . .  G493
      522   SEQ-FAIL-GF-7. . . . . . . . .  G515
      548   SEQ-FAIL-GF-8. . . . . . . . .  G541
      578   SEQ-FAIL-GF-9. . . . . . . . .  G571
      350   SEQ-INIT-GF-1
      378   SEQ-INIT-GF-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    17
0 Defined   Cross-reference of procedures   References

0     405   SEQ-INIT-GF-3
      432   SEQ-INIT-GF-4
      460   SEQ-INIT-GF-5
      484   SEQ-INIT-GF-6
      508   SEQ-INIT-GF-7
      534   SEQ-INIT-GF-8
      564   SEQ-INIT-GF-9
      354   SEQ-TEST-GF-1
      382   SEQ-TEST-GF-2
      409   SEQ-TEST-GF-3
      436   SEQ-TEST-GF-4
      464   SEQ-TEST-GF-5
      488   SEQ-TEST-GF-6
      512   SEQ-TEST-GF-7
      538   SEQ-TEST-GF-8
      568   SEQ-TEST-GF-9
      366   SEQ-WRITE-GF-1 . . . . . . . .  G359 G362
      395   SEQ-WRITE-GF-2 . . . . . . . .  G388 G391
      422   SEQ-WRITE-GF-3 . . . . . . . .  G415 G418
      449   SEQ-WRITE-GF-4 . . . . . . . .  G442 G445
      477   SEQ-WRITE-GF-5 . . . . . . . .  G470 G473
      501   SEQ-WRITE-GF-6 . . . . . . . .  G494 G497
      525   SEQ-WRITE-GF-7 . . . . . . . .  G518 G521
      551   SEQ-WRITE-GF-8 . . . . . . . .  G544 G547
      581   SEQ-WRITE-GF-9 . . . . . . . .  G574 G577
      236   TERMINATE-CALL
      234   TERMINATE-CCVS
      297   WRITE-LINE . . . . . . . . . .  P247 P248 P256 P257 P258 P259 P261 P262 P263 P265 P267 P276 P284 P290 P295 P296
                                            P319 P323 P325 P334
      309   WRT-LN . . . . . . . . . . . .  P303 P304 P305 P308 P313
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    18
0 Defined   Cross-reference of programs     References

        3   NC219A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC219A    Date 06/04/2022  Time 11:58:43   Page    19
0LineID  Message code  Message text

     73  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC219A:
 *    Source records = 587
 *    Data Division statements = 69
 *    Procedure Division statements = 236
 *    Generated COBOL statements = 0
 *    Program complexity factor = 245
0End of compilation 1,  program NC219A,  highest severity 0.
0Return code 0
