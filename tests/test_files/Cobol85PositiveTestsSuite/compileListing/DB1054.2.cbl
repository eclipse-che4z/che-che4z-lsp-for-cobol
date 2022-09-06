1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:17   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:17   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB1054.2
   000002         000200 PROGRAM-ID.                                                      DB1054.2
   000003         000300     DB105A.                                                      DB1054.2
   000004         000400 AUTHOR.                                                          DB1054.2
   000005         000500     FEDERAL COMPILER TESTING CENTER.                             DB1054.2
   000006         000600 INSTALLATION.                                                    DB1054.2
   000007         000700     GENERAL SERVICES ADMINISTRATION                              DB1054.2
   000008         000800     AUTOMATED DATA AND TELECOMMUNICATION SERVICE.                DB1054.2
   000009         000900     SOFTWARE DEVELOPMENT OFFICE.                                 DB1054.2
   000010         001000     5203 LEESBURG PIKE  SUITE 1100                               DB1054.2
   000011         001100     FALLS CHURCH VIRGINIA 22041.                                 DB1054.2
   000012         001200                                                                  DB1054.2
   000013         001300     PHONE   (703) 756-6153                                       DB1054.2
   000014         001400                                                                  DB1054.2
   000015         001500     " HIGH       ".                                              DB1054.2
   000016         001600 DATE-WRITTEN.                                                    DB1054.2
   000017         001700     CCVS-74 VERSION 4.0 - 1980 JULY 1.                           DB1054.2
   000018         001800     CREATION DATE     /    VALIDATION DATE                       DB1054.2
   000019         001900     "4.2 ".                                                      DB1054.2
   000020         002000 SECURITY.                                                        DB1054.2
   000021         002100     NONE.                                                        DB1054.2
   000022         002200*                                                                 DB1054.2
   000023         002300*    *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *DB1054.2
   000024         002400*                                                                 DB1054.2
   000025         002500*                       PROGRAM ABSTRACT                          DB1054.2
   000026         002600*                                                                 DB1054.2
   000027         002700*    DB105A TESTS THE CAPABILITY OF THE DEBUG MODULE TO MONITOR   DB1054.2
   000028         002800*    ALL PROCEDURES WITH A SINGLE DEBUGGING DECLARATIVE.  THIS    DB1054.2
   000029         002900*    PROGRAM IS TO BE COMPILED AND EXECUTED WITH BOTH COMPILE     DB1054.2
   000030         003000*    AND OBJECT TIME DEBUGGING SWITCHES ON.  THE DEBUGGING        DB1054.2
   000031         003100*    PROCEDURE SHOULD BE INCLUDED IN THE COMPILATION AND          DB1054.2
   000032         003200*    GENERATE CODE.  DURING EXECUTION, EACH PROCEDURE SHOULD      DB1054.2
   000033         003300*    TRIGGER THE DEBUGGING PROCEDURE WHICH SHOULD STACK THE       DB1054.2
   000034         003400*    NAME OF THE PROCEDURE CALLING IT.  PRIOR TO BEING STACKED,   DB1054.2
   000035         003500*    EACH NAME IS POTENTIALLY ADJUSTED BY MODIFYING A FIXED-      DB1054.2
   000036         003600*    LOCATION NUMERIC SUBFIELD IN THE NAME.  THE CONSEQUENCE IS   DB1054.2
   000037         003700*    THAT IF THE PROGRAM EXECUTES PROPERLY, THE NAMES THAT ARE    DB1054.2
   000038         003800*    STACKED WILL BE UNIQUE AND IN AN INCREMENTING SEQUENCE IN    DB1054.2
   000039         003900*    THE NUMERIC SUBFIELD.  NEAR THE END OF THE PROGRAM, THE      DB1054.2
   000040         004000*    STACKING FUNCTION IS DISABLED AND THE NAME STACK IS COMPARED DB1054.2
   000041         004100*    TO A STATIC TABLE CONTAINING PROCEDURE-NAMES IN THE ORDER    DB1054.2
   000042         004200*    IN WHICH THE PROCEDURES SHOULD HAVE STACKED.                 DB1054.2
   000043         004300*                                                                 DB1054.2
   000044         004400*   DB105A"S REPORT DIFFERS SLIGHTLY FROM THE NOMINAL CCVS FORMAT.DB1054.2
   000045         004500*    IF EXECUTION IS PERFECT, THE REPORT WILL CONSIST OF 227      DB1054.2
   000046         004600*    LINES SHOWING                                                DB1054.2
   000047         004700*                                                                 DB1054.2
   000048         004800*        (A)  PROGRAM PROCEDURE NAME, AS IT APPEARS IN THE        DB1054.2
   000049         004900*             PROGRAM.                                            DB1054.2
   000050         005000*        (B)  ADJUSTED PROCEDURE NAME, AFTER ITS NUMERIC SUBFIELD DB1054.2
   000051         005100*             HAS BEEN ADJUSTED.                                  DB1054.2
   000052         005200*        (C)  ADJUSTED DEBUG-NAME, THAT WAS STACKED BY THE        DB1054.2
   000053         005300*             DEBUGGING PROCEDURE.                                DB1054.2
   000054         005400*                                                                 DB1054.2
   000055         005500*    NOMINALLY, THE NUMERIC SUBFIELDS OF THE PROCEDURE NAMES      DB1054.2
   000056         005600*    SHOULD APPEAR IN ASCENDING SEQUENCE.  ANY DEVIATIONS IN THE  DB1054.2
   000057         005700*    STACKING SEQUENCE FROM THE EXPECTED SEQUENCE WILL CAUSE      DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800*    ADDITIONAL REPORT LINES TO BE GENERATED WITH ONE OR MORE     DB1054.2
   000059         005900*    COLUMNS BLANK.  IF NOTHING EVER APPEARS IN THE "ADJUSTED     DB1054.2
   000060         006000*    DEBUG-NAME" COLUMN, IT MAY BE ASSUMED THAT THE DEBUGGING     DB1054.2
   000061         006100*    PROCEDURE WAS NEVER EXECUTED.                                DB1054.2
   000062         006200*                                                                 DB1054.2
   000063         006300*    IT IS A FUNDAMENTAL ASSUMPTION OF DB105A THAT WHEN A SECTION DB1054.2
   000064         006400*    IS ENTERED, THE DEBUGGING SECTION WILL BE CALLED TWICE, ONCE DB1054.2
   000065         006500*    FOR THE SECTION NAME AND ONCE FOR THE PARAGRAPH NAME THAT    DB1054.2
   000066         006600*    IMMEDIATELY FOLLOWS THE SECTION NAME.  ADDITIONALLY, DB105A  DB1054.2
   000067         006700*    TRAPS ANY FAILURES IN PROGRAM FLOW CAUSED BY A FAILURE OF    DB1054.2
   000068         006800*    VERBS FROM THE NUCLEUS MODULE.  THESE FAILURES ARE SUMMED    DB1054.2
   000069         006900*    AND REPORTED AT THE BOTTOM OF DB105A"S REPORT.  IF ANY       DB1054.2
   000070         007000*    PROCEDURE NAMES BEGINNING WITH "PROC-000" APPEAR IN THE      DB1054.2
   000071         007100*    "ADJUSTED DEBUG-NAME" COLUMN OF THE REPORT, THESE RESULT     DB1054.2
   000072         007200*    FROM EXECUTION OF PROCEDURES WHICH SHOULD NOT HAVE BEEN      DB1054.2
   000073         007300*    EXECUTED IF THE PROGRAM HAD FOLLOWED THE PROPER CONTROL FLOW DB1054.2
   000074         007400*    SEQUENCE.                                                    DB1054.2
   000075         007500*                                                                 DB1054.2
   000076         007600*                                                                 DB1054.2
   000077         007700*                                                                 DB1054.2
   000078         007800 ENVIRONMENT DIVISION.                                            DB1054.2
   000079         007900 CONFIGURATION SECTION.                                           DB1054.2
   000080         008000 SOURCE-COMPUTER.                                                 DB1054.2
   000081         008100     XXXXX082                                                     DB1054.2
   000082         008200     WITH DEBUGGING MODE.                                         DB1054.2
   000083         008300 OBJECT-COMPUTER.                                                 DB1054.2
   000084         008400     XXXXX083.                                                    DB1054.2
   000085         008500 INPUT-OUTPUT SECTION.                                            DB1054.2
   000086         008600 FILE-CONTROL.                                                    DB1054.2
   000087         008700     SELECT PRINT-FILE ASSIGN TO                                  DB1054.2 91
   000088         008800     XXXXX055.                                                    DB1054.2
   000089         008900 DATA DIVISION.                                                   DB1054.2
   000090         009000 FILE SECTION.                                                    DB1054.2
   000091         009100 FD  PRINT-FILE                                                   DB1054.2

 ==000091==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000092         009200     LABEL RECORDS                                                DB1054.2
   000093         009300     XXXXX084                                                     DB1054.2 UND

 ==000093==> IGYGR1174-S "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.

   000094         009400     DATA RECORD IS PRINT-REC DUMMY-RECORD.                       DB1054.2 * *
   000095         009500 01  PRINT-REC PICTURE X(120).                                    DB1054.2
   000096         009600 01  DUMMY-RECORD PICTURE X(120).                                 DB1054.2
   000097         009700 WORKING-STORAGE SECTION.                                         DB1054.2
   000098         009800 77  ATWO-DS-01V00                PICTURE S9                      DB1054.2
   000099         009900                                  VALUE 2.                        DB1054.2
   000100         010000 77  P-COUNT                      PICTURE 9(6).                   DB1054.2
   000101         010100 77  THREE                              PICTURE IS 9 VALUE IS 3.  DB1054.2
   000102         010200 77  XRAY                               PICTURE IS X.             DB1054.2
   000103         010300 77  ALTERLOOP                          PICTURE IS 9 VALUE IS     DB1054.2
   000104         010400     ZERO.                                                        DB1054.2 IMP
   000105         010500 77  BYPASS PICTURE IS 9 VALUE IS 1.                              DB1054.2
   000106         010600 77  STACK-END PICTURE IS 999 COMPUTATIONAL.                      DB1054.2
   000107         010700 77  INCREMENT PICTURE IS 99.                                     DB1054.2
   000108         010800 77  PROC-ACTIVE PICTURE IS 9 VALUE IS 1.                         DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000109         010900 01  PROCEDURE-NAMES.                                             DB1054.2
   000110         011000     02  FILLER PIC X(25) VALUE "PROC-001-BEGIN-TESTS     ".      DB1054.2
   000111         011100     02  FILLER PIC X(25) VALUE "PROC-002-GO--TEST-1      ".      DB1054.2
   000112         011200     02  FILLER PIC X(25) VALUE "PROC-003-GO--WRITE-1     ".      DB1054.2
   000113         011300     02  FILLER PIC X(25) VALUE "PROC-004-GO--INIT-2      ".      DB1054.2
   000114         011400     02  FILLER PIC X(25) VALUE "PROC-005-GO--TEST-2      ".      DB1054.2
   000115         011500     02  FILLER PIC X(25) VALUE "PROC-005-GO--A           ".      DB1054.2
   000116         011600     02  FILLER PIC X(25) VALUE "PROC-005-GO--TEST-2      ".      DB1054.2
   000117         011700     02  FILLER PIC X(25) VALUE "PROC-005-GO--B           ".      DB1054.2
   000118         011800     02  FILLER PIC X(25) VALUE "PROC-005-GO--TEST-2      ".      DB1054.2
   000119         011900     02  FILLER PIC X(25) VALUE "PROC-005-GO--C           ".      DB1054.2
   000120         012000     02  FILLER PIC X(25) VALUE "PROC-005-GO--TEST-2      ".      DB1054.2
   000121         012100     02  FILLER PIC X(25) VALUE "PROC-005-GO--D           ".      DB1054.2
   000122         012200     02  FILLER PIC X(25) VALUE "PROC-005-GO--TEST-2      ".      DB1054.2
   000123         012300     02  FILLER PIC X(25) VALUE "PROC-005-GO--A           ".      DB1054.2
   000124         012400     02  FILLER PIC X(25) VALUE "PROC-005-GO--E           ".      DB1054.2
   000125         012500     02  FILLER PIC X(25) VALUE "PROC-016-GO--WRITE-2     ".      DB1054.2
   000126         012600     02  FILLER PIC X(25) VALUE "PROC-017-GO--TEST-3      ".      DB1054.2
   000127         012700     02  FILLER PIC X(25) VALUE "PROC-018-GO--PASS-3      ".      DB1054.2
   000128         012800     02  FILLER PIC X(25) VALUE "PROC-019-GO--WRITE-3     ".      DB1054.2
   000129         012900     02  FILLER PIC X(25) VALUE "PROC-020-GO--TEST-4      ".      DB1054.2
   000130         013000     02  FILLER PIC X(25) VALUE "PROC-021-GO--PASS-4      ".      DB1054.2
   000131         013100     02  FILLER PIC X(25) VALUE "PROC-022-GO--PAS-4       ".      DB1054.2
   000132         013200     02  FILLER PIC X(25) VALUE "PROC-023-GO--WRITE-4     ".      DB1054.2
   000133         013300     02  FILLER PIC X(25) VALUE "PROC-024-ALTER-INIT      ".      DB1054.2
   000134         013400     02  FILLER PIC X(25) VALUE "PROC-025-ALTER-TEST-1    ".      DB1054.2
   000135         013500     02  FILLER PIC X(25) VALUE "PROC-026-ALTER-A         ".      DB1054.2
   000136         013600     02  FILLER PIC X(25) VALUE "PROC-026-ALTER-A         ".      DB1054.2
   000137         013700     02  FILLER PIC X(25) VALUE "PROC-027-ALTER-C         ".      DB1054.2
   000138         013800     02  FILLER PIC X(25) VALUE "PROC-028-ALTER-WRITE-1   ".      DB1054.2
   000139         013900     02  FILLER PIC X(25) VALUE "PROC-030-ALTER-TEST-3    ".      DB1054.2
   000140         014000     02  FILLER PIC X(25) VALUE "PROC-031-ALTER-G         ".      DB1054.2
   000141         014100     02  FILLER PIC X(25) VALUE "PROC-031-ALTER-G         ".      DB1054.2
   000142         014200     02  FILLER PIC X(25) VALUE "PROC-032-ALTER-I         ".      DB1054.2
   000143         014300     02  FILLER PIC X(25) VALUE "PROC-031-ALTER-G         ".      DB1054.2
   000144         014400     02  FILLER PIC X(25) VALUE "PROC-031-ALTER-G         ".      DB1054.2
   000145         014500     02  FILLER PIC X(25) VALUE "PROC-032-ALTER-WRITE-3   ".      DB1054.2
   000146         014600     02  FILLER PIC X(25) VALUE "PROC-037-EXIT-TEST-1     ".      DB1054.2
   000147         014700     02  FILLER PIC X(25) VALUE "PROC-038-EXIT-CHECK-1    ".      DB1054.2
   000148         014800     02  FILLER PIC X(25) VALUE "PROC-039-EXIT-WRITE-1    ".      DB1054.2
   000149         014900     02  FILLER PIC X(25) VALUE "PROC-040-PFM-TEST-1      ".      DB1054.2
   000150         015000     02  FILLER PIC X(25) VALUE "PROC-041-PFM-A           ".      DB1054.2
   000151         015100     02  FILLER PIC X(25) VALUE "PROC-042-PFM-WRITE-1     ".      DB1054.2
   000152         015200     02  FILLER PIC X(25) VALUE "PROC-043-PFM-TEST-2      ".      DB1054.2
   000153         015300     02  FILLER PIC X(25) VALUE "PROC-041-PFM-A           ".      DB1054.2
   000154         015400     02  FILLER PIC X(25) VALUE "PROC-045-PFM-B           ".      DB1054.2
   000155         015500     02  FILLER PIC X(25) VALUE "PROC-046-PFM-WRITE-2     ".      DB1054.2
   000156         015600     02  FILLER PIC X(25) VALUE "PROC-047-PFM-TEST-3      ".      DB1054.2
   000157         015700     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000158         015800     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000159         015900     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000160         016000     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000161         016100     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000162         016200     02  FILLER PIC X(25) VALUE "PROC-048-PFM-C           ".      DB1054.2
   000163         016300     02  FILLER PIC X(25) VALUE "PROC-048-PFM-WRITE-3     ".      DB1054.2
   000164         016400     02  FILLER PIC X(25) VALUE "PROC-055-PFM-TEST-4      ".      DB1054.2
   000165         016500     02  FILLER PIC X(25) VALUE "PROC-056-PFM-E           ".      DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000166         016600     02  FILLER PIC X(25) VALUE "PROC-057-PFM-F           ".      DB1054.2
   000167         016700     02  FILLER PIC X(25) VALUE "PROC-058-PFM-G           ".      DB1054.2
   000168         016800     02  FILLER PIC X(25) VALUE "PROC-059-PFM-H           ".      DB1054.2
   000169         016900     02  FILLER PIC X(25) VALUE "PROC-060-PFM-WRITE-4     ".      DB1054.2
   000170         017000     02  FILLER PIC X(25) VALUE "PROC-061-PFM-TEST-5      ".      DB1054.2
   000171         017100     02  FILLER PIC X(25) VALUE "PROC-062-PFM-J           ".      DB1054.2
   000172         017200     02  FILLER PIC X(25) VALUE "PROC-063-PFM-L           ".      DB1054.2
   000173         017300     02  FILLER PIC X(25) VALUE "PROC-064-PFM-WRITE-5     ".      DB1054.2
   000174         017400     02  FILLER PIC X(25) VALUE "PROC-065-PFM-TEST-6      ".      DB1054.2
   000175         017500     02  FILLER PIC X(25) VALUE "PROC-066-PFM-N           ".      DB1054.2
   000176         017600     02  FILLER PIC X(25) VALUE "PROC-067-PFM-O           ".      DB1054.2
   000177         017700     02  FILLER PIC X(25) VALUE "PROC-068-PFM-P           ".      DB1054.2
   000178         017800     02  FILLER PIC X(25) VALUE "PROC-069-PFM-WRITE-6     ".      DB1054.2
   000179         017900     02  FILLER PIC X(25) VALUE "PROC-070-PFM-TEST-7      ".      DB1054.2
   000180         018000     02  FILLER PIC X(25) VALUE "PROC-071-PFM-V           ".      DB1054.2
   000181         018100     02  FILLER PIC X(25) VALUE "PROC-072-PFM-W           ".      DB1054.2
   000182         018200     02  FILLER PIC X(25) VALUE "PROC-073-PFM-X           ".      DB1054.2
   000183         018300     02  FILLER PIC X(25) VALUE "PROC-074-PFM-Y           ".      DB1054.2
   000184         018400     02  FILLER PIC X(25) VALUE "PROC-075-PFM-Z           ".      DB1054.2
   000185         018500     02  FILLER PIC X(25) VALUE "PROC-071-PFM-V           ".      DB1054.2
   000186         018600     02  FILLER PIC X(25) VALUE "PROC-072-PFM-W           ".      DB1054.2
   000187         018700     02  FILLER PIC X(25) VALUE "PROC-073-PFM-X           ".      DB1054.2
   000188         018800     02  FILLER PIC X(25) VALUE "PROC-074-PFM-Y           ".      DB1054.2
   000189         018900     02  FILLER PIC X(25) VALUE "PROC-075-PFM-Z           ".      DB1054.2
   000190         019000     02  FILLER PIC X(25) VALUE "PROC-071-PFM-V           ".      DB1054.2
   000191         019100     02  FILLER PIC X(25) VALUE "PROC-072-PFM-W           ".      DB1054.2
   000192         019200     02  FILLER PIC X(25) VALUE "PROC-073-PFM-X           ".      DB1054.2
   000193         019300     02  FILLER PIC X(25) VALUE "PROC-074-PFM-Y           ".      DB1054.2
   000194         019400     02  FILLER PIC X(25) VALUE "PROC-075-PFM-Z           ".      DB1054.2
   000195         019500     02  FILLER PIC X(25) VALUE "PROC-071-PFM-V           ".      DB1054.2
   000196         019600     02  FILLER PIC X(25) VALUE "PROC-072-PFM-W           ".      DB1054.2
   000197         019700     02  FILLER PIC X(25) VALUE "PROC-073-PFM-X           ".      DB1054.2
   000198         019800     02  FILLER PIC X(25) VALUE "PROC-074-PFM-Y           ".      DB1054.2
   000199         019900     02  FILLER PIC X(25) VALUE "PROC-075-PFM-Z           ".      DB1054.2
   000200         020000     02  FILLER PIC X(25) VALUE "PROC-071-PFM-V           ".      DB1054.2
   000201         020100     02  FILLER PIC X(25) VALUE "PROC-072-PFM-W           ".      DB1054.2
   000202         020200     02  FILLER PIC X(25) VALUE "PROC-073-PFM-X           ".      DB1054.2
   000203         020300     02  FILLER PIC X(25) VALUE "PROC-074-PFM-Y           ".      DB1054.2
   000204         020400     02  FILLER PIC X(25) VALUE "PROC-075-PFM-Z           ".      DB1054.2
   000205         020500     02  FILLER PIC X(25) VALUE "PROC-096-PFM-WRITE-7     ".      DB1054.2
   000206         020600     02  FILLER PIC X(25) VALUE "PROC-097-PFM-TEST-08     ".      DB1054.2
   000207         020700     02  FILLER PIC X(25) VALUE "PROC-098-PFM-B-8         ".      DB1054.2
   000208         020800     02  FILLER PIC X(25) VALUE "PROC-097-PFM-A-8         ".      DB1054.2
   000209         020900     02  FILLER PIC X(25) VALUE "PROC-098-PFM-B-8         ".      DB1054.2
   000210         021000     02  FILLER PIC X(25) VALUE "PROC-097-PFM-A-8         ".      DB1054.2
   000211         021100     02  FILLER PIC X(25) VALUE "PROC-098-PFM-B-8         ".      DB1054.2
   000212         021200     02  FILLER PIC X(25) VALUE "PROC-097-PFM-TESTT-8     ".      DB1054.2
   000213         021300     02  FILLER PIC X(25) VALUE "PROC-098-PFM-TESTTT-8    ".      DB1054.2
   000214         021400     02  FILLER PIC X(25) VALUE "PROC-105-PFM-WRITE-08    ".      DB1054.2
   000215         021500     02  FILLER PIC X(25) VALUE "PROC-106-PFM-TEST-09     ".      DB1054.2
   000216         021600     02  FILLER PIC X(25) VALUE "PROC-107-PFM-B-9         ".      DB1054.2
   000217         021700     02  FILLER PIC X(25) VALUE "PROC-106-PFM-A-9         ".      DB1054.2
   000218         021800     02  FILLER PIC X(25) VALUE "PROC-107-PFM-B-9         ".      DB1054.2
   000219         021900     02  FILLER PIC X(25) VALUE "PROC-106-PFM-A-9         ".      DB1054.2
   000220         022000     02  FILLER PIC X(25) VALUE "PROC-107-PFM-B-9         ".      DB1054.2
   000221         022100     02  FILLER PIC X(25) VALUE "PROC-106-PFM-A-9         ".      DB1054.2
   000222         022200     02  FILLER PIC X(25) VALUE "PROC-107-PFM-B-9         ".      DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000223         022300     02  FILLER PIC X(25) VALUE "PROC-106-PFM-TESTT-9     ".      DB1054.2
   000224         022400     02  FILLER PIC X(25) VALUE "PROC-107-PFM-TESTTT-9    ".      DB1054.2
   000225         022500     02  FILLER PIC X(25) VALUE "PROC-116-PFM-WRITE-09    ".      DB1054.2
   000226         022600     02  FILLER PIC X(25) VALUE "PROC-117-PFM-TEST-10     ".      DB1054.2
   000227         022700     02  FILLER PIC X(25) VALUE "PROC-118-PFM-B-10        ".      DB1054.2
   000228         022800     02  FILLER PIC X(25) VALUE "PROC-119-PFM-C-10        ".      DB1054.2
   000229         022900     02  FILLER PIC X(25) VALUE "PROC-120-PFM-D-10        ".      DB1054.2
   000230         023000     02  FILLER PIC X(25) VALUE "PROC-117-PFM-A-10        ".      DB1054.2
   000231         023100     02  FILLER PIC X(25) VALUE "PROC-118-PFM-B-10        ".      DB1054.2
   000232         023200     02  FILLER PIC X(25) VALUE "PROC-119-PFM-C-10        ".      DB1054.2
   000233         023300     02  FILLER PIC X(25) VALUE "PROC-120-PFM-D-10        ".      DB1054.2
   000234         023400     02  FILLER PIC X(25) VALUE "PROC-117-PFM-A-10        ".      DB1054.2
   000235         023500     02  FILLER PIC X(25) VALUE "PROC-118-PFM-B-10        ".      DB1054.2
   000236         023600     02  FILLER PIC X(25) VALUE "PROC-119-PFM-C-10        ".      DB1054.2
   000237         023700     02  FILLER PIC X(25) VALUE "PROC-120-PFM-D-10        ".      DB1054.2
   000238         023800     02  FILLER PIC X(25) VALUE "PROC-118-PFM-B-10        ".      DB1054.2
   000239         023900     02  FILLER PIC X(25) VALUE "PROC-119-PFM-C-10        ".      DB1054.2
   000240         024000     02  FILLER PIC X(25) VALUE "PROC-120-PFM-D-10        ".      DB1054.2
   000241         024100     02  FILLER PIC X(25) VALUE "PROC-117-PFM-A-10        ".      DB1054.2
   000242         024200     02  FILLER PIC X(25) VALUE "PROC-118-PFM-B-10        ".      DB1054.2
   000243         024300     02  FILLER PIC X(25) VALUE "PROC-119-PFM-C-10        ".      DB1054.2
   000244         024400     02  FILLER PIC X(25) VALUE "PROC-120-PFM-D-10        ".      DB1054.2
   000245         024500     02  FILLER PIC X(25) VALUE "PROC-121-PFM-TESTT-10    ".      DB1054.2
   000246         024600     02  FILLER PIC X(25) VALUE "PROC-122-PFM-TESTTT-10   ".      DB1054.2
   000247         024700     02  FILLER PIC X(25) VALUE "PROC-138-PFM-WRITE-10    ".      DB1054.2
   000248         024800     02  FILLER PIC X(25) VALUE "PROC-139-PFM-TEST-11     ".      DB1054.2
   000249         024900     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000250         025000     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000251         025100     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000252         025200     02  FILLER PIC X(25) VALUE "PROC-139-PFM-A-11        ".      DB1054.2
   000253         025300     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000254         025400     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000255         025500     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000256         025600     02  FILLER PIC X(25) VALUE "PROC-139-PFM-A-11        ".      DB1054.2
   000257         025700     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000258         025800     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000259         025900     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000260         026000     02  FILLER PIC X(25) VALUE "PROC-139-PFM-A-11        ".      DB1054.2
   000261         026100     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000262         026200     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000263         026300     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000264         026400     02  FILLER PIC X(25) VALUE "PROC-139-PFM-A-11        ".      DB1054.2
   000265         026500     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000266         026600     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000267         026700     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000268         026800     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000269         026900     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000270         027000     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000271         027100     02  FILLER PIC X(25) VALUE "PROC-139-PFM-A-11        ".      DB1054.2
   000272         027200     02  FILLER PIC X(25) VALUE "PROC-140-PFM-B-11        ".      DB1054.2
   000273         027300     02  FILLER PIC X(25) VALUE "PROC-139-PFM-C-11        ".      DB1054.2
   000274         027400     02  FILLER PIC X(25) VALUE "PROC-140-PFM-D-11        ".      DB1054.2
   000275         027500     02  FILLER PIC X(25) VALUE "PROC-139-PFM-TESTT-11    ".      DB1054.2
   000276         027600     02  FILLER PIC X(25) VALUE "PROC-140-PFM-TESTTT-11   ".      DB1054.2
   000277         027700     02  FILLER PIC X(25) VALUE "PROC-168-PFM-WRITE-11    ".      DB1054.2
   000278         027800     02  FILLER PIC X(25) VALUE "PROC-169-PFM-TEST-12     ".      DB1054.2
   000279         027900     02  FILLER PIC X(25) VALUE "PROC-170-PFM-A-12        ".      DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000280         028000     02  FILLER PIC X(25) VALUE "PROC-171-PFM-B-12        ".      DB1054.2
   000281         028100     02  FILLER PIC X(25) VALUE "PROC-172-PFM-C-12        ".      DB1054.2
   000282         028200     02  FILLER PIC X(25) VALUE "PROC-173-PFM-D-12        ".      DB1054.2
   000283         028300     02  FILLER PIC X(25) VALUE "PROC-174-PFM-E-12        ".      DB1054.2
   000284         028400     02  FILLER PIC X(25) VALUE "PROC-175-PFM-TESTT-12    ".      DB1054.2
   000285         028500     02  FILLER PIC X(25) VALUE "PROC-176-PFM-WRITE-12    ".      DB1054.2
   000286         028600     02  FILLER PIC X(25) VALUE "PROC-177-PFM-TEST-13     ".      DB1054.2
   000287         028700     02  FILLER PIC X(25) VALUE "PROC-178-PFM-A-13        ".      DB1054.2
   000288         028800     02  FILLER PIC X(25) VALUE "PROC-177-PFM-B-13        ".      DB1054.2
   000289         028900     02  FILLER PIC X(25) VALUE "PROC-178-PFM-A-13        ".      DB1054.2
   000290         029000     02  FILLER PIC X(25) VALUE "PROC-177-PFM-B-13        ".      DB1054.2
   000291         029100     02  FILLER PIC X(25) VALUE "PROC-178-PFM-A-13        ".      DB1054.2
   000292         029200     02  FILLER PIC X(25) VALUE "PROC-177-PFM-B-13        ".      DB1054.2
   000293         029300     02  FILLER PIC X(25) VALUE "PROC-178-PFM-A-13        ".      DB1054.2
   000294         029400     02  FILLER PIC X(25) VALUE "PROC-177-PFM-B-13        ".      DB1054.2
   000295         029500     02  FILLER PIC X(25) VALUE "PROC-178-PFM-TESTT-13    ".      DB1054.2
   000296         029600     02  FILLER PIC X(25) VALUE "PROC-187-PFM-WRITE-13    ".      DB1054.2
   000297         029700     02  FILLER PIC X(25) VALUE "PROC-188-PFM-TEST-14     ".      DB1054.2
   000298         029800     02  FILLER PIC X(25) VALUE "PROC-189-A101            ".      DB1054.2
   000299         029900     02  FILLER PIC X(25) VALUE "PROC-190-A102            ".      DB1054.2
   000300         030000     02  FILLER PIC X(25) VALUE "PROC-191-A103            ".      DB1054.2
   000301         030100     02  FILLER PIC X(25) VALUE "PROC-192-A104            ".      DB1054.2
   000302         030200     02  FILLER PIC X(25) VALUE "PROC-193-A105            ".      DB1054.2
   000303         030300     02  FILLER PIC X(25) VALUE "PROC-194-A106            ".      DB1054.2
   000304         030400     02  FILLER PIC X(25) VALUE "PROC-195-A107            ".      DB1054.2
   000305         030500     02  FILLER PIC X(25) VALUE "PROC-196-A108            ".      DB1054.2
   000306         030600     02  FILLER PIC X(25) VALUE "PROC-197-A109            ".      DB1054.2
   000307         030700     02  FILLER PIC X(25) VALUE "PROC-198-A110            ".      DB1054.2
   000308         030800     02  FILLER PIC X(25) VALUE "PROC-199-A111            ".      DB1054.2
   000309         030900     02  FILLER PIC X(25) VALUE "PROC-200-A112            ".      DB1054.2
   000310         031000     02  FILLER PIC X(25) VALUE "PROC-201-A113            ".      DB1054.2
   000311         031100     02  FILLER PIC X(25) VALUE "PROC-202-A114            ".      DB1054.2
   000312         031200     02  FILLER PIC X(25) VALUE "PROC-203-A115            ".      DB1054.2
   000313         031300     02  FILLER PIC X(25) VALUE "PROC-204-A116            ".      DB1054.2
   000314         031400     02  FILLER PIC X(25) VALUE "PROC-205-A117            ".      DB1054.2
   000315         031500     02  FILLER PIC X(25) VALUE "PROC-206-A118            ".      DB1054.2
   000316         031600     02  FILLER PIC X(25) VALUE "PROC-207-A119            ".      DB1054.2
   000317         031700     02  FILLER PIC X(25) VALUE "PROC-208-A120            ".      DB1054.2
   000318         031800     02  FILLER PIC X(25) VALUE "PROC-209-A121            ".      DB1054.2
   000319         031900     02  FILLER PIC X(25) VALUE "PROC-210-PFM-WRITE-14    ".      DB1054.2
   000320         032000     02  FILLER PIC X(25) VALUE "PROC-211-PFM-A-15        ".      DB1054.2
   000321         032100     02  FILLER PIC X(25) VALUE "PROC-212-PFM-TEST-15     ".      DB1054.2
   000322         032200     02  FILLER PIC X(25) VALUE "PROC-213-PFM-G-15        ".      DB1054.2
   000323         032300     02  FILLER PIC X(25) VALUE "PROC-214-PFM-H-15        ".      DB1054.2
   000324         032400     02  FILLER PIC X(25) VALUE "PROC-215-PFM-E-15        ".      DB1054.2
   000325         032500     02  FILLER PIC X(25) VALUE "PROC-216-PFM-L-15        ".      DB1054.2
   000326         032600     02  FILLER PIC X(25) VALUE "PROC-217-PFM-B-15        ".      DB1054.2
   000327         032700     02  FILLER PIC X(25) VALUE "PROC-218-PFM-WRITE-15    ".      DB1054.2
   000328         032800     02  FILLER PIC X(25) VALUE "PROC-219-PFM-TEST-LAST   ".      DB1054.2
   000329         032900     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000330         033000     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000331         033100     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000332         033200     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000333         033300     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000334         033400     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000335         033500     02  FILLER PIC X(25) VALUE "PROC-220-PFM-U           ".      DB1054.2
   000336         033600     02  FILLER PIC X(25) VALUE "PROC-227-PFM-WRITE-LAST  ".      DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000337         033700 01  STATIC-TABLE REDEFINES PROCEDURE-NAMES.                      DB1054.2 109
   000338         033800     02  EXPECTED-NAME OCCURS 227 TIMES INDEXED BY STATIC-INDEX   DB1054.2
   000339         033900         PICTURE IS X(25).                                        DB1054.2
   000340         034000 01  STACKING-AREA.                                               DB1054.2
   000341         034100     02  PROC-NAME OCCURS 500 TIMES INDEXED BY STACK-INDEX.       DB1054.2
   000342         034200         03  PROC-LOC PICTURE IS X(4).                            DB1054.2
   000343         034300         03  FILLER PICTURE IS X.                                 DB1054.2
   000344         034400         03  BASE-NUMBER PICTURE IS 999.                          DB1054.2
   000345         034500         03  FILLER PICTURE IS X.                                 DB1054.2
   000346         034600         03  BASE-NAME PICTURE IS X(16).                          DB1054.2
   000347         034700 01  TABLE-ENTRY.                                                 DB1054.2
   000348         034800     02  FILLER PICTURE IS X(5).                                  DB1054.2
   000349         034900     02  TABLE-ENTRY-BASE PICTURE IS 999.                         DB1054.2
   000350         035000     02  FILLER PICTURE IS X(17).                                 DB1054.2
   000351         035100 01  FLOW-FAILURE-1.                                              DB1054.2
   000352         035200     02  FILLER PICTURE IS X VALUE IS SPACE.                      DB1054.2 IMP
   000353         035300     02  FILLER PICTURE IS X(43) VALUE                            DB1054.2
   000354         035400         "COUNT OF LEVEL 1 NUCLEUS FLOW FAILURES WAS ".           DB1054.2
   000355         035500     02  NUC-FAILURE-COUNT PICTURE IS 999 VALUE 0.                DB1054.2
   000356         035600     02  FILLER PICTURE X VALUE ".".                              DB1054.2
   000357         035700 01  FLOW-FAILURE-2 PICTURE IS X(75) VALUE IS                     DB1054.2
   000358         035800         " A NON-ZERO COUNT WILL CAUSE FAILURES TO APPEAR IN THE ADB1054.2
   000359         035900-        "BOVE REPORT.".                                          DB1054.2
   000360         036000 01  NOTE-RECORD.                                                 DB1054.2
   000361         036100     02 A     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000362         036200     02 B     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000363         036300     02 C     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000364         036400     02 D     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000365         036500     02 E     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000366         036600     02 F     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000367         036700     02 G     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000368         036800     02 H     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000369         036900     02 I     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000370         037000     02 J     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000371         037100     02 K     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000372         037200     02 L     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000373         037300     02 M     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000374         037400     02 N     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000375         037500     02 O     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000376         037600     02 P     PICTURE X VALUE SPACE.                              DB1054.2 IMP
   000377         037700 01  GO-TABLE.                                                    DB1054.2
   000378         037800     02 GO-SCRIPT OCCURS 8 TIMES PICTURE 9.                       DB1054.2
   000379         037900 01  GO-TO-DEPEND                       PICTURE IS 9 VALUE IS 0.  DB1054.2
   000380         038000 01  GO-TO-DEEP                         PICTURE IS 9 VALUE IS 1.  DB1054.2
   000381         038100 01  PERFORM1                           PICTURE IS XXX            DB1054.2
   000382         038200     VALUE IS SPACE.                                              DB1054.2 IMP
   000383         038300 01  PERFORM2                           PICTURE IS S999           DB1054.2
   000384         038400     VALUE IS 20.                                                 DB1054.2
   000385         038500 01  PERFORM4                           PICTURE IS S99V9.         DB1054.2
   000386         038600 01  PERFORM5                           PICTURE IS 999            DB1054.2
   000387         038700     VALUE IS ZERO.                                               DB1054.2 IMP
   000388         038800 01  PERFORM-KEY                        PICTURE IS 9.             DB1054.2
   000389         038900 01  PERFORM-HOLD.                                                DB1054.2
   000390         039000     02  TEST-LETTER OCCURS 20 TIMES  PICTURE X.                  DB1054.2
   000391         039100 01  TEST-RESULTS.                                                DB1054.2
   000392         039200     02 FILLER                    PICTURE X VALUE SPACE.          DB1054.2 IMP
   000393         039300     02 FEATURE                   PICTURE X(20).                  DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000394         039400     02 FILLER                    PICTURE XX VALUE SPACE.         DB1054.2 IMP
   000395         039500     02 P-OR-F                    PICTURE X(5).                   DB1054.2
   000396         039600     02 FILLER                    PICTURE XX  VALUE SPACE.        DB1054.2 IMP
   000397         039700     02  PAR-NAME.                                                DB1054.2
   000398         039800       03 FILLER PICTURE X(12).                                   DB1054.2
   000399         039900       03  PARDOT-X PICTURE X.                                    DB1054.2
   000400         040000       03 DOTVALUE PICTURE 99.                                    DB1054.2
   000401         040100       03 FILLER PICTURE IS X(10).                                DB1054.2
   000402         040200     02 FILLER                    PICTURE X VALUE SPACE.          DB1054.2 IMP
   000403         040300     02  CORRECT-A  PICTURE IS X(25).                             DB1054.2
   000404         040400     02  CORRECT-NFIELD REDEFINES CORRECT-A.                      DB1054.2 403
   000405         040500         03  CORRECT-N  PICTURE -9(9).9(9).                       DB1054.2
   000406         040600         03  FILLER PICTURE X(5).                                 DB1054.2
   000407         040700     02 FILLER                    PICTURE XX VALUE SPACE.         DB1054.2 IMP
   000408         040800     02  COMPUTED-A PICTURE IS X(25).                             DB1054.2
   000409         040900     02  COMPUTED-NFIELD REDEFINES COMPUTED-A.                    DB1054.2 408
   000410         041000         03  COMPUTED-N PICTURE -9(9).9(9).                       DB1054.2
   000411         041100         03  FILLER PICTURE X(5).                                 DB1054.2
   000412         041200     02  RE-MARK PICTURE IS XXX.                                  DB1054.2
   000413         041300 01  COLUMNS-LINE-1.                                              DB1054.2
   000414         041400     02 PAGE-CONTROL-C PICTURE IS X VALUE IS SPACE.               DB1054.2 IMP
   000415         041500     02  FILLER PICTURE IS X(7) VALUE IS SPACE.                   DB1054.2 IMP
   000416         041600     02  FILLER PICTURE IS X(7) VALUE IS "FEATURE".               DB1054.2
   000417         041700     02  FILLER PICTURE IS X(9) VALUE IS SPACE.                   DB1054.2 IMP
   000418         041800     02  FILLER PICTURE IS X(4) VALUE IS "PASS".                  DB1054.2
   000419         041900     02  FILLER PICTURE IS X(10) VALUE IS SPACE.                  DB1054.2 IMP
   000420         042000     02  FILLER PICTURE IS X(7)  VALUE IS "PROGRAM".              DB1054.2
   000421         042100     02  FILLER PICTURE IS X(19) VALUE IS SPACE.                  DB1054.2 IMP
   000422         042200     02  FILLER PICTURE IS X(8)  VALUE IS "ADJUSTED".             DB1054.2
   000423         042300     02  FILLER PICTURE IS X(18) VALUE IS SPACE.                  DB1054.2 IMP
   000424         042400     02  FILLER PICTURE IS X(8)  VALUE IS "ADJUSTED".             DB1054.2
   000425         042500 01  COLUMNS-LINE-2.                                              DB1054.2
   000426         042600     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1054.2 IMP
   000427         042700     02  FILLER PICTURE IS X(7) VALUE IS SPACE.                   DB1054.2 IMP
   000428         042800     02  FILLER PICTURE IS X(6)  VALUE IS "TESTED".               DB1054.2
   000429         042900     02  FILLER PICTURE IS X(10) VALUE IS SPACE.                  DB1054.2 IMP
   000430         043000     02  FILLER PICTURE IS X(4)  VALUE IS "FAIL".                 DB1054.2
   000431         043100     02  FILLER PICTURE IS X(7)  VALUE IS SPACE.                  DB1054.2 IMP
   000432         043200     02  FILLER PICTURE IS X(14) VALUE IS "PROCEDURE NAME".       DB1054.2
   000433         043300     02  FILLER PICTURE IS X(12) VALUE IS SPACE.                  DB1054.2 IMP
   000434         043400     02  FILLER PICTURE IS X(14) VALUE IS "PROCEDURE NAME".       DB1054.2
   000435         043500     02  FILLER PICTURE IS X(14) VALUE IS SPACE.                  DB1054.2 IMP
   000436         043600     02  FILLER PICTURE IS X(10) VALUE IS "DEBUG-NAME".           DB1054.2
   000437         043700 01  REC-SKL-SUB PICTURE 9(2) VALUE ZERO.                         DB1054.2 IMP
   000438         043800 01  REC-CT PICTURE 99 VALUE ZERO.                                DB1054.2 IMP
   000439         043900 01  DELETE-CNT                   PICTURE 999  VALUE ZERO.        DB1054.2 IMP
   000440         044000 01  ERROR-COUNTER PICTURE IS 999 VALUE IS ZERO.                  DB1054.2 IMP
   000441         044100 01  INSPECT-COUNTER PIC 999 VALUE ZERO.                          DB1054.2 IMP
   000442         044200 01  PASS-COUNTER PIC 999 VALUE ZERO.                             DB1054.2 IMP
   000443         044300 01  TOTAL-ERROR PIC 999 VALUE ZERO.                              DB1054.2 IMP
   000444         044400 01  ERROR-HOLD PIC 999 VALUE ZERO.                               DB1054.2 IMP
   000445         044500 01  DUMMY-HOLD PIC X(120) VALUE SPACE.                           DB1054.2 IMP
   000446         044600 01  RECORD-COUNT PIC 9(5) VALUE ZERO.                            DB1054.2 IMP
   000447         044700 01  CCVS-H-1.                                                    DB1054.2
   000448         044800     02  FILLER   PICTURE X(27)  VALUE SPACE.                     DB1054.2 IMP
   000449         044900     02 FILLER PICTURE X(67) VALUE                                DB1054.2
   000450         045000     " FEDERAL COMPILER TESTING CENTER COBOL COMPILER VALIDATION  DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000451         045100-    " SYSTEM".                                                   DB1054.2
   000452         045200     02  FILLER     PICTURE X(26)  VALUE SPACE.                   DB1054.2 IMP
   000453         045300 01  CCVS-H-2.                                                    DB1054.2
   000454         045400     02 FILLER PICTURE X(52) VALUE IS                             DB1054.2
   000455         045500     "CCVS74 NCC  COPY, NOT FOR DISTRIBUTION.".                   DB1054.2
   000456         045600     02 FILLER PICTURE IS X(19) VALUE IS "TEST RESULTS SET-  ".   DB1054.2
   000457         045700     02 TEST-ID PICTURE IS X(9).                                  DB1054.2
   000458         045800     02 FILLER PICTURE IS X(40) VALUE IS SPACE.                   DB1054.2 IMP
   000459         045900 01  CCVS-H-3.                                                    DB1054.2
   000460         046000     02  FILLER PICTURE X(34) VALUE                               DB1054.2
   000461         046100     " FOR OFFICIAL USE ONLY    ".                                DB1054.2
   000462         046200     02  FILLER PICTURE X(58) VALUE                               DB1054.2
   000463         046300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".DB1054.2
   000464         046400     02  FILLER PICTURE X(28) VALUE                               DB1054.2
   000465         046500     "  COPYRIGHT   1974 ".                                       DB1054.2
   000466         046600 01  CCVS-E-1.                                                    DB1054.2
   000467         046700     02 FILLER PICTURE IS X(52) VALUE IS SPACE.                   DB1054.2 IMP
   000468         046800     02 FILLER PICTURE IS X(14) VALUE IS "END OF TEST-  ".        DB1054.2
   000469         046900     02 ID-AGAIN PICTURE IS X(9).                                 DB1054.2
   000470         047000     02 FILLER PICTURE X(45) VALUE IS                             DB1054.2
   000471         047100     " NTIS DISTRIBUTION COBOL 74".                               DB1054.2
   000472         047200 01  CCVS-E-2.                                                    DB1054.2
   000473         047300     02  FILLER                   PICTURE X(31)  VALUE            DB1054.2
   000474         047400     SPACE.                                                       DB1054.2 IMP
   000475         047500     02  FILLER                   PICTURE X(21)  VALUE SPACE.     DB1054.2 IMP
   000476         047600     02 CCVS-E-2-2.                                               DB1054.2
   000477         047700         03 ERROR-TOTAL PICTURE IS XXX VALUE IS SPACE.            DB1054.2 IMP
   000478         047800         03 FILLER PICTURE IS X VALUE IS SPACE.                   DB1054.2 IMP
   000479         047900         03 ENDER-DESC PIC X(44) VALUE "ERRORS ENCOUNTERED".      DB1054.2
   000480         048000 01  CCVS-E-3.                                                    DB1054.2
   000481         048100     02  FILLER PICTURE X(22) VALUE                               DB1054.2
   000482         048200     " FOR OFFICIAL USE ONLY".                                    DB1054.2
   000483         048300     02  FILLER PICTURE X(12) VALUE SPACE.                        DB1054.2 IMP
   000484         048400     02  FILLER PICTURE X(58) VALUE                               DB1054.2
   000485         048500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".DB1054.2
   000486         048600     02  FILLER PICTURE X(13) VALUE SPACE.                        DB1054.2 IMP
   000487         048700     02 FILLER PIC X(15) VALUE " COPYRIGHT 1974".                 DB1054.2
   000488         048800 01  CCVS-E-4.                                                    DB1054.2
   000489         048900     02 CCVS-E-4-1 PIC XXX VALUE SPACE.                           DB1054.2 IMP
   000490         049000     02 FILLER PIC XXXX VALUE " OF ".                             DB1054.2
   000491         049100     02 CCVS-E-4-2 PIC XXX VALUE SPACE.                           DB1054.2 IMP
   000492         049200     02 FILLER PIC X(40) VALUE                                    DB1054.2
   000493         049300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       DB1054.2
   000494         049400 01  XXINFO.                                                      DB1054.2
   000495         049500     02 FILLER PIC X(30) VALUE "        *** INFORMATION  ***".    DB1054.2
   000496         049600     02 INFO-TEXT.                                                DB1054.2
   000497         049700     04 FILLER PIC X(20) VALUE SPACE.                             DB1054.2 IMP
   000498         049800     04 XXCOMPUTED PIC X(20).                                     DB1054.2
   000499         049900     04 FILLER PIC X(5) VALUE SPACE.                              DB1054.2 IMP
   000500         050000     04 XXCORRECT PIC X(20).                                      DB1054.2
   000501         050100 01  HYPHEN-LINE.                                                 DB1054.2
   000502         050200     02 FILLER PICTURE IS X VALUE IS SPACE.                       DB1054.2 IMP
   000503         050300     02 FILLER PICTURE IS X(65) VALUE IS "************************DB1054.2
   000504         050400-    "*****************************************".                 DB1054.2
   000505         050500     02 FILLER PICTURE IS X(54) VALUE IS "************************DB1054.2
   000506         050600-    "******************************".                            DB1054.2
   000507         050700 01  CCVS-PGM-ID PIC X(6) VALUE                                   DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000508         050800     "DB105A".                                                    DB1054.2
   000509         050900 PROCEDURE DIVISION.                                              DB1054.2
   000510         051000 DECLARATIVES.                                                    DB1054.2
   000511         051100 DEBUG-ALL-PROCS SECTION.                                         DB1054.2
   000512         051200     USE FOR DEBUGGING ON ALL PROCEDURES.                         DB1054.2
   000513         051300 DEBUG-ALL-0.                                                     DB1054.2
   000514         051400     MOVE 0 TO PROC-ACTIVE.                                       DB1054.2 108
   000515         051500     IF BYPASS IS EQUAL TO 1 GO TO DEBUG-ALL-EXIT.                DB1054.2 105 526
   000516         051600     MOVE DEBUG-NAME TO PROC-NAME (STACK-INDEX).                  DB1054.2 IMP 341 341
   000517         051700     IF PROC-LOC (STACK-INDEX) IS EQUAL TO "PROC"                 DB1054.2 342 341
   000518      1  051800             INSPECT PROC-NAME (STACK-INDEX)                      DB1054.2 341 341
   000519      1  051900             REPLACING CHARACTERS BY " " AFTER INITIAL " ".       DB1054.2
   000520         052000     IF BASE-NUMBER (STACK-INDEX) IS NUMERIC                      DB1054.2 344 341
   000521      1  052100             ADD INCREMENT TO BASE-NUMBER (STACK-INDEX).          DB1054.2 107 344 341
   000522         052200     IF STACK-INDEX IS EQUAL TO 500                               DB1054.2 341
   000523      1  052300             MOVE 1 TO BYPASS                                     DB1054.2 105
   000524      1  052400             GO TO DEBUG-ALL-EXIT.                                DB1054.2 526
   000525         052500     SET STACK-INDEX UP BY 1.                                     DB1054.2 341
   000526         052600 DEBUG-ALL-EXIT.                                                  DB1054.2
   000527         052700     EXIT.                                                        DB1054.2
   000528         052800 END DECLARATIVES.                                                DB1054.2
   000529         052900 CCVS1 SECTION.                                                   DB1054.2
   000530         053000 OPEN-FILES.                                                      DB1054.2
   000531         053100     OPEN     OUTPUT PRINT-FILE.                                  DB1054.2 91
   000532         053200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   DB1054.2 507 457 507 469
   000533         053300     MOVE    SPACE TO TEST-RESULTS.                               DB1054.2 IMP 391
   000534         053400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             DB1054.2 556 560
   000535         053500     GO TO CCVS1-EXIT.                                            DB1054.2 615
   000536         053600 CLOSE-FILES.                                                     DB1054.2
   000537         053700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   DB1054.2 565 586 91
   000538         053800 TERMINATE-CCVS.                                                  DB1054.2
   000539         053900     EXIT PROGRAM.                                                DB1054.2
   000540         054000 TERMINATE-CALL.                                                  DB1054.2
   000541         054100     STOP     RUN.                                                DB1054.2
   000542         054200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         DB1054.2 395 441
   000543         054300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           DB1054.2 395 442
   000544         054400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          DB1054.2 395 440
   000545         054500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-CNT.          DB1054.2 395 439
   000546         054600     MOVE "****TEST DELETED****" TO RE-MARK.                      DB1054.2 412
   000547         054700 PRINT-DETAIL.                                                    DB1054.2
   000548         054800     IF REC-CT NOT EQUAL TO ZERO                                  DB1054.2 438 IMP
   000549      1  054900             MOVE "." TO PARDOT-X                                 DB1054.2 399
   000550      1  055000             MOVE REC-CT TO DOTVALUE.                             DB1054.2 438 400
   000551         055100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      DB1054.2 391 95 598
   000552         055200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-A.              DB1054.2 IMP 395 IMP 408
   000553         055300     MOVE SPACE TO CORRECT-A.                                     DB1054.2 IMP 403
   000554         055400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         DB1054.2 438 IMP IMP 397
   000555         055500     MOVE     SPACE TO RE-MARK.                                   DB1054.2 IMP 412
   000556         055600 HEAD-ROUTINE.                                                    DB1054.2
   000557         055700     MOVE CCVS-H-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1054.2 447 96 598
   000558         055800     MOVE CCVS-H-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.   DB1054.2 453 96 598
   000559         055900     MOVE CCVS-H-3 TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.   DB1054.2 459 96 598
   000560         056000 COLUMN-NAMES-ROUTINE.                                            DB1054.2
   000561         056100     MOVE COLUMNS-LINE-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.     DB1054.2 413 96 598
   000562         056200     MOVE COLUMNS-LINE-2 TO DUMMY-RECORD.                         DB1054.2 425 96
   000563         056300     PERFORM WRITE-LINE 2 TIMES.                                  DB1054.2 598
   000564         056400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        DB1054.2 501 96 598
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000565         056500 END-ROUTINE.                                                     DB1054.2
   000566         056600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.DB1054.2 501 96 598
   000567         056700 END-RTN-EXIT.                                                    DB1054.2
   000568         056800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   DB1054.2 466 96 598
   000569         056900 END-ROUTINE-1.                                                   DB1054.2
   000570         057000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      DB1054.2 440 444 441
   000571         057100      ERROR-HOLD. ADD DELETE-CNT TO ERROR-HOLD.                   DB1054.2 444 439 444
   000572         057200      ADD PASS-COUNTER TO ERROR-HOLD.                             DB1054.2 442 444
   000573         057300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   DB1054.2
   000574         057400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            DB1054.2 442 489
   000575         057500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              DB1054.2 444 491
   000576         057600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                DB1054.2 488 476
   000577         057700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           DB1054.2 472 96 598
   000578         057800  END-ROUTINE-12.                                                 DB1054.2
   000579         057900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        DB1054.2 479
   000580         058000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      DB1054.2 440 IMP
   000581      1  058100         MOVE "NO " TO ERROR-TOTAL                                DB1054.2 477
   000582         058200         ELSE                                                     DB1054.2
   000583      1  058300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       DB1054.2 440 477
   000584         058400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           DB1054.2 472 96
   000585         058500     PERFORM WRITE-LINE.                                          DB1054.2 598
   000586         058600 END-ROUTINE-13.                                                  DB1054.2
   000587         058700     IF DELETE-CNT IS EQUAL TO ZERO                               DB1054.2 439 IMP
   000588      1  058800         MOVE "NO " TO ERROR-TOTAL  ELSE                          DB1054.2 477
   000589      1  058900         MOVE DELETE-CNT TO ERROR-TOTAL.                          DB1054.2 439 477
   000590         059000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   DB1054.2 479
   000591         059100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1054.2 472 96 598
   000592         059200      IF   INSPECT-COUNTER EQUAL TO ZERO                          DB1054.2 441 IMP
   000593      1  059300          MOVE "NO " TO ERROR-TOTAL                               DB1054.2 477
   000594      1  059400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   DB1054.2 441 477
   000595         059500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            DB1054.2 479
   000596         059600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          DB1054.2 472 96 598
   000597         059700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           DB1054.2 480 96 598
   000598         059800 WRITE-LINE.                                                      DB1054.2
   000599         059900     ADD 1 TO RECORD-COUNT.                                       DB1054.2 446
   000600         060000     IF RECORD-COUNT GREATER 50                                   DB1054.2 446
   000601      1  060100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          DB1054.2 96 445
   000602      1  060200         MOVE SPACE TO DUMMY-RECORD                               DB1054.2 IMP 96
   000603      1  060300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  DB1054.2 96
   000604      1  060400         MOVE COLUMNS-LINE-1 TO DUMMY-RECORD PERFORM WRT-LN       DB1054.2 413 96 611
   000605      1  060500         MOVE COLUMNS-LINE-2 TO DUMMY-RECORD PERFORM WRT-LN       DB1054.2 425 96 611
   000606      1  060600             2 TIMES                                              DB1054.2
   000607      1  060700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          DB1054.2 501 96 611
   000608      1  060800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          DB1054.2 445 96
   000609      1  060900         MOVE ZERO TO RECORD-COUNT.                               DB1054.2 IMP 446
   000610         061000     PERFORM   WRT-LN.                                            DB1054.2 611
   000611         061100 WRT-LN.                                                          DB1054.2
   000612         061200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               DB1054.2 96
   000613         061300     MOVE SPACE TO DUMMY-RECORD.                                  DB1054.2 IMP 96
   000614         061400*                                                                 DB1054.2
   000615         061500 CCVS1-EXIT.                                                      DB1054.2
   000616         061600     EXIT.                                                        DB1054.2
   000617         061700 INITIALIZE-PROC-NAME-STACK.                                      DB1054.2
   000618         061800     MOVE 0 TO BYPASS.                                            DB1054.2 105
   000619         061900     SET STACK-INDEX TO 1.                                        DB1054.2 341
   000620         062000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000621         062100 PROC-001-BEGIN-TESTS SECTION.                                    DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000622         062200 PROC-002-GO--TEST-1.                                             DB1054.2
   000623         062300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000624         062400     GO TO    PROC-003-GO--WRITE-1.                               DB1054.2 629
   000625         062500 PROC-000-GO--DELETE-1.                                           DB1054.2
   000626         062600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000627         062700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000628         062800     GO TO    PROC-003-GO--WRITE-1.                               DB1054.2 629
   000629         062900 PROC-003-GO--WRITE-1.                                            DB1054.2
   000630         063000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000631         063100     MOVE "GO TO " TO FEATURE.                                    DB1054.2 393
   000632         063200     MOVE "PROC-002-GO--TEST-1" TO PAR-NAME.                      DB1054.2 397
   000633         063300 PROC-004-GO--INIT-2.                                             DB1054.2
   000634         063400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000635         063500     MOVE "PROC-005-GO--TEST-2" TO PAR-NAME.                      DB1054.2 397
   000636         063600     MOVE     SPACE TO P-OR-F.                                    DB1054.2 IMP 395
   000637         063700     MOVE "GO TO DEPENDING" TO FEATURE.                           DB1054.2 393
   000638         063800 PROC-005-GO--TEST-2.                                             DB1054.2
   000639         063900     ADD 1 TO INCREMENT.                                          DB1054.2 107
   000640         064000     MOVE     SPACE TO FEATURE.                                   DB1054.2 IMP 393
   000641         064100     GO TO    PROC-005-GO--B                                      DB1054.2 661
   000642         064200              PROC-005-GO--D                                      DB1054.2 679
   000643         064300              PROC-005-GO--C DEPENDING ON GO-TO-DEPEND.           DB1054.2 670 379
   000644         064400     GO TO    PROC-005-GO--A.                                     DB1054.2 650
   000645         064500 PROC-000-GO--DELETE-2.                                           DB1054.2
   000646         064600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000647         064700     MOVE "PROC-005-GO--TEST-2" TO PAR-NAME.                      DB1054.2 397
   000648         064800     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000649         064900     GO TO    PROC-016-GO--WRITE-2.                               DB1054.2 694
   000650         065000 PROC-005-GO--A.                                                  DB1054.2
   000651         065100     ADD 1 TO INCREMENT.                                          DB1054.2 107
   000652         065200     MOVE "PROC-005-GO--A" TO PAR-NAME.                           DB1054.2 397
   000653         065300     IF       GO-TO-DEPEND EQUAL TO 0                             DB1054.2 379
   000654      1  065400              ADD 1 TO GO-TO-DEPEND                               DB1054.2 379
   000655      1  065500              GO TO PROC-005-GO--TEST-2.                          DB1054.2 638
   000656         065600     IF       GO-TO-DEPEND GREATER THAN 3                         DB1054.2 379
   000657      1  065700              GO TO PROC-005-GO--E.                               DB1054.2 688
   000658         065800     PERFORM  PROC-000-NUCLEUS-FAILURE                            DB1054.2 1284
   000659         065900              MOVE 1 TO GO-TO-DEPEND                              DB1054.2 379
   000660         066000              GO TO PROC-005-GO--TEST-2.                          DB1054.2 638
   000661         066100 PROC-005-GO--B.                                                  DB1054.2
   000662         066200     ADD 1 TO INCREMENT.                                          DB1054.2 107
   000663         066300     MOVE "PROC-005-GO--B" TO PAR-NAME.                           DB1054.2 397
   000664         066400     IF       GO-TO-DEPEND NOT EQUAL TO 1                         DB1054.2 379
   000665      1  066500              PERFORM PROC-000-NUCLEUS-FAILURE                    DB1054.2 1284
   000666      1  066600              MOVE 3 TO GO-TO-DEPEND                              DB1054.2 379
   000667      1  066700              GO TO PROC-005-GO--TEST-2.                          DB1054.2 638
   000668         066800     ADD      2 TO GO-TO-DEPEND.                                  DB1054.2 379
   000669         066900     GO TO    PROC-005-GO--TEST-2.                                DB1054.2 638
   000670         067000 PROC-005-GO--C.                                                  DB1054.2
   000671         067100     ADD 1 TO INCREMENT.                                          DB1054.2 107
   000672         067200     MOVE "PROC-005-GO--C" TO PAR-NAME.                           DB1054.2 397
   000673         067300     IF       GO-TO-DEPEND NOT EQUAL TO 3                         DB1054.2 379
   000674      1  067400              PERFORM PROC-000-NUCLEUS-FAILURE                    DB1054.2 1284
   000675      1  067500              MOVE 2 TO GO-TO-DEPEND                              DB1054.2 379
   000676      1  067600              GO TO PROC-005-GO--TEST-2.                          DB1054.2 638
   000677         067700     SUBTRACT 1 FROM GO-TO-DEPEND.                                DB1054.2 379
   000678         067800     GO TO    PROC-005-GO--TEST-2.                                DB1054.2 638
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000679         067900 PROC-005-GO--D.                                                  DB1054.2
   000680         068000     ADD 1 TO INCREMENT.                                          DB1054.2 107
   000681         068100     MOVE "PROC-005-GO--D" TO PAR-NAME.                           DB1054.2 397
   000682         068200     IF       GO-TO-DEPEND NOT EQUAL TO 2                         DB1054.2 379
   000683      1  068300              PERFORM PROC-000-NUCLEUS-FAILURE                    DB1054.2 1284
   000684      1  068400              MOVE 4 TO GO-TO-DEPEND                              DB1054.2 379
   000685      1  068500              GO TO PROC-005-GO--TEST-2.                          DB1054.2 638
   000686         068600     ADD      2 TO GO-TO-DEPEND.                                  DB1054.2 379
   000687         068700     GO TO    PROC-005-GO--TEST-2.                                DB1054.2 638
   000688         068800 PROC-005-GO--E.                                                  DB1054.2
   000689         068900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000690         069000     MOVE "PROC-005-GO--E" TO PAR-NAME.                           DB1054.2 397
   000691         069100     IF       GO-TO-DEPEND EQUAL TO 4                             DB1054.2 379
   000692      1  069200              GO TO PROC-016-GO--WRITE-2.                         DB1054.2 694
   000693         069300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000694         069400 PROC-016-GO--WRITE-2.                                            DB1054.2
   000695         069500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000696         069600     ADD 1 TO REC-CT.                                             DB1054.2 438
   000697         069700 PROC-017-GO--TEST-3.                                             DB1054.2
   000698         069800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000699         069900     GO TO    PROC-018-GO--PASS-3.                                DB1054.2 708
   000700         070000 PROC-000-GO--TEST-3A.                                            DB1054.2
   000701         070100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000702         070200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000703         070300     GO TO    PROC-019-GO--WRITE-3.                               DB1054.2 709
   000704         070400 PROC-000-GO--DELETE-3.                                           DB1054.2
   000705         070500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000706         070600     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000707         070700     GO TO    PROC-019-GO--WRITE-3.                               DB1054.2 709
   000708         070800 PROC-018-GO--PASS-3   SECTION.                                   DB1054.2
   000709         070900 PROC-019-GO--WRITE-3.                                            DB1054.2
   000710         071000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000711         071100     MOVE "GO TO" TO FEATURE.                                     DB1054.2 393
   000712         071200     MOVE "PROC-017-GO--TEST-3" TO PAR-NAME.                      DB1054.2 397
   000713         071300 PROC-020-GO--TEST-4.                                             DB1054.2
   000714         071400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000715         071500     GO TO    PROC-021-GO--PASS-4                                 DB1054.2 723
   000716         071600              PROC-000-GO--NUC-FAIL-4 DEPENDING ON GO-TO-DEEP.    DB1054.2 728 380
   000717         071700*    NOTE THAT PROC-021-GO--PASS-4 IS A SECTION-NAME.             DB1054.2
   000718         071800     GO TO    PROC-000-GO--NUC-FAIL-4.                            DB1054.2 728
   000719         071900 PROC-000-GO--DELETE-4.                                           DB1054.2
   000720         072000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000721         072100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000722         072200     GO TO    PROC-023-GO--WRITE-4.                               DB1054.2 733
   000723         072300 PROC-021-GO--PASS-4   SECTION.                                   DB1054.2
   000724         072400 PROC-022-GO--PAS-4.                                              DB1054.2
   000725         072500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000726         072600     IF       GO-TO-DEEP EQUAL TO 1                               DB1054.2 380
   000727      1  072700              GO TO PROC-023-GO--WRITE-4.                         DB1054.2 733
   000728         072800 PROC-000-GO--NUC-FAIL-4.                                         DB1054.2
   000729         072900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000730         073000     MOVE     GO-TO-DEEP TO COMPUTED-N.                           DB1054.2 380 410
   000731         073100     MOVE     1 TO CORRECT-N.                                     DB1054.2 405
   000732         073200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000733         073300 PROC-023-GO--WRITE-4.                                            DB1054.2
   000734         073400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000735         073500     MOVE "GO TO DEPENDING" TO FEATURE.                           DB1054.2 393
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000736         073600     MOVE "PROC-020-GO--TEST-4" TO PAR-NAME.                      DB1054.2 397
   000737         073700 PROC-024-ALTER-INIT.                                             DB1054.2
   000738         073800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000739         073900     MOVE "ALTER" TO FEATURE.                                     DB1054.2 393
   000740         074000 PROC-025-ALTER-TEST-1.                                           DB1054.2
   000741         074100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000742         074200     ALTER    PROC-026-ALTER-A TO PROCEED TO PROC-027-ALTER-C.    DB1054.2 749 755
   000743         074300     MOVE 1 TO INCREMENT.                                         DB1054.2 107
   000744         074400     GO TO    PROC-026-ALTER-A.                                   DB1054.2 749
   000745         074500 PROC-000-ALTER-DELETE-1.                                         DB1054.2
   000746         074600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000747         074700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000748         074800     GO TO    PROC-028-ALTER-WRITE-1.                             DB1054.2 757
   000749         074900 PROC-026-ALTER-A.                                                DB1054.2
   000750         075000     GO TO    PROC-000-ALTER-B.                                   DB1054.2 751
   000751         075100 PROC-000-ALTER-B.                                                DB1054.2
   000752         075200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000753         075300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000754         075400     GO TO    PROC-028-ALTER-WRITE-1.                             DB1054.2 757
   000755         075500 PROC-027-ALTER-C.                                                DB1054.2
   000756         075600     ADD 0 TO INCREMENT.                                          DB1054.2 107
   000757         075700 PROC-028-ALTER-WRITE-1.                                          DB1054.2
   000758         075800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000759         075900     MOVE "PROC-025-ALTER-TEST-1" TO PAR-NAME.                    DB1054.2 397
   000760         076000 PROC-030-ALTER-TEST-3.                                           DB1054.2
   000761         076100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000762         076200     ALTER    PROC-031-ALTER-G TO PROCEED TO PROC-032-ALTER-I.    DB1054.2 769 775
   000763         076300     MOVE 1 TO INCREMENT.                                         DB1054.2 107
   000764         076400     GO TO    PROC-031-ALTER-G.                                   DB1054.2 769
   000765         076500 PROC-000-ALTER-DELETE-3.                                         DB1054.2
   000766         076600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000767         076700     PERFORM PROC-000-NUCLEUS-FAILURE.                            DB1054.2 1284
   000768         076800     GO TO    PROC-032-ALTER-WRITE-3.                             DB1054.2 784
   000769         076900 PROC-031-ALTER-G.                                                DB1054.2
   000770         077000     GO TO    PROC-000-ALTER-H.                                   DB1054.2 771
   000771         077100 PROC-000-ALTER-H.                                                DB1054.2
   000772         077200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000773         077300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000774         077400     GO TO    PROC-032-ALTER-WRITE-3.                             DB1054.2 784
   000775         077500 PROC-032-ALTER-I.                                                DB1054.2
   000776         077600     MOVE 3 TO INCREMENT.                                         DB1054.2 107
   000777         077700     ADD      1 TO ALTERLOOP.                                     DB1054.2 103
   000778         077800     IF       ALTERLOOP GREATER THAN 1                            DB1054.2 103
   000779      1  077900              PERFORM PROC-000-NUCLEUS-FAILURE                    DB1054.2 1284
   000780      1  078000              GO TO PROC-032-ALTER-WRITE-3.                       DB1054.2 784
   000781         078100     ALTER    PROC-031-ALTER-G TO  PROC-032-ALTER-WRITE-3.        DB1054.2 769 784
   000782         078200     MOVE 4 TO INCREMENT.                                         DB1054.2 107
   000783         078300     GO TO    PROC-031-ALTER-G.                                   DB1054.2 769
   000784         078400 PROC-032-ALTER-WRITE-3.                                          DB1054.2
   000785         078500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000786         078600     MOVE "PROC-030-ALTER-TEST-3" TO PAR-NAME.                    DB1054.2 397
   000787         078700 PROC-037-EXIT-TEST-1.                                            DB1054.2
   000788         078800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000789         078900     GO TO    PROC-038-EXIT-CHECK-1.                              DB1054.2 794
   000790         079000 PROC-000-EXIT-DELETE-1.                                          DB1054.2
   000791         079100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000792         079200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000793         079300     GO TO    PROC-039-EXIT-WRITE-1.                              DB1054.2 796
   000794         079400 PROC-038-EXIT-CHECK-1.                                           DB1054.2
   000795         079500     EXIT.                                                        DB1054.2
   000796         079600 PROC-039-EXIT-WRITE-1.                                           DB1054.2
   000797         079700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000798         079800     MOVE "EXIT" TO FEATURE.                                      DB1054.2 393
   000799         079900     MOVE "PROC-037-EXIT-TEST-1" TO PAR-NAME.                     DB1054.2 397
   000800         080000 PROC-040-PFM-TEST-1.                                             DB1054.2
   000801         080100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000802         080200     MOVE     1 TO PERFORM-KEY.                                   DB1054.2 388
   000803         080300     PERFORM  PROC-041-PFM-A.                                     DB1054.2 824
   000804         080400     IF       PERFORM1 EQUAL TO "ABC"                             DB1054.2 381
   000805      1  080500              NEXT SENTENCE                                       DB1054.2
   000806         080600              ELSE                                                DB1054.2
   000807      1  080700              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   000808         080800     GO TO    PROC-042-PFM-WRITE-1.                               DB1054.2 812
   000809         080900 PROC-000-PFM-DELETE-1.                                           DB1054.2
   000810         081000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000811         081100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000812         081200 PROC-042-PFM-WRITE-1.                                            DB1054.2
   000813         081300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000814         081400     MOVE "PERFORM" TO FEATURE.                                   DB1054.2 393
   000815         081500     MOVE "PFM-TEST-1" TO PAR-NAME.                               DB1054.2 397
   000816         081600 PROC-043-PFM-TEST-2.                                             DB1054.2
   000817         081700     MOVE 3 TO INCREMENT.                                         DB1054.2 107
   000818         081800     MOVE     2 TO PERFORM-KEY.                                   DB1054.2 388
   000819         081900     GO TO    PROC-041-PFM-A.                                     DB1054.2 824
   000820         082000 PROC-000-PFM-DELETE-2.                                           DB1054.2
   000821         082100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000822         082200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000823         082300     GO TO    PROC-046-PFM-WRITE-2.                               DB1054.2 839
   000824         082400 PROC-041-PFM-A.                                                  DB1054.2
   000825         082500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000826         082600     IF       PERFORM-KEY EQUAL TO 1                              DB1054.2 388
   000827      1  082700              MOVE "ABC" TO PERFORM1                              DB1054.2 381
   000828         082800              ELSE                                                DB1054.2
   000829      1  082900              MOVE "XYZ" TO PERFORM1.                             DB1054.2 381
   000830         083000 PROC-045-PFM-B.                                                  DB1054.2
   000831         083100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000832         083200     IF       PERFORM-KEY EQUAL TO 1                              DB1054.2 388
   000833      1  083300              PERFORM PROC-000-NUCLEUS-FAILURE                    DB1054.2 1284
   000834      1  083400              GO TO PROC-043-PFM-TEST-2.                          DB1054.2 816
   000835         083500     IF       PERFORM1 EQUAL TO "XYZ"                             DB1054.2 381
   000836      1  083600              NEXT SENTENCE                                       DB1054.2
   000837         083700              ELSE                                                DB1054.2
   000838      1  083800              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   000839         083900 PROC-046-PFM-WRITE-2.                                            DB1054.2
   000840         084000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000841         084100     MOVE "PERFORM" TO FEATURE.                                   DB1054.2 393
   000842         084200     MOVE "PROC-043-PFM-TEST-2" TO PAR-NAME.                      DB1054.2 397
   000843         084300 PROC-047-PFM-TEST-3.                                             DB1054.2
   000844         084400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000845         084500     PERFORM  PROC-048-PFM-C 3 TIMES.                             DB1054.2 1368
   000846         084600     PERFORM  PROC-048-PFM-C THREE TIMES.                         DB1054.2 1368 101
   000847         084700     IF       PERFORM2 EQUAL TO 56                                DB1054.2 383
   000848      1  084800              NEXT SENTENCE                                       DB1054.2
   000849         084900              ELSE                                                DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000850      1  085000              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   000851         085100     GO TO    PROC-048-PFM-WRITE-3.                               DB1054.2 855
   000852         085200 PROC-000-PFM-DELETE-3.                                           DB1054.2
   000853         085300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000854         085400     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000855         085500 PROC-048-PFM-WRITE-3.                                            DB1054.2
   000856         085600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000857         085700     MOVE "PERFORM TIMES" TO FEATURE.                             DB1054.2 393
   000858         085800     MOVE "PROC-047-PFM-TEST-3" TO PAR-NAME.                      DB1054.2 397
   000859         085900 PROC-055-PFM-TEST-4.                                             DB1054.2
   000860         086000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000861         086100     PERFORM  PROC-056-PFM-E THRU PROC-059-PFM-H.                 DB1054.2 1377 1389
   000862         086200     IF       PERFORM4 EQUAL TO 70.0                              DB1054.2 385
   000863      1  086300              NEXT SENTENCE                                       DB1054.2
   000864         086400              ELSE                                                DB1054.2
   000865      1  086500              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   000866         086600     GO TO    PROC-060-PFM-WRITE-4.                               DB1054.2 870
   000867         086700 PROC-000-PFM-DELETE-4.                                           DB1054.2
   000868         086800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000869         086900     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000870         087000 PROC-060-PFM-WRITE-4.                                            DB1054.2
   000871         087100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000872         087200     MOVE "NESTED PERFORM THRU" TO FEATURE.                       DB1054.2 393
   000873         087300     MOVE "PROC-055-PFM-TEST-4" TO PAR-NAME.                      DB1054.2 397
   000874         087400 PROC-061-PFM-TEST-5.                                             DB1054.2
   000875         087500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000876         087600     PERFORM  PROC-062-PFM-J.                                     DB1054.2 1397
   000877         087700     IF       PERFORM2 EQUAL TO 312                               DB1054.2 383
   000878      1  087800              NEXT SENTENCE                                       DB1054.2
   000879         087900              ELSE                                                DB1054.2
   000880      1  088000              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   000881         088100     GO TO    PROC-064-PFM-WRITE-5.                               DB1054.2 885
   000882         088200 PROC-000-PFM-DELETE-5.                                           DB1054.2
   000883         088300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000884         088400     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000885         088500 PROC-064-PFM-WRITE-5.                                            DB1054.2
   000886         088600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000887         088700     MOVE "NESTED PERFORM" TO FEATURE.                            DB1054.2 393
   000888         088800     MOVE "PROC-061-PFM-TEST-5" TO PAR-NAME.                      DB1054.2 397
   000889         088900 PROC-065-PFM-TEST-6.                                             DB1054.2
   000890         089000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000891         089100     PERFORM  PROC-066-PFM-N.                                     DB1054.2 1418
   000892         089200     GO TO    PROC-069-PFM-WRITE-6.                               DB1054.2 896
   000893         089300 PROC-000-PFM-DELETE-6.                                           DB1054.2
   000894         089400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000895         089500     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000896         089600 PROC-069-PFM-WRITE-6.                                            DB1054.2
   000897         089700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000898         089800     MOVE "PERFORM SECTION-NAME" TO FEATURE.                      DB1054.2 393
   000899         089900     MOVE "PROC-065-PFM-TEST-6" TO PAR-NAME.                      DB1054.2 397
   000900         090000 PROC-070-PFM-TEST-7.                                             DB1054.2
   000901         090100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000902         090200     PERFORM  PROC-071-PFM-V THRU PROC-075-PFM-Z 5 TIMES.         DB1054.2 1445 1449
   000903         090300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000904         090400     GO       TO PROC-096-PFM-WRITE-7.                            DB1054.2 908
   000905         090500 PROC-000-PFM-DELETE-7.                                           DB1054.2
   000906         090600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000907         090700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000908         090800 PROC-096-PFM-WRITE-7.                                            DB1054.2
   000909         090900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000910         091000     MOVE     "PERFORM EXIT PARAS" TO FEATURE.                    DB1054.2 393
   000911         091100     MOVE "PROC-070-PFM-TEST-7" TO PAR-NAME.                      DB1054.2 397
   000912         091200 PROC-097-PFM-TEST-08.                                            DB1054.2
   000913         091300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000914         091400     MOVE     ZERO TO P-COUNT                                     DB1054.2 IMP 100
   000915         091500     PERFORM  PROC-098-PFM-B-8.                                   DB1054.2 920
   000916         091600     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000917         091700     PERFORM PROC-097-PFM-A-8.                                    DB1054.2 919
   000918         091800     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000919         091900 PROC-097-PFM-A-8   SECTION.                                      DB1054.2
   000920         092000 PROC-098-PFM-B-8.                                                DB1054.2
   000921         092100     ADD 2 TO INCREMENT.                                          DB1054.2 107
   000922         092200     ADD      100 TO P-COUNT.                                     DB1054.2 100
   000923         092300 PROC-097-PFM-TESTT-8 SECTION.                                    DB1054.2
   000924         092400 PROC-098-PFM-TESTTT-8.                                           DB1054.2
   000925         092500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000926         092600     IF       P-COUNT EQUAL TO 000302                             DB1054.2 100
   000927      1  092700              GO TO PROC-105-PFM-WRITE-08.                        DB1054.2 938
   000928         092800     GO       TO PROC-000-PFM-NUC-FAIL-08.                        DB1054.2 933
   000929         092900 PROC-000-DELETE-08.                                              DB1054.2
   000930         093000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000931         093100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000932         093200     GO       TO PROC-105-PFM-WRITE-08.                           DB1054.2 938
   000933         093300 PROC-000-PFM-NUC-FAIL-08.                                        DB1054.2
   000934         093400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000935         093500     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   000936         093600     MOVE     000302 TO CORRECT-N.                                DB1054.2 405
   000937         093700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000938         093800 PROC-105-PFM-WRITE-08.                                           DB1054.2
   000939         093900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000940         094000     MOVE "PERFORM             " TO FEATURE.                      DB1054.2 393
   000941         094100     MOVE     "PROC-097-PFM-TEST-08" TO PAR-NAME.                 DB1054.2 397
   000942         094200 PROC-106-PFM-TEST-09.                                            DB1054.2
   000943         094300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000944         094400     MOVE     ZERO TO P-COUNT.                                    DB1054.2 IMP 100
   000945         094500     PERFORM PROC-107-PFM-B-9   1 TIMES.                          DB1054.2 950
   000946         094600     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000947         094700     PERFORM  PROC-106-PFM-A-9   ATWO-DS-01V00 TIMES.             DB1054.2 949 98
   000948         094800     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000949         094900 PROC-106-PFM-A-9   SECTION.                                      DB1054.2
   000950         095000 PROC-107-PFM-B-9.                                                DB1054.2
   000951         095100     ADD 2 TO INCREMENT.                                          DB1054.2 107
   000952         095200     ADD      100 TO P-COUNT.                                     DB1054.2 100
   000953         095300 PROC-106-PFM-TESTT-9 SECTION.                                    DB1054.2
   000954         095400 PROC-107-PFM-TESTTT-9.                                           DB1054.2
   000955         095500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000956         095600     IF       P-COUNT EQUAL TO 000402                             DB1054.2 100
   000957      1  095700              GO TO PROC-116-PFM-WRITE-09.                        DB1054.2 968
   000958         095800     GO       TO PROC-000-PFM-NUC-FAIL-09.                        DB1054.2 963
   000959         095900 PROC-000-PFM-DELETE-09.                                          DB1054.2
   000960         096000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000961         096100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000962         096200     GO       TO PROC-116-PFM-WRITE-09.                           DB1054.2 968
   000963         096300 PROC-000-PFM-NUC-FAIL-09.                                        DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000964         096400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000965         096500     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   000966         096600     MOVE     000502 TO CORRECT-N.                                DB1054.2 405
   000967         096700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   000968         096800 PROC-116-PFM-WRITE-09.                                           DB1054.2
   000969         096900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000970         097000     MOVE "PERFORM TIMES       " TO FEATURE.                      DB1054.2 393
   000971         097100     MOVE     "PROC-106-PFM-TEST-09" TO PAR-NAME.                 DB1054.2 397
   000972         097200 PROC-117-PFM-TEST-10.                                            DB1054.2
   000973         097300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000974         097400     MOVE     ZERO TO P-COUNT.                                    DB1054.2 IMP 100
   000975         097500     PERFORM  PROC-118-PFM-B-10 THROUGH PROC-120-PFM-D-10.        DB1054.2 988 991
   000976         097600     MOVE 4 TO INCREMENT.                                         DB1054.2 107
   000977         097700     ADD      1 TO P-COUNT                                        DB1054.2 100
   000978         097800     PERFORM  PROC-117-PFM-A-10 THRU PROC-119-PFM-C-10.           DB1054.2 987 990
   000979         097900     MOVE 8 TO INCREMENT.                                         DB1054.2 107
   000980         098000     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000981         098100     PERFORM  PROC-117-PFM-A-10 THRU PROC-120-PFM-D-10.           DB1054.2 987 991
   000982         098200     MOVE 11 TO INCREMENT.                                        DB1054.2 107
   000983         098300     ADD      1 TO P-COUNT.                                       DB1054.2 100
   000984         098400     PERFORM  PROC-118-PFM-B-10 THRU PROC-119-PFM-C-10.           DB1054.2 988 990
   000985         098500     MOVE 15 TO INCREMENT.                                        DB1054.2 107
   000986         098600     ADD     1 TO P-COUNT.                                        DB1054.2 100
   000987         098700 PROC-117-PFM-A-10 SECTION.                                       DB1054.2
   000988         098800 PROC-118-PFM-B-10.                                               DB1054.2
   000989         098900     ADD      100 TO P-COUNT.                                     DB1054.2 100
   000990         099000 PROC-119-PFM-C-10 SECTION.                                       DB1054.2
   000991         099100 PROC-120-PFM-D-10.                                               DB1054.2
   000992         099200     ADD      10000 TO P-COUNT.                                   DB1054.2 100
   000993         099300 PROC-121-PFM-TESTT-10 SECTION.                                   DB1054.2
   000994         099400 PROC-122-PFM-TESTTT-10.                                          DB1054.2
   000995         099500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   000996         099600     IF       P-COUNT EQUAL TO 050504                             DB1054.2 100
   000997      1  099700              GO TO PROC-138-PFM-WRITE-10.                        DB1054.2 1008
   000998         099800     GO       TO PROC-000-PFM-NUC-FAIL-10.                        DB1054.2 1003
   000999         099900 PROC-000-PFM-DELETE-10.                                          DB1054.2
   001000         100000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001001         100100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001002         100200     GO       TO PROC-138-PFM-WRITE-10.                           DB1054.2 1008
   001003         100300 PROC-000-PFM-NUC-FAIL-10.                                        DB1054.2
   001004         100400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001005         100500     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   001006         100600     MOVE     050504 TO CORRECT-N.                                DB1054.2 405
   001007         100700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001008         100800 PROC-138-PFM-WRITE-10.                                           DB1054.2
   001009         100900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001010         101000     MOVE "PERFORM THRU        " TO FEATURE.                      DB1054.2 393
   001011         101100     MOVE     "PROC-117-PFM-TEST-10" TO PAR-NAME.                 DB1054.2 397
   001012         101200 PROC-139-PFM-TEST-11.                                            DB1054.2
   001013         101300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001014         101400     MOVE     ZERO TO P-COUNT.                                    DB1054.2 IMP 100
   001015         101500     PERFORM PROC-140-PFM-B-11 THROUGH PROC-140-PFM-D-11 1 TIMES. DB1054.2 1028 1032
   001016         101600     MOVE 4 TO INCREMENT.                                         DB1054.2 107
   001017         101700     ADD      1 TO P-COUNT.                                       DB1054.2 100
   001018         101800     PERFORM  PROC-139-PFM-A-11 THRU PROC-139-PFM-C-11 2 TIMES.   DB1054.2 1027 1031
   001019         101900     MOVE 12 TO INCREMENT.                                        DB1054.2 107
   001020         102000     ADD      1 TO P-COUNT.                                       DB1054.2 100
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001021         102100     PERFORM  PROC-139-PFM-A-11 THRU PROC-140-PFM-D-11 2 TIMES.   DB1054.2 1027 1032
   001022         102200     MOVE 19 TO INCREMENT.                                        DB1054.2 107
   001023         102300     ADD      1 TO P-COUNT.                                       DB1054.2 100
   001024         102400     PERFORM PROC-140-PFM-B-11 THRU PROC-139-PFM-C-11   1 TIMES.  DB1054.2 1028 1031
   001025         102500     MOVE 23 TO INCREMENT.                                        DB1054.2 107
   001026         102600     ADD      1 TO P-COUNT.                                       DB1054.2 100
   001027         102700 PROC-139-PFM-A-11 SECTION.                                       DB1054.2
   001028         102800 PROC-140-PFM-B-11.                                               DB1054.2
   001029         102900     ADD 2 TO INCREMENT.                                          DB1054.2 107
   001030         103000     ADD      100 TO P-COUNT.                                     DB1054.2 100
   001031         103100 PROC-139-PFM-C-11 SECTION.                                       DB1054.2
   001032         103200 PROC-140-PFM-D-11.                                               DB1054.2
   001033         103300     ADD 2 TO INCREMENT.                                          DB1054.2 107
   001034         103400     ADD     10000 TO P-COUNT.                                    DB1054.2 100
   001035         103500 PROC-139-PFM-TESTT-11 SECTION.                                   DB1054.2
   001036         103600 PROC-140-PFM-TESTTT-11.                                          DB1054.2
   001037         103700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001038         103800     IF       P-COUNT EQUAL TO 070704                             DB1054.2 100
   001039      1  103900              GO TO PROC-168-PFM-WRITE-11.                        DB1054.2 1050
   001040         104000     GO       TO PROC-000-PFM-NUC-FAIL-11.                        DB1054.2 1045
   001041         104100 PROC-000-PFM-DELETE-11.                                          DB1054.2
   001042         104200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001043         104300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001044         104400     GO       TO PROC-168-PFM-WRITE-11.                           DB1054.2 1050
   001045         104500 PROC-000-PFM-NUC-FAIL-11.                                        DB1054.2
   001046         104600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001047         104700     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   001048         104800     MOVE     090904 TO CORRECT-N.                                DB1054.2 405
   001049         104900     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001050         105000 PROC-168-PFM-WRITE-11.                                           DB1054.2
   001051         105100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001052         105200     MOVE "PERFORM THRU, TIMES " TO FEATURE.                      DB1054.2 393
   001053         105300     MOVE     "PROC-139-PFM-TEST-11" TO PAR-NAME.                 DB1054.2 397
   001054         105400 PROC-169-PFM-TEST-12.                                            DB1054.2
   001055         105500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001056         105600     MOVE     ZERO TO P-COUNT.                                    DB1054.2 IMP 100
   001057         105700     ADD      1 TO P-COUNT.                                       DB1054.2 100
   001058         105800     PERFORM  PROC-170-PFM-A-12.                                  DB1054.2 1061
   001059         105900     ADD      2 TO P-COUNT.                                       DB1054.2 100
   001060         106000     GO       TO PROC-175-PFM-TESTT-12.                           DB1054.2 1084
   001061         106100 PROC-170-PFM-A-12.                                               DB1054.2
   001062         106200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001063         106300     ADD      10 TO P-COUNT.                                      DB1054.2 100
   001064         106400     PERFORM  PROC-171-PFM-B-12.                                  DB1054.2 1066
   001065         106500     ADD      20 TO P-COUNT.                                      DB1054.2 100
   001066         106600 PROC-171-PFM-B-12.                                               DB1054.2
   001067         106700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001068         106800     ADD      100 TO P-COUNT.                                     DB1054.2 100
   001069         106900     PERFORM  PROC-172-PFM-C-12.                                  DB1054.2 1071
   001070         107000     ADD      200 TO P-COUNT.                                     DB1054.2 100
   001071         107100 PROC-172-PFM-C-12.                                               DB1054.2
   001072         107200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001073         107300     ADD      1000 TO P-COUNT.                                    DB1054.2 100
   001074         107400     PERFORM  PROC-173-PFM-D-12.                                  DB1054.2 1076
   001075         107500     ADD      2000 TO P-COUNT.                                    DB1054.2 100
   001076         107600 PROC-173-PFM-D-12.                                               DB1054.2
   001077         107700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001078         107800     ADD      10000 TO P-COUNT.                                   DB1054.2 100
   001079         107900     PERFORM  PROC-174-PFM-E-12.                                  DB1054.2 1081
   001080         108000     ADD      20000 TO P-COUNT.                                   DB1054.2 100
   001081         108100 PROC-174-PFM-E-12.                                               DB1054.2
   001082         108200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001083         108300     ADD      100000 TO P-COUNT.                                  DB1054.2 100
   001084         108400 PROC-175-PFM-TESTT-12.                                           DB1054.2
   001085         108500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001086         108600     IF       P-COUNT EQUAL TO 133333                             DB1054.2 100
   001087      1  108700              GO TO PROC-176-PFM-WRITE-12.                        DB1054.2 1098
   001088         108800     GO       TO PROC-000-PFM-NUC-FAIL-12.                        DB1054.2 1093
   001089         108900 PROC-000-PFM-DELETE-12.                                          DB1054.2
   001090         109000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001091         109100     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001092         109200     GO       TO PROC-176-PFM-WRITE-12.                           DB1054.2 1098
   001093         109300 PROC-000-PFM-NUC-FAIL-12.                                        DB1054.2
   001094         109400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001095         109500     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   001096         109600     MOVE     133333 TO CORRECT-N.                                DB1054.2 405
   001097         109700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001098         109800 PROC-176-PFM-WRITE-12.                                           DB1054.2
   001099         109900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001100         110000     MOVE "NESTED PERFORM      " TO FEATURE.                      DB1054.2 393
   001101         110100     MOVE     "PROC-169-PFM-TEST-12" TO PAR-NAME.                 DB1054.2 397
   001102         110200 PROC-177-PFM-TEST-13.                                            DB1054.2
   001103         110300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001104         110400     MOVE     ZERO TO P-COUNT.                                    DB1054.2 IMP 100
   001105         110500     PERFORM  PROC-178-PFM-A-13 THRU PROC-177-PFM-B-13.           DB1054.2 1110 1113
   001106         110600     ADD      1 TO P-COUNT.                                       DB1054.2 100
   001107         110700     MOVE 2 TO INCREMENT.                                         DB1054.2 107
   001108         110800     PERFORM  PROC-178-PFM-A-13 THRU PROC-177-PFM-B-13 2 TIMES.   DB1054.2 1110 1113
   001109         110900     ADD      2 TO P-COUNT.                                       DB1054.2 100
   001110         111000 PROC-178-PFM-A-13.                                               DB1054.2
   001111         111100     ADD 2 TO INCREMENT.                                          DB1054.2 107
   001112         111200     ADD      100 TO P-COUNT.                                     DB1054.2 100
   001113         111300 PROC-177-PFM-B-13.                                               DB1054.2
   001114         111400     EXIT.                                                        DB1054.2
   001115         111500 PROC-178-PFM-TESTT-13.                                           DB1054.2
   001116         111600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001117         111700     IF       P-COUNT EQUAL TO 000403                             DB1054.2 100
   001118      1  111800              GO TO PROC-187-PFM-WRITE-13.                        DB1054.2 1130
   001119         111900     GO       TO PROC-000-PFM-NUC-FAIL-13.                        DB1054.2 1124
   001120         112000 PROC-000-PFM-DELETE-13.                                          DB1054.2
   001121         112100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001122         112200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001123         112300     GO       TO PROC-187-PFM-WRITE-13.                           DB1054.2 1130
   001124         112400 PROC-000-PFM-NUC-FAIL-13.                                        DB1054.2
   001125         112500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001126         112600     MOVE     P-COUNT TO COMPUTED-N.                              DB1054.2 100 410
   001127         112700     MOVE     000403 TO CORRECT-N.                                DB1054.2 405
   001128         112800     MOVE     "PERFORM WITH EXIT" TO FEATURE.                     DB1054.2 393
   001129         112900     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001130         113000 PROC-187-PFM-WRITE-13.                                           DB1054.2
   001131         113100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001132         113200     MOVE     "PROC-177-PFM-TEST-13" TO PAR-NAME.                 DB1054.2 397
   001133         113300 PROC-188-PFM-TEST-14.                                            DB1054.2
   001134         113400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001135         113500     PERFORM PROC-189-A101.                                       DB1054.2 1364
   001136         113600     IF PERFORM-HOLD EQUAL TO "ABCDEFGHIJKLMNOPQRST"              DB1054.2 389
   001137      1  113700         GO TO PROC-210-PFM-WRITE-14.                             DB1054.2 1145
   001138         113800     MOVE "ABCDEFGHIJKLMNOPQRST" TO CORRECT-A.                    DB1054.2 403
   001139         113900     MOVE PERFORM-HOLD TO COMPUTED-A.                             DB1054.2 389 408
   001140         114000     PERFORM PROC-000-NUCLEUS-FAILURE.                            DB1054.2 1284
   001141         114100     GO TO PROC-210-PFM-WRITE-14.                                 DB1054.2 1145
   001142         114200 PROC-000-PFM-DELETE-14.                                          DB1054.2
   001143         114300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001144         114400     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001145         114500 PROC-210-PFM-WRITE-14.                                           DB1054.2
   001146         114600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001147         114700     MOVE     "PROC-188-PFM-TEST-14" TO PAR-NAME.                 DB1054.2 397
   001148         114800 PROC-211-PFM-A-15 SECTION.                                       DB1054.2
   001149         114900 PROC-212-PFM-TEST-15.                                            DB1054.2
   001150         115000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001151         115100     PERFORM  PROC-213-PFM-G-15 THRU PROC-217-PFM-B-15.           DB1054.2 1176 1157

 ==001151==> IGYPA3086-W "PERFORM" start-of-range "PROC-213-PFM-G-15" follows the "PERFORM"
                         end-of-range "PROC-217-PFM-B-15".  The "PERFORM" end-of-range may be
                         unreachable.  The statement was processed as written.

   001152         115200     GO       TO PROC-218-PFM-WRITE-15.                           DB1054.2 1192
   001153         115300 PROC-000-PFM-DELETE-15.                                          DB1054.2
   001154         115400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001155         115500     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001156         115600     GO       TO PROC-218-PFM-WRITE-15.                           DB1054.2 1192
   001157         115700 PROC-217-PFM-B-15.                                               DB1054.2
   001158         115800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001159         115900     ADD 1 TO REC-CT.                                             DB1054.2 438
   001160         116000 PROC-000-PFM-C-15.                                               DB1054.2
   001161         116100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001162         116200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001163         116300     MOVE     "RETURN MECHANISM LOST" TO RE-MARK.                 DB1054.2 412
   001164         116400     GO       TO PROC-218-PFM-WRITE-15.                           DB1054.2 1192
   001165         116500 PROC-000-PFM-D-15.                                               DB1054.2
   001166         116600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001167         116700     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001168         116800     MOVE     "PERFORM GOT LOST IN GO TOS" TO RE-MARK.            DB1054.2 412
   001169         116900     GO       TO PROC-218-PFM-WRITE-15.                           DB1054.2 1192
   001170         117000 PROC-215-PFM-E-15.                                               DB1054.2
   001171         117100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001172         117200     GO       TO PROC-216-PFM-L-15.                               DB1054.2 1189
   001173         117300 PROC-000-PFM-F-15.                                               DB1054.2
   001174         117400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001175         117500     GO       TO PROC-000-PFM-D-15.                               DB1054.2 1165
   001176         117600 PROC-213-PFM-G-15 SECTION.                                       DB1054.2
   001177         117700 PROC-214-PFM-H-15.                                               DB1054.2
   001178         117800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001179         117900     GO       TO PROC-215-PFM-E-15.                               DB1054.2 1170
   001180         118000 PROC-000-PFM-I-15.                                               DB1054.2
   001181         118100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001182         118200     GO       TO PROC-000-PFM-D-15.                               DB1054.2 1165
   001183         118300 PROC-000-PFM-J-15 SECTION.                                       DB1054.2
   001184         118400 PROC-000-PFM-K-15.                                               DB1054.2
   001185         118500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001186         118600     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001187         118700     MOVE     "PROC-000-PFM-K-15 ENTERED" TO RE-MARK.             DB1054.2 412
   001188         118800     GO       TO PROC-218-PFM-WRITE-15.                           DB1054.2 1192
   001189         118900 PROC-216-PFM-L-15.                                               DB1054.2
   001190         119000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001191         119100     GO       TO PROC-217-PFM-B-15.                               DB1054.2 1157
   001192         119200 PROC-218-PFM-WRITE-15.                                           DB1054.2
   001193         119300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001194         119400     MOVE     "PERFORM GO TO PARAS" TO FEATURE.                   DB1054.2 393
   001195         119500     MOVE     "PROC-212-PFM-TEST-15" TO PAR-NAME.                 DB1054.2 397
   001196         119600 PROC-219-PFM-TEST-LAST.                                          DB1054.2
   001197         119700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001198         119800     MOVE     7 TO PERFORM5.                                      DB1054.2 386
   001199         119900     PERFORM  PROC-220-PFM-U PERFORM5 TIMES.                      DB1054.2 1438 386
   001200         120000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001201         120100     IF       PERFORM5 EQUAL TO 707                               DB1054.2 386
   001202      1  120200              GO TO PROC-227-PFM-WRITE-LAST.                      DB1054.2 1213
   001203         120300     GO       TO PROC-000-PFM-NUC-FAIL-LST.                       DB1054.2 1208
   001204         120400 PROC-000-PFM-DELETE-LAST.                                        DB1054.2
   001205         120500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001206         120600     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001207         120700     GO       TO PROC-227-PFM-WRITE-LAST.                         DB1054.2 1213
   001208         120800 PROC-000-PFM-NUC-FAIL-LST.                                       DB1054.2
   001209         120900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001210         121000     MOVE     PERFORM5 TO COMPUTED-N.                             DB1054.2 386 410
   001211         121100     MOVE     707 TO CORRECT-N.                                   DB1054.2 405
   001212         121200     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001213         121300 PROC-227-PFM-WRITE-LAST.                                         DB1054.2
   001214         121400     IF PROC-ACTIVE IS NOT EQUAL TO 0                             DB1054.2 108
   001215      1  121500         MOVE " DEBUGGING PROCEDURE WAS NEVER EXECUTED.  NO FURTHEDB1054.2
   001216      1  121600-             "R REPORT WILL BE GENERATED." TO DUMMY-RECORD       DB1054.2 96
   001217      1  121700         PERFORM WRITE-LINE                                       DB1054.2 598
   001218      1  121800         MOVE 227 TO ERROR-COUNTER                                DB1054.2 440
   001219      1  121900         GO TO CCVS-EXIT.                                         DB1054.2 1450
   001220         122000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001221         122100     MOVE SPACE TO TEST-RESULTS.                                  DB1054.2 IMP 391
   001222         122200     MOVE "DEBUG ALL PROCEDURES" TO FEATURE.                      DB1054.2 393
   001223         122300     MOVE 0 TO REC-CT.                                            DB1054.2 438
   001224         122400     MOVE 1 TO BYPASS.                                            DB1054.2 105
   001225         122500     SET STACK-END TO STACK-INDEX.                                DB1054.2 106 341
   001226         122600     SET STACK-INDEX TO 1.                                        DB1054.2 341
   001227         122700     SET STATIC-INDEX TO 1.                                       DB1054.2 338
   001228         122800     PERFORM NAME-LISTER 227 TIMES.                               DB1054.2 1243
   001229         122900 EMPTY-THE-STACK.                                                 DB1054.2
   001230         123000     IF STACK-INDEX IS NOT LESS THAN STACK-END GO TO STACK-EMPTY. DB1054.2 341 106 1233
   001231         123100     PERFORM CORRECT-GT-STACK.                                    DB1054.2 1266
   001232         123200     GO TO EMPTY-THE-STACK.                                       DB1054.2 1229
   001233         123300 STACK-EMPTY.                                                     DB1054.2
   001234         123400     MOVE SPACE TO DUMMY-RECORD.                                  DB1054.2 IMP 96
   001235         123500     MOVE 51 TO RECORD-COUNT.                                     DB1054.2 446
   001236         123600     PERFORM WRITE-LINE.                                          DB1054.2 598
   001237         123700     MOVE FLOW-FAILURE-1 TO DUMMY-RECORD.                         DB1054.2 351 96
   001238         123800     PERFORM WRITE-LINE.                                          DB1054.2 598
   001239         123900     MOVE FLOW-FAILURE-2 TO DUMMY-RECORD.                         DB1054.2 357 96
   001240         124000     PERFORM WRITE-LINE 2 TIMES.                                  DB1054.2 598
   001241         124100*                                                                 DB1054.2
   001242         124200     GO TO    CCVS-EXIT.                                          DB1054.2 1450
   001243         124300 NAME-LISTER SECTION.                                             DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001244         124400 NAME-LISTER-1.                                                   DB1054.2
   001245         124500     MOVE EXPECTED-NAME (STATIC-INDEX) TO TABLE-ENTRY.            DB1054.2 338 338 347
   001246         124600     SET TABLE-ENTRY-BASE TO STATIC-INDEX.                        DB1054.2 349 338
   001247         124700     IF STACK-INDEX IS EQUAL TO STACK-END GO TO STACK-GT-CORRECT. DB1054.2 341 106 1274
   001248         124800     IF BASE-NUMBER (STACK-INDEX) IS NOT NUMERIC                  DB1054.2 344 341
   001249      1  124900         GO TO CORRECT-GT-STACK.                                  DB1054.2 1266
   001250         125000     IF TABLE-ENTRY-BASE IS GREATER THAN BASE-NUMBER (STACK-INDEX)DB1054.2 349 344 341
   001251      1  125100         GO TO CORRECT-GT-STACK.                                  DB1054.2 1266
   001252         125200     IF TABLE-ENTRY-BASE IS LESS THAN BASE-NUMBER (STACK-INDEX)   DB1054.2 349 344 341
   001253      1  125300         GO TO STACK-GT-CORRECT.                                  DB1054.2 1274
   001254         125400 CORRECT-EQ-STACK.                                                DB1054.2
   001255         125500     MOVE EXPECTED-NAME (STATIC-INDEX) TO PAR-NAME.               DB1054.2 338 338 397
   001256         125600     MOVE TABLE-ENTRY TO CORRECT-A.                               DB1054.2 347 403
   001257         125700     MOVE PROC-NAME (STACK-INDEX) TO COMPUTED-A.                  DB1054.2 341 341 408
   001258         125800     IF CORRECT-A IS NOT EQUAL TO COMPUTED-A PERFORM FAIL         DB1054.2 403 408 544
   001259      1  125900                                        ELSE PERFORM PASS.        DB1054.2 543
   001260         126000     PERFORM PRINT-DETAIL.                                        DB1054.2 547
   001261         126100     IF STACK-INDEX IS LESS THAN 500                              DB1054.2 341
   001262      1  126200             SET STACK-INDEX UP BY 1.                             DB1054.2 341
   001263         126300     IF STATIC-INDEX IS LESS THAN 227                             DB1054.2 338
   001264      1  126400             SET STATIC-INDEX UP BY 1.                            DB1054.2 338
   001265         126500     GO TO NAME-LISTER-EXIT.                                      DB1054.2 1281
   001266         126600 CORRECT-GT-STACK.                                                DB1054.2
   001267         126700     MOVE PROC-NAME (STACK-INDEX) TO COMPUTED-A.                  DB1054.2 341 341 408
   001268         126800     PERFORM FAIL.                                                DB1054.2 544
   001269         126900     PERFORM PRINT-DETAIL.                                        DB1054.2 547
   001270         127000     IF STACK-INDEX IS LESS THAN 500                              DB1054.2 341
   001271      1  127100             SET STACK-INDEX UP BY 1.                             DB1054.2 341
   001272         127200 CORRECT-GT-STACK-1.                                              DB1054.2
   001273         127300     GO TO NAME-LISTER-1.                                         DB1054.2 1244
   001274         127400 STACK-GT-CORRECT.                                                DB1054.2
   001275         127500     MOVE EXPECTED-NAME (STATIC-INDEX) TO PAR-NAME.               DB1054.2 338 338 397
   001276         127600     MOVE TABLE-ENTRY TO CORRECT-A.                               DB1054.2 347 403
   001277         127700     PERFORM FAIL.                                                DB1054.2 544
   001278         127800     PERFORM PRINT-DETAIL.                                        DB1054.2 547
   001279         127900     IF STATIC-INDEX IS LESS THAN 227                             DB1054.2 338
   001280      1  128000             SET STATIC-INDEX UP BY 1.                            DB1054.2 338
   001281         128100 NAME-LISTER-EXIT.                                                DB1054.2
   001282         128200     EXIT.                                                        DB1054.2
   001283         128300 OTHER-PROCEDURES SECTION.                                        DB1054.2
   001284         128400 PROC-000-NUCLEUS-FAILURE.                                        DB1054.2
   001285         128500     ADD 1 TO NUC-FAILURE-COUNT.                                  DB1054.2 355
   001286         128600 PROC-209-A121.                                                   DB1054.2
   001287         128700     EXIT.                                                        DB1054.2
   001288         128800 PROC-208-A120.                                                   DB1054.2
   001289         128900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001290         129000     MOVE "T" TO TEST-LETTER (20).                                DB1054.2 390
   001291         129100     PERFORM PROC-209-A121.                                       DB1054.2 1286
   001292         129200 PROC-207-A119.                                                   DB1054.2
   001293         129300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001294         129400     MOVE "S" TO TEST-LETTER (19).                                DB1054.2 390
   001295         129500     PERFORM PROC-208-A120.                                       DB1054.2 1288
   001296         129600 PROC-206-A118.                                                   DB1054.2
   001297         129700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001298         129800     MOVE "R" TO TEST-LETTER (18).                                DB1054.2 390
   001299         129900     PERFORM PROC-207-A119.                                       DB1054.2 1292
   001300         130000 PROC-205-A117.                                                   DB1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001301         130100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001302         130200     MOVE "Q" TO TEST-LETTER (17).                                DB1054.2 390
   001303         130300     PERFORM PROC-206-A118.                                       DB1054.2 1296
   001304         130400 PROC-204-A116.                                                   DB1054.2
   001305         130500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001306         130600     MOVE "P" TO TEST-LETTER (16).                                DB1054.2 390
   001307         130700     PERFORM PROC-205-A117.                                       DB1054.2 1300
   001308         130800 PROC-203-A115.                                                   DB1054.2
   001309         130900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001310         131000     MOVE "O" TO TEST-LETTER (15).                                DB1054.2 390
   001311         131100     PERFORM PROC-204-A116.                                       DB1054.2 1304
   001312         131200 PROC-202-A114.                                                   DB1054.2
   001313         131300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001314         131400     MOVE "N" TO TEST-LETTER (14).                                DB1054.2 390
   001315         131500     PERFORM PROC-203-A115.                                       DB1054.2 1308
   001316         131600 PROC-201-A113.                                                   DB1054.2
   001317         131700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001318         131800     MOVE "M" TO TEST-LETTER (13).                                DB1054.2 390
   001319         131900     PERFORM PROC-202-A114.                                       DB1054.2 1312
   001320         132000 PROC-200-A112.                                                   DB1054.2
   001321         132100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001322         132200     MOVE "L" TO TEST-LETTER (12).                                DB1054.2 390
   001323         132300     PERFORM PROC-201-A113.                                       DB1054.2 1316
   001324         132400 PROC-199-A111.                                                   DB1054.2
   001325         132500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001326         132600     MOVE "K" TO TEST-LETTER (11).                                DB1054.2 390
   001327         132700     PERFORM PROC-200-A112.                                       DB1054.2 1320
   001328         132800 PROC-198-A110.                                                   DB1054.2
   001329         132900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001330         133000     MOVE "J" TO TEST-LETTER (10).                                DB1054.2 390
   001331         133100     PERFORM PROC-199-A111.                                       DB1054.2 1324
   001332         133200 PROC-197-A109.                                                   DB1054.2
   001333         133300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001334         133400     MOVE "I" TO TEST-LETTER (9).                                 DB1054.2 390
   001335         133500     PERFORM PROC-198-A110.                                       DB1054.2 1328
   001336         133600 PROC-196-A108.                                                   DB1054.2
   001337         133700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001338         133800     MOVE "H" TO TEST-LETTER (8).                                 DB1054.2 390
   001339         133900     PERFORM PROC-197-A109.                                       DB1054.2 1332
   001340         134000 PROC-195-A107.                                                   DB1054.2
   001341         134100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001342         134200     MOVE "G" TO TEST-LETTER (7).                                 DB1054.2 390
   001343         134300     PERFORM PROC-196-A108.                                       DB1054.2 1336
   001344         134400 PROC-194-A106.                                                   DB1054.2
   001345         134500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001346         134600     MOVE "F" TO TEST-LETTER (6).                                 DB1054.2 390
   001347         134700     PERFORM PROC-195-A107.                                       DB1054.2 1340
   001348         134800 PROC-193-A105.                                                   DB1054.2
   001349         134900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001350         135000     MOVE "E" TO TEST-LETTER (5).                                 DB1054.2 390
   001351         135100     PERFORM PROC-194-A106.                                       DB1054.2 1344
   001352         135200 PROC-192-A104.                                                   DB1054.2
   001353         135300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001354         135400     MOVE "D" TO TEST-LETTER (4).                                 DB1054.2 390
   001355         135500     PERFORM PROC-193-A105.                                       DB1054.2 1348
   001356         135600 PROC-191-A103.                                                   DB1054.2
   001357         135700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001358         135800     MOVE "C" TO TEST-LETTER (3).                                 DB1054.2 390
   001359         135900     PERFORM PROC-192-A104.                                       DB1054.2 1352
   001360         136000 PROC-190-A102.                                                   DB1054.2
   001361         136100     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001362         136200     MOVE "B" TO TEST-LETTER (2).                                 DB1054.2 390
   001363         136300     PERFORM PROC-191-A103.                                       DB1054.2 1356
   001364         136400 PROC-189-A101.                                                   DB1054.2
   001365         136500     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001366         136600     MOVE "A" TO TEST-LETTER (1).                                 DB1054.2 390
   001367         136700     PERFORM PROC-190-A102.                                       DB1054.2 1360
   001368         136800 PROC-048-PFM-C.                                                  DB1054.2
   001369         136900     ADD 1 TO INCREMENT.                                          DB1054.2 107
   001370         137000     ADD      6 TO PERFORM2.                                      DB1054.2 383
   001371         137100 PROC-000-PFM-D.                                                  DB1054.2
   001372         137200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001373         137300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001374         137400     GO TO    PROC-055-PFM-TEST-4.                                DB1054.2 859
   001375         137500*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               DB1054.2
   001376         137600*    FROM THE PREVIOUS ONE.                                       DB1054.2
   001377         137700 PROC-056-PFM-E.                                                  DB1054.2
   001378         137800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001379         137900     MOVE "CSW" TO PERFORM1.                                      DB1054.2 381
   001380         138000     PERFORM  PROC-057-PFM-F THRU PROC-058-PFM-G.                 DB1054.2 1383 1386
   001381         138100     SUBTRACT .8 FROM PERFORM4.                                   DB1054.2 385
   001382         138200     GO TO    PROC-059-PFM-H.                                     DB1054.2 1389
   001383         138300 PROC-057-PFM-F.                                                  DB1054.2
   001384         138400     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001385         138500     MOVE     60.5 TO PERFORM4.                                   DB1054.2 385
   001386         138600 PROC-058-PFM-G.                                                  DB1054.2
   001387         138700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001388         138800     ADD      10.3 TO PERFORM4.                                   DB1054.2 385
   001389         138900 PROC-059-PFM-H.                                                  DB1054.2
   001390         139000     EXIT.                                                        DB1054.2
   001391         139100 PROC-000-PFM-I.                                                  DB1054.2
   001392         139200     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001393         139300     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001394         139400     GO TO    PROC-060-PFM-WRITE-4.                               DB1054.2 870
   001395         139500*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               DB1054.2
   001396         139600*    FROM THE PREVIOUS ONE.                                       DB1054.2
   001397         139700 PROC-062-PFM-J.                                                  DB1054.2
   001398         139800     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001399         139900     MOVE "YES" TO PERFORM1.                                      DB1054.2 381
   001400         140000     PERFORM  PROC-063-PFM-L.                                     DB1054.2 1408
   001401         140100     MULTIPLY 3 BY PERFORM2.                                      DB1054.2 383
   001402         140200 PROC-000-PFM-K.                                                  DB1054.2
   001403         140300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001404         140400     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001405         140500     GO TO    PROC-064-PFM-WRITE-5.                               DB1054.2 885
   001406         140600*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               DB1054.2
   001407         140700*    FROM THE PREVIOUS ONE.                                       DB1054.2
   001408         140800 PROC-063-PFM-L.                                                  DB1054.2
   001409         140900     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001410         141000     MOVE     4 TO PERFORM2.                                      DB1054.2 383
   001411         141100     ADD      100 TO PERFORM2.                                    DB1054.2 383
   001412         141200 PROC-000-PFM-M.                                                  DB1054.2
   001413         141300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001414         141400     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001415         141500     GO TO    PROC-064-PFM-WRITE-5.                               DB1054.2 885
   001416         141600*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               DB1054.2
   001417         141700*    FROM THE PREVIOUS ONE.                                       DB1054.2
   001418         141800 PROC-066-PFM-N        SECTION.                                   DB1054.2
   001419         141900 PROC-067-PFM-O.                                                  DB1054.2
   001420         142000     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001421         142100     ADD 1 TO NUC-FAILURE-COUNT.                                  DB1054.2 355
   001422         142200 PROC-068-PFM-P.                                                  DB1054.2
   001423         142300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001424         142400     SUBTRACT 1 FROM NUC-FAILURE-COUNT.                           DB1054.2 355
   001425         142500 PROC-000-PFM-Q        SECTION.                                   DB1054.2
   001426         142600 PROC-000-PFM-R.                                                  DB1054.2
   001427         142700     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001428         142800     PERFORM  PROC-000-NUCLEUS-FAILURE.                           DB1054.2 1284
   001429         142900     GO TO    PROC-069-PFM-WRITE-6.                               DB1054.2 896
   001430         143000*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH FROM THE      DB1054.2
   001431         143100*        PREVIOUS ONE.                                            DB1054.2
   001432         143200 PROC-000-PFM-S.                                                  DB1054.2
   001433         143300     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001434         143400     ADD      1 TO PERFORM5.                                      DB1054.2 386
   001435         143500 PROC-000-PFM-T.                                                  DB1054.2
   001436         143600     MOVE 0 TO INCREMENT.                                         DB1054.2 107
   001437         143700     ADD      10 TO PERFORM5.                                     DB1054.2 386
   001438         143800 PROC-220-PFM-U.                                                  DB1054.2
   001439         143900     ADD 1 TO INCREMENT.                                          DB1054.2 107
   001440         144000     ADD      100 TO PERFORM5.                                    DB1054.2 386
   001441         144100     IF       PERFORM5 GREATER THAN 899                           DB1054.2 386
   001442      1  144200              MOVE PERFORM5 TO COMPUTED-N                         DB1054.2 386 410
   001443      1  144300              MOVE 707 TO CORRECT-N                               DB1054.2 405
   001444      1  144400              PERFORM PROC-000-NUCLEUS-FAILURE.                   DB1054.2 1284
   001445         144500 PROC-071-PFM-V.       EXIT.                                      DB1054.2
   001446         144600 PROC-072-PFM-W.       EXIT.                                      DB1054.2
   001447         144700 PROC-073-PFM-X.       EXIT.                                      DB1054.2
   001448         144800 PROC-074-PFM-Y.       EXIT.                                      DB1054.2
   001449         144900 PROC-075-PFM-Z.       ADD  5  TO INCREMENT.                      DB1054.2 107
   001450         145000 CCVS-EXIT SECTION.                                               DB1054.2
   001451         145100 CCVS-999999.                                                     DB1054.2
   001452         145200     GO TO CLOSE-FILES.                                           DB1054.2 536
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    29
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      361   A
      103   ALTERLOOP. . . . . . . . . . .  M777 778
       98   ATWO-DS-01V00. . . . . . . . .  947
      362   B
      346   BASE-NAME
      344   BASE-NUMBER. . . . . . . . . .  520 M521 1248 1250 1252
      105   BYPASS . . . . . . . . . . . .  515 M523 M618 M1224
      363   C
      466   CCVS-E-1 . . . . . . . . . . .  568
      472   CCVS-E-2 . . . . . . . . . . .  577 584 591 596
      476   CCVS-E-2-2 . . . . . . . . . .  M576
      480   CCVS-E-3 . . . . . . . . . . .  597
      488   CCVS-E-4 . . . . . . . . . . .  576
      489   CCVS-E-4-1 . . . . . . . . . .  M574
      491   CCVS-E-4-2 . . . . . . . . . .  M575
      447   CCVS-H-1 . . . . . . . . . . .  557
      453   CCVS-H-2 . . . . . . . . . . .  558
      459   CCVS-H-3 . . . . . . . . . . .  559
      507   CCVS-PGM-ID. . . . . . . . . .  532 532
      413   COLUMNS-LINE-1 . . . . . . . .  561 604
      425   COLUMNS-LINE-2 . . . . . . . .  562 605
      408   COMPUTED-A . . . . . . . . . .  409 M552 M1139 M1257 1258 M1267
      410   COMPUTED-N . . . . . . . . . .  M730 M935 M965 M1005 M1047 M1095 M1126 M1210 M1442
      409   COMPUTED-NFIELD
      403   CORRECT-A. . . . . . . . . . .  404 M553 M1138 M1256 1258 M1276
      405   CORRECT-N. . . . . . . . . . .  M731 M936 M966 M1006 M1048 M1096 M1127 M1211 M1443
      404   CORRECT-NFIELD
      364   D
        0   DEBUG-NAME . . . . . . . . . .  516
      439   DELETE-CNT . . . . . . . . . .  M545 571 587 589
      400   DOTVALUE . . . . . . . . . . .  M550
      445   DUMMY-HOLD . . . . . . . . . .  M601 608
       96   DUMMY-RECORD . . . . . . . . .  M557 M558 M559 M561 M562 M564 M566 M568 M577 M584 M591 M596 M597 601 M602 603
                                            M604 M605 M607 M608 612 M613 M1216 M1234 M1237 M1239
      365   E
      479   ENDER-DESC . . . . . . . . . .  M579 M590 M595
      440   ERROR-COUNTER. . . . . . . . .  M544 570 580 583 M1218
      444   ERROR-HOLD . . . . . . . . . .  M570 M571 M571 M572 575
      477   ERROR-TOTAL. . . . . . . . . .  M581 M583 M588 M589 M593 M594
      338   EXPECTED-NAME. . . . . . . . .  1245 1255 1275
      366   F
      393   FEATURE. . . . . . . . . . . .  M631 M637 M640 M711 M735 M739 M798 M814 M841 M857 M872 M887 M898 M910 M940 M970
                                            M1010 M1052 M1100 M1128 M1194 M1222
      351   FLOW-FAILURE-1 . . . . . . . .  1237
      357   FLOW-FAILURE-2 . . . . . . . .  1239
      367   G
      378   GO-SCRIPT
      377   GO-TABLE
      380   GO-TO-DEEP . . . . . . . . . .  716 726 730
      379   GO-TO-DEPEND . . . . . . . . .  643 653 M654 656 M659 664 M666 M668 673 M675 M677 682 M684 M686 691
      368   H
      501   HYPHEN-LINE. . . . . . . . . .  564 566 607
      369   I
      469   ID-AGAIN . . . . . . . . . . .  M532
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    30
0 Defined   Cross-reference of data names   References

