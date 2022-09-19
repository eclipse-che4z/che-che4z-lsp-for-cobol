1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:36   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:36   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:36   Page     3
0LineID  Message code  Library phase message text

         IGYLI0090-W   1 sequence errors were found in this program.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1                          1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         SM1064.2
   000002         000200 PROGRAM-ID.                                                      SM1064.2
   000003         000300     SM106A.                                                      SM1064.2
   000004         000500*                                                              *  SM1064.2
   000005         000600*    VALIDATION FOR:-                                          *  SM1064.2
   000006         000700*                                                              *  SM1064.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".SM1064.2
   000008         000900*                                                              *  SM1064.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".SM1064.2
   000010         001100*                                                              *  SM1064.2
   000011         001300*                                                              *  SM1064.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  SM1064.2
   000013         001500*                                                              *  SM1064.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  SM1064.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  SM1064.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  SM1064.2
   000017         001900*                                                              *  SM1064.2
   000018         002100 ENVIRONMENT DIVISION.                                            SM1064.2
   000019         002200*                                                                 SM1064.2
   000020         002400*                                                                 SM1064.2
   000021         002500*COPY   K6SCA                                                     SM1064.2
   000022         002600*                                                                 SM1064.2
   000023         002800 COPY   K6SCA.                                                    SM1064.2
   000024C*       000100 CONFIGURATION SECTION.                                           K6SCA4.2
   000025C        000200 SOURCE-COMPUTER.                                                 K6SCA4.2
   000026C        000300     XXXXX082.                                                    K6SCA4.2
   000027C        000400 OBJECT-COMPUTER.                                                 K6SCA4.2
   000028C        000500     XXXXX083.                                                    K6SCA4.2
   000029C        000600 INPUT-OUTPUT SECTION.                                            K6SCA4.2
   000030C        000700 FILE-CONTROL.                                                    K6SCA4.2
   000031C        000800     SELECT PRINT-FILE ASSIGN TO                                  K6SCA4.2 35
   000032C        000900     XXXXX055.                                                    K6SCA4.2
   000033C        001000 DATA DIVISION.                                                   K6SCA4.2
   000034C        001100 FILE SECTION.                                                    K6SCA4.2
   000035C        001200 FD  PRINT-FILE.                                                  K6SCA4.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036C        001300 01  PRINT-REC PICTURE X(120).                                    K6SCA4.2
   000037C        001400 01  DUMMY-RECORD PICTURE X(120).                                 K6SCA4.2
   000038C        001500 WORKING-STORAGE SECTION.                                         K6SCA4.2
   000039C        001600 01  TEST-RESULTS.                                                K6SCA4.2
   000040C        001700     02 FILLER                   PIC X      VALUE SPACE.          K6SCA4.2 IMP
   000041C        001800     02 FEATURE                  PIC X(20)  VALUE SPACE.          K6SCA4.2 IMP
   000042C        001900     02 FILLER                   PIC X      VALUE SPACE.          K6SCA4.2 IMP
   000043C        002000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          K6SCA4.2 IMP
   000044C        002100     02 FILLER                   PIC X      VALUE SPACE.          K6SCA4.2 IMP
   000045C        002200     02  PAR-NAME.                                                K6SCA4.2
   000046C        002300       03 FILLER                 PIC X(19)  VALUE SPACE.          K6SCA4.2 IMP
   000047C        002400       03  PARDOT-X              PIC X      VALUE SPACE.          K6SCA4.2 IMP
   000048C        002500       03 DOTVALUE               PIC 99     VALUE ZERO.           K6SCA4.2 IMP
   000049C        002600     02 FILLER                   PIC X(8)   VALUE SPACE.          K6SCA4.2 IMP
   000050C        002700     02 RE-MARK                  PIC X(61).                       K6SCA4.2
   000051C        002800 01  TEST-COMPUTED.                                               K6SCA4.2
   000052C        002900     02 FILLER                   PIC X(30)  VALUE SPACE.          K6SCA4.2 IMP
   000053C        003000     02 FILLER                   PIC X(17)  VALUE                 K6SCA4.2
   000054C        003100            "       COMPUTED=".                                   K6SCA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055C        003200     02 COMPUTED-X.                                               K6SCA4.2
   000056C        003300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          K6SCA4.2 IMP
   000057C        003400     03 COMPUTED-N               REDEFINES COMPUTED-A             K6SCA4.2 56
   000058C        003500                                 PIC -9(9).9(9).                  K6SCA4.2
   000059C        003600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         K6SCA4.2 56
   000060C        003700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     K6SCA4.2 56
   000061C        003800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     K6SCA4.2 56
   000062C        003900     03       CM-18V0 REDEFINES COMPUTED-A.                       K6SCA4.2 56
   000063C        004000         04 COMPUTED-18V0                    PIC -9(18).          K6SCA4.2
   000064C        004100         04 FILLER                           PIC X.               K6SCA4.2
   000065C        004200     03 FILLER PIC X(50) VALUE SPACE.                             K6SCA4.2 IMP
   000066C        004300 01  TEST-CORRECT.                                                K6SCA4.2
   000067C        004400     02 FILLER PIC X(30) VALUE SPACE.                             K6SCA4.2 IMP
   000068C        004500     02 FILLER PIC X(17) VALUE "       CORRECT =".                K6SCA4.2
   000069C        004600     02 CORRECT-X.                                                K6SCA4.2
   000070C        004700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         K6SCA4.2 IMP
   000071C        004800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      K6SCA4.2 70
   000072C        004900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         K6SCA4.2 70
   000073C        005000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     K6SCA4.2 70
   000074C        005100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     K6SCA4.2 70
   000075C        005200     03      CR-18V0 REDEFINES CORRECT-A.                         K6SCA4.2 70
   000076C        005300         04 CORRECT-18V0                     PIC -9(18).          K6SCA4.2
   000077C        005400         04 FILLER                           PIC X.               K6SCA4.2
   000078C        005500     03 FILLER PIC X(2) VALUE SPACE.                              K6SCA4.2 IMP
   000079C        005600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     K6SCA4.2 IMP
   000080C        005700 01  CCVS-C-1.                                                    K6SCA4.2
   000081C        005800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAK6SCA4.2
   000082C        005900-    "SS  PARAGRAPH-NAME                                          K6SCA4.2
   000083C        006000-    "       REMARKS".                                            K6SCA4.2
   000084C        006100     02 FILLER                     PIC X(20)    VALUE SPACE.      K6SCA4.2 IMP
   000085C        006200 01  CCVS-C-2.                                                    K6SCA4.2
   000086C        006300     02 FILLER                     PIC X        VALUE SPACE.      K6SCA4.2 IMP
   000087C        006400     02 FILLER                     PIC X(6)     VALUE "TESTED".   K6SCA4.2
   000088C        006500     02 FILLER                     PIC X(15)    VALUE SPACE.      K6SCA4.2 IMP
   000089C        006600     02 FILLER                     PIC X(4)     VALUE "FAIL".     K6SCA4.2
   000090C        006700     02 FILLER                     PIC X(94)    VALUE SPACE.      K6SCA4.2 IMP
   000091C        006800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       K6SCA4.2 IMP
   000092C        006900 01  REC-CT                        PIC 99       VALUE ZERO.       K6SCA4.2 IMP
   000093C        007000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000094C        007100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000095C        007200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000096C        007300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000097C        007400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000098C        007500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       K6SCA4.2 IMP
   000099C        007600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      K6SCA4.2 IMP
   000100C        007700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       K6SCA4.2 IMP
   000101C        007800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     K6SCA4.2 IMP
   000102C        007900 01  CCVS-H-1.                                                    K6SCA4.2
   000103C        008000     02  FILLER                    PIC X(39)    VALUE SPACES.     K6SCA4.2 IMP
   000104C        008100     02  FILLER                    PIC X(42)    VALUE             K6SCA4.2
   000105C        008200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 K6SCA4.2
   000106C        008300     02  FILLER                    PIC X(39)    VALUE SPACES.     K6SCA4.2 IMP
   000107C        008400 01  CCVS-H-2A.                                                   K6SCA4.2
   000108C        008500   02  FILLER                        PIC X(40)  VALUE SPACE.      K6SCA4.2 IMP
   000109C        008600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  K6SCA4.2
   000110C        008700   02  FILLER                        PIC XXXX   VALUE             K6SCA4.2
   000111C        008800     "4.2 ".                                                      K6SCA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112C        008900   02  FILLER                        PIC X(28)  VALUE             K6SCA4.2
   000113C        009000            " COPY - NOT FOR DISTRIBUTION".                       K6SCA4.2
   000114C        009100   02  FILLER                        PIC X(41)  VALUE SPACE.      K6SCA4.2 IMP
   000115C        009200                                                                  K6SCA4.2
   000116C        009300 01  CCVS-H-2B.                                                   K6SCA4.2
   000117C        009400   02  FILLER                        PIC X(15)  VALUE             K6SCA4.2
   000118C        009500            "TEST RESULT OF ".                                    K6SCA4.2
   000119C        009600   02  TEST-ID                       PIC X(9).                    K6SCA4.2
   000120C        009700   02  FILLER                        PIC X(4)   VALUE             K6SCA4.2
   000121C        009800            " IN ".                                               K6SCA4.2
   000122C        009900   02  FILLER                        PIC X(12)  VALUE             K6SCA4.2
   000123C        010000     " HIGH       ".                                              K6SCA4.2
   000124C        010100   02  FILLER                        PIC X(22)  VALUE             K6SCA4.2
   000125C        010200            " LEVEL VALIDATION FOR ".                             K6SCA4.2
   000126C        010300   02  FILLER                        PIC X(58)  VALUE             K6SCA4.2
   000127C        010400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".K6SCA4.2
   000128C        010500 01  CCVS-H-3.                                                    K6SCA4.2
   000129C        010600     02  FILLER                      PIC X(34)  VALUE             K6SCA4.2
   000130C        010700            " FOR OFFICIAL USE ONLY    ".                         K6SCA4.2
   000131C        010800     02  FILLER                      PIC X(58)  VALUE             K6SCA4.2
   000132C        010900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".K6SCA4.2
   000133C        011000     02  FILLER                      PIC X(28)  VALUE             K6SCA4.2
   000134C        011100            "  COPYRIGHT   1985 ".                                K6SCA4.2
   000135C        011200 01  CCVS-E-1.                                                    K6SCA4.2
   000136C        011300     02 FILLER                       PIC X(52)  VALUE SPACE.      K6SCA4.2 IMP
   000137C        011400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              K6SCA4.2
   000138C        011500     02 ID-AGAIN                     PIC X(9).                    K6SCA4.2
   000139C        011600     02 FILLER                       PIC X(45)  VALUE SPACES.     K6SCA4.2 IMP
   000140C        011700 01  CCVS-E-2.                                                    K6SCA4.2
   000141C        011800     02  FILLER                      PIC X(31)  VALUE SPACE.      K6SCA4.2 IMP
   000142C        011900     02  FILLER                      PIC X(21)  VALUE SPACE.      K6SCA4.2 IMP
   000143C        012000     02 CCVS-E-2-2.                                               K6SCA4.2
   000144C        012100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      K6SCA4.2 IMP
   000145C        012200         03 FILLER                   PIC X      VALUE SPACE.      K6SCA4.2 IMP
   000146C        012300         03 ENDER-DESC               PIC X(44)  VALUE             K6SCA4.2
   000147C        012400            "ERRORS ENCOUNTERED".                                 K6SCA4.2
   000148C        012500 01  CCVS-E-3.                                                    K6SCA4.2
   000149C        012600     02  FILLER                      PIC X(22)  VALUE             K6SCA4.2
   000150C        012700            " FOR OFFICIAL USE ONLY".                             K6SCA4.2
   000151C        012800     02  FILLER                      PIC X(12)  VALUE SPACE.      K6SCA4.2 IMP
   000152C        012900     02  FILLER                      PIC X(58)  VALUE             K6SCA4.2
   000153C        013000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".K6SCA4.2
   000154C        013100     02  FILLER                      PIC X(13)  VALUE SPACE.      K6SCA4.2 IMP
   000155C        013200     02 FILLER                       PIC X(15)  VALUE             K6SCA4.2
   000156C        013300             " COPYRIGHT 1985".                                   K6SCA4.2
   000157C        013400 01  CCVS-E-4.                                                    K6SCA4.2
   000158C        013500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      K6SCA4.2 IMP
   000159C        013600     02 FILLER                       PIC X(4)   VALUE " OF ".     K6SCA4.2
   000160C        013700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      K6SCA4.2 IMP
   000161C        013800     02 FILLER                       PIC X(40)  VALUE             K6SCA4.2
   000162C        013900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       K6SCA4.2
   000163C        014000 01  XXINFO.                                                      K6SCA4.2
   000164C        014100     02 FILLER                       PIC X(19)  VALUE             K6SCA4.2
   000165C        014200            "*** INFORMATION ***".                                K6SCA4.2
   000166C        014300     02 INFO-TEXT.                                                K6SCA4.2
   000167C        014400       04 FILLER                     PIC X(8)   VALUE SPACE.      K6SCA4.2 IMP
   000168C        014500       04 XXCOMPUTED                 PIC X(20).                   K6SCA4.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169C        014600       04 FILLER                     PIC X(5)   VALUE SPACE.      K6SCA4.2 IMP
   000170C        014700       04 XXCORRECT                  PIC X(20).                   K6SCA4.2
   000171C        014800     02 INF-ANSI-REFERENCE           PIC X(48).                   K6SCA4.2
   000172C        014900 01  HYPHEN-LINE.                                                 K6SCA4.2
   000173C        015000     02 FILLER  PIC IS X VALUE IS SPACE.                          K6SCA4.2 IMP
   000174C        015100     02 FILLER  PIC IS X(65)    VALUE IS "************************K6SCA4.2
   000175C        015200-    "*****************************************".                 K6SCA4.2
   000176C        015300     02 FILLER  PIC IS X(54)    VALUE IS "************************K6SCA4.2
   000177C        015400-    "******************************".                            K6SCA4.2
   000178C        015500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             K6SCA4.2
   000179C        015600     "K6SCA".                                                     K6SCA4.2
   000180C        015700 PROCEDURE DIVISION.                                              K6SCA4.2
   000181C        015800 CCVS1 SECTION.                                                   K6SCA4.2
   000182C        015900 OPEN-FILES.                                                      K6SCA4.2
   000183C        016000     OPEN     OUTPUT PRINT-FILE.                                  K6SCA4.2 35
   000184C        016100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   K6SCA4.2 178 119 178 138
   000185C        016200     MOVE    SPACE TO TEST-RESULTS.                               K6SCA4.2 IMP 39
   000186C        016300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             K6SCA4.2 211 216
   000187C        016400     GO TO CCVS1-EXIT.                                            K6SCA4.2 298
   000188C        016500 CLOSE-FILES.                                                     K6SCA4.2
   000189C        016600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   K6SCA4.2 220 241 35
   000190C        016700 TERMINATE-CCVS.                                                  K6SCA4.2
   000191C        016800     EXIT PROGRAM.                                                K6SCA4.2
   000192C        016900 TERMINATE-CALL.                                                  K6SCA4.2
   000193C        017000     STOP     RUN.                                                K6SCA4.2
   000194C        017100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         K6SCA4.2 43 95
   000195C        017200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           K6SCA4.2 43 96
   000196C        017300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          K6SCA4.2 43 94
   000197C        017400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      K6SCA4.2 43 93
   000198C        017500     MOVE "****TEST DELETED****" TO RE-MARK.                      K6SCA4.2 50
   000199C        017600 PRINT-DETAIL.                                                    K6SCA4.2
   000200C        017700     IF REC-CT NOT EQUAL TO ZERO                                  K6SCA4.2 92 IMP
   000201C     1  017800             MOVE "." TO PARDOT-X                                 K6SCA4.2 47
   000202C     1  017900             MOVE REC-CT TO DOTVALUE.                             K6SCA4.2 92 48
   000203C        018000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      K6SCA4.2 39 36 253
   000204C        018100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               K6SCA4.2 43 253
   000205C     1  018200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 K6SCA4.2 274 288
   000206C     1  018300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 K6SCA4.2 289 297
   000207C        018400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              K6SCA4.2 IMP 43 IMP 55
   000208C        018500     MOVE SPACE TO CORRECT-X.                                     K6SCA4.2 IMP 69
   000209C        018600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         K6SCA4.2 92 IMP IMP 45
   000210C        018700     MOVE     SPACE TO RE-MARK.                                   K6SCA4.2 IMP 50
   000211C        018800 HEAD-ROUTINE.                                                    K6SCA4.2
   000212C        018900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  K6SCA4.2 102 37 253
   000213C        019000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  K6SCA4.2 107 37 253
   000214C        019100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  K6SCA4.2 116 37 253
   000215C        019200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  K6SCA4.2 128 37 253
   000216C        019300 COLUMN-NAMES-ROUTINE.                                            K6SCA4.2
   000217C        019400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           K6SCA4.2 80 37 253
   000218C        019500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   K6SCA4.2 85 37 253
   000219C        019600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        K6SCA4.2 172 37 253
   000220C        019700 END-ROUTINE.                                                     K6SCA4.2
   000221C        019800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.K6SCA4.2 172 37 253
   000222C        019900 END-RTN-EXIT.                                                    K6SCA4.2
   000223C        020000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   K6SCA4.2 135 37 253
   000224C        020100 END-ROUTINE-1.                                                   K6SCA4.2
   000225C        020200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      K6SCA4.2 94 98 95
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226C        020300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               K6SCA4.2 98 93 98
   000227C        020400      ADD PASS-COUNTER TO ERROR-HOLD.                             K6SCA4.2 96 98
   000228C        020500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   K6SCA4.2
   000229C        020600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            K6SCA4.2 96 158
   000230C        020700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              K6SCA4.2 98 160
   000231C        020800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                K6SCA4.2 157 143
   000232C        020900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           K6SCA4.2 140 37 253
   000233C        021000  END-ROUTINE-12.                                                 K6SCA4.2
   000234C        021100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        K6SCA4.2 146
   000235C        021200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      K6SCA4.2 94 IMP
   000236C     1  021300         MOVE "NO " TO ERROR-TOTAL                                K6SCA4.2 144
   000237C        021400         ELSE                                                     K6SCA4.2
   000238C     1  021500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       K6SCA4.2 94 144
   000239C        021600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           K6SCA4.2 140 37
   000240C        021700     PERFORM WRITE-LINE.                                          K6SCA4.2 253
   000241C        021800 END-ROUTINE-13.                                                  K6SCA4.2
   000242C        021900     IF DELETE-COUNTER IS EQUAL TO ZERO                           K6SCA4.2 93 IMP
   000243C     1  022000         MOVE "NO " TO ERROR-TOTAL  ELSE                          K6SCA4.2 144
   000244C     1  022100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      K6SCA4.2 93 144
   000245C        022200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   K6SCA4.2 146
   000246C        022300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           K6SCA4.2 140 37 253
   000247C        022400      IF   INSPECT-COUNTER EQUAL TO ZERO                          K6SCA4.2 95 IMP
   000248C     1  022500          MOVE "NO " TO ERROR-TOTAL                               K6SCA4.2 144
   000249C     1  022600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   K6SCA4.2 95 144
   000250C        022700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            K6SCA4.2 146
   000251C        022800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          K6SCA4.2 140 37 253
   000252C        022900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           K6SCA4.2 148 37 253
   000253C        023000 WRITE-LINE.                                                      K6SCA4.2
   000254C        023100     ADD 1 TO RECORD-COUNT.                                       K6SCA4.2 100
   000255C        023200     IF RECORD-COUNT GREATER 42                                   K6SCA4.2 100
   000256C     1  023300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          K6SCA4.2 37 99
   000257C     1  023400         MOVE SPACE TO DUMMY-RECORD                               K6SCA4.2 IMP 37
   000258C     1  023500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  K6SCA4.2 37
   000259C     1  023600         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    K6SCA4.2 102 37 269
   000260C     1  023700         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    K6SCA4.2 107 37 269
   000261C     1  023800         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    K6SCA4.2 116 37 269
   000262C     1  023900         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    K6SCA4.2 128 37 269
   000263C     1  024000         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            K6SCA4.2 80 37 269
   000264C     1  024100         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            K6SCA4.2 85 37 269
   000265C     1  024200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          K6SCA4.2 172 37 269
   000266C     1  024300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          K6SCA4.2 99 37
   000267C     1  024400         MOVE ZERO TO RECORD-COUNT.                               K6SCA4.2 IMP 100
   000268C        024500     PERFORM WRT-LN.                                              K6SCA4.2 269
   000269C        024600 WRT-LN.                                                          K6SCA4.2
   000270C        024700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               K6SCA4.2 37
   000271C        024800     MOVE SPACE TO DUMMY-RECORD.                                  K6SCA4.2 IMP 37
   000272C        024900 BLANK-LINE-PRINT.                                                K6SCA4.2
   000273C        025000     PERFORM WRT-LN.                                              K6SCA4.2 269
   000274C        025100 FAIL-ROUTINE.                                                    K6SCA4.2
   000275C        025200     IF     COMPUTED-X NOT EQUAL TO SPACE                         K6SCA4.2 55 IMP
   000276C     1  025300            GO TO   FAIL-ROUTINE-WRITE.                           K6SCA4.2 283
   000277C        025400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.K6SCA4.2 69 IMP 283
   000278C        025500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 K6SCA4.2 101 171
   000279C        025600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   K6SCA4.2 166
   000280C        025700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   K6SCA4.2 163 37 253
   000281C        025800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         K6SCA4.2 IMP 171
   000282C        025900     GO TO  FAIL-ROUTINE-EX.                                      K6SCA4.2 288
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283C        026000 FAIL-ROUTINE-WRITE.                                              K6SCA4.2
   000284C        026100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         K6SCA4.2 51 36 253
   000285C        026200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 K6SCA4.2 101 79
   000286C        026300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. K6SCA4.2 66 36 253
   000287C        026400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         K6SCA4.2 IMP 79
   000288C        026500 FAIL-ROUTINE-EX. EXIT.                                           K6SCA4.2
   000289C        026600 BAIL-OUT.                                                        K6SCA4.2
   000290C        026700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   K6SCA4.2 56 IMP 292
   000291C        026800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           K6SCA4.2 70 IMP 297
   000292C        026900 BAIL-OUT-WRITE.                                                  K6SCA4.2
   000293C        027000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  K6SCA4.2 70 170 56 168
   000294C        027100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 K6SCA4.2 101 171
   000295C        027200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   K6SCA4.2 163 37 253
   000296C        027300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         K6SCA4.2 IMP 171
   000297C        027400 BAIL-OUT-EX. EXIT.                                               K6SCA4.2
   000298C        027500 CCVS1-EXIT.                                                      K6SCA4.2
   000299C        027600     EXIT.                                                        K6SCA4.2
   000300C        027700 LB106A-INIT SECTION.                                             K6SCA4.2
   000301C        027800 LB106A-001.                                                      K6SCA4.2
   000302C        027900     MOVE  " REGARDLESS OF WHAT APPEARS ABOVE OR BELOW, THIS IS THK6SCA4.2
   000303C        028000-          "E REPORT FOR SM106A" TO PRINT-REC.                    K6SCA4.2 36
   000304C        028100     PERFORM WRITE-LINE.                                          K6SCA4.2 253
   000305C        028200     PERFORM BLANK-LINE-PRINT.                                    K6SCA4.2 272
   000306C        028300     MOVE     " THE PRESENCE OF THIS MESSAGE INDICATES THAT TEXT FK6SCA4.2
   000307C        028400-    "OR ALL 3 DIVISIONS CAN BE GENERATED BY ONE COPY STATEMENT." K6SCA4.2
   000308C        028500              TO PRINT-REC.                                       K6SCA4.2 36
   000309C        028600     PERFORM       WRITE-LINE.                                    K6SCA4.2 253
   000310C        028700     PERFORM       INSPT.                                         K6SCA4.2 194
   000311C        028800 CCVS-EXIT SECTION.                                               K6SCA4.2
   000312C        028900 CCVS-999999.                                                     K6SCA4.2
   000313C        029000     GO TO CLOSE-FILES.                                           K6SCA4.2 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    10
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      101   ANSI-REFERENCE . . . . . . . .  278 285 294
       80   CCVS-C-1 . . . . . . . . . . .  217 263
       85   CCVS-C-2 . . . . . . . . . . .  218 264
      135   CCVS-E-1 . . . . . . . . . . .  223
      140   CCVS-E-2 . . . . . . . . . . .  232 239 246 251
      143   CCVS-E-2-2 . . . . . . . . . .  M231
      148   CCVS-E-3 . . . . . . . . . . .  252
      157   CCVS-E-4 . . . . . . . . . . .  231
      158   CCVS-E-4-1 . . . . . . . . . .  M229
      160   CCVS-E-4-2 . . . . . . . . . .  M230
      102   CCVS-H-1 . . . . . . . . . . .  212 259
      107   CCVS-H-2A. . . . . . . . . . .  213 260
      116   CCVS-H-2B. . . . . . . . . . .  214 261
      128   CCVS-H-3 . . . . . . . . . . .  215 262
      178   CCVS-PGM-ID. . . . . . . . . .  184 184
       62   CM-18V0
       56   COMPUTED-A . . . . . . . . . .  57 59 60 61 62 290 293
       57   COMPUTED-N
       55   COMPUTED-X . . . . . . . . . .  M207 275
       59   COMPUTED-0V18
       61   COMPUTED-14V4
       63   COMPUTED-18V0
       60   COMPUTED-4V14
       79   COR-ANSI-REFERENCE . . . . . .  M285 M287
       70   CORRECT-A. . . . . . . . . . .  71 72 73 74 75 291 293
       71   CORRECT-N
       69   CORRECT-X. . . . . . . . . . .  M208 277
       72   CORRECT-0V18
       74   CORRECT-14V4
       76   CORRECT-18V0
       73   CORRECT-4V14
       75   CR-18V0
       93   DELETE-COUNTER . . . . . . . .  M197 226 242 244
       48   DOTVALUE . . . . . . . . . . .  M202
       99   DUMMY-HOLD . . . . . . . . . .  M256 266
       37   DUMMY-RECORD . . . . . . . . .  M212 M213 M214 M215 M217 M218 M219 M221 M223 M232 M239 M246 M251 M252 256 M257
                                            258 M259 M260 M261 M262 M263 M264 M265 M266 270 M271 M280 M295
      146   ENDER-DESC . . . . . . . . . .  M234 M245 M250
       94   ERROR-COUNTER. . . . . . . . .  M196 225 235 238
       98   ERROR-HOLD . . . . . . . . . .  M225 M226 M226 M227 230
      144   ERROR-TOTAL. . . . . . . . . .  M236 M238 M243 M244 M248 M249
       41   FEATURE
      172   HYPHEN-LINE. . . . . . . . . .  219 221 265
      138   ID-AGAIN . . . . . . . . . . .  M184
      171   INF-ANSI-REFERENCE . . . . . .  M278 M281 M294 M296
      166   INFO-TEXT. . . . . . . . . . .  M279
       95   INSPECT-COUNTER. . . . . . . .  M194 225 247 249
       43   P-OR-F . . . . . . . . . . . .  M194 M195 M196 M197 204 M207
       45   PAR-NAME . . . . . . . . . . .  M209
       47   PARDOT-X . . . . . . . . . . .  M201
       96   PASS-COUNTER . . . . . . . . .  M195 227 229
       35   PRINT-FILE . . . . . . . . . .  31 183 189
       36   PRINT-REC. . . . . . . . . . .  M203 M284 M286 M303 M308
       50   RE-MARK. . . . . . . . . . . .  M198 M210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    11