0     107   INCREMENT. . . . . . . . . . .  521 M620 M623 M626 M630 M634 M639 M646 M651 M662 M671 M680 M689 M695 M698 M701
                                            M705 M710 M714 M720 M725 M729 M734 M738 M741 M743 M746 M752 M756 M758 M761 M763
                                            M766 M772 M776 M782 M785 M788 M791 M797 M801 M810 M813 M817 M821 M825 M831 M840
                                            M844 M853 M856 M860 M868 M871 M875 M883 M886 M890 M894 M897 M901 M903 M906 M909
                                            M913 M921 M925 M930 M934 M939 M943 M951 M955 M960 M964 M969 M973 M976 M979 M982
                                            M985 M995 M1000 M1004 M1009 M1013 M1016 M1019 M1022 M1025 M1029 M1033 M1037 M1042
                                            M1046 M1051 M1055 M1062 M1067 M1072 M1077 M1082 M1085 M1090 M1094 M1099 M1103
                                            M1107 M1111 M1116 M1121 M1125 M1131 M1134 M1143 M1146 M1150 M1154 M1158 M1161
                                            M1166 M1171 M1174 M1178 M1181 M1185 M1190 M1193 M1197 M1200 M1205 M1209 M1220
                                            M1289 M1293 M1297 M1301 M1305 M1309 M1313 M1317 M1321 M1325 M1329 M1333 M1337
                                            M1341 M1345 M1349 M1353 M1357 M1361 M1365 M1369 M1372 M1378 M1384 M1387 M1392
                                            M1398 M1403 M1409 M1413 M1420 M1423 M1427 M1433 M1436 M1439 M1449
      496   INFO-TEXT
      441   INSPECT-COUNTER. . . . . . . .  M542 570 592 594
      370   J
      371   K
      372   L
      373   M
      374   N
      360   NOTE-RECORD
      355   NUC-FAILURE-COUNT. . . . . . .  M1285 M1421 M1424
      375   O
      376   P
      100   P-COUNT. . . . . . . . . . . .  M914 M916 M918 M922 926 935 M944 M946 M948 M952 956 965 M974 M977 M980 M983 M986
                                            M989 M992 996 1005 M1014 M1017 M1020 M1023 M1026 M1030 M1034 1038 1047 M1056
                                            M1057 M1059 M1063 M1065 M1068 M1070 M1073 M1075 M1078 M1080 M1083 1086 1095 M1104
                                            M1106 M1109 M1112 1117 1126
      395   P-OR-F . . . . . . . . . . . .  M542 M543 M544 M545 M552 M636
      414   PAGE-CONTROL-C
      397   PAR-NAME . . . . . . . . . . .  M554 M632 M635 M647 M652 M663 M672 M681 M690 M712 M736 M759 M786 M799 M815 M842
                                            M858 M873 M888 M899 M911 M941 M971 M1011 M1053 M1101 M1132 M1147 M1195 M1255
                                            M1275
      399   PARDOT-X . . . . . . . . . . .  M549
      442   PASS-COUNTER . . . . . . . . .  M543 572 574
      389   PERFORM-HOLD . . . . . . . . .  1136 1139
      388   PERFORM-KEY. . . . . . . . . .  M802 M818 826 832
      381   PERFORM1 . . . . . . . . . . .  804 M827 M829 835 M1379 M1399
      383   PERFORM2 . . . . . . . . . . .  847 877 M1370 M1401 M1410 M1411
      385   PERFORM4 . . . . . . . . . . .  862 M1381 M1385 M1388
      386   PERFORM5 . . . . . . . . . . .  M1198 1199 1201 1210 M1434 M1437 M1440 1441 1442
       91   PRINT-FILE . . . . . . . . . .  87 531 537
       95   PRINT-REC. . . . . . . . . . .  M551
      108   PROC-ACTIVE. . . . . . . . . .  M514 1214
      342   PROC-LOC . . . . . . . . . . .  517
      341   PROC-NAME. . . . . . . . . . .  M516 M518 1257 1267
      109   PROCEDURE-NAMES. . . . . . . .  337
      412   RE-MARK. . . . . . . . . . . .  M546 M555 M1163 M1168 M1187
      438   REC-CT . . . . . . . . . . . .  548 550 554 M696 M1159 M1223
      437   REC-SKL-SUB
      446   RECORD-COUNT . . . . . . . . .  M599 600 M609 M1235
      106   STACK-END. . . . . . . . . . .  M1225 1230 1247
      341   STACK-INDEX. . . . . . . . . .  516 517 518 520 521 522 M525 M619 1225 M1226 1230 1247 1248 1250 1252 1257 1261
                                            M1262 1267 1270 M1271
      340   STACKING-AREA
      338   STATIC-INDEX . . . . . . . . .  M1227 1245 1246 1255 1263 M1264 1275 1279 M1280
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    31
0 Defined   Cross-reference of data names   References