0 Defined   Cross-reference of data names   References

0      92   REC-CT . . . . . . . . . . . .  200 202 209
       91   REC-SKL-SUB
      100   RECORD-COUNT . . . . . . . . .  M254 255 M267
       51   TEST-COMPUTED. . . . . . . . .  284
       66   TEST-CORRECT . . . . . . . . .  286
      119   TEST-ID. . . . . . . . . . . .  M184
       39   TEST-RESULTS . . . . . . . . .  M185 203
       97   TOTAL-ERROR
      168   XXCOMPUTED . . . . . . . . . .  M293
      170   XXCORRECT. . . . . . . . . . .  M293
      163   XXINFO . . . . . . . . . . . .  280 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    12
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

      289   BAIL-OUT . . . . . . . . . . .  P206
      297   BAIL-OUT-EX. . . . . . . . . .  E206 G291
      292   BAIL-OUT-WRITE . . . . . . . .  G290
      272   BLANK-LINE-PRINT . . . . . . .  P305
      311   CCVS-EXIT
      312   CCVS-999999
      181   CCVS1
      298   CCVS1-EXIT . . . . . . . . . .  G187
      188   CLOSE-FILES. . . . . . . . . .  G313
      216   COLUMN-NAMES-ROUTINE . . . . .  E186
      197   DE-LETE
      220   END-ROUTINE. . . . . . . . . .  P189
      224   END-ROUTINE-1
      233   END-ROUTINE-12
      241   END-ROUTINE-13 . . . . . . . .  E189
      222   END-RTN-EXIT
      196   FAIL
      274   FAIL-ROUTINE . . . . . . . . .  P205
      288   FAIL-ROUTINE-EX. . . . . . . .  E205 G282
      283   FAIL-ROUTINE-WRITE . . . . . .  G276 G277
      211   HEAD-ROUTINE . . . . . . . . .  P186
      194   INSPT. . . . . . . . . . . . .  P310
      300   LB106A-INIT
      301   LB106A-001
      182   OPEN-FILES
      195   PASS
      199   PRINT-DETAIL
      192   TERMINATE-CALL
      190   TERMINATE-CCVS
      253   WRITE-LINE . . . . . . . . . .  P203 P204 P212 P213 P214 P215 P217 P218 P219 P221 P223 P232 P240 P246 P251 P252
                                            P280 P284 P286 P295 P304 P309
      269   WRT-LN . . . . . . . . . . . .  P259 P260 P261 P262 P263 P264 P265 P268 P273
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    13
0 Defined   Cross-reference of programs     References

        3   SM106A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    14
0
          COPY/BASIS cross-reference of text-names, library names and dataset information

  Text-name Library   File name                                    Concat   ISPF statistics
  (Member)  (DDNAME)  (Dataset name)                               Level    Created         Changed

  K6SCA     SYSLIB    AP891843.PUBLIC.CPY                            0

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SM106A    Date 06/04/2022  Time 11:56:36   Page    15
0LineID  Message code  Message text

         IGYSC0205-W   Warning message(s) were issued during library phase processing.  Refer to the beginning of the listing.

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program SM106A:
 *    Source records = 313
 *    Data Division statements = 63
 *    Procedure Division statements = 142
 *    Generated COBOL statements = 0
 *    Program complexity factor = 148
0End of compilation 1,  program SM106A,  highest severity 4.
0Return code 4