0     337   STATIC-TABLE
      347   TABLE-ENTRY. . . . . . . . . .  M1245 1256 1276
      349   TABLE-ENTRY-BASE . . . . . . .  M1246 1250 1252
      457   TEST-ID. . . . . . . . . . . .  M532
      390   TEST-LETTER. . . . . . . . . .  M1290 M1294 M1298 M1302 M1306 M1310 M1314 M1318 M1322 M1326 M1330 M1334 M1338
                                            M1342 M1346 M1350 M1354 M1358 M1362 M1366
      391   TEST-RESULTS . . . . . . . . .  M533 551 M1221
      101   THREE. . . . . . . . . . . . .  846
      443   TOTAL-ERROR
      102   XRAY
      498   XXCOMPUTED
      500   XXCORRECT
      494   XXINFO
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    32
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

     1450   CCVS-EXIT. . . . . . . . . . .  G1219 G1242
     1451   CCVS-999999
      529   CCVS1
      615   CCVS1-EXIT . . . . . . . . . .  G535
      536   CLOSE-FILES. . . . . . . . . .  G1452
      560   COLUMN-NAMES-ROUTINE . . . . .  E534
     1254   CORRECT-EQ-STACK
     1266   CORRECT-GT-STACK . . . . . . .  P1231 G1249 G1251
     1272   CORRECT-GT-STACK-1
      545   DE-LETE
      526   DEBUG-ALL-EXIT . . . . . . . .  G515 G524
      511   DEBUG-ALL-PROCS
      513   DEBUG-ALL-0
     1229   EMPTY-THE-STACK. . . . . . . .  G1232
      565   END-ROUTINE. . . . . . . . . .  P537
      569   END-ROUTINE-1
      578   END-ROUTINE-12
      586   END-ROUTINE-13 . . . . . . . .  E537
      567   END-RTN-EXIT
      544   FAIL . . . . . . . . . . . . .  P1258 P1268 P1277
      556   HEAD-ROUTINE . . . . . . . . .  P534
      617   INITIALIZE-PROC-NAME-STACK
      542   INSPT
     1243   NAME-LISTER. . . . . . . . . .  P1228
     1281   NAME-LISTER-EXIT . . . . . . .  G1265
     1244   NAME-LISTER-1. . . . . . . . .  G1273
      530   OPEN-FILES
     1283   OTHER-PROCEDURES
      543   PASS . . . . . . . . . . . . .  P1259
      547   PRINT-DETAIL . . . . . . . . .  P1260 P1269 P1278
      751   PROC-000-ALTER-B . . . . . . .  G750
      745   PROC-000-ALTER-DELETE-1
      765   PROC-000-ALTER-DELETE-3
      771   PROC-000-ALTER-H . . . . . . .  G770
      929   PROC-000-DELETE-08
      790   PROC-000-EXIT-DELETE-1
      625   PROC-000-GO--DELETE-1
      645   PROC-000-GO--DELETE-2
      704   PROC-000-GO--DELETE-3
      719   PROC-000-GO--DELETE-4
      728   PROC-000-GO--NUC-FAIL-4. . . .  D716 G718
      700   PROC-000-GO--TEST-3A
     1284   PROC-000-NUCLEUS-FAILURE . . .  P627 P648 P658 P665 P674 P683 P693 P702 P706 P721 P732 P747 P753 P767 P773 P779
                                            P792 P807 P811 P822 P833 P838 P850 P854 P865 P869 P880 P884 P895 P907 P931 P937
                                            P961 P967 P1001 P1007 P1043 P1049 P1091 P1097 P1122 P1129 P1140 P1144 P1155 P1162
                                            P1167 P1186 P1206 P1212 P1373 P1393 P1404 P1414 P1428 P1444
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    33
0 Defined   Cross-reference of procedures   References

0    1160   PROC-000-PFM-C-15
     1371   PROC-000-PFM-D
     1165   PROC-000-PFM-D-15. . . . . . .  G1175 G1182
     1204   PROC-000-PFM-DELETE-LAST
      959   PROC-000-PFM-DELETE-09
      809   PROC-000-PFM-DELETE-1
      999   PROC-000-PFM-DELETE-10
     1041   PROC-000-PFM-DELETE-11
     1089   PROC-000-PFM-DELETE-12
     1120   PROC-000-PFM-DELETE-13
     1142   PROC-000-PFM-DELETE-14
     1153   PROC-000-PFM-DELETE-15
      820   PROC-000-PFM-DELETE-2
      852   PROC-000-PFM-DELETE-3
      867   PROC-000-PFM-DELETE-4
      882   PROC-000-PFM-DELETE-5
      893   PROC-000-PFM-DELETE-6
      905   PROC-000-PFM-DELETE-7
     1173   PROC-000-PFM-F-15
     1391   PROC-000-PFM-I
     1180   PROC-000-PFM-I-15
     1183   PROC-000-PFM-J-15
     1402   PROC-000-PFM-K
     1184   PROC-000-PFM-K-15
     1412   PROC-000-PFM-M
     1208   PROC-000-PFM-NUC-FAIL-LST. . .  G1203
      933   PROC-000-PFM-NUC-FAIL-08 . . .  G928
      963   PROC-000-PFM-NUC-FAIL-09 . . .  G958
     1003   PROC-000-PFM-NUC-FAIL-10 . . .  G998
     1045   PROC-000-PFM-NUC-FAIL-11 . . .  G1040
     1093   PROC-000-PFM-NUC-FAIL-12 . . .  G1088
     1124   PROC-000-PFM-NUC-FAIL-13 . . .  G1119
     1425   PROC-000-PFM-Q
     1426   PROC-000-PFM-R
     1432   PROC-000-PFM-S
     1435   PROC-000-PFM-T
      621   PROC-001-BEGIN-TESTS
      622   PROC-002-GO--TEST-1
      629   PROC-003-GO--WRITE-1 . . . . .  G624 G628
      633   PROC-004-GO--INIT-2
      650   PROC-005-GO--A . . . . . . . .  G644
      661   PROC-005-GO--B . . . . . . . .  D641
      670   PROC-005-GO--C . . . . . . . .  D643
      679   PROC-005-GO--D . . . . . . . .  D642
      688   PROC-005-GO--E . . . . . . . .  G657
      638   PROC-005-GO--TEST-2. . . . . .  G655 G660 G667 G669 G676 G678 G685 G687
      694   PROC-016-GO--WRITE-2 . . . . .  G649 G692
      697   PROC-017-GO--TEST-3
      708   PROC-018-GO--PASS-3. . . . . .  G699
      709   PROC-019-GO--WRITE-3 . . . . .  G703 G707
      713   PROC-020-GO--TEST-4
      723   PROC-021-GO--PASS-4. . . . . .  D715
      724   PROC-022-GO--PAS-4
      733   PROC-023-GO--WRITE-4 . . . . .  G722 G727
      737   PROC-024-ALTER-INIT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    34
0 Defined   Cross-reference of procedures   References

0     740   PROC-025-ALTER-TEST-1
      749   PROC-026-ALTER-A . . . . . . .  A742 G744
      755   PROC-027-ALTER-C . . . . . . .  T742
      757   PROC-028-ALTER-WRITE-1 . . . .  G748 G754
      760   PROC-030-ALTER-TEST-3
      769   PROC-031-ALTER-G . . . . . . .  A762 G764 A781 G783
      775   PROC-032-ALTER-I . . . . . . .  T762
      784   PROC-032-ALTER-WRITE-3 . . . .  G768 G774 G780 T781
      787   PROC-037-EXIT-TEST-1
      794   PROC-038-EXIT-CHECK-1. . . . .  G789
      796   PROC-039-EXIT-WRITE-1. . . . .  G793
      800   PROC-040-PFM-TEST-1
      824   PROC-041-PFM-A . . . . . . . .  P803 G819
      812   PROC-042-PFM-WRITE-1 . . . . .  G808
      816   PROC-043-PFM-TEST-2. . . . . .  G834
      830   PROC-045-PFM-B
      839   PROC-046-PFM-WRITE-2 . . . . .  G823
      843   PROC-047-PFM-TEST-3
     1368   PROC-048-PFM-C . . . . . . . .  P845 P846
      855   PROC-048-PFM-WRITE-3 . . . . .  G851
      859   PROC-055-PFM-TEST-4. . . . . .  G1374
     1377   PROC-056-PFM-E . . . . . . . .  P861
     1383   PROC-057-PFM-F . . . . . . . .  P1380
     1386   PROC-058-PFM-G . . . . . . . .  E1380
     1389   PROC-059-PFM-H . . . . . . . .  E861 G1382
      870   PROC-060-PFM-WRITE-4 . . . . .  G866 G1394
      874   PROC-061-PFM-TEST-5
     1397   PROC-062-PFM-J . . . . . . . .  P876
     1408   PROC-063-PFM-L . . . . . . . .  P1400
      885   PROC-064-PFM-WRITE-5 . . . . .  G881 G1405 G1415
      889   PROC-065-PFM-TEST-6
     1418   PROC-066-PFM-N . . . . . . . .  P891
     1419   PROC-067-PFM-O
     1422   PROC-068-PFM-P
      896   PROC-069-PFM-WRITE-6 . . . . .  G892 G1429
      900   PROC-070-PFM-TEST-7
     1445   PROC-071-PFM-V . . . . . . . .  P902
     1446   PROC-072-PFM-W
     1447   PROC-073-PFM-X
     1448   PROC-074-PFM-Y
     1449   PROC-075-PFM-Z . . . . . . . .  E902
      908   PROC-096-PFM-WRITE-7 . . . . .  G904
      919   PROC-097-PFM-A-8 . . . . . . .  P917
      912   PROC-097-PFM-TEST-08
      923   PROC-097-PFM-TESTT-8
      920   PROC-098-PFM-B-8 . . . . . . .  P915
      924   PROC-098-PFM-TESTTT-8
      938   PROC-105-PFM-WRITE-08. . . . .  G927 G932
      949   PROC-106-PFM-A-9 . . . . . . .  P947
      942   PROC-106-PFM-TEST-09
      953   PROC-106-PFM-TESTT-9
      950   PROC-107-PFM-B-9 . . . . . . .  P945
      954   PROC-107-PFM-TESTTT-9
      968   PROC-116-PFM-WRITE-09. . . . .  G957 G962
      987   PROC-117-PFM-A-10. . . . . . .  P978 P981
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    35
0 Defined   Cross-reference of procedures   References

0     972   PROC-117-PFM-TEST-10
      988   PROC-118-PFM-B-10. . . . . . .  P975 P984
      990   PROC-119-PFM-C-10. . . . . . .  E978 E984
      991   PROC-120-PFM-D-10. . . . . . .  E975 E981
      993   PROC-121-PFM-TESTT-10
      994   PROC-122-PFM-TESTTT-10
     1008   PROC-138-PFM-WRITE-10. . . . .  G997 G1002
     1027   PROC-139-PFM-A-11. . . . . . .  P1018 P1021
     1031   PROC-139-PFM-C-11. . . . . . .  E1018 E1024
     1012   PROC-139-PFM-TEST-11
     1035   PROC-139-PFM-TESTT-11
     1028   PROC-140-PFM-B-11. . . . . . .  P1015 P1024
     1032   PROC-140-PFM-D-11. . . . . . .  E1015 E1021
     1036   PROC-140-PFM-TESTTT-11
     1050   PROC-168-PFM-WRITE-11. . . . .  G1039 G1044
     1054   PROC-169-PFM-TEST-12
     1061   PROC-170-PFM-A-12. . . . . . .  P1058
     1066   PROC-171-PFM-B-12. . . . . . .  P1064
     1071   PROC-172-PFM-C-12. . . . . . .  P1069
     1076   PROC-173-PFM-D-12. . . . . . .  P1074
     1081   PROC-174-PFM-E-12. . . . . . .  P1079
     1084   PROC-175-PFM-TESTT-12. . . . .  G1060
     1098   PROC-176-PFM-WRITE-12. . . . .  G1087 G1092
     1113   PROC-177-PFM-B-13. . . . . . .  E1105 E1108
     1102   PROC-177-PFM-TEST-13
     1110   PROC-178-PFM-A-13. . . . . . .  P1105 P1108
     1115   PROC-178-PFM-TESTT-13
     1130   PROC-187-PFM-WRITE-13. . . . .  G1118 G1123
     1133   PROC-188-PFM-TEST-14
     1364   PROC-189-A101. . . . . . . . .  P1135
     1360   PROC-190-A102. . . . . . . . .  P1367
     1356   PROC-191-A103. . . . . . . . .  P1363
     1352   PROC-192-A104. . . . . . . . .  P1359
     1348   PROC-193-A105. . . . . . . . .  P1355
     1344   PROC-194-A106. . . . . . . . .  P1351
     1340   PROC-195-A107. . . . . . . . .  P1347
     1336   PROC-196-A108. . . . . . . . .  P1343
     1332   PROC-197-A109. . . . . . . . .  P1339
     1328   PROC-198-A110. . . . . . . . .  P1335
     1324   PROC-199-A111. . . . . . . . .  P1331
     1320   PROC-200-A112. . . . . . . . .  P1327
     1316   PROC-201-A113. . . . . . . . .  P1323
     1312   PROC-202-A114. . . . . . . . .  P1319
     1308   PROC-203-A115. . . . . . . . .  P1315
     1304   PROC-204-A116. . . . . . . . .  P1311
     1300   PROC-205-A117. . . . . . . . .  P1307
     1296   PROC-206-A118. . . . . . . . .  P1303
     1292   PROC-207-A119. . . . . . . . .  P1299
     1288   PROC-208-A120. . . . . . . . .  P1295
     1286   PROC-209-A121. . . . . . . . .  P1291
     1145   PROC-210-PFM-WRITE-14. . . . .  G1137 G1141
     1148   PROC-211-PFM-A-15
     1149   PROC-212-PFM-TEST-15
     1176   PROC-213-PFM-G-15. . . . . . .  P1151
     1177   PROC-214-PFM-H-15
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    36
0 Defined   Cross-reference of procedures   References

0    1170   PROC-215-PFM-E-15. . . . . . .  G1179
     1189   PROC-216-PFM-L-15. . . . . . .  G1172
     1157   PROC-217-PFM-B-15. . . . . . .  E1151 G1191
     1192   PROC-218-PFM-WRITE-15. . . . .  G1152 G1156 G1164 G1169 G1188
     1196   PROC-219-PFM-TEST-LAST
     1438   PROC-220-PFM-U . . . . . . . .  P1199
     1213   PROC-227-PFM-WRITE-LAST. . . .  G1202 G1207
     1233   STACK-EMPTY. . . . . . . . . .  G1230
     1274   STACK-GT-CORRECT . . . . . . .  G1247 G1253
      540   TERMINATE-CALL
      538   TERMINATE-CCVS
      598   WRITE-LINE . . . . . . . . . .  P551 P557 P558 P559 P561 P563 P564 P566 P568 P577 P585 P591 P596 P597 P1217 P1236
                                            P1238 P1240
      611   WRT-LN . . . . . . . . . . . .  P604 P605 P607 P610
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    37
0 Defined   Cross-reference of programs     References

        3   DB105A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB105A    Date 06/04/2022  Time 12:00:17   Page    38
0LineID  Message code  Message text

     91  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

     93  IGYGR1174-S   "XXXXX084" was not defined as a data-name.  "XXXXX084" was discarded.

   1151  IGYPA3086-W   "PERFORM" start-of-range "PROC-213-PFM-G-15" follows the "PERFORM" end-of-range "PROC-217-PFM-B-15".  The
                       "PERFORM" end-of-range may be unreachable.  The statement was processed as written.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           1              1                   1
-* Statistics for COBOL program DB105A:
 *    Source records = 1452
 *    Data Division statements = 98
 *    Procedure Division statements = 725
 *    Generated COBOL statements = 0
 *    Program complexity factor = 733
0End of compilation 1,  program DB105A,  highest severity 12.
0Return code 12
