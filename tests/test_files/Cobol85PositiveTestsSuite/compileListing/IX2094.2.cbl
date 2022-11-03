1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:52   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:52   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2094.2
   000002         000200 PROGRAM-ID.                                                      IX2094.2
   000003         000300     IX209A.                                                      IX2094.2
   000004         000500*                                                              *  IX2094.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2094.2
   000006         000700*                                                              *  IX2094.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2094.2
   000008         000900*                                                              *  IX2094.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2094.2
   000010         001100*                                                              *  IX2094.2
   000011         001300*                                                              *  IX2094.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2094.2
   000013         001500*                                                              *  IX2094.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2094.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2094.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2094.2
   000017         001900*                                                              *  IX2094.2
   000018         002100*         "IX209A"                                                IX2094.2
   000019         002300*    THE PURPOSE OF THIS PROGRAM IS TO TEST USE OF THE            IX2094.2
   000020         002400*    START --- EQUAL TO --- STATEMENT USING FIRST THE PRIME       IX2094.2
   000021         002500*    RECORD KEY AND THEN WITH EACH OF THE ALTERNATE RECORD KEYS   IX2094.2
   000022         002600*    AS THE KEY OF REFERENCE.   THE START STATEMENT NAMES,        IX2094.2
   000023         002700*    IN ITS CONSTRUCT , EITHER THE DATA NAME SPECIFIED IN THE     IX2094.2
   000024         002800*    KEY CLAUSE OR A DATA ITEM THAT IS SUBORDINATE TO THE         IX2094.2
   000025         002900*    KEY NAME.   DIFFERENT KEY VALUES ARE USED FOR TESTING.       IX2094.2
   000026         003000*    IF A KEY VALUE IS PROVIDED WHICH MATCHES A RECORD IN THE FILEIX2094.2
   000027         003100*    WHEN THE START IS EXECUTED THEN THE RECORD IS EXPECTED TO    IX2094.2
   000028         003200*    MADE AVAILABLE BY THE SUBSEQUENT READ STATEMENT.  IF A KEY   IX2094.2
   000029         003300*    VALUE IS PROVIDED WHICH DOES NOT  MATCH ANY RECORD IN THE    IX2094.2
   000030         003400*    FILE THEN THE INVALID KEY PATH IS EXPECTED TO BE TAKEN.      IX2094.2
   000031         003500*    THE FILE STATUS CONTENTS RESULTING FROM EXECUTION OF THE     IX2094.2
   000032         003600*    START TESTS ARE SAVED AND CHECKED IN LATER TESTS.            IX2094.2
   000033         003700*                                                                 IX2094.2
   000034         003800*            REFERENCE   AMERICAN NATIONAL STANDARD               IX2094.2
   000035         003900*                        PROGRAMMING LANGUAGE COBOL, X3.23-198X.  IX2094.2
   000036         004000*                        SECTION IX, INDEX I-O, THE START         IX2094.2
   000037         004100*                        STATEMENT. PARAGRAPHS 4.7.3 (3), (4);    IX2094.2
   000038         004200*                                              4.7.4 (1), (4), (5)IX2094.2
   000039         004300*                                                        AND      IX2094.2
   000040         004400*                        THE FILE STATUS PARAGRAPH 1.3.4          IX2094.2
   000041         004500*                                                                 IX2094.2
   000042         004600*    BEFORE EXECUTION OF THE START IN EACH TEST, A RECORD IS MADE IX2094.2
   000043         004700*    AVAILABLE FROM THE FILE THAT IS DIFFERENT THAN WILL RESULT   IX2094.2
   000044         004800*    FROM THE TEST, AND THE RECORD KEY IS LOADED WITH A KEY VALUE.IX2094.2
   000045         004900*    DEPENDING ON THE NATURE OF THE TEST THE KEY VALUE MAY OR     IX2094.2
   000046         005000*    MAY NOT BE A VALID KEY FOR THE FILE.                         IX2094.2
   000047         005100*                                                                 IX2094.2
   000048         005200*    THIS PROGRAM FIRST CREATES AN  INDEXED SEQUENTIAL FILE       IX2094.2
   000049         005300*    CONTAINING TWO ALTERNATE KEYS AND  THE ONE REQUIRED RECORD   IX2094.2
   000050         005400*    KEY FOR THE FILE.  IMMEDIATELY FOLLOWING FILE CREATION THE   IX2094.2
   000051         005500*    FILE IS READ AND THE RECORDS OF THE FILE VERIFIED FOR        IX2094.2
   000052         005600*    ACCURACY.  NEXT THE TESTS ARE EXECUTED USING THE START ---   IX2094.2
   000053         005700*    EQUAL TO --- STATEMENT.                                      IX2094.2
   000054         005800*    THE RECORDS IN THE FILE ARE CREATED IN SEQUENTIAL ORDER BY   IX2094.2
   000055         005900*    RECORD KEY VALUE.  FOLLOWING  IS A SAMPLE OF THE DATA        IX2094.2
   000056         006000*    CONTENTS FOR THE RECORD KEY AND TWO ALTERNATE RECORD KEYS IN IX2094.2
   000057         006100*    THE FILE.                                                    IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200*                                                                 IX2094.2
   000059         006300*   REC-NO  RECORD-KEY      ALTERNATE-KEY-1     ALTERNATE-KEY-2   IX2094.2
   000060         006400*   ------  ----------      ---------------     ---------------   IX2094.2
   000061         006500*    001   BBBBBBBBBC002 EEEEEEEEEF000ALTKEY1 WWWWWWWWWV398ALTKEY2IX2094.2
   000062         006600*    002   BBBBBBBBCC004 EEEEEEEEFF004ALTKEY1 WWWWWWWWVV396ALTKEY2IX2094.2
   000063         006700*    003   BBBBBBBCCC006 EEEEEEEFFF006ALTKEY1 WWWWWWWVVV394ALTKEY2IX2094.2
   000064         006800*     .          .                 .                    .         IX2094.2
   000065         006900*     .          .                 .                    .         IX2094.2
   000066         007000*     .          .                 .                    .         IX2094.2
   000067         007100*    010   CCCCCCCCCC020 FFFFFFFFFF020ALTKEY1 VVVVVVVVVV380ALTKEY2IX2094.2
   000068         007200*    011   CCCCCCCCCD022 FFFFFFFFFG022ALTKEY1 VVVVVVVVVV380ALTKEY2IX2094.2
   000069         007300*    012   CCCCCCCCDD024 FFFFFFFFGG024ALTKEY1 VVVVVVVVUU376ALTKEY2IX2094.2
   000070         007400*     .          .                 .                    .         IX2094.2
   000071         007500*     .          .                 .                    .         IX2094.2
   000072         007600*     .          .                 .                    .         IX2094.2
   000073         007700*    200   UUUUUUUUUU400 YYYYYYYYYY400ALTKEY1 DDDDDDDDDD000ALTKEY2IX2094.2
   000074         007800*                                                                 IX2094.2
   000075         007900*     NOTE 1 - ALTERNATE KEY NUMBER 2 CONTAINS DUPLICATE KEYS     IX2094.2
   000076         008000*              EVERY 10TH AND 11TH RECORDS.                       IX2094.2
   000077         008100*                                                                 IX2094.2
   000078         008200*     NOTE 2 - THE FIRST 50 RECORDS AND LAST 25 RECORDS OF THE    IX2094.2
   000079         008300*    FILE FOLLOW THE ABOVE SEQUENTIAL KEY PATTERN.  FOR THE MIDDLEIX2094.2
   000080         008400*    125 RECORDS ONLY THE NUMBER PART OF THE KEYS ARE VARIED      IX2094.2
   000081         008500*    AND VARIED IN THE SEQUENCE SHOWN ABOVE.  THAT IS, RECORD-KEY IX2094.2
   000082         008600*    AND ALTERNATE-KEY-1 ARE INCREMENTED BY 2 AND THE ALTERNATE-  IX2094.2
   000083         008700*    KEY-2 IS DECREMENTED BY 2 EACH TIME A RECORD IS WRITTEN TO   IX2094.2
   000084         008800*    THE FILE.  THE FILE IS DESIGNED TO BE LARGE ENOUGH SO THAT   IX2094.2
   000085         008900*    AN I-O OPERATION IS REQUIRED FOR EACH RECORD ACCESSED FROM   IX2094.2
   000086         009000*    THE FILE.                                                    IX2094.2
   000087         009100*                                                                 IX2094.2
   000088         009200*    FILE CHARACTERISTICS ARE: FILE SIZE            = 200 RECORDS IX2094.2
   000089         009300*                              RECORD SIZE          = 240 CHARS.  IX2094.2
   000090         009400*                              RECORD KEY SIZE      = 13  CHARS.  IX2094.2
   000091         009500*                              ALTERNATE KEY 1 SIZE = 20  CHARS.  IX2094.2
   000092         009600*                              ALTERNATE KEY 2 SIZE = 20  CHARS.  IX2094.2
   000093         009700*                              ACCESS MODE          = SEQUENTIAL  IX2094.2
   000094         009800*                                                                 IX2094.2
   000095         009900*    A LIST OF COBOL ELEMENTS WITH THE PARAGRAPH NAME IN PARENTH- IX2094.2
   000096         010000*    ESIS THAT TESTS THE ELEMENT AND A SHORT DESCRIPTION OF THE   IX2094.2
   000097         010100*    TEST FOLLOWS.                                                IX2094.2
   000098         010200*                                                                 IX2094.2
   000099         010300*      WRITE --- INVALID KEY---. (INX-TEST-001) - THIS TEST CREATEIX2094.2
   000100         010400*            A FILE OF 200 RECORDS CONTAINING ONE RECORD KEY AND  IX2094.2
   000101         010500*            TWO ALTERNATE KEYS.                                  IX2094.2
   000102         010600*      READ ---AT END ---. (INX-TEST-002) - THIS TEST READS THE   IX2094.2
   000103         010700*            FILE CREATED IN INX-TEST-001 AND VERIFIES THAT   THE IX2094.2
   000104         010800*            FILE WAS CREATED CORRECTLY.                          IX2094.2
   000105         010900*      START --- KEY IS EQUAL TO RECORD-KEY INVALID KEY ---. (INX-IX2094.2
   000106         011000*            TEST-003.01 THRU INX-TEST-003.04) - THE START        IX2094.2
   000107         011100*            STATEMENT IS EXECUTED USING THE RECORD-KEY FOR THE   IX2094.2
   000108         011200*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000109         011300*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2094.2
   000110         011400*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2094.2
   000111         011500*            (.03) AND GREATER THAN THAN THE LAST RECORD IN THE   IX2094.2
   000112         011600*            FILE (.04).                                          IX2094.2
   000113         011700*      START --- KEY IS EQUAL TO DATA-ITEM  INVALID KEY ---. (INX-IX2094.2
   000114         011800*            TEST-003.05 THRU INX-TEST-003.09) - THE START        IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011900*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2094.2
   000116         012000*            SUBORDINATE TO  THE RECORD-KEY NAME OF THE FILE      IX2094.2
   000117         012100*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000118         012200*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2094.2
   000119         012300*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2094.2
   000120         012400*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2094.2
   000121         012500*            THE FIRST RECORD IN THE FILE (.08) AND GREATER THAN  IX2094.2
   000122         012600*            THE LAST RECORD IN THE FILE (.09.                    IX2094.2
   000123         012700*      FILE STATUS. (INX-TEST-004.01 THRU INX-TEST-004.09) - THESEIX2094.2
   000124         012800*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2094.2
   000125         012900*            FROM THE START IN INX-TEST-003.01 THRU               IX2094.2
   000126         013000*            INX-TEST-003.09.                                     IX2094.2
   000127         013100*      START --- KEY IS EQUAL TO ALTNATE-KEY INVALID KEY --. (INX-IX2094.2
   000128         013200*            TEST-005.01 THRU INX-TEST-005.04) - THE START        IX2094.2
   000129         013300*            STATEMENT IS EXECUTED USING THE ALTERNATE-KEY FOR THEIX2094.2
   000130         013400*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000131         013500*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2094.2
   000132         013600*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2094.2
   000133         013700*            (.03) AND GREATER THAN THAN THE LAST RECORD IN THE   IX2094.2
   000134         013800*            FILE (.04).                                          IX2094.2
   000135         013900*      START --- KEY IS EQUAL TO DATA-ITEM  INVALID KEY ---. (INX-IX2094.2
   000136         014000*            TEST-005.05 THRU INX-TEST-005.09) - THE START        IX2094.2
   000137         014100*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2094.2
   000138         014200*            SUBORDINATE TO THE ALTERNATE-KEY NAME OF THE FILE    IX2094.2
   000139         014300*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000140         014400*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2094.2
   000141         014500*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2094.2
   000142         014600*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2094.2
   000143         014700*            THE FIRST RECORD IN THE FILE (.08) AND GREATER THAN  IX2094.2
   000144         014800*            THE LAST RECORD IN THE FILE (.09.                    IX2094.2
   000145         014900*      FILE STATUS. (INX-TEST-006.01 THRU INX-TEST-006.09) - THESEIX2094.2
   000146         015000*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2094.2
   000147         015100*            FROM THE START IN INX-TEST-005.01 THRU               IX2094.2
   000148         015200*            INX-TEST-005.09.                                     IX2094.2
   000149         015300*      START --- KEY IS EQUAL TO ALTNATE-KEY INVALID KEY --. (INX-IX2094.2
   000150         015400*            TEST-007.01 THRU INX-TEST-007.04) - THE START        IX2094.2
   000151         015500*            STATEMENT IS EXECUTED USING THE ALTERNATE-KEY        IX2094.2
   000152         015600*            WHICH SPECIFIES THE DUPLICATES OPTION FOR THE FILE   IX2094.2
   000153         015700*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000154         015800*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2094.2
   000155         015900*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2094.2
   000156         016000*            (.03) AND GREATER THAN THAN THE LAST RECORD IN THE   IX2094.2
   000157         016100*            FILE (.04).                                          IX2094.2
   000158         016200*      START --- KEY IS EQUAL TO DATA-ITEM  INVALID KEY ---. (INX-IX2094.2
   000159         016300*            TEST-007.05 THRU INX-TEST-007.09) - THE START        IX2094.2
   000160         016400*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2094.2
   000161         016500*            SUBORDINATE TO THE ALTERNATE-KEY W/DUP FOR THE FILE  IX2094.2
   000162         016600*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2094.2
   000163         016700*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2094.2
   000164         016800*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2094.2
   000165         016900*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2094.2
   000166         017000*            THE FIRST RECORD IN THE FILE (.08) AND GREATER THAN  IX2094.2
   000167         017100*            THE LAST RECORD IN THE FILE (.09.                    IX2094.2
   000168         017200*      FILE STATUS. (INX-TEST-008.01 THRU INX-TEST-008.09) - THESEIX2094.2
   000169         017300*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2094.2
   000170         017400*            FROM THE START IN INX-TEST-007.01 THRU               IX2094.2
   000171         017500*            INX-TEST-007.09.                                     IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000172         017600*                                                                 IX2094.2
   000173         017800 ENVIRONMENT DIVISION.                                            IX2094.2
   000174         017900 CONFIGURATION SECTION.                                           IX2094.2
   000175         018000 SOURCE-COMPUTER.                                                 IX2094.2
   000176         018100     XXXXX082.                                                    IX2094.2
   000177         018200 OBJECT-COMPUTER.                                                 IX2094.2
   000178         018300     XXXXX083.                                                    IX2094.2
   000179         018400 INPUT-OUTPUT SECTION.                                            IX2094.2
   000180         018500 FILE-CONTROL.                                                    IX2094.2
   000181         018600     SELECT RAW-DATA   ASSIGN TO                                  IX2094.2 201
   000182         018700     XXXXX062                                                     IX2094.2
   000183         018800            ORGANIZATION IS INDEXED                               IX2094.2
   000184         018900            ACCESS MODE IS RANDOM                                 IX2094.2
   000185         019000            RECORD KEY IS RAW-DATA-KEY.                           IX2094.2 204
   000186         019100     SELECT PRINT-FILE ASSIGN TO                                  IX2094.2 216
   000187         019200     XXXXX055.                                                    IX2094.2
   000188         019300     SELECT  IX-FS1                                               IX2094.2 219
   000189         019400     ASSIGN TO                                                    IX2094.2
   000190         019500     XXXXX024                                                     IX2094.2
   000191         019600     XXXXX044                                                     IX2094.2

 ==000191==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000192         019700        ACCESS MODE IS SEQUENTIAL                                 IX2094.2
   000193         019800        ORGANIZATION IS INDEXED                                   IX2094.2
   000194         019900        RECORD KEY IS IX-FS1-KEY                                  IX2094.2 228
   000195         020000        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY1                    IX2094.2 236
   000196         020100        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY2 WITH DUPLICATES    IX2094.2 245
   000197         020200        FILE STATUS IS FS1-STATUS.                                IX2094.2 276
   000198         020300 DATA DIVISION.                                                   IX2094.2
   000199         020400 FILE SECTION.                                                    IX2094.2
   000200         020500                                                                  IX2094.2
   000201         020600 FD  RAW-DATA.                                                    IX2094.2
   000202         020700                                                                  IX2094.2
   000203         020800 01  RAW-DATA-SATZ.                                               IX2094.2
   000204         020900     05  RAW-DATA-KEY        PIC X(6).                            IX2094.2
   000205         021000     05  C-DATE              PIC 9(6).                            IX2094.2
   000206         021100     05  C-TIME              PIC 9(8).                            IX2094.2
   000207         021200     05  C-NO-OF-TESTS       PIC 99.                              IX2094.2
   000208         021300     05  C-OK                PIC 999.                             IX2094.2
   000209         021400     05  C-ALL               PIC 999.                             IX2094.2
   000210         021500     05  C-FAIL              PIC 999.                             IX2094.2
   000211         021600     05  C-DELETED           PIC 999.                             IX2094.2
   000212         021700     05  C-INSPECT           PIC 999.                             IX2094.2
   000213         021800     05  C-NOTE              PIC X(13).                           IX2094.2
   000214         021900     05  C-INDENT            PIC X.                               IX2094.2
   000215         022000     05  C-ABORT             PIC X(8).                            IX2094.2
   000216         022100 FD  PRINT-FILE.                                                  IX2094.2

 ==000216==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000217         022200 01  PRINT-REC PICTURE X(120).                                    IX2094.2
   000218         022300 01  DUMMY-RECORD PICTURE X(120).                                 IX2094.2
   000219         022400 FD  IX-FS1                                                       IX2094.2

 ==000219==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   000220         022500     LABEL RECORDS ARE STANDARD                                   IX2094.2
   000221         022600     DATA RECORD IS IX-FS1R1-F-G-240                              IX2094.2 *
   000222         022700     RECORD CONTAINS 240 CHARACTERS.                              IX2094.2
   000223         022800 01  IX-FS1R1-F-G-240.                                            IX2094.2
   000224         022900     05 IX-FS1-REC-120           PICTURE X(120).                  IX2094.2
   000225         023000     05 IX-FS1-REC-121-240.                                       IX2094.2
   000226         023100        10 FILLER                PICTURE X(8).                    IX2094.2
   000227         023200        10 IX-REC-KEY-AREA.                                       IX2094.2
   000228         023300           15 IX-FS1-KEY.                                         IX2094.2
   000229         023400              20 IX-FS1-KEY-1-10.                                 IX2094.2
   000230         023500                 25 IX-FS1-KEY-1-5      PICTURE X(5).             IX2094.2
   000231         023600                 25 IX-FS1-KEY-6-10     PICTURE X(5).             IX2094.2
   000232         023700               20 IX-FS1-KEY-11-13      PICTURE X(3).             IX2094.2
   000233         023800           15 FILLER             PICTURE X(16).                   IX2094.2
   000234         023900        10 FILLER                PICTURE X(9).                    IX2094.2
   000235         024000        10 IX-ALT-KEY1-AREA.                                      IX2094.2
   000236         024100           15 IX-FS1-ALTKEY1.                                     IX2094.2
   000237         024200              20 IX-FS1-ALTKEY1-1-10.                             IX2094.2
   000238         024300                 25 IX-FS1-ALTKEY1-1-5  PICTURE X(5).             IX2094.2
   000239         024400                 25 IX-FS1-ALTKEY1-6-10 PICTURE X(5).             IX2094.2
   000240         024500              20 IX-FS1-ALTKEY1-11-13   PICTURE X(3).             IX2094.2
   000241         024600              20 IX-FS1-ALTKEY1-14-20   PICTURE X(7).             IX2094.2
   000242         024700           15 FILLER             PICTURE X(9).                    IX2094.2
   000243         024800        10 FILLER                PICTURE X(9).                    IX2094.2
   000244         024900        10 IX-ALT-KEY2-AREA.                                      IX2094.2
   000245         025000           15 IX-FS1-ALTKEY2.                                     IX2094.2
   000246         025100              20 IX-FS1-ALTKEY2-1-10.                             IX2094.2
   000247         025200                 25 IX-FS1-ALTKEY2-1-5  PICTURE X(5).             IX2094.2
   000248         025300                 25 IX-FS1-ALTKEY2-6-10 PICTURE X(5).             IX2094.2
   000249         025400              20 IX-FS1-ALTKEY2-11-13   PICTURE X(3).             IX2094.2
   000250         025500              20 IX-FS1-ALTKEY2-14-20   PICTURE X(7).             IX2094.2
   000251         025600           15 FILLER             PICTURE X(9).                    IX2094.2
   000252         025700        10 FILLER                PICTURE X(7).                    IX2094.2
   000253         025800 WORKING-STORAGE SECTION.                                         IX2094.2
   000254         025900 01  WRK-FS1-RECKEY.                                              IX2094.2
   000255         026000     05 FS1-RECKEY-1-13.                                          IX2094.2
   000256         026100        10 FS1-RECKEY-1-10       PICTURE X(10).                   IX2094.2
   000257         026200        10 FS1-RECKEY-11-13      PICTURE 9(3).                    IX2094.2
   000258         026300     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX2094.2 IMP
   000259         026400 01  WRK-FS1-ALTKEY1.                                             IX2094.2
   000260         026500      05 FS1-ALTKEY1-1-20.                                        IX2094.2
   000261         026600       10  FS1-ALTKEY1-1-10.                                      IX2094.2
   000262         026700        15 FS1-ALTKEY1-1-5       PICTURE X(5).                    IX2094.2
   000263         026800        15 FS1-ALTKEY1-6-10      PICTURE X(5).                    IX2094.2
   000264         026900       10 FS1-ALTKEY1-11-13      PICTURE 9(3).                    IX2094.2
   000265         027000       10 FS1-ALTKEY1-14-20      PICTURE X(7).                    IX2094.2
   000266         027100     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX2094.2 IMP
   000267         027200 01  WRK-FS1-ALTKEY2.                                             IX2094.2
   000268         027300     05 FS1-ALTKEY2-1-20.                                         IX2094.2
   000269         027400        10 FS1-ALTKEY2-1-10.                                      IX2094.2
   000270         027500           15 FS1-ALTKEY2-1-5    PICTURE X(5).                    IX2094.2
   000271         027600           15 FS1-ALTKEY2-6-10   PICTURE X(5).                    IX2094.2
   000272         027700        10 FS1-ALTKEY2-11-13     PICTURE 9(3).                    IX2094.2
   000273         027800        10 FS1-ALTKEY2-14-20     PICTURE X(7).                    IX2094.2
   000274         027900     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX2094.2 IMP
   000275         028000 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX2094.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         028100 01  FS1-STATUS                  PICTURE XX   VALUE SPACE.        IX2094.2 IMP
   000277         028200 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX2094.2 IMP
   000278         028300 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX2094.2
   000279         028400 01  INVKEY-COUNTER              PICTURE 9(3) COMPUTATIONAL.      IX2094.2
   000280         028500 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX2094.2
   000281         028600 01  RECKEY-NUM                  PICTURE 9(3).                    IX2094.2
   000282         028700 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX2094.2
   000283         028800 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX2094.2
   000284         028900 01  RECORD-KEY-CONTENT.                                          IX2094.2
   000285         029000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000286         029100          "BBBBBBBBBC002EEEEEEEEEF002ALTKEY1WWWWWWWWWV398ALTKEY2".IX2094.2
   000287         029200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000288         029300          "BBBBBBBBCC004EEEEEEEEFF004ALTKEY1WWWWWWWWVV396ALTKEY2".IX2094.2
   000289         029400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000290         029500          "BBBBBBBCCC006EEEEEEEFFF006ALTKEY1WWWWWWWVVV394ALTKEY2".IX2094.2
   000291         029600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000292         029700          "BBBBBBCCCC008EEEEEEFFFF008ALTKEY1WWWWWWVVVV392ALTKEY2".IX2094.2
   000293         029800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000294         029900          "BBBBBCCCCC010EEEEEFFFFF010ALTKEY1WWWWWVVVVV390ALTKEY2".IX2094.2
   000295         030000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000296         030100          "BBBBCCCCCC012EEEEFFFFFF012ALTKEY1WWWWVVVVVV388ALTKEY2".IX2094.2
   000297         030200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000298         030300          "BBBCCCCCCC014EEEFFFFFFF014ALTKEY1WWWVVVVVVV386ALTKEY2".IX2094.2
   000299         030400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000300         030500          "BBCCCCCCCC016EEFFFFFFFF016ALTKEY1WWVVVVVVVV384ALTKEY2".IX2094.2
   000301         030600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000302         030700          "BCCCCCCCCC018EFFFFFFFFF018ALTKEY1WVVVVVVVVV382ALTKEY2".IX2094.2
   000303         030800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000304         030900          "CCCCCCCCCC020FFFFFFFFFF020ALTKEY1VVVVVVVVVV380ALTKEY2".IX2094.2
   000305         031000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000306         031100          "CCCCCCCCCD022FFFFFFFFFG022ALTKEY1VVVVVVVVVV380ALTKEY2".IX2094.2
   000307         031200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000308         031300          "CCCCCCCCDD024FFFFFFFFGG024ALTKEY1VVVVVVVVUU376ALTKEY2".IX2094.2
   000309         031400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000310         031500          "CCCCCCCDDD026FFFFFFFGGG026ALTKEY1VVVVVVVUUU374ALTKEY2".IX2094.2
   000311         031600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000312         031700          "CCCCCCDDDD028FFFFFFGGGG028ALTKEY1VVVVVVUUUU372ALTKEY2".IX2094.2
   000313         031800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000314         031900          "CCCCCDDDDD030FFFFFGGGGG030ALTKEY1VVVVVUUUUU370ALTKEY2".IX2094.2
   000315         032000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000316         032100          "CCCCDDDDDD032FFFFGGGGGG032ALTKEY1VVVVUUUUUU368ALTKEY2".IX2094.2
   000317         032200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000318         032300          "CCCDDDDDDD034FFFGGGGGGG034ALTKEY1VVVUUUUUUU366ALTKEY2".IX2094.2
   000319         032400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000320         032500          "CCDDDDDDDD036FFGGGGGGGG036ALTKEY1VVUUUUUUUU364ALTKEY2".IX2094.2
   000321         032600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000322         032700          "CDDDDDDDDD038FGGGGGGGGG038ALTKEY1VUUUUUUUUU362ALTKEY2".IX2094.2
   000323         032800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000324         032900          "DDDDDDDDDD040GGGGGGGGGG040ALTKEY1UUUUUUUUUU360ALTKEY2".IX2094.2
   000325         033000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000326         033100          "DDDDDDDDDE042GGGGGGGGGH042ALTKEY1UUUUUUUUUU360ALTKEY2".IX2094.2
   000327         033200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000328         033300          "DDDDDDDDEE044GGGGGGGGHH044ALTKEY1UUUUUUUUTT356ALTKEY2".IX2094.2
   000329         033400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000330         033500          "DDDDDDDEEE046GGGGGGGHHH046ALTKEY1UUUUUUUTTT354ALTKEY2".IX2094.2
   000331         033600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000332         033700          "DDDDDDEEEE048GGGGGGHHHH048ALTKEY1UUUUUUTTTT352ALTKEY2".IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000334         033900          "DDDDDEEEEE050GGGGGHHHHH050ALTKEY1UUUUUTTTTT350ALTKEY2".IX2094.2
   000335         034000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000336         034100          "DDDDEEEEEE052GGGGHHHHHH052ALTKEY1UUUUTTTTTT348ALTKEY2".IX2094.2
   000337         034200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000338         034300          "DDDEEEEEEE054GGGHHHHHHH054ALTKEY1UUUTTTTTTT346ALTKEY2".IX2094.2
   000339         034400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000340         034500          "DDEEEEEEEE056GGHHHHHHHH056ALTKEY1UUTTTTTTTT344ALTKEY2".IX2094.2
   000341         034600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000342         034700          "DEEEEEEEEE058GHHHHHHHHH058ALTKEY1UTTTTTTTTT342ALTKEY2".IX2094.2
   000343         034800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000344         034900          "EEEEEEEEEE060HHHHHHHHHH060ALTKEY1TTTTTTTTTT340ALTKEY2".IX2094.2
   000345         035000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000346         035100          "EEEEEEEEEF062HHHHHHHHHI062ALTKEY1TTTTTTTTTT340ALTKEY2".IX2094.2
   000347         035200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000348         035300          "EEEEEEEEFF064HHHHHHHHII064ALTKEY1TTTTTTTTSS336ALTKEY2".IX2094.2
   000349         035400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000350         035500          "EEEEEEEFFF066HHHHHHHIII066ALTKEY1TTTTTTTSSS334ALTKEY2".IX2094.2
   000351         035600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000352         035700          "EEEEEEFFFF068HHHHHHIIII068ALTKEY1TTTTTTSSSS332ALTKEY2".IX2094.2
   000353         035800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000354         035900          "EEEEEFFFFF070HHHHHIIIII070ALTKEY1TTTTTSSSSS330ALTKEY2".IX2094.2
   000355         036000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000356         036100          "EEEEFFFFFF072HHHHIIIIII072ALTKEY1TTTTSSSSSS328ALTKEY2".IX2094.2
   000357         036200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000358         036300          "EEEFFFFFFF074HHHIIIIIII074ALTKEY1TTTSSSSSSS326ALTKEY2".IX2094.2
   000359         036400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000360         036500          "EEFFFFFFFF076HHIIIIIIII076ALTKEY1TTSSSSSSSS324ALTKEY2".IX2094.2
   000361         036600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000362         036700          "EFFFFFFFFF078HIIIIIIIII078ALTKEY1TSSSSSSSSS322ALTKEY2".IX2094.2
   000363         036800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000364         036900          "FFFFFFFFFF080IIIIIIIIII080ALTKEY1SSSSSSSSSS320ALTKEY2".IX2094.2
   000365         037000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000366         037100          "FFFFFFFFFG082IIIIIIIIIJ082ALTKEY1SSSSSSSSSS320ALTKEY2".IX2094.2
   000367         037200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000368         037300          "FFFFFFFFGG084IIIIIIIIJJ084ALTKEY1SSSSSSSSRR316ALTKEY2".IX2094.2
   000369         037400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000370         037500          "FFFFFFFGGG086IIIIIIIJJJ086ALTKEY1SSSSSSSRRR314ALTKEY2".IX2094.2
   000371         037600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000372         037700          "FFFFFFGGGG088IIIIIIJJJJ088ALTKEY1SSSSSSRRRR312ALTKEY2".IX2094.2
   000373         037800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000374         037900          "FFFFFGGGGG090IIIIIJJJJJ090ALTKEY1SSSSSRRRRR310ALTKEY2".IX2094.2
   000375         038000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000376         038100          "FFFFGGGGGG092IIIIJJJJJJ092ALTKEY1SSSSRRRRRR308ALTKEY2".IX2094.2
   000377         038200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000378         038300          "FFFGGGGGGG094IIIJJJJJJJ094ALTKEY1SSSRRRRRRR306ALTKEY2".IX2094.2
   000379         038400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000380         038500          "FFGGGGGGGG096IIJJJJJJJJ096ALTKEY1SSRRRRRRRR304ALTKEY2".IX2094.2
   000381         038600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000382         038700          "FGGGGGGGGG098IJJJJJJJJJ098ALTKEY1SRRRRRRRRR302ALTKEY2".IX2094.2
   000383         038800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000384         038900          "GGGGGGGGGG100JJJJJJJJJJ100ALTKEY1RRRRRRRRRR300ALTKEY2".IX2094.2
   000385         039000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000386         039100          "RRRRSSSSSS352VVVVWWWWWW352ALTKEY1GGGGFFFFFF048ALTKEY2".IX2094.2
   000387         039200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000388         039300          "RRRSSSSSSS354VVVWWWWWWW354ALTKEY1GGGFFFFFFF046ALTKEY2".IX2094.2
   000389         039400     05 FILLER PIC X(53) VALUE                                    IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039500          "RRSSSSSSSS356VVWWWWWWWW356ALTKEY1GGFFFFFFFF044ALTKEY2".IX2094.2
   000391         039600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000392         039700          "RSSSSSSSSS358VWWWWWWWWW358ALTKEY1GFFFFFFFFF042ALTKEY2".IX2094.2
   000393         039800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000394         039900          "SSSSSSSSSS360WWWWWWWWWW360ALTKEY1FFFFFFFFFF040ALTKEY2".IX2094.2
   000395         040000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000396         040100          "SSSSSSSSST362WWWWWWWWWX362ALTKEY1FFFFFFFFFF040ALTKEY2".IX2094.2
   000397         040200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000398         040300          "SSSSSSSSTT364WWWWWWWWXX364ALTKEY1FFFFFFFFEE036ALTKEY2".IX2094.2
   000399         040400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000400         040500          "SSSSSSSTTT366WWWWWWWXXX366ALTKEY1FFFFFFFEEE034ALTKEY2".IX2094.2
   000401         040600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000402         040700          "SSSSSSTTTT368WWWWWWXXXX368ALTKEY1FFFFFFEEEE032ALTKEY2".IX2094.2
   000403         040800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000404         040900          "SSSSSTTTTT370WWWWWXXXXX370ALTKEY1FFFFFEEEEE030ALTKEY2".IX2094.2
   000405         041000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000406         041100          "SSSSTTTTTT372WWWWXXXXXX372ALTKEY1FFFFEEEEEE028ALTKEY2".IX2094.2
   000407         041200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000408         041300          "SSSTTTTTTT374WWWXXXXXXX374ALTKEY1FFFEEEEEEE026ALTKEY2".IX2094.2
   000409         041400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000410         041500          "SSTTTTTTTT376WWXXXXXXXX376ALTKEY1FFEEEEEEEE024ALTKEY2".IX2094.2
   000411         041600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000412         041700          "STTTTTTTTT378WXXXXXXXXX378ALTKEY1FEEEEEEEEE022ALTKEY2".IX2094.2
   000413         041800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000414         041900          "TTTTTTTTTT380XXXXXXXXXX380ALTKEY1EEEEEEEEEE020ALTKEY2".IX2094.2
   000415         042000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000416         042100          "TTTTTTTTTU382XXXXXXXXXY382ALTKEY1EEEEEEEEEE020ALTKEY2".IX2094.2
   000417         042200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000418         042300          "TTTTTTTTUU384XXXXXXXXYY384ALTKEY1EEEEEEEEDD016ALTKEY2".IX2094.2
   000419         042400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000420         042500          "TTTTTTTUUU386XXXXXXXYYY386ALTKEY1EEEEEEEDDD014ALTKEY2".IX2094.2
   000421         042600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000422         042700          "TTTTTTUUUU388XXXXXXYYYY388ALTKEY1EEEEEEDDDD012ALTKEY2".IX2094.2
   000423         042800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000424         042900          "TTTTTUUUUU390XXXXXYYYYY390ALTKEY1EEEEEDDDDD010ALTKEY2".IX2094.2
   000425         043000     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000426         043100          "TTTTUUUUUU392XXXXYYYYYY392ALTKEY1EEEEDDDDDD008ALTKEY2".IX2094.2
   000427         043200     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000428         043300          "TTTUUUUUUU394XXXYYYYYYY394ALTKEY1EEEDDDDDDD006ALTKEY2".IX2094.2
   000429         043400     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000430         043500          "TTUUUUUUUU396XXYYYYYYYY396ALTKEY1EEDDDDDDDD004ALTKEY2".IX2094.2
   000431         043600     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000432         043700          "TUUUUUUUUU398XYYYYYYYYY398ALTKEY1EDDDDDDDDD002ALTKEY2".IX2094.2
   000433         043800     05 FILLER PIC X(53) VALUE                                    IX2094.2
   000434         043900          "UUUUUUUUUU400YYYYYYYYYY400ALTKEY1DDDDDDDDDD000ALTKEY2".IX2094.2
   000435         044000 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX2094.2 284
   000436         044100     05 KEY-VALUES                  OCCURS 75  TIMES.             IX2094.2
   000437         044200       10 RECKEY-VALUE           PICTURE X(13).                   IX2094.2
   000438         044300       10 ALTKEY1-VALUE          PICTURE X(20).                   IX2094.2
   000439         044400       10 ALTKEY2-VALUE          PICTURE X(20).                   IX2094.2
   000440         044500 01  INIT-FLAG                   PICTURE 9.                       IX2094.2
   000441         044600 01  HOLD-FILESTATUS-RECORD.                                      IX2094.2
   000442         044700     05 FILESTATUS               PICTURE XX  OCCURS 10 TIMES.     IX2094.2
   000443         044800 01  FILE-RECORD-INFORMATION-REC.                                 IX2094.2
   000444         044900     03 FILE-RECORD-INFO-SKELETON.                                IX2094.2
   000445         045000        05 FILLER                 PICTURE X(48)       VALUE       IX2094.2
   000446         045100             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045200        05 FILLER                 PICTURE X(46)       VALUE       IX2094.2
   000448         045300             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2094.2
   000449         045400        05 FILLER                 PICTURE X(26)       VALUE       IX2094.2
   000450         045500             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2094.2
   000451         045600        05 FILLER                 PICTURE X(37)       VALUE       IX2094.2
   000452         045700             ",RECKEY=                             ".             IX2094.2
   000453         045800        05 FILLER                 PICTURE X(38)       VALUE       IX2094.2
   000454         045900             ",ALTKEY1=                             ".            IX2094.2
   000455         046000        05 FILLER                 PICTURE X(38)       VALUE       IX2094.2
   000456         046100             ",ALTKEY2=                             ".            IX2094.2
   000457         046200        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2094.2 IMP
   000458         046300     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2094.2
   000459         046400        05 FILE-RECORD-INFO-P1-120.                               IX2094.2
   000460         046500           07 FILLER              PIC X(5).                       IX2094.2
   000461         046600           07 XFILE-NAME           PIC X(6).                      IX2094.2
   000462         046700           07 FILLER              PIC X(8).                       IX2094.2
   000463         046800           07 XRECORD-NAME         PIC X(6).                      IX2094.2
   000464         046900           07 FILLER              PIC X(1).                       IX2094.2
   000465         047000           07 REELUNIT-NUMBER     PIC 9(1).                       IX2094.2
   000466         047100           07 FILLER              PIC X(7).                       IX2094.2
   000467         047200           07 XRECORD-NUMBER       PIC 9(6).                      IX2094.2
   000468         047300           07 FILLER              PIC X(6).                       IX2094.2
   000469         047400           07 UPDATE-NUMBER       PIC 9(2).                       IX2094.2
   000470         047500           07 FILLER              PIC X(5).                       IX2094.2
   000471         047600           07 ODO-NUMBER          PIC 9(4).                       IX2094.2
   000472         047700           07 FILLER              PIC X(5).                       IX2094.2
   000473         047800           07 XPROGRAM-NAME        PIC X(5).                      IX2094.2
   000474         047900           07 FILLER              PIC X(7).                       IX2094.2
   000475         048000           07 XRECORD-LENGTH       PIC 9(6).                      IX2094.2
   000476         048100           07 FILLER              PIC X(7).                       IX2094.2
   000477         048200           07 CHARS-OR-RECORDS    PIC X(2).                       IX2094.2
   000478         048300           07 FILLER              PIC X(1).                       IX2094.2
   000479         048400           07 XBLOCK-SIZE          PIC 9(4).                      IX2094.2
   000480         048500           07 FILLER              PIC X(6).                       IX2094.2
   000481         048600           07 RECORDS-IN-FILE     PIC 9(6).                       IX2094.2
   000482         048700           07 FILLER              PIC X(5).                       IX2094.2
   000483         048800           07 XFILE-ORGANIZATION   PIC X(2).                      IX2094.2
   000484         048900           07 FILLER              PIC X(6).                       IX2094.2
   000485         049000           07 XLABEL-TYPE          PIC X(1).                      IX2094.2
   000486         049100        05 FILE-RECORD-INFO-P121-240.                             IX2094.2
   000487         049200           07 FILLER              PIC X(8).                       IX2094.2
   000488         049300           07 XRECORD-KEY          PIC X(29).                     IX2094.2
   000489         049400           07 FILLER              PIC X(9).                       IX2094.2
   000490         049500           07 ALTERNATE-KEY1      PIC X(29).                      IX2094.2
   000491         049600           07 FILLER              PIC X(9).                       IX2094.2
   000492         049700           07 ALTERNATE-KEY2      PIC X(29).                      IX2094.2
   000493         049800           07 FILLER              PIC X(7).                       IX2094.2
   000494         049900 01  TEST-RESULTS.                                                IX2094.2
   000495         050000     02 FILLER                   PIC X      VALUE SPACE.          IX2094.2 IMP
   000496         050100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2094.2 IMP
   000497         050200     02 FILLER                   PIC X      VALUE SPACE.          IX2094.2 IMP
   000498         050300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2094.2 IMP
   000499         050400     02 FILLER                   PIC X      VALUE SPACE.          IX2094.2 IMP
   000500         050500     02  PAR-NAME.                                                IX2094.2
   000501         050600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2094.2 IMP
   000502         050700       03  PARDOT-X              PIC X      VALUE SPACE.          IX2094.2 IMP
   000503         050800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2094.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2094.2 IMP
   000505         051000     02 RE-MARK                  PIC X(61).                       IX2094.2
   000506         051100 01  TEST-COMPUTED.                                               IX2094.2
   000507         051200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2094.2 IMP
   000508         051300     02 FILLER                   PIC X(17)  VALUE                 IX2094.2
   000509         051400            "       COMPUTED=".                                   IX2094.2
   000510         051500     02 COMPUTED-X.                                               IX2094.2
   000511         051600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2094.2 IMP
   000512         051700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2094.2 511
   000513         051800                                 PIC -9(9).9(9).                  IX2094.2
   000514         051900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2094.2 511
   000515         052000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2094.2 511
   000516         052100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2094.2 511
   000517         052200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2094.2 511
   000518         052300         04 COMPUTED-18V0                    PIC -9(18).          IX2094.2
   000519         052400         04 FILLER                           PIC X.               IX2094.2
   000520         052500     03 FILLER PIC X(50) VALUE SPACE.                             IX2094.2 IMP
   000521         052600 01  TEST-CORRECT.                                                IX2094.2
   000522         052700     02 FILLER PIC X(30) VALUE SPACE.                             IX2094.2 IMP
   000523         052800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2094.2
   000524         052900     02 CORRECT-X.                                                IX2094.2
   000525         053000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2094.2 IMP
   000526         053100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2094.2 525
   000527         053200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2094.2 525
   000528         053300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2094.2 525
   000529         053400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2094.2 525
   000530         053500     03      CR-18V0 REDEFINES CORRECT-A.                         IX2094.2 525
   000531         053600         04 CORRECT-18V0                     PIC -9(18).          IX2094.2
   000532         053700         04 FILLER                           PIC X.               IX2094.2
   000533         053800     03 FILLER PIC X(2) VALUE SPACE.                              IX2094.2 IMP
   000534         053900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2094.2 IMP
   000535         054000 01  CCVS-C-1.                                                    IX2094.2
   000536         054100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2094.2
   000537         054200-    "SS  PARAGRAPH-NAME                                          IX2094.2
   000538         054300-    "       REMARKS".                                            IX2094.2
   000539         054400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2094.2 IMP
   000540         054500 01  CCVS-C-2.                                                    IX2094.2
   000541         054600     02 FILLER                     PIC X        VALUE SPACE.      IX2094.2 IMP
   000542         054700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2094.2
   000543         054800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2094.2 IMP
   000544         054900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2094.2
   000545         055000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2094.2 IMP
   000546         055100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2094.2 IMP
   000547         055200 01  REC-CT                        PIC 99       VALUE ZERO.       IX2094.2 IMP
   000548         055300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2094.2 IMP
   000549         055400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2094.2 IMP
   000550         055500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2094.2 IMP
   000551         055600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2094.2 IMP
   000552         055700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2094.2 IMP
   000553         055800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2094.2 IMP
   000554         055900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2094.2 IMP
   000555         056000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2094.2 IMP
   000556         056100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2094.2 IMP
   000557         056200 01  CCVS-H-1.                                                    IX2094.2
   000558         056300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2094.2 IMP
   000559         056400     02  FILLER                    PIC X(42)    VALUE             IX2094.2
   000560         056500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2094.2 IMP
   000562         056700 01  CCVS-H-2A.                                                   IX2094.2
   000563         056800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2094.2 IMP
   000564         056900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2094.2
   000565         057000   02  FILLER                        PIC XXXX   VALUE             IX2094.2
   000566         057100     "4.2 ".                                                      IX2094.2
   000567         057200   02  FILLER                        PIC X(28)  VALUE             IX2094.2
   000568         057300            " COPY - NOT FOR DISTRIBUTION".                       IX2094.2
   000569         057400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2094.2 IMP
   000570         057500                                                                  IX2094.2
   000571         057600 01  CCVS-H-2B.                                                   IX2094.2
   000572         057700   02  FILLER                        PIC X(15)  VALUE             IX2094.2
   000573         057800            "TEST RESULT OF ".                                    IX2094.2
   000574         057900   02  TEST-ID                       PIC X(9).                    IX2094.2
   000575         058000   02  FILLER                        PIC X(4)   VALUE             IX2094.2
   000576         058100            " IN ".                                               IX2094.2
   000577         058200   02  FILLER                        PIC X(12)  VALUE             IX2094.2
   000578         058300     " HIGH       ".                                              IX2094.2
   000579         058400   02  FILLER                        PIC X(22)  VALUE             IX2094.2
   000580         058500            " LEVEL VALIDATION FOR ".                             IX2094.2
   000581         058600   02  FILLER                        PIC X(58)  VALUE             IX2094.2
   000582         058700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2094.2
   000583         058800 01  CCVS-H-3.                                                    IX2094.2
   000584         058900     02  FILLER                      PIC X(34)  VALUE             IX2094.2
   000585         059000            " FOR OFFICIAL USE ONLY    ".                         IX2094.2
   000586         059100     02  FILLER                      PIC X(58)  VALUE             IX2094.2
   000587         059200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2094.2
   000588         059300     02  FILLER                      PIC X(28)  VALUE             IX2094.2
   000589         059400            "  COPYRIGHT   1985 ".                                IX2094.2
   000590         059500 01  CCVS-E-1.                                                    IX2094.2
   000591         059600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2094.2 IMP
   000592         059700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2094.2
   000593         059800     02 ID-AGAIN                     PIC X(9).                    IX2094.2
   000594         059900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2094.2 IMP
   000595         060000 01  CCVS-E-2.                                                    IX2094.2
   000596         060100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2094.2 IMP
   000597         060200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2094.2 IMP
   000598         060300     02 CCVS-E-2-2.                                               IX2094.2
   000599         060400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2094.2 IMP
   000600         060500         03 FILLER                   PIC X      VALUE SPACE.      IX2094.2 IMP
   000601         060600         03 ENDER-DESC               PIC X(44)  VALUE             IX2094.2
   000602         060700            "ERRORS ENCOUNTERED".                                 IX2094.2
   000603         060800 01  CCVS-E-3.                                                    IX2094.2
   000604         060900     02  FILLER                      PIC X(22)  VALUE             IX2094.2
   000605         061000            " FOR OFFICIAL USE ONLY".                             IX2094.2
   000606         061100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2094.2 IMP
   000607         061200     02  FILLER                      PIC X(58)  VALUE             IX2094.2
   000608         061300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2094.2
   000609         061400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2094.2 IMP
   000610         061500     02 FILLER                       PIC X(15)  VALUE             IX2094.2
   000611         061600             " COPYRIGHT 1985".                                   IX2094.2
   000612         061700 01  CCVS-E-4.                                                    IX2094.2
   000613         061800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2094.2 IMP
   000614         061900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2094.2
   000615         062000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2094.2 IMP
   000616         062100     02 FILLER                       PIC X(40)  VALUE             IX2094.2
   000617         062200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062300 01  XXINFO.                                                      IX2094.2
   000619         062400     02 FILLER                       PIC X(19)  VALUE             IX2094.2
   000620         062500            "*** INFORMATION ***".                                IX2094.2
   000621         062600     02 INFO-TEXT.                                                IX2094.2
   000622         062700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2094.2 IMP
   000623         062800       04 XXCOMPUTED                 PIC X(20).                   IX2094.2
   000624         062900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2094.2 IMP
   000625         063000       04 XXCORRECT                  PIC X(20).                   IX2094.2
   000626         063100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2094.2
   000627         063200 01  HYPHEN-LINE.                                                 IX2094.2
   000628         063300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2094.2 IMP
   000629         063400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2094.2
   000630         063500-    "*****************************************".                 IX2094.2
   000631         063600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2094.2
   000632         063700-    "******************************".                            IX2094.2
   000633         063800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2094.2
   000634         063900     "IX209A".                                                    IX2094.2
   000635         064000 PROCEDURE DIVISION.                                              IX2094.2
   000636         064100 CCVS1 SECTION.                                                   IX2094.2
   000637         064200 OPEN-FILES.                                                      IX2094.2
   000638         064300     OPEN I-O RAW-DATA.                                           IX2094.2 201
   000639         064400     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2094.2 633 204
   000640         064500     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2094.2 201 646
   000641         064600     MOVE "ABORTED " TO C-ABORT.                                  IX2094.2 215
   000642         064700     ADD 1 TO C-NO-OF-TESTS.                                      IX2094.2 207
   000643         064800     ACCEPT C-DATE  FROM DATE.                                    IX2094.2 205
   000644         064900     ACCEPT C-TIME  FROM TIME.                                    IX2094.2 206
   000645         065000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2094.2 203 646
   000646         065100 END-E-1.                                                         IX2094.2
   000647         065200     CLOSE RAW-DATA.                                              IX2094.2 201
   000648         065300     OPEN    OUTPUT PRINT-FILE.                                   IX2094.2 216
   000649         065400     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2094.2 633 574 633 593
   000650         065500     MOVE    SPACE TO TEST-RESULTS.                               IX2094.2 IMP 494
   000651         065600     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2094.2 695 700
   000652         065700     MOVE    ZERO TO REC-SKL-SUB.                                 IX2094.2 IMP 546
   000653         065800     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2094.2 654
   000654         065900 CCVS-INIT-FILE.                                                  IX2094.2
   000655         066000     ADD     1 TO REC-SKL-SUB.                                    IX2094.2 546
   000656         066100     MOVE    FILE-RECORD-INFO-SKELETON                            IX2094.2 444
   000657         066200          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2094.2 458 546
   000658         066300 CCVS-INIT-EXIT.                                                  IX2094.2
   000659         066400     GO TO CCVS1-EXIT.                                            IX2094.2 782
   000660         066500 CLOSE-FILES.                                                     IX2094.2
   000661         066600     OPEN I-O RAW-DATA.                                           IX2094.2 201
   000662         066700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2094.2 633 204
   000663         066800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2094.2 201 671
   000664         066900     MOVE "OK.     " TO C-ABORT.                                  IX2094.2 215
   000665         067000     MOVE PASS-COUNTER TO C-OK.                                   IX2094.2 551 208
   000666         067100     MOVE ERROR-HOLD   TO C-ALL.                                  IX2094.2 553 209
   000667         067200     MOVE ERROR-COUNTER TO C-FAIL.                                IX2094.2 549 210
   000668         067300     MOVE DELETE-COUNTER TO C-DELETED.                            IX2094.2 548 211
   000669         067400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2094.2 550 212
   000670         067500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2094.2 203 671
   000671         067600 END-E-2.                                                         IX2094.2
   000672         067700     CLOSE RAW-DATA.                                              IX2094.2 201
   000673         067800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2094.2 704 725 216
   000674         067900 TERMINATE-CCVS.                                                  IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675         068000     EXIT PROGRAM.                                                IX2094.2
   000676         068100 TERMINATE-CALL.                                                  IX2094.2
   000677         068200     STOP     RUN.                                                IX2094.2
   000678         068300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2094.2 498 550
   000679         068400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2094.2 498 551
   000680         068500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2094.2 498 549
   000681         068600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2094.2 498 548
   000682         068700     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2094.2 505
   000683         068800 PRINT-DETAIL.                                                    IX2094.2
   000684         068900     IF REC-CT NOT EQUAL TO ZERO                                  IX2094.2 547 IMP
   000685      1  069000             MOVE "." TO PARDOT-X                                 IX2094.2 502
   000686      1  069100             MOVE REC-CT TO DOTVALUE.                             IX2094.2 547 503
   000687         069200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2094.2 494 217 737
   000688         069300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2094.2 498 737
   000689      1  069400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2094.2 758 772
   000690      1  069500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2094.2 773 781
   000691         069600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2094.2 IMP 498 IMP 510
   000692         069700     MOVE SPACE TO CORRECT-X.                                     IX2094.2 IMP 524
   000693         069800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2094.2 547 IMP IMP 500
   000694         069900     MOVE     SPACE TO RE-MARK.                                   IX2094.2 IMP 505
   000695         070000 HEAD-ROUTINE.                                                    IX2094.2
   000696         070100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2094.2 557 218 737
   000697         070200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2094.2 562 218 737
   000698         070300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2094.2 571 218 737
   000699         070400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2094.2 583 218 737
   000700         070500 COLUMN-NAMES-ROUTINE.                                            IX2094.2
   000701         070600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2094.2 535 218 737
   000702         070700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2094.2 540 218 737
   000703         070800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2094.2 627 218 737
   000704         070900 END-ROUTINE.                                                     IX2094.2
   000705         071000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2094.2 627 218 737
   000706         071100 END-RTN-EXIT.                                                    IX2094.2
   000707         071200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2094.2 590 218 737
   000708         071300 END-ROUTINE-1.                                                   IX2094.2
   000709         071400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2094.2 549 553 550
   000710         071500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2094.2 553 548 553
   000711         071600      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2094.2 551 553
   000712         071700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2094.2
   000713         071800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2094.2 551 613
   000714         071900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2094.2 553 615
   000715         072000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2094.2 612 598
   000716         072100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2094.2 595 218 737
   000717         072200  END-ROUTINE-12.                                                 IX2094.2
   000718         072300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2094.2 601
   000719         072400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2094.2 549 IMP
   000720      1  072500         MOVE "NO " TO ERROR-TOTAL                                IX2094.2 599
   000721         072600         ELSE                                                     IX2094.2
   000722      1  072700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2094.2 549 599
   000723         072800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2094.2 595 218
   000724         072900     PERFORM WRITE-LINE.                                          IX2094.2 737
   000725         073000 END-ROUTINE-13.                                                  IX2094.2
   000726         073100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2094.2 548 IMP
   000727      1  073200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2094.2 599
   000728      1  073300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2094.2 548 599
   000729         073400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2094.2 601
   000730         073500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2094.2 595 218 737
   000731         073600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2094.2 550 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732      1  073700          MOVE "NO " TO ERROR-TOTAL                               IX2094.2 599
   000733      1  073800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2094.2 550 599
   000734         073900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2094.2 601
   000735         074000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2094.2 595 218 737
   000736         074100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2094.2 603 218 737
   000737         074200 WRITE-LINE.                                                      IX2094.2
   000738         074300     ADD 1 TO RECORD-COUNT.                                       IX2094.2 555
   000739         074400     IF RECORD-COUNT GREATER 42                                   IX2094.2 555
   000740      1  074500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2094.2 218 554
   000741      1  074600         MOVE SPACE TO DUMMY-RECORD                               IX2094.2 IMP 218
   000742      1  074700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2094.2 218
   000743      1  074800         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2094.2 557 218 753
   000744      1  074900         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2094.2 562 218 753
   000745      1  075000         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2094.2 571 218 753
   000746      1  075100         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2094.2 583 218 753
   000747      1  075200         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2094.2 535 218 753
   000748      1  075300         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2094.2 540 218 753
   000749      1  075400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2094.2 627 218 753
   000750      1  075500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2094.2 554 218
   000751      1  075600         MOVE ZERO TO RECORD-COUNT.                               IX2094.2 IMP 555
   000752         075700     PERFORM WRT-LN.                                              IX2094.2 753
   000753         075800 WRT-LN.                                                          IX2094.2
   000754         075900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2094.2 218
   000755         076000     MOVE SPACE TO DUMMY-RECORD.                                  IX2094.2 IMP 218
   000756         076100 BLANK-LINE-PRINT.                                                IX2094.2
   000757         076200     PERFORM WRT-LN.                                              IX2094.2 753
   000758         076300 FAIL-ROUTINE.                                                    IX2094.2
   000759         076400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2094.2 510 IMP
   000760      1  076500            GO TO   FAIL-ROUTINE-WRITE.                           IX2094.2 767
   000761         076600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2094.2 524 IMP 767
   000762         076700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2094.2 556 626
   000763         076800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2094.2 621
   000764         076900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2094.2 618 218 737
   000765         077000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2094.2 IMP 626
   000766         077100     GO TO  FAIL-ROUTINE-EX.                                      IX2094.2 772
   000767         077200 FAIL-ROUTINE-WRITE.                                              IX2094.2
   000768         077300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2094.2 506 217 737
   000769         077400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2094.2 556 534
   000770         077500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2094.2 521 217 737
   000771         077600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2094.2 IMP 534
   000772         077700 FAIL-ROUTINE-EX. EXIT.                                           IX2094.2
   000773         077800 BAIL-OUT.                                                        IX2094.2
   000774         077900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2094.2 511 IMP 776
   000775         078000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2094.2 525 IMP 781
   000776         078100 BAIL-OUT-WRITE.                                                  IX2094.2
   000777         078200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2094.2 525 625 511 623
   000778         078300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2094.2 556 626
   000779         078400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2094.2 618 218 737
   000780         078500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2094.2 IMP 626
   000781         078600 BAIL-OUT-EX. EXIT.                                               IX2094.2
   000782         078700 CCVS1-EXIT.                                                      IX2094.2
   000783         078800     EXIT.                                                        IX2094.2
   000784         078900 SECT-0001-IX209A SECTION.                                        IX2094.2
   000785         079000 WRITE-INT-GF-01.                                                 IX2094.2
   000786         079100     OPEN    OUTPUT IX-FS1.                                       IX2094.2 219
   000787         079200     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX2094.2 461
   000788         079300     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2094.2 463
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079400     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2094.2 IMP 467
   000790         079500     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2094.2 477
   000791         079600     MOVE    CCVS-PGM-ID  TO  XPROGRAM-NAME       (1).            IX2094.2 633 473
   000792         079700     MOVE    240      TO  XRECORD-LENGTH      (1).                IX2094.2 475
   000793         079800     MOVE    001      TO  XBLOCK-SIZE         (1).                IX2094.2 479
   000794         079900     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2094.2 483
   000795         080000     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2094.2 485
   000796         080100     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2094.2 481
   000797         080200     MOVE    "CREATE-FILE-FS1" TO FEATURE.                        IX2094.2 496
   000798         080300     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2094.2 500
   000799         080400     MOVE    ZERO TO KEYSUB.                                      IX2094.2 IMP 278
   000800         080500     MOVE    ZERO TO INVKEY-COUNTER.                              IX2094.2 IMP 279
   000801         080600 WRITE-INIT-GF-01-01.                                             IX2094.2
   000802         080700     PERFORM WRITE-TEST-GF-01-1  50 TIMES.                        IX2094.2 806
   000803         080800     PERFORM WRITE-TEST-GF-01-2  125 TIMES.                       IX2094.2 819
   000804         080900     PERFORM WRITE-TEST-GF-01-1  25 TIMES.                        IX2094.2 806
   000805         081000     GO TO   WRITE-TEST-GF-01.                                    IX2094.2 831
   000806         081100 WRITE-TEST-GF-01-1.                                              IX2094.2
   000807         081200     ADD     001  TO XRECORD-NUMBER (1).                          IX2094.2 467
   000808         081300     ADD     001  TO  KEYSUB.                                     IX2094.2 278
   000809         081400     MOVE    RECKEY-VALUE (KEYSUB) TO FS1-RECKEY-1-13.            IX2094.2 437 278 255
   000810         081500     MOVE    ALTKEY1-VALUE (KEYSUB) TO FS1-ALTKEY1-1-20.          IX2094.2 438 278 260
   000811         081600     MOVE    ALTKEY2-VALUE (KEYSUB) TO FS1-ALTKEY2-1-20.          IX2094.2 439 278 268
   000812         081700     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2094.2 254 488
   000813         081800     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2094.2 259 490
   000814         081900     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2094.2 267 492
   000815         082000     MOVE    FILE-RECORD-INFO (1)  TO IX-FS1R1-F-G-240.           IX2094.2 458 223
   000816         082100     WRITE   IX-FS1R1-F-G-240                                     IX2094.2 223
   000817      1  082200                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2094.2 279
   000818         082300     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2094.2 277
   000819         082400 WRITE-TEST-GF-01-2.                                              IX2094.2
   000820         082500     ADD     002  TO FS1-RECKEY-11-13.                            IX2094.2 257
   000821         082600     ADD     002 TO FS1-ALTKEY1-11-13.                            IX2094.2 264
   000822         082700     SUBTRACT  002 FROM FS1-ALTKEY2-11-13.                        IX2094.2 272
   000823         082800     ADD     001  TO XRECORD-NUMBER (1).                          IX2094.2 467
   000824         082900     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2094.2 254 488
   000825         083000     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2094.2 259 490
   000826         083100     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2094.2 267 492
   000827         083200     MOVE    FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.            IX2094.2 458 223
   000828         083300     WRITE   IX-FS1R1-F-G-240                                     IX2094.2 223
   000829      1  083400                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2094.2 279
   000830         083500     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2094.2 277
   000831         083600 WRITE-TEST-GF-01.                                                IX2094.2
   000832         083700     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2094.2 279 277
   000833         083800             GIVING RECORDS-WRITTEN.                              IX2094.2 280
   000834         083900     MOVE    200  TO CORRECT-18V0.                                IX2094.2 531
   000835         084000     MOVE    RECORDS-WRITTEN TO COMPUTED-18V0.                    IX2094.2 280 518
   000836         084100     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2094.2 280
   000837      1  084200             PERFORM  PASS                                        IX2094.2 679
   000838         084300             ELSE                                                 IX2094.2
   000839      1  084400             PERFORM FAIL.                                        IX2094.2 680
   000840         084500     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2094.2 505
   000841         084600     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   000842         084700     GO TO   WRITE-TEST-GF-01-END.                                IX2094.2 847
   000843         084800 WRITE-DELETE-GF-01.                                              IX2094.2
   000844         084900     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2094.2 500
   000845         085000     PERFORM DE-LETE.                                             IX2094.2 681
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         085100     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   000847         085200 WRITE-TEST-GF-01-END.                                            IX2094.2
   000848         085300     CLOSE   IX-FS1.                                              IX2094.2 219
   000849         085400 READ-INIT-F1-01.                                                 IX2094.2
   000850         085500     OPEN    INPUT  IX-FS1.                                       IX2094.2 219
   000851         085600     MOVE    "READ-TEST-F1-01" TO PAR-NAME.                       IX2094.2 500
   000852         085700     MOVE    "READ FILE IX-FS1" TO FEATURE.                       IX2094.2 496
   000853         085800     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2094.2 IMP 277
   000854         085900     MOVE    02   TO RECKEY-NUM.                                  IX2094.2 281
   000855         086000     MOVE    002 TO ALTKEY1-NUM.                                  IX2094.2 282
   000856         086100 READ-TEST-F1-01-R1.                                              IX2094.2
   000857         086200     READ    IX-FS1  AT END  GO TO READ-TEST-F1-01.               IX2094.2 219 869
   000858         086300     MOVE    IX-REC-KEY-AREA TO WRK-FS1-RECKEY.                   IX2094.2 227 254
   000859         086400     MOVE    IX-ALT-KEY1-AREA TO WRK-FS1-ALTKEY1.                 IX2094.2 235 259
   000860         086500     IF      FS1-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2094.2 257 281
   000861         086600             AND FS1-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2094.2 264 282
   000862      1  086700             NEXT SENTENCE                                        IX2094.2
   000863         086800             ELSE                                                 IX2094.2
   000864      1  086900             PERFORM  READ-FAIL-F1-01.                            IX2094.2 880
   000865         087000     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2094.2 277
   000866         087100     ADD     002  TO RECKEY-NUM                                   IX2094.2 281
   000867         087200     ADD     002  TO ALTKEY1-NUM.                                 IX2094.2 282
   000868         087300     GO TO   READ-TEST-F1-01-R1.                                  IX2094.2 856
   000869         087400 READ-TEST-F1-01.                                                 IX2094.2
   000870         087500     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2094.2 277
   000871      1  087600             PERFORM PASS ELSE                                    IX2094.2 679
   000872      1  087700     MOVE "IX-28; 4.5.2 OR IX-41; 4.9.2 NOT COORECTLY EXECUTED"   IX2094.2
   000873      1  087800                  TO RE-MARK                                      IX2094.2 505
   000874      1  087900             PERFORM FAIL.                                        IX2094.2 680
   000875         088000     MOVE    EXCUT-COUNTER-06V00 TO  COMPUTED-18V0.               IX2094.2 277 518
   000876         088100     MOVE    200  TO  CORRECT-18V0.                               IX2094.2 531
   000877         088200     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2094.2 505
   000878         088300     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   000879         088400     GO TO   READ-EXIT-F1-01.                                     IX2094.2 886
   000880         088500 READ-FAIL-F1-01.                                                 IX2094.2
   000881         088600     PERFORM FAIL.                                                IX2094.2 680
   000882         088700     MOVE    FS1-RECKEY-11-13  TO COMPUTED-18V0.                  IX2094.2 257 518
   000883         088800     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2094.2 281 531
   000884         088900     MOVE    "NUM EMBEDDED IN RECKEY"  TO RE-MARK.                IX2094.2 505
   000885         089000     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   000886         089100 READ-EXIT-F1-01.                                                 IX2094.2
   000887         089200     CLOSE   IX-FS1.                                              IX2094.2 219
   000888         089300 START-INIT-GF-01.                                                IX2094.2
   000889         089400     OPEN    INPUT  IX-FS1.                                       IX2094.2 219
   000890         089500     MOVE    "START EQ TO RECKEY"  TO FEATURE.                    IX2094.2 496
   000891         089600     MOVE    "START-TEST-GF-01" TO PAR-NAME.                      IX2094.2 500
   000892         089700     MOVE    "********************" TO HOLD-FILESTATUS-RECORD.    IX2094.2 441
   000893         089800*                                                                 IX2094.2
   000894         089900* THIS TEST TESTS THE  "START -- EQUAL TO" FOR PROPER POSITIONING IX2094.2
   000895         090000* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2094.2
   000896         090100* START-TEST-GF-01 USE ONLY THE PRIME RECORD KEY FOR ESTABLISHING IX2094.2
   000897         090200* THE CURRENT RECORD POINTER FOR THE FILE.  THE FOLLOWING IS A    IX2094.2
   000898         090300* SUMMARY OF THE TEST CONDITIONS AND THE EXPECTED ACTION TO BE    IX2094.2
   000899         090400* TAKEN FOR THE  TESTS.                                           IX2094.2
   000900         090500*                                                                 IX2094.2
   000901         090600*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2094.2
   000902         090700*                                                                 IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090800*   START-TEST-GF-01 - EQUAL A RECORD IN FILE / RECORD FOUND      IX2094.2
   000904         090900*   START-TEST-GF-02 - BETWEEN 2 EXISTING KEY VALUES / INVALID KEYIX2094.2
   000905         091000*   START-TEST-GF-03 - LESS THAN FIRST FILE RECORD / INVALID KEY  IX2094.2
   000906         091100*   START-TEST-GF-04 - GREATER THAN LAST FILE RECORD / INVALID KEYIX2094.2
   000907         091200*   START-TEST-GF-05 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2094.2
   000908         091300*   START-TEST-GF-06 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2094.2
   000909         091400*   START-TEST-GF-07 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2094.2
   000910         091500*   START-TEST-GF-08 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2094.2
   000911         091600*   START-TEST-GF-09 - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEY IX2094.2
   000912         091700*                                                                 IX2094.2
   000913         091800*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2094.2
   000914         091900*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2094.2
   000915         092000*  IF AN INVALID KEY IS EXPECTED FROM THE TEST, THE KEYS          IX2094.2
   000916         092100*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2094.2
   000917         092200*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2094.2
   000918         092300*  MATCH RECORDS IN THE FILE.  IF KEY MATCH IS EXPECTED FROM      IX2094.2
   000919         092400*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2094.2
   000920         092500*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2094.2
   000921         092600*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2094.2
   000922         092700*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2094.2
   000923         092800*                                                                 IX2094.2
   000924         092900 START-INIT-GF-01-01.                                             IX2094.2
   000925         093000     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   000926         093100     MOVE    "START-TEST-GF-01" TO PAR-NAME.                      IX2094.2 500
   000927         093200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   000928      1  093300             MOVE   "**"  TO FILESTATUS (1)                       IX2094.2 442
   000929      1  093400             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2094.2 505
   000930      1  093500             GO TO START-DELETE-GF-01.                            IX2094.2 965
   000931         093600     MOVE    "CCCCCCCCCD022" TO FS1-RECKEY-1-13.                  IX2094.2 255
   000932         093700     MOVE    "EEEEEFFFFF022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   000933         093800     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   000934         093900     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2094.2 254 227
   000935         094000     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2094.2 259 235
   000936         094100     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2094.2 267 244
   000937         094200 START-TEST-GF-01.                                                IX2094.2
   000938         094300*                                                                 IX2094.2
   000939         094400*  START-TEST-GF-01 - THE START SHOULD FIND A RECORD IN THE FILE  IX2094.2
   000940         094500*                    WHICH HAS A RECORD KEY VALUE OF              IX2094.2
   000941         094600*                    CCCCCCCCCD022 (RECORD NUMBER 11).            IX2094.2
   000942         094700*                                                                 IX2094.2
   000943         094800     START   IX-FS1                                               IX2094.2 219
   000944         094900                    KEY IS EQUAL TO IX-FS1-KEY                    IX2094.2 228
   000945      1  095000          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (1)         IX2094.2 276 442
   000946      1  095100                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   000947      1  095200                        GO TO START-FAIL-GF-01.                   IX2094.2 960
   000948         095300     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2094.2 276 442
   000949         095400     READ    IX-FS1  AT END                                       IX2094.2 219
   000950      1  095500                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   000951      1  095600                     GO TO START-FAIL-GF-01.                      IX2094.2 960
   000952         095700     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2094.2 223 458
   000953         095800     IF      XRECORD-NUMBER (1) EQUAL TO 11                       IX2094.2 467
   000954      1  095900             PERFORM PASS                                         IX2094.2 679
   000955      1  096000             MOVE SPACE TO RE-MARK                                IX2094.2 IMP 505
   000956      1  096100             GO TO START-WRITE-GF-01.                             IX2094.2 967
   000957         096200     MOVE    11  TO RECNO.                                        IX2094.2 275
   000958         096300     PERFORM DISPLAY-RECORD-KEYS.                                 IX2094.2 2828
   000959         096400     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2094.2 467 518
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960         096500 START-FAIL-GF-01.                                                IX2094.2
   000961         096600     PERFORM FAIL.                                                IX2094.2 680
   000962         096700     MOVE    11   TO CORRECT-18V0.                                IX2094.2 531
   000963         096800     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   000964         096900     GO TO   START-WRITE-GF-01.                                   IX2094.2 967
   000965         097000 START-DELETE-GF-01.                                              IX2094.2
   000966         097100     PERFORM DE-LETE.                                             IX2094.2 681
   000967         097200 START-WRITE-GF-01.                                               IX2094.2
   000968         097300     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   000969         097400 START-INIT-GF-02.                                                IX2094.2
   000970         097500     MOVE    "START-TEST-GF-02" TO PAR-NAME.                      IX2094.2 500
   000971         097600     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   000972         097700     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   000973      1  097800             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   000974      1  097900             MOVE   "**"  TO FILESTATUS (2)                       IX2094.2 442
   000975      1  098000             GO TO   START-DELETE-GF-02.                          IX2094.2 1006
   000976         098100     MOVE    "EEEEEEEFFF067" TO FS1-RECKEY-1-13.                  IX2094.2 255
   000977         098200     MOVE    "HHHHHHHIII066ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2094.2 260
   000978         098300     MOVE    "TTTTTTTSSS334ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   000979         098400     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   000980         098500     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   000981         098600     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   000982         098700 START-TEST-GF-02.                                                IX2094.2
   000983         098800*                                                                 IX2094.2
   000984         098900*  START-TEST-GF-02 - THE START SHOULD NOT FIND A RECORD IN THE   IX2094.2
   000985         099000*                    FILE WHICH HAS A RECORD KEY VALUE OF         IX2094.2
   000986         099100*                    "EEEEEEEFFF067". THIS KEY VALUE IS           IX2094.2
   000987         099200*                    SEQUENTIALLY LOCATED BETWEEN TWO CURRENTLY   IX2094.2
   000988         099300*                    EXISTING RECORD KEYS IN THE FILE.            IX2094.2
   000989         099400*                                                                 IX2094.2
   000990         099500     START   IX-FS1                                               IX2094.2 219
   000991         099600                     KEY IS EQUAL TO IX-FS1-KEY                   IX2094.2 228
   000992      1  099700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (2)       IX2094.2 276 442
   000993      1  099800                         GO TO START-PASS-GF-02.                  IX2094.2 1003
   000994         099900     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2094.2 276 442
   000995         100000     READ    IX-FS1 AT END                                        IX2094.2 219
   000996      1  100100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   000997         100200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   000998         100300     PERFORM FAIL.                                                IX2094.2 680
   000999         100400     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001000         100500     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2094.2 488 511
   001001         100600     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001002         100700     GO TO   START-WRITE-GF-02.                                   IX2094.2 1008
   001003         100800 START-PASS-GF-02.                                                IX2094.2
   001004         100900     PERFORM  PASS.                                               IX2094.2 679
   001005         101000     GO TO   START-WRITE-GF-02.                                   IX2094.2 1008
   001006         101100 START-DELETE-GF-02.                                              IX2094.2
   001007         101200     PERFORM DE-LETE.                                             IX2094.2 681
   001008         101300 START-WRITE-GF-02.                                               IX2094.2
   001009         101400     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001010         101500 START-INIT-GF-03.                                                IX2094.2
   001011         101600     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001012         101700     MOVE    "START-TEST-GF-03" TO PAR-NAME.                      IX2094.2 500
   001013         101800     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001014      1  101900             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001015      1  102000             MOVE   "**"  TO FILESTATUS (3)                       IX2094.2 442
   001016      1  102100             GO TO   START-DELETE-GF-03.                          IX2094.2 1047
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001017         102200     MOVE    "BBBBBBBBBC001"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001018         102300     MOVE    "EEEEEEEEEF002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001019         102400     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001020         102500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001021         102600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001022         102700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001023         102800 START-TEST-GF-03.                                                IX2094.2
   001024         102900*                                                                 IX2094.2
   001025         103000*  START-TEST-GF-03  - THE START STATEMENT SHOULD NOT FIND A      IX2094.2
   001026         103100*                    RECORD IN THE FILE WHICH HAS A RECORD        IX2094.2
   001027         103200*                    KEY VALUE OF "BBBBBBBBBC001".  THIS KEY      IX2094.2
   001028         103300*                    VALUE IS SEQUENTIALLY LOWER THAN ANY         IX2094.2
   001029         103400*                    CURRENTLY EXISTING KEY IN THE FILE.          IX2094.2
   001030         103500*                                                                 IX2094.2
   001031         103600     START   IX-FS1                                               IX2094.2 219
   001032         103700                     KEY IS EQUAL TO IX-FS1-KEY                   IX2094.2 228
   001033      1  103800          INVALID KEY    MOVE FS1-STATUS TO FILESTATUS (3)        IX2094.2 276 442
   001034      1  103900                     GO TO START-PASS-GF-03.                      IX2094.2 1044
   001035         104000     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2094.2 276 442
   001036         104100     READ    IX-FS1  AT END                                       IX2094.2 219
   001037      1  104200                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001038         104300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001039         104400     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001040         104500     PERFORM FAIL.                                                IX2094.2 680
   001041         104600     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   001042         104700     MOVE    "INVALID KEY"  TO CORRECT-A.                         IX2094.2 525
   001043         104800     GO TO START-WRITE-GF-03.                                     IX2094.2 1049
   001044         104900 START-PASS-GF-03.                                                IX2094.2
   001045         105000     PERFORM PASS.                                                IX2094.2 679
   001046         105100     GO TO   START-WRITE-GF-03.                                   IX2094.2 1049
   001047         105200 START-DELETE-GF-03.                                              IX2094.2
   001048         105300     PERFORM DE-LETE.                                             IX2094.2 681
   001049         105400 START-WRITE-GF-03.                                               IX2094.2
   001050         105500     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001051         105600 START-INIT-GF-04.                                                IX2094.2
   001052         105700     MOVE "START-TEST-GF-04" TO PAR-NAME.                         IX2094.2 500
   001053         105800     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001054         105900     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001055      1  106000             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001056      1  106100             MOVE   "**"  TO FILESTATUS (4)                       IX2094.2 442
   001057      1  106200             GO TO   START-DELETE-GF-04.                          IX2094.2 1090
   001058         106300     MOVE    "UUUUUUUUUU401"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001059         106400     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001060         106500     MOVE    "DDDDDDDDDD000ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001061         106600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001062         106700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001063         106800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001064         106900 START-TEST-GF-04.                                                IX2094.2
   001065         107000*                                                                 IX2094.2
   001066         107100*  START-TEST-GF-04  - THE START STATEMENT SHOULD NOT FIND A      IX2094.2
   001067         107200*                    RECORD IN THE  FILE WHICH HAS A RECORD       IX2094.2
   001068         107300*                    KEY VALUE OF "UUUUUUUUUU401".  THIS          IX2094.2
   001069         107400*                    VALUE IS SEQUENTIALLY  ONE GREATER THAN      IX2094.2
   001070         107500*                    ANY RECORD KEY CURRENTLY EXISTING IN         IX2094.2
   001071         107600*                    THE FILE.  AN INVALID KEY CONDITION          IX2094.2
   001072         107700*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2094.2
   001073         107800*                                                                 IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001074         107900     START   IX-FS1                                               IX2094.2 219
   001075         108000                     KEY IS EQUAL TO IX-FS1-KEY                   IX2094.2 228
   001076      1  108100          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2094.2 276 442
   001077      1  108200                         GO TO START-PASS-GF-04.                  IX2094.2 1087
   001078         108300     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2094.2 276 442
   001079         108400     READ    IX-FS1 AT END                                        IX2094.2 219
   001080      1  108500                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001081         108600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001082         108700     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001083         108800     PERFORM FAIL.                                                IX2094.2 680
   001084         108900     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2094.2 488 511
   001085         109000     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001086         109100     GO TO   START-WRITE-GF-04.                                   IX2094.2 1092
   001087         109200 START-PASS-GF-04.                                                IX2094.2
   001088         109300     PERFORM  PASS.                                               IX2094.2 679
   001089         109400     GO TO   START-WRITE-GF-04.                                   IX2094.2 1092
   001090         109500 START-DELETE-GF-04.                                              IX2094.2
   001091         109600     PERFORM DE-LETE.                                             IX2094.2 681
   001092         109700 START-WRITE-GF-04.                                               IX2094.2
   001093         109800     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001094         109900 START-INIT-GF-05.                                                IX2094.2
   001095         110000     MOVE "START-TEST-GF-05" TO PAR-NAME.                         IX2094.2 500
   001096         110100     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001097         110200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001098      1  110300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001099      1  110400             MOVE   "**"  TO FILESTATUS (5)                       IX2094.2 442
   001100      1  110500             GO TO   START-DELETE-GF-05.                          IX2094.2 1141
   001101         110600     MOVE    "CDDDDDDDDD039" TO FS1-RECKEY-1-13.                  IX2094.2 255
   001102         110700     MOVE    "IIIIIIIIJJ083ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001103         110800     MOVE    "ABCXXXXXXX400ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   001104         110900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001105         111000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001106         111100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001107         111200 START-TEST-GF-05.                                                IX2094.2
   001108         111300*  START-TEST-GF-05  - THE START STATEMENT USES AN OPERAND        IX2094.2
   001109         111400*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2094.2
   001110         111500*                    OF A RECORD   KEY BUT IS THE NAME OF A       IX2094.2
   001111         111600*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2094.2
   001112         111700*                    RECORD KEY.  THE CONTENTS OF THE DATA ITEM   IX2094.2
   001113         111800*                    (POSITIONS 1 THRU 5 OF THE RECORD KEY)       IX2094.2
   001114         111900*                    IS A UNIQUE KEY VALUE FOR THE FILE. THE      IX2094.2
   001115         112000*                    BALANCE OF THE KEY (POSITIONS 6 THRU 13) IS  IX2094.2
   001116         112100*                    NOT A VALID KEY VALUE FOR THE FILE.  THE     IX2094.2
   001117         112200*                    RECORD WITH THE RECORD KEY "CDDDDDDDDD038"   IX2094.2
   001118         112300*                    (RECORD NUMBER 19) IS EXPECTED TO BE FOUND.  IX2094.2
   001119         112400*                                                                 IX2094.2
   001120         112500     START   IX-FS1                                               IX2094.2 219
   001121         112600                    KEY IS EQUAL TO IX-FS1-KEY-1-5                IX2094.2 230
   001122      1  112700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2094.2 276 442
   001123      1  112800                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   001124      1  112900                     GO TO START-FAIL-GF-05.                      IX2094.2 1136
   001125         113000     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2094.2 276 442
   001126         113100     READ    IX-FS1  AT END                                       IX2094.2 219
   001127      1  113200                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   001128      1  113300                     GO TO  START-FAIL-GF-05.                     IX2094.2 1136
   001129         113400     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001130         113500     IF      XRECORD-NUMBER (1) EQUAL TO 19                       IX2094.2 467
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001131      1  113600             PERFORM  PASS                                        IX2094.2 679
   001132      1  113700             GO TO START-WRITE-GF-05.                             IX2094.2 1143
   001133         113800     MOVE    19  TO RECNO.                                        IX2094.2 275
   001134         113900     PERFORM DISPLAY-RECORD-KEYS.                                 IX2094.2 2828
   001135         114000     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   001136         114100 START-FAIL-GF-05.                                                IX2094.2
   001137         114200     PERFORM  FAIL.                                               IX2094.2 680
   001138         114300     MOVE    19  TO CORRECT-18V0.                                 IX2094.2 531
   001139         114400     MOVE "IX-36; 4.7.2 ETC.; SUBORDINATE D-I OF KEY" TO RE-MARK. IX2094.2 505
   001140         114500     GO TO   START-WRITE-GF-05.                                   IX2094.2 1143
   001141         114600 START-DELETE-GF-05.                                              IX2094.2
   001142         114700     PERFORM DE-LETE.                                             IX2094.2 681
   001143         114800 START-WRITE-GF-05.                                               IX2094.2
   001144         114900     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001145         115000 START-INIT-GF-06.                                                IX2094.2
   001146         115100     MOVE "START-TEST-GF-06" TO PAR-NAME.                         IX2094.2 500
   001147         115200     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001148         115300     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001149      1  115400             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001150      1  115500             MOVE   "**"  TO FILESTATUS (6)                       IX2094.2 442
   001151      1  115600             GO TO   START-DELETE-GF-06.                          IX2094.2 1197
   001152         115700     MOVE    "TTTTTUUUUU390"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001153         115800     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001154         115900     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001155         116000     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001156         116100     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001157         116200     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001158         116300 START-TEST-GF-06.                                                IX2094.2
   001159         116400*                                                                 IX2094.2
   001160         116500*  START-TEST-GF-06  - THE START STATEMENT USES AN OPERAND IN THE IX2094.2
   001161         116600*                    KEY PHRASE WHICH IS NOT THE NAME OF A RECORD IX2094.2
   001162         116700*                    KEY BUT IS THE NAME OF A DATA ITEM THAT IS   IX2094.2
   001163         116800*                    SUBORDINATE TO THE RECORD KEY.  THE CONTENTS IX2094.2
   001164         116900*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2094.2
   001165         117000*                    RECORD KEY)  IS A DUPLICATE OF THE FIRST     IX2094.2
   001166         117100*                    5 POSITIONS OF 5 OTHER RECORDS IN THE FILE.  IX2094.2
   001167         117200*                    THIS TEST EXPECTS THE RECORD POINTER         IX2094.2
   001168         117300*                    TO BE POSITIONED TO RECORD KEY TTTTTTTTTT380 IX2094.2
   001169         117400*                    (RECORD NUMBER 190) WHICH WAS THE            IX2094.2
   001170         117500*                    FIRST RECORD WRITTEN TO THE FILE THAT        IX2094.2
   001171         117600*                    CONTAINS TTTTT IN THE FIRST 5 POSITIONS OF   IX2094.2
   001172         117700*                    THE KEY.  THE RECORD KEY WAS LOADED WITH THE IX2094.2
   001173         117800*                    VALUE "TTTTTUUUUU390" (KEY FOR RECORD NUMBER IX2094.2
   001174         117900*                    195) BEFORE THE START WAS EXECUTED.          IX2094.2
   001175         118000*                                                                 IX2094.2
   001176         118100     START   IX-FS1                                               IX2094.2 219
   001177         118200                    KEY IS EQUAL TO IX-FS1-KEY-1-5                IX2094.2 230
   001178      1  118300          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (6)       IX2094.2 276 442
   001179      1  118400                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2094.2 511
   001180      1  118500                     GO TO START-FAIL-GF-06.                      IX2094.2 1192
   001181         118600     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2094.2 276 442
   001182         118700     READ    IX-FS1  AT END                                       IX2094.2 219
   001183      1  118800                     MOVE "AT END ON READ" TO COMPUTED-A          IX2094.2 511
   001184      1  118900                     GO TO START-FAIL-GF-06.                      IX2094.2 1192
   001185         119000     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001186         119100     IF      XRECORD-NUMBER (1) EQUAL TO 190                      IX2094.2 467
   001187      1  119200             PERFORM  PASS                                        IX2094.2 679
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001188      1  119300             GO TO START-WRITE-GF-06.                             IX2094.2 1199
   001189         119400     MOVE    65  TO RECNO.                                        IX2094.2 275
   001190         119500     PERFORM DISPLAY-RECORD-KEYS.                                 IX2094.2 2828
   001191         119600     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   001192         119700 START-FAIL-GF-06.                                                IX2094.2
   001193         119800     MOVE "IX-36; 4.7.2 ETC.; SUBORDINATE D-I OF KEY" TO RE-MARK. IX2094.2 505
   001194         119900     PERFORM  FAIL.                                               IX2094.2 680
   001195         120000     MOVE    190   TO CORRECT-18V0.                               IX2094.2 531
   001196         120100     GO TO   START-WRITE-GF-06.                                   IX2094.2 1199
   001197         120200 START-DELETE-GF-06.                                              IX2094.2
   001198         120300     PERFORM DE-LETE.                                             IX2094.2 681
   001199         120400 START-WRITE-GF-06.                                               IX2094.2
   001200         120500     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001201         120600 START-INIT-GF-07.                                                IX2094.2
   001202         120700     MOVE "START-TEST-GF-07" TO PAR-NAME.                         IX2094.2 500
   001203         120800     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001204         120900     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001205      1  121000             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001206      1  121100             MOVE   "**"  TO FILESTATUS (7)                       IX2094.2 442
   001207      1  121200             GO TO   START-DELETE-GF-07.                          IX2094.2 1247
   001208         121300     MOVE    "CCCCCCD022   " TO FS1-RECKEY-1-13.                  IX2094.2 255
   001209         121400     MOVE    "FFFFFFFFFG022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001210         121500     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001211         121600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001212         121700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001213         121800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001214         121900 START-TEST-GF-07.                                                IX2094.2
   001215         122000*                                                                 IX2094.2
   001216         122100*  START-TEST-GF-07  - THE START STATEMENT USES AN OPERAND IN THE IX2094.2
   001217         122200*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001218         122300*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2094.2
   001219         122400*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001220         122500*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY)      IX2094.2
   001221         122600*                    IS LOADED WITH "CCCCCCD022".  NO SUCH RECORD IX2094.2
   001222         122700*                    SHOULD BE IN THE FILE.  IF IN THE COMPARSION,IX2094.2
   001223         122800*                    THE LONGER OPERAND IS TRUNCATED ON THE LEFT  IX2094.2
   001224         122900*                    INSTEAD OF ON THE RIGHT THE CONTENTS OF      IX2094.2
   001225         123000*                    THE DATA ITEM WILL MATCH A RECORD IN THE     IX2094.2
   001226         123100*                    FILE.  THIS TEST EXPECTS THE LONGER OPERAND  IX2094.2
   001227         123200*                    TO BE TRUNCATED ON THE RIGHT CAUSING NO      IX2094.2
   001228         123300*                    DATA ITEM MATCH AND RESULTING IN AN INVALID  IX2094.2
   001229         123400*                    KEY CONDITION WHEN THE START IS EXECUTED.    IX2094.2
   001230         123500*                                                                 IX2094.2
   001231         123600     START   IX-FS1                                               IX2094.2 219
   001232         123700                    KEY IS EQUAL TO IX-FS1-KEY-1-10               IX2094.2 229
   001233      1  123800          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2094.2 276 442
   001234      1  123900                     GO TO START-PASS-GF-07.                      IX2094.2 1244
   001235         124000     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2094.2 276 442
   001236         124100     READ    IX-FS1  AT END                                       IX2094.2 219
   001237      1  124200                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001238         124300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001239         124400     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001240         124500     PERFORM FAIL.                                                IX2094.2 680
   001241         124600     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2094.2 488 511
   001242         124700     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001243         124800     GO TO   START-WRITE-GF-07.                                   IX2094.2 1249
   001244         124900 START-PASS-GF-07.                                                IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001245         125000     PERFORM PASS.                                                IX2094.2 679
   001246         125100     GO TO   START-WRITE-GF-07.                                   IX2094.2 1249
   001247         125200 START-DELETE-GF-07.                                              IX2094.2
   001248         125300     PERFORM DE-LETE.                                             IX2094.2 681
   001249         125400 START-WRITE-GF-07.                                               IX2094.2
   001250         125500     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001251         125600 START-INIT-GF-08.                                                IX2094.2
   001252         125700     MOVE "START-TEST-GF-08" TO PAR-NAME.                         IX2094.2 500
   001253         125800     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001254         125900     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001255      1  126000             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001256      1  126100             MOVE   "**"  TO FILESTATUS (8)                       IX2094.2 442
   001257      1  126200             GO TO   START-DELETE-GF-08.                          IX2094.2 1294
   001258         126300     MOVE    "ABBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001259         126400     MOVE    "EEEEEEEEEF002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001260         126500     MOVE    "WWWWWWWWWW400ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001261         126600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001262         126700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001263         126800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001264         126900 START-TEST-GF-08.                                                IX2094.2
   001265         127000*                                                                 IX2094.2
   001266         127100*  START-TEST-GF-08  - THIS TEST USES AN OPERAND IN THE           IX2094.2
   001267         127200*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001268         127300*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2094.2
   001269         127400*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001270         127500*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2094.2
   001271         127600*                    LOADED WITH "ABBBBBBBBC".  THIS KEY VALUE    IX2094.2
   001272         127700*                    IS LOWER THAN ANY RECORD KEY VALUE IN        IX2094.2
   001273         127800*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   001274         127900*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   001275         128000*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   001276         128100*                    EXECUTED.                                    IX2094.2
   001277         128200*                                                                 IX2094.2
   001278         128300     START   IX-FS1                                               IX2094.2 219
   001279         128400                    KEY IS EQUAL TO IX-FS1-KEY-1-10               IX2094.2 229
   001280      1  128500          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2094.2 276 442
   001281      1  128600                     GO TO START-PASS-GF-08.                      IX2094.2 1291
   001282         128700     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2094.2 276 442
   001283         128800     READ    IX-FS1  AT END                                       IX2094.2 219
   001284      1  128900                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001285         129000     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001286         129100     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001287         129200     PERFORM FAIL.                                                IX2094.2 680
   001288         129300     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   001289         129400     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   001290         129500     GO TO   START-WRITE-GF-08.                                   IX2094.2 1296
   001291         129600 START-PASS-GF-08.                                                IX2094.2
   001292         129700     PERFORM PASS.                                                IX2094.2 679
   001293         129800     GO TO   START-WRITE-GF-08.                                   IX2094.2 1296
   001294         129900 START-DELETE-GF-08.                                              IX2094.2
   001295         130000     PERFORM DE-LETE.                                             IX2094.2 681
   001296         130100 START-WRITE-GF-08.                                               IX2094.2
   001297         130200     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001298         130300 START-INIT-GF-09.                                                IX2094.2
   001299         130400     MOVE "START-TEST-GF-09" TO PAR-NAME.                         IX2094.2 500
   001300         130500     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001301         130600     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001302      1  130700             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001303      1  130800             MOVE   "**"  TO FILESTATUS (9)                       IX2094.2 442
   001304      1  130900             GO TO   START-DELETE-GF-09.                          IX2094.2 1341
   001305         131000     MOVE    "UUUUUUUUUV400"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001306         131100     MOVE    "EEEEEEEEEF002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001307         131200     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001308         131300     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001309         131400     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001310         131500     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001311         131600 START-TEST-GF-09.                                                IX2094.2
   001312         131700*                                                                 IX2094.2
   001313         131800*  START-TEST-GF-09  - THIS TEST USES AN OPERAND IN THE           IX2094.2
   001314         131900*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001315         132000*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2094.2
   001316         132100*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001317         132200*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2094.2
   001318         132300*                    LOADED WITH "UUUUUUUUUV".  THIS KEY VALUE    IX2094.2
   001319         132400*                    IS GREATER THAN ANY RECORD KEY VALUE IN      IX2094.2
   001320         132500*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   001321         132600*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   001322         132700*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   001323         132800*                    EXECUTED.                                    IX2094.2
   001324         132900*                                                                 IX2094.2
   001325         133000     START   IX-FS1                                               IX2094.2 219
   001326         133100                    KEY IS EQUAL TO IX-FS1-KEY-1-10               IX2094.2 229
   001327      1  133200          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (9)       IX2094.2 276 442
   001328      1  133300                     GO TO START-PASS-GF-09.                      IX2094.2 1338
   001329         133400     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2094.2 276 442
   001330         133500     READ    IX-FS1  AT END                                       IX2094.2 219
   001331      1  133600                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001332         133700     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001333         133800     MOVE "IX-36; 4.7.2 ETC." TO RE-MARK.                         IX2094.2 505
   001334         133900     PERFORM FAIL.                                                IX2094.2 680
   001335         134000     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   001336         134100     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   001337         134200     GO TO   START-WRITE-GF-09.                                   IX2094.2 1343
   001338         134300 START-PASS-GF-09.                                                IX2094.2
   001339         134400     PERFORM PASS.                                                IX2094.2 679
   001340         134500     GO TO   START-WRITE-GF-09.                                   IX2094.2 1343
   001341         134600 START-DELETE-GF-09.                                              IX2094.2
   001342         134700     PERFORM DE-LETE.                                             IX2094.2 681
   001343         134800 START-WRITE-GF-09.                                               IX2094.2
   001344         134900     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001345         135000     CLOSE   IX-FS1.                                              IX2094.2 219
   001346         135100 START-INIT-GF-FILE-STATUS.                                       IX2094.2
   001347         135200     MOVE "FILE STATUS START:00"   TO FEATURE.                    IX2094.2 496
   001348         135300     MOVE   "START-TEST-GF-10" TO PAR-NAME.                       IX2094.2 500
   001349         135400*                                                                 IX2094.2
   001350         135500*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2094.2
   001351         135600*                                                                 IX2094.2
   001352         135700 START-TEST-GF-10.                                                IX2094.2
   001353         135800     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2094.2 442
   001354      1  135900             PERFORM DE-LETE                                      IX2094.2 681
   001355      1  136000             GO TO  START-WRITE-GF-10.                            IX2094.2 1368
   001356         136100*                                                                 IX2094.2
   001357         136200*  START-TEST-GF-10 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001358         136300*                    RESULTING FROM START-TEST-GF-01.  THE FILE   IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001359         136400*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2094.2
   001360         136500*                                                                 IX2094.2
   001361         136600     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2094.2 442
   001362      1  136700             PERFORM PASS                                         IX2094.2 679
   001363         136800     ELSE                                                         IX2094.2
   001364      1  136900     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-01  " TO RE-MARK IX2094.2 505
   001365      1  137000             PERFORM  FAIL                                        IX2094.2 680
   001366      1  137100             MOVE  "00"  TO CORRECT-A                             IX2094.2 525
   001367      1  137200             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2094.2 442 511
   001368         137300 START-WRITE-GF-10.                                               IX2094.2
   001369         137400     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001370         137500 START-TEST-GF-11.                                                IX2094.2
   001371         137600     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001372         137700     MOVE "START-TEST-GF-11" TO PAR-NAME.                         IX2094.2 500
   001373         137800     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2094.2 442
   001374      1  137900             PERFORM DE-LETE                                      IX2094.2 681
   001375      1  138000             GO TO  START-WRITE-GF-11.                            IX2094.2 1387
   001376         138100*                                                                 IX2094.2
   001377         138200*  START-TEST-GF-11 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001378         138300*                    RESULTING FROM START-TEST-GF-02. THE FILE    IX2094.2
   001379         138400*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   001380         138500*                                                                 IX2094.2
   001381         138600     IF      FILESTATUS (2)  EQUAL TO "23"                        IX2094.2 442
   001382      1  138700             PERFORM  PASS                                        IX2094.2 679
   001383      1  138800             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001384      1  138900     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-02  " TO RE-MARK IX2094.2 505
   001385      1  139000             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   001386      1  139100             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2094.2 442 511
   001387         139200 START-WRITE-GF-11.                                               IX2094.2
   001388         139300     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001389         139400 START-TEST-GF-12.                                                IX2094.2
   001390         139500     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001391         139600     MOVE "START-TEST-GF-12" TO PAR-NAME.                         IX2094.2 500
   001392         139700     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2094.2 442
   001393      1  139800             PERFORM DE-LETE                                      IX2094.2 681
   001394      1  139900             GO TO  START-WRITE-GF-12.                            IX2094.2 1406
   001395         140000*                                                                 IX2094.2
   001396         140100*  START-TEST-GF-12 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001397         140200*                    RESULTING FROM START-TEST-GF-03. THE FILE    IX2094.2
   001398         140300*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   001399         140400*                                                                 IX2094.2
   001400         140500     IF      FILESTATUS (3)  EQUAL TO "23"                        IX2094.2 442
   001401      1  140600             PERFORM  PASS                                        IX2094.2 679
   001402      1  140700             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001403      1  140800     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-03  " TO RE-MARK IX2094.2 505
   001404      1  140900             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   001405      1  141000             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2094.2 442 511
   001406         141100 START-WRITE-GF-12.                                               IX2094.2
   001407         141200     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001408         141300 START-TEST-GF-13.                                                IX2094.2
   001409         141400     MOVE "START-TEST-GF-13" TO PAR-NAME.                         IX2094.2 500
   001410         141500     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001411         141600     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2094.2 442
   001412      1  141700             PERFORM DE-LETE                                      IX2094.2 681
   001413      1  141800             GO TO  START-WRITE-GF-13.                            IX2094.2 1425
   001414         141900*                                                                 IX2094.2
   001415         142000*  START-TEST-GF-13 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001416         142100*                    RESULTING FROM START-TEST-GF-04. THE FILE    IX2094.2
   001417         142200*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   001418         142300*                                                                 IX2094.2
   001419         142400     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2094.2 442
   001420      1  142500             PERFORM  PASS                                        IX2094.2 679
   001421      1  142600             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001422      1  142700     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-04  " TO RE-MARK IX2094.2 505
   001423      1  142800             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   001424      1  142900             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2094.2 442 511
   001425         143000 START-WRITE-GF-13.                                               IX2094.2
   001426         143100     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001427         143200 START-TEST-GF-14.                                                IX2094.2
   001428         143300     MOVE "START-TEST-GF-14" TO PAR-NAME.                         IX2094.2 500
   001429         143400     MOVE "FILE STATUS START:00"   TO FEATURE.                    IX2094.2 496
   001430         143500     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2094.2 442
   001431      1  143600             PERFORM DE-LETE                                      IX2094.2 681
   001432      1  143700             GO TO  START-WRITE-GF-14.                            IX2094.2 1444
   001433         143800*                                                                 IX2094.2
   001434         143900*  START-TEST-GF-14 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001435         144000*                    RESULTING FROM START-TEST-GF-05. THE FILE    IX2094.2
   001436         144100*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   001437         144200*                                                                 IX2094.2
   001438         144300     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2094.2 442
   001439      1  144400             PERFORM  PASS                                        IX2094.2 679
   001440      1  144500             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001441      1  144600     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-05   " TO RE-MARKIX2094.2 505
   001442      1  144700             MOVE    "00"  TO CORRECT-A                           IX2094.2 525
   001443      1  144800             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2094.2 442 511
   001444         144900 START-WRITE-GF-14.                                               IX2094.2
   001445         145000     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001446         145100 START-TEST-GF-15.                                                IX2094.2
   001447         145200     MOVE "START-TEST-GF-15" TO PAR-NAME.                         IX2094.2 500
   001448         145300     MOVE "FILE STATUS START:00"   TO FEATURE.                    IX2094.2 496
   001449         145400     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2094.2 442
   001450      1  145500             PERFORM DE-LETE                                      IX2094.2 681
   001451      1  145600             GO TO  START-WRITE-GF-15.                            IX2094.2 1463
   001452         145700*                                                                 IX2094.2
   001453         145800*  START-TEST-GF-15 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001454         145900*                    RESULTING FROM START-TEST-GF-06. THE FILE    IX2094.2
   001455         146000*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   001456         146100*                                                                 IX2094.2
   001457         146200     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2094.2 442
   001458      1  146300             PERFORM  PASS                                        IX2094.2 679
   001459      1  146400             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001460      1  146500     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-06   " TO RE-MARKIX2094.2 505
   001461      1  146600             MOVE   "00"  TO CORRECT-A                            IX2094.2 525
   001462      1  146700             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2094.2 442 511
   001463         146800 START-WRITE-GF-15.                                               IX2094.2
   001464         146900     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001465         147000 START-TEST-GGF-16.                                               IX2094.2
   001466         147100     MOVE "START-TEST-GF-16" TO PAR-NAME.                         IX2094.2 500
   001467         147200     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001468         147300     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2094.2 442
   001469      1  147400             PERFORM DE-LETE                                      IX2094.2 681
   001470      1  147500             GO TO  START-WRITE-GF-16.                            IX2094.2 1482
   001471         147600*                                                                 IX2094.2
   001472         147700*  START-TEST-GF-16 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001473         147800*                    RESULTING FROM START-TEST-GF-07. THE FILE    IX2094.2
   001474         147900*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2094.2
   001475         148000*                                                                 IX2094.2
   001476         148100     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2094.2 442
   001477      1  148200             PERFORM  PASS                                        IX2094.2 679
   001478      1  148300             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001479      1  148400     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-07   " TO RE-MARKIX2094.2 505
   001480      1  148500             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   001481      1  148600             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2094.2 442 511
   001482         148700 START-WRITE-GF-16.                                               IX2094.2
   001483         148800     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001484         148900 START-TEST-GF-17.                                                IX2094.2
   001485         149000     MOVE "START-TEST-GF-17" TO PAR-NAME.                         IX2094.2 500
   001486         149100     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001487         149200     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2094.2 442
   001488      1  149300             PERFORM DE-LETE                                      IX2094.2 681
   001489      1  149400             GO TO  START-WRITE-GF-17.                            IX2094.2 1501
   001490         149500*                                                                 IX2094.2
   001491         149600*  START-TEST-GF-07 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001492         149700*                    RESULTING FROM START-TEST-GF-08. THE FILE    IX2094.2
   001493         149800*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   001494         149900*                                                                 IX2094.2
   001495         150000     IF      FILESTATUS (8)  EQUAL TO "23"                        IX2094.2 442
   001496      1  150100             PERFORM  PASS                                        IX2094.2 679
   001497      1  150200             ELSE  PERFORM  FAIL                                  IX2094.2 680
   001498      1  150300     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-08   " TO RE-MARKIX2094.2 505
   001499      1  150400             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   001500      1  150500             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2094.2 442 511
   001501         150600 START-WRITE-GF-17.                                               IX2094.2
   001502         150700     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001503         150800 START-TEST-GF-18.                                                IX2094.2
   001504         150900     MOVE "START-TEST-GF-18" TO PAR-NAME.                         IX2094.2 500
   001505         151000     MOVE "FILE STATUS START:23"   TO FEATURE.                    IX2094.2 496
   001506         151100     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2094.2 442
   001507      1  151200             PERFORM DE-LETE                                      IX2094.2 681
   001508      1  151300             GO TO  START-WRITE-GF-18.                            IX2094.2 1520
   001509         151400*                                                                 IX2094.2
   001510         151500*  START-TEST-GF-18 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001511         151600*                    RESULTING FROM START-TEST-GF-09. THE FILE    IX2094.2
   001512         151700*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   001513         151800*                                                                 IX2094.2
   001514         151900     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2094.2 442
   001515      1  152000             PERFORM PASS                                         IX2094.2 679
   001516      1  152100     ELSE    PERFORM FAIL                                         IX2094.2 680
   001517      1  152200     MOVE "IX-3; 1.3.4 (1) A; FROM START-TEST-GF-09   " TO RE-MARKIX2094.2 505
   001518      1  152300             MOVE  "23"  TO CORRECT-A                             IX2094.2 525
   001519      1  152400             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2094.2 442 511
   001520         152500 START-WRITE-GF-18.                                               IX2094.2
   001521         152600     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   001522         152800                                                                  IX2094.2
   001523         152900 START-INIT-005.                                                  IX2094.2
   001524         153000     OPEN    INPUT  IX-FS1.                                       IX2094.2 219
   001525         153100     MOVE    "STR EQ ALTKY W/O DUP" TO FEATURE.                   IX2094.2 496
   001526         153200     MOVE    "START-TEST-GF-19" TO PAR-NAME.                      IX2094.2 500
   001527         153300     MOVE    "********************" TO HOLD-FILESTATUS-RECORD.    IX2094.2 441
   001528         153400*                                                                 IX2094.2
   001529         153500* THIS TEST TESTS THE  "START -- EQUAL TO" FOR PROPER POSITIONING IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001530         153600* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2094.2
   001531         153700* START-TEST-GF-19/27 USES ONLY THE ALTERNATE RECORD KEY WITHOUT  IX2094.2
   001532         153800* THE DUPLICATES OPTION FOR ESTABLISHING THE CURRENT RECORD       IX2094.2
   001533         153900* POINTER FOR THE FILE.  THE FOLLOWING IS A SUMMARY OF THE TEST   IX2094.2
   001534         154000* CONDITIONS AND THE EXPECTED ACTION TO BE TAKEN FOR THE TESTS.   IX2094.2
   001535         154100*                                                                 IX2094.2
   001536         154200*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2094.2
   001537         154300*                                                                 IX2094.2
   001538         154400*   START-TEST-GF-19  - EQUAL A RECORD IN FILE / RECORD FOUND     IX2094.2
   001539         154500*   START-TEST-GF-20  - BETWEEN 2 EXISTING KEY VALUES / INVALID KEIX2094.2
   001540         154600*   START-TEST-GF-21  - LESS THAN FIRST FILE RECORD / INVALID KEY IX2094.2
   001541         154700*   START-TEST-GF-22  - GREATER THAN LAST FILE RECORD / INVALID KEIX2094.2
   001542         154800*   START-TEST-GF-23  - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUIX2094.2
   001543         154900*   START-TEST-GF-24  - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUIX2094.2
   001544         155000*   START-TEST-GF-25  - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEIX2094.2
   001545         155100*   START-TEST-GF-26  - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEIX2094.2
   001546         155200*   START-TEST-GF-27  - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEYIX2094.2
   001547         155300*                                                                 IX2094.2
   001548         155400*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2094.2
   001549         155500*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2094.2
   001550         155600*  IF AN INVALID KEY IS EXPECTED FROM THE TEST, THE KEYS          IX2094.2
   001551         155700*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2094.2
   001552         155800*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2094.2
   001553         155900*  MATCH RECORDS IN THE FILE.  IF KEY MATCH IS EXPECTED FROM      IX2094.2
   001554         156000*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2094.2
   001555         156100*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2094.2
   001556         156200*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2094.2
   001557         156300*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2094.2
   001558         156400*                                                                 IX2094.2
   001559         156500 START-INIT-GF-19.                                                IX2094.2
   001560         156600     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001561         156700     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001562      1  156800             MOVE   "**"  TO FILESTATUS (1)                       IX2094.2 442
   001563      1  156900             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2094.2 505
   001564      1  157000             GO TO START-DELETE-GF-19.                            IX2094.2 1599
   001565         157100     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001566         157200     MOVE    "XXXXXXXXXY382ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001567         157300     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   001568         157400     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2094.2 254 227
   001569         157500     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2094.2 259 235
   001570         157600     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2094.2 267 244
   001571         157700 START-TEST-GF-19.                                                IX2094.2
   001572         157800*                                                                 IX2094.2
   001573         157900*  START-TEST-GF-19 - THE START SHOULD FIND A RECORD IN THE FILE  IX2094.2
   001574         158000*                    WHICH HAS AN ALTERNATE KEY VALUE OF          IX2094.2
   001575         158100*                    XXXXXXXXXY382ALTKEY1 (RECORD NUMBER 191).    IX2094.2
   001576         158200*                                                                 IX2094.2
   001577         158300     START   IX-FS1                                               IX2094.2 219
   001578         158400                    KEY IS EQUAL TO IX-FS1-ALTKEY1                IX2094.2 236
   001579      1  158500        INVALID KEY     MOVE FS1-STATUS TO FILESTATUS (1)         IX2094.2 276 442
   001580      1  158600                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   001581      1  158700                        GO TO START-FAIL-GF-19.                   IX2094.2 1594
   001582         158800     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2094.2 276 442
   001583         158900     READ    IX-FS1  AT END                                       IX2094.2 219
   001584      1  159000                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   001585      1  159100                     GO TO START-FAIL-GF-19.                      IX2094.2 1594
   001586         159200     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2094.2 223 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001587         159300     IF      XRECORD-NUMBER (1)  EQUAL TO 191                     IX2094.2 467
   001588      1  159400             PERFORM PASS                                         IX2094.2 679
   001589      1  159500             MOVE SPACE TO RE-MARK                                IX2094.2 IMP 505
   001590      1  159600             GO TO START-WRITE-GF-19.                             IX2094.2 1601
   001591         159700     MOVE    66  TO RECNO.                                        IX2094.2 275
   001592         159800     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2094.2 2835
   001593         159900     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2094.2 467 518
   001594         160000 START-FAIL-GF-19.                                                IX2094.2
   001595         160100     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001596         160200     PERFORM FAIL.                                                IX2094.2 680
   001597         160300     MOVE    191  TO CORRECT-18V0.                                IX2094.2 531
   001598         160400     GO TO   START-WRITE-GF-19.                                   IX2094.2 1601
   001599         160500 START-DELETE-GF-19.                                              IX2094.2
   001600         160600     PERFORM DE-LETE.                                             IX2094.2 681
   001601         160700 START-WRITE-GF-19.                                               IX2094.2
   001602         160800     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001603         160900 START-INIT-GF-20.                                                IX2094.2
   001604         161000     MOVE "START-TEST-GF-20" TO PAR-NAME.                         IX2094.2 500
   001605         161100     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001606         161200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001607      1  161300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001608      1  161400             MOVE   "**"  TO FILESTATUS (2)                       IX2094.2 442
   001609      1  161500             GO TO   START-DELETE-GF-20.                          IX2094.2 1641
   001610         161600     MOVE    "EEEEEEEFFF066"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001611         161700     MOVE    "HHHHHHHIII067ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001612         161800     MOVE    "TTTTTTTSSS334ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   001613         161900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001614         162000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001615         162100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001616         162200 START-TEST-GF-20.                                                IX2094.2
   001617         162300*                                                                 IX2094.2
   001618         162400*  START-TEST-GF.02  - THE START SHOULD NOT FIND A RECORD IN THE  IX2094.2
   001619         162500*                    FILE WHICH HAS AN ALTERNATE KEY VALUE OF     IX2094.2
   001620         162600*                    HHHHHHHIII067ALTKEY1.  THIS KEY VALUE IS     IX2094.2
   001621         162700*                    SEQUENTIALLY LOCATED BETWEEN TWO CURRENTLY   IX2094.2
   001622         162800*                    EXISTING ALTERNATE KEYS IN THE FILE.         IX2094.2
   001623         162900*                                                                 IX2094.2
   001624         163000     START   IX-FS1                                               IX2094.2 219
   001625         163100                    KEY IS EQUAL TO IX-FS1-ALTKEY1                IX2094.2 236
   001626      1  163200          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (2)       IX2094.2 276 442
   001627      1  163300                         GO TO START-PASS-GF-20.                  IX2094.2 1637
   001628         163400     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2094.2 276 442
   001629         163500     READ    IX-FS1 AT END                                        IX2094.2 219
   001630      1  163600                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001631         163700     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001632         163800     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001633         163900     PERFORM FAIL.                                                IX2094.2 680
   001634         164000     MOVE    ALTERNATE-KEY1 (1) TO COMPUTED-A.                    IX2094.2 490 511
   001635         164100     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001636         164200     GO TO   START-WRITE-GF-20.                                   IX2094.2 1643
   001637         164300 START-PASS-GF-20.                                                IX2094.2
   001638         164400     PERFORM  PASS.                                               IX2094.2 679
   001639         164500     MOVE     "INVALID KEY"  TO RE-MARK.                          IX2094.2 505
   001640         164600     GO TO   START-WRITE-GF-20.                                   IX2094.2 1643
   001641         164700 START-DELETE-GF-20.                                              IX2094.2
   001642         164800     PERFORM DE-LETE.                                             IX2094.2 681
   001643         164900 START-WRITE-GF-20.                                               IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001644         165000     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001645         165100 START-INIT-GF-21.                                                IX2094.2
   001646         165200     MOVE "START-TEST-GF-21" TO PAR-NAME.                         IX2094.2 500
   001647         165300     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001648         165400     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001649      1  165500             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001650      1  165600             MOVE   "**"  TO FILESTATUS (3)                       IX2094.2 442
   001651      1  165700             GO TO   START-DELETE-GF-21.                          IX2094.2 1683
   001652         165800     MOVE    "BBBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001653         165900     MOVE   "EEEEEEEEEF001ALTKEY1"  TO FS1-ALTKEY1-1-20.          IX2094.2 260
   001654         166000     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001655         166100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001656         166200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001657         166300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001658         166400 START-TEST-GF-21.                                                IX2094.2
   001659         166500*                                                                 IX2094.2
   001660         166600*  START-TEST-GF-21 - THE START STATEMENT SHOULD NOT FIND A       IX2094.2
   001661         166700*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2094.2
   001662         166800*                    KEY VALUE OF EEEEEEEEEF001ALTKEY1.  THIS KEY IX2094.2
   001663         166900*                    VALUE IS SEQUENTIALLY LOWER THAN ANY         IX2094.2
   001664         167000*                    CURRENTLY EXISTING KEY IN THE FILE.          IX2094.2
   001665         167100*                                                                 IX2094.2
   001666         167200     START   IX-FS1                                               IX2094.2 219
   001667         167300                    KEY IS EQUAL TO IX-FS1-ALTKEY1                IX2094.2 236
   001668      1  167400          INVALID KEY    MOVE FS1-STATUS TO FILESTATUS (3)        IX2094.2 276 442
   001669      1  167500                     GO TO START-PASS-GF-21.                      IX2094.2 1679
   001670         167600     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2094.2 276 442
   001671         167700     READ    IX-FS1  AT END                                       IX2094.2 219
   001672      1  167800                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001673         167900     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001674         168000     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001675         168100     PERFORM FAIL.                                                IX2094.2 680
   001676         168200     MOVE    ALTERNATE-KEY1 (1) TO COMPUTED-A.                    IX2094.2 490 511
   001677         168300     MOVE    "INVALID KEY"  TO CORRECT-A.                         IX2094.2 525
   001678         168400     GO TO START-WRITE-GF-21.                                     IX2094.2 1685
   001679         168500 START-PASS-GF-21.                                                IX2094.2
   001680         168600     PERFORM PASS.                                                IX2094.2 679
   001681         168700     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2094.2 505
   001682         168800     GO TO   START-WRITE-GF-21.                                   IX2094.2 1685
   001683         168900 START-DELETE-GF-21.                                              IX2094.2
   001684         169000     PERFORM DE-LETE.                                             IX2094.2 681
   001685         169100 START-WRITE-GF-21.                                               IX2094.2
   001686         169200     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001687         169300 START-INIT-GF-22.                                                IX2094.2
   001688         169400     MOVE "START-TEST-GF-22" TO PAR-NAME.                         IX2094.2 500
   001689         169500     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001690         169600     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001691      1  169700             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001692      1  169800             MOVE   "**"  TO FILESTATUS (4)                       IX2094.2 442
   001693      1  169900             GO TO   START-DELETE-GF-22.                          IX2094.2 1726
   001694         170000     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001695         170100     MOVE    "YYYYYYYYYY401ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001696         170200     MOVE    "DDDDDDDDDD000ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   001697         170300     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001698         170400     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001699         170500     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001700         170600 START-TEST-GF-22.                                                IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001701         170700*                                                                 IX2094.2
   001702         170800*  START-TEST-GF-22 - THE START STATEMENT SHOULD NOT FIND A       IX2094.2
   001703         170900*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2094.2
   001704         171000*                    KEY VALUE OF YYYYYYYYYY401ALTKEY1.  THIS     IX2094.2
   001705         171100*                    VALUE IS SEQUENTIALLY GREATER THAN           IX2094.2
   001706         171200*                    ANY ALTERNATE KEY CURRENTLY EXISTING IN      IX2094.2
   001707         171300*                    THE FILE.  AN INVALID KEY CONDITION          IX2094.2
   001708         171400*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2094.2
   001709         171500*                                                                 IX2094.2
   001710         171600     START   IX-FS1                                               IX2094.2 219
   001711         171700                    KEY IS EQUAL TO IX-FS1-ALTKEY1                IX2094.2 236
   001712      1  171800          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2094.2 276 442
   001713      1  171900                         GO TO START-PASS-GF-22.                  IX2094.2 1723
   001714         172000     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2094.2 276 442
   001715         172100     READ    IX-FS1 AT END                                        IX2094.2 219
   001716      1  172200                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001717         172300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001718         172400     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001719         172500     PERFORM FAIL.                                                IX2094.2 680
   001720         172600     MOVE    ALTERNATE-KEY1 (1) TO COMPUTED-A.                    IX2094.2 490 511
   001721         172700     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001722         172800     GO TO   START-WRITE-GF-22.                                   IX2094.2 1728
   001723         172900 START-PASS-GF-22.                                                IX2094.2
   001724         173000     PERFORM  PASS.                                               IX2094.2 679
   001725         173100     GO TO   START-WRITE-GF-22.                                   IX2094.2 1728
   001726         173200 START-DELETE-GF-22.                                              IX2094.2
   001727         173300     PERFORM DE-LETE.                                             IX2094.2 681
   001728         173400 START-WRITE-GF-22.                                               IX2094.2
   001729         173500     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001730         173600 START-INIT-GF-23.                                                IX2094.2
   001731         173700     MOVE "START-TEST-GF-23" TO PAR-NAME.                         IX2094.2 500
   001732         173800     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001733         173900     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001734      1  174000             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001735      1  174100             MOVE   "**"  TO FILESTATUS (5)                       IX2094.2 442
   001736      1  174200             GO TO   START-DELETE-GF-23.                          IX2094.2 1779
   001737         174300     MOVE    "CDDDDDDDDD039"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001738         174400     MOVE    "GGGGHXXXXX052ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2094.2 260
   001739         174500     MOVE    "ABCXXXXXXX400ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001740         174600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001741         174700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001742         174800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001743         174900 START-TEST-GF-23.                                                IX2094.2
   001744         175000*  START-TEST-GF-23 - THE START STATEMENT USES AN OPERAND         IX2094.2
   001745         175100*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2094.2
   001746         175200*                    OF AN ALTERNATE KEY BUT IS THE NAME OF A     IX2094.2
   001747         175300*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2094.2
   001748         175400*                    ALTERNATE KEY.  THE CONTENTS OF THE DATA ITEMIX2094.2
   001749         175500*                    (POSITIONS 1 THRU 5 OF THE ALTERNATE KEY)    IX2094.2
   001750         175600*                    IS A UNIQUE KEY VALUE FOR THE FILE.  THE     IX2094.2
   001751         175700*                    BALANCE OF THE KEY (POSITIONS 6 THRU 13 OF   IX2094.2
   001752         175800*                    THE ALTERNATE KEY IS NOT A VALID KEY VALUE   IX2094.2
   001753         175900*                    FOR THE FILE.  THE                           IX2094.2
   001754         176000*                    RECORD WITH THE ALTERNATE KEY "GGGGHHHHHH052 IX2094.2
   001755         176100*                    ALTKEY1 (RECORD NUMBER 26) IS EXPECTED TO    IX2094.2
   001756         176200*                    BE FOUND.                                    IX2094.2
   001757         176300*                                                                 IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001758         176400     START   IX-FS1                                               IX2094.2 219
   001759         176500                    KEY IS EQUAL TO IX-FS1-ALTKEY1-1-5            IX2094.2 238
   001760      1  176600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2094.2 276 442
   001761      1  176700                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   001762      1  176800                     GO TO START-FAIL-GF-23.                      IX2094.2 1774
   001763         176900     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2094.2 276 442
   001764         177000     READ    IX-FS1  AT END                                       IX2094.2 219
   001765      1  177100                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   001766      1  177200                     GO TO  START-FAIL-GF-23.                     IX2094.2 1774
   001767         177300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001768         177400     IF      XRECORD-NUMBER (1)  EQUAL TO 26                      IX2094.2 467
   001769      1  177500             PERFORM  PASS                                        IX2094.2 679
   001770      1  177600             GO TO START-WRITE-GF-23.                             IX2094.2 1781
   001771         177700     MOVE    26  TO RECNO.                                        IX2094.2 275
   001772         177800     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2094.2 2835
   001773         177900     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   001774         178000 START-FAIL-GF-23.                                                IX2094.2
   001775         178100     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001776         178200     PERFORM  FAIL.                                               IX2094.2 680
   001777         178300     MOVE    26  TO CORRECT-18V0.                                 IX2094.2 531
   001778         178400     GO TO   START-WRITE-GF-23.                                   IX2094.2 1781
   001779         178500 START-DELETE-GF-23.                                              IX2094.2
   001780         178600     PERFORM DE-LETE.                                             IX2094.2 681
   001781         178700 START-WRITE-GF-23.                                               IX2094.2
   001782         178800     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001783         178900 START-INIT-GF-24.                                                IX2094.2
   001784         179000     MOVE "START-TEST-GF-24" TO PAR-NAME.                         IX2094.2 500
   001785         179100     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001786         179200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001787      1  179300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001788      1  179400             MOVE   "**"  TO FILESTATUS (6)                       IX2094.2 442
   001789      1  179500             GO TO   START-DELETE-GF-24.                          IX2094.2 1835
   001790         179600     MOVE    "YYYYYUUUUU390"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001791         179700     MOVE    "XXXXXYYYYY390ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001792         179800     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001793         179900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001794         180000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001795         180100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001796         180200 START-TEST-GF-24.                                                IX2094.2
   001797         180300*                                                                 IX2094.2
   001798         180400*  START-TEST-GF-24 - THE START STATEMENT USES AN OPERAND IN THE  IX2094.2
   001799         180500*                    KEY PHRASE WHICH IS NOT THE NAME OF AN       IX2094.2
   001800         180600*                    ALTERNATE KEY BUT IS THE NAME OF A DATA ITEM IX2094.2
   001801         180700*                    THAT IS SUBORDINATE TO THE KEY.  THE CONTENTSIX2094.2
   001802         180800*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2094.2
   001803         180900*                    ALTERNATE KEY) IS A DUPLICATE OF THE FIRST   IX2094.2
   001804         181000*                    5 POSITIONS OF 5 OTHER RECORDS IN THE FILE.  IX2094.2
   001805         181100*                    THIS TEST EXPECTS THE RECORD POINTER         IX2094.2
   001806         181200*                    TO BE POSITIONED TO RECORD KEY XXXXXXXXXX380 IX2094.2
   001807         181300*                    ALTKEY1 (RECORD NUMBER 190) WHICH WAS THE    IX2094.2
   001808         181400*                    FIRST RECORD WRITTEN TO THE FILE THAT        IX2094.2
   001809         181500*                    CONTAINS XXXXX IN THE FIRST 5 POSITIONS OF   IX2094.2
   001810         181600*                  THE KEY.  THE ALTERNATE KEY WAS LOADED WITH THEIX2094.2
   001811         181700*                    VALUE XXXXXYYYYY390ALTKEY1 (KEY FOR RECORD   IX2094.2
   001812         181800*                     NUMBER 195) BEFORE THE START WAS EXECUTED.  IX2094.2
   001813         181900*                                                                 IX2094.2
   001814         182000     START   IX-FS1                                               IX2094.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001815         182100                    KEY IS EQUAL TO IX-FS1-ALTKEY1-1-5            IX2094.2 238
   001816      1  182200          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (6)       IX2094.2 276 442
   001817      1  182300                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2094.2 511
   001818      1  182400                     GO TO START-FAIL-GF-24.                      IX2094.2 1830
   001819         182500     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2094.2 276 442
   001820         182600     READ    IX-FS1  AT END                                       IX2094.2 219
   001821      1  182700                     MOVE "AT END ON READ" TO COMPUTED-A          IX2094.2 511
   001822      1  182800                     GO TO START-FAIL-GF-24.                      IX2094.2 1830
   001823         182900     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001824         183000     IF      XRECORD-NUMBER (1) EQUAL TO 190                      IX2094.2 467
   001825      1  183100             PERFORM  PASS                                        IX2094.2 679
   001826      1  183200             GO TO START-WRITE-GF-24.                             IX2094.2 1837
   001827         183300     MOVE    65  TO RECNO.                                        IX2094.2 275
   001828         183400     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2094.2 2835
   001829         183500     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   001830         183600 START-FAIL-GF-24.                                                IX2094.2
   001831         183700     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001832         183800     PERFORM  FAIL.                                               IX2094.2 680
   001833         183900     MOVE    190   TO CORRECT-18V0.                               IX2094.2 531
   001834         184000     GO TO   START-WRITE-GF-24.                                   IX2094.2 1837
   001835         184100 START-DELETE-GF-24.                                              IX2094.2
   001836         184200     PERFORM DE-LETE.                                             IX2094.2 681
   001837         184300 START-WRITE-GF-24.                                               IX2094.2
   001838         184400     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001839         184500 START-INIT-GF-25.                                                IX2094.2
   001840         184600     MOVE "START-TEST-GF-25" TO PAR-NAME.                         IX2094.2 500
   001841         184700     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001842         184800     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001843      1  184900             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001844      1  185000             MOVE   "**"  TO FILESTATUS (7)                       IX2094.2 442
   001845      1  185100             GO TO   START-DELETE-GF-25.                          IX2094.2 1885
   001846         185200     MOVE    "CCCCCCCCCD022"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001847         185300     MOVE    "022ALTKEY1          "  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001848         185400     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001849         185500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001850         185600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001851         185700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001852         185800 START-TEST-GF-25.                                                IX2094.2
   001853         185900*                                                                 IX2094.2
   001854         186000*  START-TEST-GF-25 - THE START STATEMENT USES AN OPERAND IN THE  IX2094.2
   001855         186100*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001856         186200*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   001857         186300*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001858         186400*                    POSITIONS 1 THRU 10 OF THE ALTERNATE KEY)    IX2094.2
   001859         186500*                    IS LOADED WITH "022ALTKEY1". NO SUCH RECORD  IX2094.2
   001860         186600*                    SHOULD BE IN THE FILE.  IF IN THE COMPARSION,IX2094.2
   001861         186700*                    THE LONGER OPERAND IS TRUNCATED ON THE LEFT  IX2094.2
   001862         186800*                    INSTEAD OF ON THE RIGHT THE CONTENTS OF      IX2094.2
   001863         186900*                    THE DATA ITEM WILL MATCH A RECORD IN THE     IX2094.2
   001864         187000*                    FILE.  THIS TEST EXPECTS THE LONGER OPERAND  IX2094.2
   001865         187100*                    TO BE TRUNCATED ON THE RIGHT CAUSING NO      IX2094.2
   001866         187200*                    DATA ITEM MATCH AND RESULTING IN AN INVALID  IX2094.2
   001867         187300*                    KEY CONDITION WHEN THE START IS EXECUTED.    IX2094.2
   001868         187400*                                                                 IX2094.2
   001869         187500     START  IX-FS1                                                IX2094.2 219
   001870         187600                   KEY IS EQUAL TO IX-FS1-ALTKEY1-1-10            IX2094.2 237
   001871      1  187700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2094.2 276 442
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001872      1  187800                     GO TO START-PASS-GF-25.                      IX2094.2 1882
   001873         187900     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2094.2 276 442
   001874         188000     READ    IX-FS1  AT END                                       IX2094.2 219
   001875      1  188100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001876         188200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001877         188300     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001878         188400     PERFORM FAIL.                                                IX2094.2 680
   001879         188500     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2094.2 488 511
   001880         188600     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   001881         188700     GO TO   START-WRITE-GF-25.                                   IX2094.2 1887
   001882         188800 START-PASS-GF-25.                                                IX2094.2
   001883         188900     PERFORM PASS.                                                IX2094.2 679
   001884         189000     GO TO   START-WRITE-GF-25.                                   IX2094.2 1887
   001885         189100 START-DELETE-GF-25.                                              IX2094.2
   001886         189200     PERFORM DE-LETE.                                             IX2094.2 681
   001887         189300 START-WRITE-GF-25.                                               IX2094.2
   001888         189400     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001889         189500 START-INIT-GF-26.                                                IX2094.2
   001890         189600     MOVE "START-TEST-GF-26" TO PAR-NAME.                         IX2094.2 500
   001891         189700     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001892         189800     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001893      1  189900             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001894      1  190000             MOVE   "**"  TO FILESTATUS (8)                       IX2094.2 442
   001895      1  190100             GO TO   START-DELETE-GF-26.                          IX2094.2 1932
   001896         190200     MOVE    "BBBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001897         190300     MOVE    "EEEEEEEEEE002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001898         190400     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001899         190500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001900         190600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001901         190700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001902         190800 START-TEST-GF-26.                                                IX2094.2
   001903         190900*                                                                 IX2094.2
   001904         191000*  START-TEST-GF-26 - THIS TEST USES AN OPERAND IN THE            IX2094.2
   001905         191100*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001906         191200*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   001907         191300*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001908         191400*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2094.2
   001909         191500*                    LOADED WITH "EEEEEEEEEE". THIS KEY VALUE     IX2094.2
   001910         191600*                    IS LOWER THAN ANY ALTERNATE KEY VALUE IN     IX2094.2
   001911         191700*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   001912         191800*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   001913         191900*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   001914         192000*                    EXECUTED.                                    IX2094.2
   001915         192100*                                                                 IX2094.2
   001916         192200     START  IX-FS1                                                IX2094.2 219
   001917         192300                   KEY IS EQUAL TO IX-FS1-ALTKEY1-1-10            IX2094.2 237
   001918      1  192400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2094.2 276 442
   001919      1  192500                     GO TO START-PASS-GF-26.                      IX2094.2 1929
   001920         192600     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2094.2 276 442
   001921         192700     READ    IX-FS1  AT END                                       IX2094.2 219
   001922      1  192800                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001923         192900     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001924         193000     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001925         193100     PERFORM FAIL.                                                IX2094.2 680
   001926         193200     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   001927         193300     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   001928         193400     GO TO   START-WRITE-GF-26.                                   IX2094.2 1934
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001929         193500 START-PASS-GF-26.                                                IX2094.2
   001930         193600     PERFORM PASS.                                                IX2094.2 679
   001931         193700     GO TO   START-WRITE-GF-26.                                   IX2094.2 1934
   001932         193800 START-DELETE-GF-26.                                              IX2094.2
   001933         193900     PERFORM DE-LETE.                                             IX2094.2 681
   001934         194000 START-WRITE-GF-26.                                               IX2094.2
   001935         194100     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001936         194200 START-INIT-GF-27.                                                IX2094.2
   001937         194300     MOVE "START-TEST-GF-27" TO PAR-NAME.                         IX2094.2 500
   001938         194400     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   001939         194500     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   001940      1  194600             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   001941      1  194700             MOVE   "**"  TO FILESTATUS (9)                       IX2094.2 442
   001942      1  194800             GO TO   START-DELETE-GF-27.                          IX2094.2 1979
   001943         194900     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   001944         195000     MOVE    "YYYYYZYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   001945         195100     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   001946         195200     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   001947         195300     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   001948         195400     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   001949         195500 START-TEST-GF-27.                                                IX2094.2
   001950         195600*                                                                 IX2094.2
   001951         195700*  START-TEST-GF-27 - THIS TEST USES AN OPERAND IN THE            IX2094.2
   001952         195800*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   001953         195900*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   001954         196000*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   001955         196100*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2094.2
   001956         196200*                    LOADED WITH "YYYYYZYYYY". THIS KEY VALUE     IX2094.2
   001957         196300*                    IS GREATER THAN ANY ALTERNATE KEY VALUE IN   IX2094.2
   001958         196400*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   001959         196500*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   001960         196600*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   001961         196700*                    EXECUTED.                                    IX2094.2
   001962         196800*                                                                 IX2094.2
   001963         196900     START  IX-FS1                                                IX2094.2 219
   001964         197000                   KEY IS EQUAL TO IX-FS1-ALTKEY1-1-10            IX2094.2 237
   001965      1  197100          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (9)       IX2094.2 276 442
   001966      1  197200                     GO TO START-PASS-GF-27.                      IX2094.2 1976
   001967         197300     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2094.2 276 442
   001968         197400     READ    IX-FS1  AT END                                       IX2094.2 219
   001969      1  197500                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   001970         197600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   001971         197700     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   001972         197800     PERFORM FAIL.                                                IX2094.2 680
   001973         197900     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   001974         198000     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   001975         198100     GO TO   START-WRITE-GF-27.                                   IX2094.2 1981
   001976         198200 START-PASS-GF-27.                                                IX2094.2
   001977         198300     PERFORM PASS.                                                IX2094.2 679
   001978         198400     GO TO   START-WRITE-GF-27.                                   IX2094.2 1981
   001979         198500 START-DELETE-GF-27.                                              IX2094.2
   001980         198600     PERFORM DE-LETE.                                             IX2094.2 681
   001981         198700 START-WRITE-GF-27.                                               IX2094.2
   001982         198800     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   001983         198900                                                                  IX2094.2
   001984         199000     CLOSE   IX-FS1.                                              IX2094.2 219
   001985         199100                                                                  IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001986         199200 START-INIT-FILE-STATUS-2.                                        IX2094.2
   001987         199300     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   001988         199400     MOVE "START-TEST-GF-28" TO PAR-NAME.                         IX2094.2 500
   001989         199500*                                                                 IX2094.2
   001990         199600*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2094.2
   001991         199700*  CAPTURED FROM THE LAST NINE TSTS.                              IX2094.2
   001992         199800*                                                                 IX2094.2
   001993         199900 START-TEST-GF-28.                                                IX2094.2
   001994         200000     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2094.2 442
   001995      1  200100             PERFORM DE-LETE                                      IX2094.2 681
   001996      1  200200             GO TO  START-WRITE-GF-28.                            IX2094.2 2009
   001997         200300*                                                                 IX2094.2
   001998         200400*  START-TEST-GF-28 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   001999         200500*                    RESULTING FROM START-TEST-GF-19. THE FILE    IX2094.2
   002000         200600*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2094.2
   002001         200700*                                                                 IX2094.2
   002002         200800     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2094.2 442
   002003      1  200900             PERFORM PASS                                         IX2094.2 679
   002004         201000     ELSE                                                         IX2094.2
   002005      1  201100     MOVE "IX-3; 1.3.4 (1) A FROM START-TEST-GF-19    " TO RE-MARKIX2094.2 505
   002006      1  201200             PERFORM  FAIL                                        IX2094.2 680
   002007      1  201300             MOVE  "00"  TO CORRECT-A                             IX2094.2 525
   002008      1  201400             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2094.2 442 511
   002009         201500 START-WRITE-GF-28.                                               IX2094.2
   002010         201600     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002011         201700 START-TEST-GF-29.                                                IX2094.2
   002012         201800     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002013         201900     MOVE "START-TEST-GF-29" TO PAR-NAME.                         IX2094.2 500
   002014         202000     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2094.2 442
   002015      1  202100             PERFORM DE-LETE                                      IX2094.2 681
   002016      1  202200             GO TO  START-WRITE-GF-29.                            IX2094.2 2028
   002017         202300*                                                                 IX2094.2
   002018         202400*  START-TEST-GF-29 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002019         202500*                    RESULTING FROM START-TEST-GF-20. THE FILE    IX2094.2
   002020         202600*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002021         202700*                                                                 IX2094.2
   002022         202800     IF      FILESTATUS (2)  EQUAL TO "23"                        IX2094.2 442
   002023      1  202900             PERFORM  PASS                                        IX2094.2 679
   002024      1  203000             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002025      1  203100     MOVE "IX-4; 1.3.4 (3) C ; SEE START-TEST-GF-20   " TO RE-MARKIX2094.2 505
   002026      1  203200             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002027      1  203300             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2094.2 442 511
   002028         203400 START-WRITE-GF-29.                                               IX2094.2
   002029         203500     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002030         203600 START-TEST-GF-30.                                                IX2094.2
   002031         203700     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002032         203800     MOVE "START-TEST-GF-30" TO PAR-NAME.                         IX2094.2 500
   002033         203900     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2094.2 442
   002034      1  204000             PERFORM DE-LETE                                      IX2094.2 681
   002035      1  204100             GO TO  START-WRITE-GF-30.                            IX2094.2 2047
   002036         204200*                                                                 IX2094.2
   002037         204300*  START-TEST-GF-30 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002038         204400*                    RESULTING FROM START-TEST-GF-21. THE FILE    IX2094.2
   002039         204500*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002040         204600*                                                                 IX2094.2
   002041         204700     IF      FILESTATUS (3)  EQUAL TO "23"                        IX2094.2 442
   002042      1  204800             PERFORM  PASS                                        IX2094.2 679
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002043      1  204900             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002044      1  205000     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-21    " TO RE-MARKIX2094.2 505
   002045      1  205100             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002046      1  205200             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2094.2 442 511
   002047         205300 START-WRITE-GF-30.                                               IX2094.2
   002048         205400     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002049         205500 START-TEST-GF-31.                                                IX2094.2
   002050         205600     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002051         205700     MOVE "START-TEST-GF-31" TO PAR-NAME.                         IX2094.2 500
   002052         205800     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2094.2 442
   002053      1  205900             PERFORM DE-LETE                                      IX2094.2 681
   002054      1  206000             GO TO  START-WRITE-GF-31.                            IX2094.2 2066
   002055         206100*                                                                 IX2094.2
   002056         206200*  START-TEST-GF-31 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002057         206300*                    RESULTING FROM START-TEST-GF-22. THE FILE    IX2094.2
   002058         206400*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002059         206500*                                                                 IX2094.2
   002060         206600     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2094.2 442
   002061      1  206700             PERFORM  PASS                                        IX2094.2 679
   002062      1  206800             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002063      1  206900     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-22    " TO RE-MARKIX2094.2 505
   002064      1  207000             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002065      1  207100             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2094.2 442 511
   002066         207200 START-WRITE-GF-31.                                               IX2094.2
   002067         207300     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002068         207400 START-TEST-GF-32.                                                IX2094.2
   002069         207500     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   002070         207600     MOVE "START-TEST-GF-32" TO PAR-NAME.                         IX2094.2 500
   002071         207700     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2094.2 442
   002072      1  207800             PERFORM DE-LETE                                      IX2094.2 681
   002073      1  207900             GO TO  START-WRITE-GF-32.                            IX2094.2 2085
   002074         208000*                                                                 IX2094.2
   002075         208100*  START-TEST-GF.05  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2094.2
   002076         208200*                    RESULTING FROM START-TEST-GF-23. THE FILE    IX2094.2
   002077         208300*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   002078         208400*                                                                 IX2094.2
   002079         208500     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2094.2 442
   002080      1  208600             PERFORM  PASS                                        IX2094.2 679
   002081      1  208700             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002082      1  208800     MOVE "IX-3; 1.3.4 (1) A; SEE START-TEST-GF-23    " TO RE-MARKIX2094.2 505
   002083      1  208900             MOVE    "00"  TO CORRECT-A                           IX2094.2 525
   002084      1  209000             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2094.2 442 511
   002085         209100 START-WRITE-GF-32.                                               IX2094.2
   002086         209200     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002087         209300 START-TEST-GF-33.                                                IX2094.2
   002088         209400     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   002089         209500     MOVE "START-TEST-GF-33" TO PAR-NAME.                         IX2094.2 500
   002090         209600     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2094.2 442
   002091      1  209700             PERFORM DE-LETE                                      IX2094.2 681
   002092      1  209800             GO TO  START-WRITE-GF-33.                            IX2094.2 2104
   002093         209900*                                                                 IX2094.2
   002094         210000*  START-TEST-GF-33  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2094.2
   002095         210100*                    RESULTING FROM START-TEST-GF-24. THE FILE    IX2094.2
   002096         210200*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   002097         210300*                                                                 IX2094.2
   002098         210400     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2094.2 442
   002099      1  210500             PERFORM  PASS                                        IX2094.2 679
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002100      1  210600             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002101      1  210700     MOVE "IX-3; 1.3.4 (1) A; SEE START-TEST-GF-24    " TO RE-MARKIX2094.2 505
   002102      1  210800             MOVE   "00"  TO CORRECT-A                            IX2094.2 525
   002103      1  210900             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2094.2 442 511
   002104         211000 START-WRITE-GF-33.                                               IX2094.2
   002105         211100     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002106         211200 START-TEST-GF-34.                                                IX2094.2
   002107         211300     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002108         211400     MOVE "START-TEST-GF-34" TO PAR-NAME.                         IX2094.2 500
   002109         211500     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2094.2 442
   002110      1  211600             PERFORM DE-LETE                                      IX2094.2 681
   002111      1  211700             GO TO  START-WRITE-GF-34.                            IX2094.2 2123
   002112         211800*                                                                 IX2094.2
   002113         211900*  START-TEST-GF-34  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2094.2
   002114         212000*                    RESULTING FROM START-TEST-GF-25. THE FILE    IX2094.2
   002115         212100*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2094.2
   002116         212200*                                                                 IX2094.2
   002117         212300     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2094.2 442
   002118      1  212400             PERFORM  PASS                                        IX2094.2 679
   002119      1  212500             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002120      1  212600     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-25    " TO RE-MARKIX2094.2 505
   002121      1  212700             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002122      1  212800             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2094.2 442 511
   002123         212900 START-WRITE-GF-34.                                               IX2094.2
   002124         213000     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002125         213100 START-TEST-GF-35.                                                IX2094.2
   002126         213200     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002127         213300     MOVE "START-TEST-GF-35" TO PAR-NAME.                         IX2094.2 500
   002128         213400     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2094.2 442
   002129      1  213500             PERFORM DE-LETE                                      IX2094.2 681
   002130      1  213600             GO TO  START-WRITE-GF-35.                            IX2094.2 2142
   002131         213700*                                                                 IX2094.2
   002132         213800*  START-TEST-GF-35  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2094.2
   002133         213900*                    RESULTING FROM START-TEST-GF-26. THE FILE    IX2094.2
   002134         214000*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002135         214100*                                                                 IX2094.2
   002136         214200     IF      FILESTATUS (8)  EQUAL TO "23"                        IX2094.2 442
   002137      1  214300             PERFORM  PASS                                        IX2094.2 679
   002138      1  214400             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002139      1  214500     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-26    " TO RE-MARKIX2094.2 505
   002140      1  214600             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002141      1  214700             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2094.2 442 511
   002142         214800 START-WRITE-GF-35.                                               IX2094.2
   002143         214900     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002144         215000 START-TEST-GF-36.                                                IX2094.2
   002145         215100     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002146         215200     MOVE "START-TEST-GF-36" TO PAR-NAME.                         IX2094.2 500
   002147         215300     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2094.2 442
   002148      1  215400             PERFORM DE-LETE                                      IX2094.2 681
   002149      1  215500             GO TO  START-WRITE-GF-36.                            IX2094.2 2161
   002150         215600*                                                                 IX2094.2
   002151         215700*  START-TEST-GF-36 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002152         215800*                    RESULTING FROM START-TEST-GF-27. THE FILE    IX2094.2
   002153         215900*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002154         216000*                                                                 IX2094.2
   002155         216100     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2094.2 442
   002156      1  216200             PERFORM PASS                                         IX2094.2 679
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002157      1  216300     ELSE    PERFORM FAIL                                         IX2094.2 680
   002158      1  216400     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-27    " TO RE-MARKIX2094.2 505
   002159      1  216500             MOVE  "23"  TO CORRECT-A                             IX2094.2 525
   002160      1  216600             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2094.2 442 511
   002161         216700 START-WRITE-GF-36.                                               IX2094.2
   002162         216800     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002163         216900                                                                  IX2094.2
   002164         217000                                                                  IX2094.2
   002165         217100 START-INIT-GF-37-ETC.                                            IX2094.2
   002166         217200     OPEN    INPUT  IX-FS1.                                       IX2094.2 219
   002167         217300     MOVE    "STRT EQ ALTKY W/DUP"  TO FEATURE.                   IX2094.2 496
   002168         217400     MOVE    "START-TEST-GF-37" TO PAR-NAME.                      IX2094.2 500
   002169         217500     MOVE    "********************" TO HOLD-FILESTATUS-RECORD.    IX2094.2 441
   002170         217600*                                                                 IX2094.2
   002171         217700* THIS TEST TESTS THE  "START -- EQUAL TO" FOR PROPER POSITIONING IX2094.2
   002172         217800* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2094.2
   002173         217900* START-TEST-007 USES ONLY THE ALTERNATE RECORD KEY WITH DUPLI-   IX2094.2
   002174         218000* CATES OPTION (ALTERNATE-KEY2) FOR ESTABLISHING                  IX2094.2
   002175         218100* THE CURRENT RECORD POINTER FOR THE FILE.  THE FOLLOWING IS A    IX2094.2
   002176         218200* SUMMARY OF THE TEST CONDITIONS AND THE EXPECTED ACTION TO BE    IX2094.2
   002177         218300* TAKEN FOR THE  TESTS.                                           IX2094.2
   002178         218400*                                                                 IX2094.2
   002179         218500*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2094.2
   002180         218600*                                                                 IX2094.2
   002181         218700*   START-TEST-GF-37 - EQUAL A RECORD IN FILE / RECORD FOUND      IX2094.2
   002182         218800*   START-TEST-GF-38 - BETWEEN 2 EXISTING KEY VALUES / INVALID KEYIX2094.2
   002183         218900*   START-TEST-GF-39 - LESS THAN FIRST FILE RECORD / INVALID KEY  IX2094.2
   002184         219000*   START-TEST-GF-40 - GREATER THAN LAST FILE RECORD / INVALID KEYIX2094.2
   002185         219100*   START-TEST-GF-41 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2094.2
   002186         219200*   START-TEST-GF-42 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2094.2
   002187         219300*   START-TEST-GF-43 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2094.2
   002188         219400*   START-TEST-GF-44 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2094.2
   002189         219500*   START-TEST-GF-45 - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEY IX2094.2
   002190         219600*                                                                 IX2094.2
   002191         219700*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2094.2
   002192         219800*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2094.2
   002193         219900*  IF AN INVALID KEY IS EXPECTED FROM THE TEST, THE KEYS          IX2094.2
   002194         220000*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2094.2
   002195         220100*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD MATCH   IX2094.2
   002196         220200*  RECORDS IN THE FILE.  IF A KEY MATCH IS EXPECTED FROM          IX2094.2
   002197         220300*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2094.2
   002198         220400*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2094.2
   002199         220500*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2094.2
   002200         220600*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2094.2
   002201         220700*                                                                 IX2094.2
   002202         220800 START-INIT-GF-37.                                                IX2094.2
   002203         220900     MOVE "START-TEST-GF-37" TO PAR-NAME.                         IX2094.2 500
   002204         221000     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002205         221100     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002206      1  221200             MOVE   "**"  TO FILESTATUS (1)                       IX2094.2 442
   002207      1  221300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002208      1  221400             GO TO START-DELETE-GF-37.                            IX2094.2 2243
   002209         221500     MOVE    "CCCCCDDDDD022" TO FS1-RECKEY-1-13.                  IX2094.2 255
   002210         221600     MOVE    "EEEEEFFFFF022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002211         221700     MOVE    "VVVVVVVVUU376ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002212         221800     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2094.2 254 227
   002213         221900     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2094.2 259 235
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002214         222000     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2094.2 267 244
   002215         222100 START-TEST-GF-37.                                                IX2094.2
   002216         222200*                                                                 IX2094.2
   002217         222300*  START-TEST-GF-37 - THE START SHOULD FIND A RECORD IN THE FILE  IX2094.2
   002218         222400*                    WHICH HAS AN ALTERNATE RECORD KEY VALUE OF   IX2094.2
   002219         222500*                    VVVVVVVVUU376ALTKEY2 (RECORD NUMBER 12).     IX2094.2
   002220         222600*                                                                 IX2094.2
   002221         222700     START  IX-FS1                                                IX2094.2 219
   002222         222800                   KEY IS EQUAL TO IX-FS1-ALTKEY2                 IX2094.2 245
   002223      1  222900          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (1)         IX2094.2 276 442
   002224      1  223000                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   002225      1  223100                        GO TO START-FAIL-GF-37.                   IX2094.2 2238
   002226         223200     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2094.2 276 442
   002227         223300     READ    IX-FS1  AT END                                       IX2094.2 219
   002228      1  223400                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   002229      1  223500                     GO TO START-FAIL-GF-37.                      IX2094.2 2238
   002230         223600     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2094.2 223 458
   002231         223700     IF      XRECORD-NUMBER (1) EQUAL TO 12                       IX2094.2 467
   002232      1  223800             PERFORM PASS                                         IX2094.2 679
   002233      1  223900             MOVE SPACE TO RE-MARK                                IX2094.2 IMP 505
   002234      1  224000             GO TO START-WRITE-GF-37.                             IX2094.2 2245
   002235         224100     MOVE    12 TO RECNO.                                         IX2094.2 275
   002236         224200     PERFORM DISPLAY-ALTERNATE-KEY2.                              IX2094.2 2842
   002237         224300     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2094.2 467 518
   002238         224400 START-FAIL-GF-37.                                                IX2094.2
   002239         224500     PERFORM FAIL.                                                IX2094.2 680
   002240         224600     MOVE    12   TO CORRECT-18V0.                                IX2094.2 531
   002241         224700     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002242         224800     GO TO   START-WRITE-GF-37.                                   IX2094.2 2245
   002243         224900 START-DELETE-GF-37.                                              IX2094.2
   002244         225000     PERFORM DE-LETE.                                             IX2094.2 681
   002245         225100 START-WRITE-GF-37.                                               IX2094.2
   002246         225200     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002247         225300 START-INIT-GF-38.                                                IX2094.2
   002248         225400     MOVE "START-TEST-GF-38" TO PAR-NAME.                         IX2094.2 500
   002249         225500     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002250         225600     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002251      1  225700             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002252      1  225800             MOVE   "**"  TO FILESTATUS (2)                       IX2094.2 442
   002253      1  225900             GO TO   START-DELETE-GF-38.                          IX2094.2 2284
   002254         226000     MOVE    "EEEEEEEEFF064" TO FS1-RECKEY-1-13.                  IX2094.2 255
   002255         226100     MOVE    "HHHHHHHIII066ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2094.2 260
   002256         226200     MOVE    "TTTTTTTSSS335ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   002257         226300     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002258         226400     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002259         226500     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002260         226600 START-TEST-GF-38.                                                IX2094.2
   002261         226700*                                                                 IX2094.2
   002262         226800*  START-TEST-GF-38- THE START SHOULD NOT FIND A RECORD IN THE    IX2094.2
   002263         226900*                    FILE WHICH HAS AN ALTERNATE RECORD KEY VALUE IX2094.2
   002264         227000*                    OF TTTTTTTSSS335ALTKEY2.  THIS KEY VALUE IS  IX2094.2
   002265         227100*                    SEQUENTIALLY LOCATED BETWEEN TWO CURRENTLY   IX2094.2
   002266         227200*                    EXISTING ALTERNATE KEYS IN THE FILE.         IX2094.2
   002267         227300*                                                                 IX2094.2
   002268         227400     START  IX-FS1                                                IX2094.2 219
   002269         227500                   KEY IS EQUAL TO IX-FS1-ALTKEY2                 IX2094.2 245
   002270      1  227600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (2)       IX2094.2 276 442
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002271      1  227700                         GO TO START-PASS-GF-38.                  IX2094.2 2281
   002272         227800     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2094.2 276 442
   002273         227900     READ    IX-FS1 AT END                                        IX2094.2 219
   002274      1  228000                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002275         228100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002276         228200     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002277         228300     PERFORM FAIL.                                                IX2094.2 680
   002278         228400     MOVE    ALTERNATE-KEY2 (1) TO COMPUTED-A.                    IX2094.2 492 511
   002279         228500     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   002280         228600     GO TO   START-WRITE-GF-38.                                   IX2094.2 2286
   002281         228700 START-PASS-GF-38.                                                IX2094.2
   002282         228800     PERFORM  PASS.                                               IX2094.2 679
   002283         228900     GO TO   START-WRITE-GF-38.                                   IX2094.2 2286
   002284         229000 START-DELETE-GF-38.                                              IX2094.2
   002285         229100     PERFORM DE-LETE.                                             IX2094.2 681
   002286         229200 START-WRITE-GF-38.                                               IX2094.2
   002287         229300     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002288         229400 START-INIT-GF-39.                                                IX2094.2
   002289         229500     MOVE "START-TEST-GF-39" TO PAR-NAME.                         IX2094.2 500
   002290         229600     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002291         229700     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002292      1  229800             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002293      1  229900             MOVE   "**"  TO FILESTATUS (3)                       IX2094.2 442
   002294      1  230000             GO TO   START-DELETE-GF-39.                          IX2094.2 2325
   002295         230100     MOVE    "UUUUUUUUUU400" TO FS1-RECKEY-1-13.                  IX2094.2 255
   002296         230200     MOVE    "YYYYYYYYYY400ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2094.2 260
   002297         230300     MOVE    "DDDDDDDDDC000ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   002298         230400     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002299         230500     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002300         230600     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002301         230700 START-TEST-GF-39.                                                IX2094.2
   002302         230800*                                                                 IX2094.2
   002303         230900*  START-TEST-GF-39 - THE START STATEMENT SHOULD NOT FIND A       IX2094.2
   002304         231000*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2094.2
   002305         231100*                    KEY VALUE OF DDDDDDDDDC000ALTKEY2.  THIS KEY IX2094.2
   002306         231200*                    VALUE IS SEQUENTIALLY LOWER THAN ANY         IX2094.2
   002307         231300*                    CURRENTLY EXISTING KEY IN THE FILE.          IX2094.2
   002308         231400*                                                                 IX2094.2
   002309         231500     START  IX-FS1                                                IX2094.2 219
   002310         231600                   KEY IS EQUAL TO IX-FS1-ALTKEY2                 IX2094.2 245
   002311      1  231700          INVALID KEY    MOVE FS1-STATUS TO FILESTATUS (3)        IX2094.2 276 442
   002312      1  231800                     GO TO START-PASS-GF-39.                      IX2094.2 2322
   002313         231900     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2094.2 276 442
   002314         232000     READ    IX-FS1  AT END                                       IX2094.2 219
   002315      1  232100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002316         232200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002317         232300     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002318         232400     PERFORM FAIL.                                                IX2094.2 680
   002319         232500     MOVE    ALTERNATE-KEY2 (1) TO COMPUTED-A.                    IX2094.2 492 511
   002320         232600     MOVE    "INVALID KEY"  TO CORRECT-A.                         IX2094.2 525
   002321         232700     GO TO START-WRITE-GF-39.                                     IX2094.2 2327
   002322         232800 START-PASS-GF-39.                                                IX2094.2
   002323         232900     PERFORM PASS.                                                IX2094.2 679
   002324         233000     GO TO   START-WRITE-GF-39.                                   IX2094.2 2327
   002325         233100 START-DELETE-GF-39.                                              IX2094.2
   002326         233200     PERFORM DE-LETE.                                             IX2094.2 681
   002327         233300 START-WRITE-GF-39.                                               IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002328         233400     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002329         233500 START-INIT-GF-40.                                                IX2094.2
   002330         233600     MOVE "START-TEST-GF-40" TO PAR-NAME.                         IX2094.2 500
   002331         233700     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002332         233800     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002333      1  233900             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002334      1  234000             MOVE   "**"  TO FILESTATUS (4)                       IX2094.2 442
   002335      1  234100             GO TO   START-DELETE-GF-40.                          IX2094.2 2368
   002336         234200     MOVE    "BBBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   002337         234300     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002338         234400     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002339         234500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002340         234600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002341         234700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002342         234800 START-TEST-GF-40.                                                IX2094.2
   002343         234900*                                                                 IX2094.2
   002344         235000*  START-TEST-GF-40 - THE START STATEMENT SHOULD NOT FIND A       IX2094.2
   002345         235100*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2094.2
   002346         235200*                    KEY VALUE OF WWWWWWWWWV399ALTKEY2.  THIS     IX2094.2
   002347         235300*                    VALUE IS SEQUENTIALLY  ONE GREATER THAN      IX2094.2
   002348         235400*                    ANY ALTERNATE KEY CURRENTLY EXISTING IN      IX2094.2
   002349         235500*                    THE FILE.  AN INVALID KEY CONDITION          IX2094.2
   002350         235600*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2094.2
   002351         235700*                                                                 IX2094.2
   002352         235800     START  IX-FS1                                                IX2094.2 219
   002353         235900                   KEY IS EQUAL TO IX-FS1-ALTKEY2                 IX2094.2 245
   002354      1  236000          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2094.2 276 442
   002355      1  236100                         GO TO START-PASS-GF-40.                  IX2094.2 2365
   002356         236200     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2094.2 276 442
   002357         236300     READ    IX-FS1 AT END                                        IX2094.2 219
   002358      1  236400                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002359         236500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002360         236600     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002361         236700     PERFORM FAIL.                                                IX2094.2 680
   002362         236800     MOVE    ALTERNATE-KEY2 (1) TO COMPUTED-A.                    IX2094.2 492 511
   002363         236900     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   002364         237000     GO TO   START-WRITE-GF-40.                                   IX2094.2 2370
   002365         237100 START-PASS-GF-40.                                                IX2094.2
   002366         237200     PERFORM  PASS.                                               IX2094.2 679
   002367         237300     GO TO   START-WRITE-GF-40.                                   IX2094.2 2370
   002368         237400 START-DELETE-GF-40.                                              IX2094.2
   002369         237500     PERFORM DE-LETE.                                             IX2094.2 681
   002370         237600 START-WRITE-GF-40.                                               IX2094.2
   002371         237700     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002372         237800 START-INIT-GF-41.                                                IX2094.2
   002373         237900     MOVE "START-TEST-GF-41" TO PAR-NAME.                         IX2094.2 500
   002374         238000     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002375         238100     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002376      1  238200             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002377      1  238300             MOVE   "**"  TO FILESTATUS (5)                       IX2094.2 442
   002378      1  238400             GO TO   START-DELETE-GF-41.                          IX2094.2 2422
   002379         238500     MOVE    "CCCCCCCCCC038"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   002380         238600     MOVE    "IIIIIIIIJJ083ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2094.2 260
   002381         238700     MOVE    "VUUUUVVVVV362ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002382         238800     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002383         238900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002384         239000     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002385         239100 START-TEST-GF-41.                                                IX2094.2
   002386         239200*                                                                 IX2094.2
   002387         239300*  START-TEST-GF-41 - THE START STATEMENT USES AN OPERAND         IX2094.2
   002388         239400*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2094.2
   002389         239500*                    OF AN ALTERNATE KEY BUT IS THE NAME OF A     IX2094.2
   002390         239600*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2094.2
   002391         239700*                    ALTERNATE KEY.  THE CONTENTS OF THE DATA ITEMIX2094.2
   002392         239800*                    (POSITIONS 1 THRU 5 OF THE ALTERNATE KEY)    IX2094.2
   002393         239900*                    IS A UNIQUE KEY VALUE FOR THE FILE. THE      IX2094.2
   002394         240000*                    BALANCE OF THE ALTERNATE KEY (POSITIONS 6    IX2094.2
   002395         240100*                    THRU 20)  IN NOT A VALID KEY VALUE FOR THE   IX2094.2
   002396         240200*                    FILE.   THE                                  IX2094.2
   002397         240300*                    RECORD WITH THE ALTERNATE KEY                IX2094.2
   002398         240400*                    VUUUUUUUUU362ALTKEY2 (RECORD NUMBER 19) IS   IX2094.2
   002399         240500*                    EXPECTED TO BE FOUND.                        IX2094.2
   002400         240600*                                                                 IX2094.2
   002401         240700     START  IX-FS1                                                IX2094.2 219
   002402         240800                   KEY IS EQUAL TO IX-FS1-ALTKEY2-1-5             IX2094.2 247
   002403      1  240900          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2094.2 276 442
   002404      1  241000                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2094.2 511
   002405      1  241100                     GO TO START-FAIL-GF-41.                      IX2094.2 2417
   002406         241200     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2094.2 276 442
   002407         241300     READ    IX-FS1  AT END                                       IX2094.2 219
   002408      1  241400                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2094.2 511
   002409      1  241500                     GO TO  START-FAIL-GF-41.                     IX2094.2 2417
   002410         241600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002411         241700     IF      XRECORD-NUMBER (1) EQUAL TO 19                       IX2094.2 467
   002412      1  241800             PERFORM  PASS                                        IX2094.2 679
   002413      1  241900             GO TO START-WRITE-GF-41.                             IX2094.2 2424
   002414         242000     MOVE    19  TO RECNO.                                        IX2094.2 275
   002415         242100     PERFORM DISPLAY-ALTERNATE-KEY2.                              IX2094.2 2842
   002416         242200     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   002417         242300 START-FAIL-GF-41.                                                IX2094.2
   002418         242400     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002419         242500     PERFORM  FAIL.                                               IX2094.2 680
   002420         242600     MOVE    19  TO CORRECT-18V0.                                 IX2094.2 531
   002421         242700     GO TO   START-WRITE-GF-41.                                   IX2094.2 2424
   002422         242800 START-DELETE-GF-41.                                              IX2094.2
   002423         242900     PERFORM DE-LETE.                                             IX2094.2 681
   002424         243000 START-WRITE-GF-41.                                               IX2094.2
   002425         243100     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002426         243200 START-INIT-GF-42.                                                IX2094.2
   002427         243300     MOVE "START-TEST-GF-42" TO PAR-NAME.                         IX2094.2 500
   002428         243400     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002429         243500     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002430      1  243600             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002431      1  243700             MOVE   "**"  TO FILESTATUS (6)                       IX2094.2 442
   002432      1  243800             GO TO   START-DELETE-GF-42.                          IX2094.2 2482
   002433         243900     MOVE    "TTTTTTTTTT390" TO FS1-RECKEY-1-13.                  IX2094.2 255
   002434         244000     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002435         244100     MOVE    "EEEEEDDDDD010ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2094.2 268
   002436         244200     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002437         244300     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002438         244400     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002439         244500 START-TEST-GF-42.                                                IX2094.2
   002440         244600*                                                                 IX2094.2
   002441         244700*  START-TEST-GF-42 - THE START STATEMENT USES AN OPERAND IN THE  IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002442         244800*                    KEY PHRASE WHICH IS NOT THE NAME OF AN ALTER-IX2094.2
   002443         244900*                    NATE KEY BUT IS THE NAME OF A DATA ITEM THAT IX2094.2
   002444         245000*                    SUBORDINATE TO THE ALTERNATE KEY. THE CONTENTIX2094.2
   002445         245100*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2094.2
   002446         245200*                    ALTERNATE KEY) IS A DUPLICATE OF THE FIRST   IX2094.2
   002447         245300*                    5 POSITIONS OF 5 OTHER RECORDS IN THE FILE.  IX2094.2
   002448         245400*                    THIS TEST EXPECTS THE RECORD POINTER         IX2094.2
   002449         245500*                    TO BE POSITIONED TO ALTERNATE KEY            IX2094.2
   002450         245600*                    EEEEEDDDDD020ALTKEY2 (RECORD NO 195) WHICH   IX2094.2
   002451         245700*                    IS THE FIRST RECORD ALPHABETICALLY IN THE    IX2094.2
   002452         245800*                    FILE THAT CONTAINS EEEEE IN THE FIRST 5      IX2094.2
   002453         245900*                    POSITIONS OF THE KEY.  NOTE THIS IS ALSO     IX2094.2
   002454         246000*                    A RECORD IN WHICH THE VALUE OF THE FULL      IX2094.2
   002455         246100*                    20 POSITION KEY IS A DUPLICATE OF ANOTHER    IX2094.2
   002456         246200*                    RECORD (RECORD NUMBER 191).  THE ALTERNATE   IX2094.2
   002457         246300*                    KEY WAS LOADED WITH THE VALUE                IX2094.2
   002458         246400*                    EEEEEDDDDD010ALTKEY2 (KEY FOR RECORD NUMBER  IX2094.2
   002459         246500*                    195) BEFORE THE START WAS EXECUTED.          IX2094.2
   002460         246600*                                                                 IX2094.2
   002461         246700     START  IX-FS1                                                IX2094.2 219
   002462         246800                   KEY IS EQUAL TO IX-FS1-ALTKEY2-1-5             IX2094.2 247
   002463      1  246900          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (6)       IX2094.2 276 442
   002464      1  247000                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2094.2 511
   002465      1  247100                     GO TO START-FAIL-GF-42.                      IX2094.2 2477
   002466         247200     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2094.2 276 442
   002467         247300     READ    IX-FS1  AT END                                       IX2094.2 219
   002468      1  247400                     MOVE "AT END ON READ" TO COMPUTED-A          IX2094.2 511
   002469      1  247500                     GO TO START-FAIL-GF-42.                      IX2094.2 2477
   002470         247600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002471         247700     IF      XRECORD-NUMBER (1) EQUAL TO 195                      IX2094.2 467
   002472      1  247800             PERFORM  PASS                                        IX2094.2 679
   002473      1  247900             GO TO START-WRITE-GF-42.                             IX2094.2 2484
   002474         248000     MOVE    65  TO RECNO.                                        IX2094.2 275
   002475         248100     PERFORM DISPLAY-ALTERNATE-KEY2.                              IX2094.2 2842
   002476         248200     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2094.2 467 518
   002477         248300 START-FAIL-GF-42.                                                IX2094.2
   002478         248400     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002479         248500     PERFORM  FAIL.                                               IX2094.2 680
   002480         248600     MOVE    195   TO CORRECT-18V0.                               IX2094.2 531
   002481         248700     GO TO   START-WRITE-GF-42.                                   IX2094.2 2484
   002482         248800 START-DELETE-GF-42.                                              IX2094.2
   002483         248900     PERFORM DE-LETE.                                             IX2094.2 681
   002484         249000 START-WRITE-GF-42.                                               IX2094.2
   002485         249100     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002486         249200 START-INIT-GF-43.                                                IX2094.2
   002487         249300     MOVE "START-TEST-GF-43" TO PAR-NAME.                         IX2094.2 500
   002488         249400     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002489         249500     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002490      1  249600             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002491      1  249700             MOVE   "**"  TO FILESTATUS (7)                       IX2094.2 442
   002492      1  249800             GO TO   START-DELETE-GF-43.                          IX2094.2 2532
   002493         249900     MOVE    "CCCCCCCCCD022"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   002494         250000     MOVE    "FFFFFFFFFG022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002495         250100     MOVE    "380ALTKEY2          "  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002496         250200     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002497         250300     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002498         250400     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002499         250500 START-TEST-GF-43.                                                IX2094.2
   002500         250600*                                                                 IX2094.2
   002501         250700*  START-TEST-GF-43 - THE START STATEMENT USES AN OPERAND IN THE  IX2094.2
   002502         250800*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   002503         250900*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   002504         251000*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   002505         251100*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY)      IX2094.2
   002506         251200*                    IS LOADED WITH "380ALTKEY2".  NO SUCH RECORD IX2094.2
   002507         251300*                    SHOULD BE IN THE FILE.  IF IN THE COMPARSION,IX2094.2
   002508         251400*                    THE LONGER OPERAND IS TRUNCATED ON THE LEFT  IX2094.2
   002509         251500*                    INSTEAD OF ON THE RIGHT THE CONTENTS OF      IX2094.2
   002510         251600*                    THE DATA ITEM WILL MATCH A RECORD IN THE     IX2094.2
   002511         251700*                    FILE.  THIS TEST EXPECTS THE LONGER OPERAND  IX2094.2
   002512         251800*                    TO BE TRUNCATED ON THE RIGHT CAUSING NO      IX2094.2
   002513         251900*                    DATA ITEM MATCH AND RESULTING IN AN INVALID  IX2094.2
   002514         252000*                    KEY CONDITION WHEN THE START IS EXECUTED.    IX2094.2
   002515         252100*                                                                 IX2094.2
   002516         252200     START  IX-FS1                                                IX2094.2 219
   002517         252300                   KEY IS EQUAL TO IX-FS1-ALTKEY2-1-10            IX2094.2 246
   002518      1  252400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2094.2 276 442
   002519      1  252500                     GO TO START-PASS-GF-43.                      IX2094.2 2529
   002520         252600     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2094.2 276 442
   002521         252700     READ    IX-FS1  AT END                                       IX2094.2 219
   002522      1  252800                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002523         252900     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002524         253000     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002525         253100     PERFORM FAIL.                                                IX2094.2 680
   002526         253200     MOVE    ALTERNATE-KEY2 (1) TO COMPUTED-A.                    IX2094.2 492 511
   002527         253300     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2094.2 525
   002528         253400     GO TO   START-WRITE-GF-43.                                   IX2094.2 2534
   002529         253500 START-PASS-GF-43.                                                IX2094.2
   002530         253600     PERFORM PASS.                                                IX2094.2 679
   002531         253700     GO TO   START-WRITE-GF-43.                                   IX2094.2 2534
   002532         253800 START-DELETE-GF-43.                                              IX2094.2
   002533         253900     PERFORM DE-LETE.                                             IX2094.2 681
   002534         254000 START-WRITE-GF-43.                                               IX2094.2
   002535         254100     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002536         254200 START-INIT-GF-44.                                                IX2094.2
   002537         254300     MOVE "START-TEST-GF-44" TO PAR-NAME.                         IX2094.2 500
   002538         254400     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002539         254500     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002540      1  254600             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002541      1  254700             MOVE   "**"  TO FILESTATUS (8)                       IX2094.2 442
   002542      1  254800             GO TO   START-DELETE-GF-44.                          IX2094.2 2579
   002543         254900     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   002544         255000     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002545         255100     MOVE    "DDDDDDDDDC000ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002546         255200     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2094.2 254 227
   002547         255300     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002548         255400     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002549         255500 START-TEST-GF-44.                                                IX2094.2
   002550         255600*                                                                 IX2094.2
   002551         255700*  START-TEST-GF-44 - THIS TEST USES AN OPERAND IN THE            IX2094.2
   002552         255800*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   002553         255900*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   002554         256000*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   002555         256100*                    (POSITIONS 1 THRU 10 OF THE ALTERNATE KEY) ISIX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002556         256200*                    LOADED WITH "DDDDDDDDDC".  THIS KEY VALUE    IX2094.2
   002557         256300*                    IS LOWER THAN ANY ALTERNATE KEY VALUE IN     IX2094.2
   002558         256400*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   002559         256500*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   002560         256600*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   002561         256700*                    EXECUTED.                                    IX2094.2
   002562         256800*                                                                 IX2094.2
   002563         256900     START  IX-FS1                                                IX2094.2 219
   002564         257000                   KEY IS EQUAL TO IX-FS1-ALTKEY2-1-10            IX2094.2 246
   002565      1  257100          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2094.2 276 442
   002566      1  257200                     GO TO START-PASS-GF-44.                      IX2094.2 2576
   002567         257300     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2094.2 276 442
   002568         257400     READ    IX-FS1  AT END                                       IX2094.2 219
   002569      1  257500                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002570         257600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002571         257700     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002572         257800     PERFORM FAIL.                                                IX2094.2 680
   002573         257900     MOVE    ALTERNATE-KEY2 (1) TO COMPUTED-A.                    IX2094.2 492 511
   002574         258000     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   002575         258100     GO TO   START-WRITE-GF-44.                                   IX2094.2 2581
   002576         258200 START-PASS-GF-44.                                                IX2094.2
   002577         258300     PERFORM PASS.                                                IX2094.2 679
   002578         258400     GO TO   START-WRITE-GF-44.                                   IX2094.2 2581
   002579         258500 START-DELETE-GF-44.                                              IX2094.2
   002580         258600     PERFORM DE-LETE.                                             IX2094.2 681
   002581         258700 START-WRITE-GF-44.                                               IX2094.2
   002582         258800     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002583         258900 START-INIT-GF-45.                                                IX2094.2
   002584         259000     MOVE "START-TEST-GF-45" TO PAR-NAME.                         IX2094.2 500
   002585         259100     PERFORM START-INITIALIZE-RECORD.                             IX2094.2 2815
   002586         259200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2094.2 440 IMP
   002587      1  259300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2094.2 505
   002588      1  259400             MOVE   "**"  TO FILESTATUS (9)                       IX2094.2 442
   002589      1  259500             GO TO   START-DELETE-GF-45.                          IX2094.2 2626
   002590         259600     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2094.2 255
   002591         259700     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2094.2 260
   002592         259800     MOVE    "WWWWWWWWWW400ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2094.2 268
   002593         259900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002594         260000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2094.2 259 235
   002595         260100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2094.2 267 244
   002596         260200 START-TEST-GF-45.                                                IX2094.2
   002597         260300*                                                                 IX2094.2
   002598         260400*  START-TEST-GF-45 - THIS TEST USES AN OPERAND IN THE            IX2094.2
   002599         260500*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2094.2
   002600         260600*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2094.2
   002601         260700*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2094.2
   002602         260800*                    (POSITIONS 1 THRU 10 OF THE ALTERNATE KEY) ISIX2094.2
   002603         260900*                    LOADED WITH "WWWWWWWWWW".  THIS KEY VALUE    IX2094.2
   002604         261000*                    IS GREATER THAN ANY ALTERNATE KEY VALUE IN   IX2094.2
   002605         261100*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2094.2
   002606         261200*                    THEREFORE AN INVALID KEY CONDITION IS        IX2094.2
   002607         261300*                    EXPECTED WHEN THE START STATEMENT IS         IX2094.2
   002608         261400*                    EXECUTED.                                    IX2094.2
   002609         261500*                                                                 IX2094.2
   002610         261600     START  IX-FS1                                                IX2094.2 219
   002611         261700                   KEY IS EQUAL TO IX-FS1-ALTKEY2-1-10            IX2094.2 246
   002612      1  261800          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (9)       IX2094.2 276 442
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002613      1  261900                     GO TO START-PASS-GF-45.                      IX2094.2 2623
   002614         262000     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2094.2 276 442
   002615         262100     READ    IX-FS1  AT END                                       IX2094.2 219
   002616      1  262200                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2094.2 505
   002617         262300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2094.2 223 458
   002618         262400     MOVE "IX-36; 4.7.2 ETC.                          " TO RE-MARKIX2094.2 505
   002619         262500     PERFORM FAIL.                                                IX2094.2 680
   002620         262600     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2094.2 488 511
   002621         262700     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2094.2 525
   002622         262800     GO TO   START-WRITE-GF-45.                                   IX2094.2 2628
   002623         262900 START-PASS-GF-45.                                                IX2094.2
   002624         263000     PERFORM PASS.                                                IX2094.2 679
   002625         263100     GO TO   START-WRITE-GF-45.                                   IX2094.2 2628
   002626         263200 START-DELETE-GF-45.                                              IX2094.2
   002627         263300     PERFORM DE-LETE.                                             IX2094.2 681
   002628         263400 START-WRITE-GF-45.                                               IX2094.2
   002629         263500     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002630         263600                                                                  IX2094.2
   002631         263700     CLOSE   IX-FS1.                                              IX2094.2 219
   002632         263800                                                                  IX2094.2
   002633         263900 START-INIT-FILE-STATUS-03.                                       IX2094.2
   002634         264000     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   002635         264100     MOVE "START-TEST-GF-46" TO PAR-NAME.                         IX2094.2 500
   002636         264200*                                                                 IX2094.2
   002637         264300*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2094.2
   002638         264400*  CAPTURED FROM THE NINE TESTS BEFORE.                           IX2094.2
   002639         264500*                                                                 IX2094.2
   002640         264600 START-TEST-GF-46.                                                IX2094.2
   002641         264700     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2094.2 442
   002642      1  264800             PERFORM DE-LETE                                      IX2094.2 681
   002643      1  264900             GO TO  START-WRITE-GF-46.                            IX2094.2 2656
   002644         265000*                                                                 IX2094.2
   002645         265100*  START-TEST-GF-046 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2094.2
   002646         265200*                    RESULTING FROM START-TEST-GF-37. THE FILE    IX2094.2
   002647         265300*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2094.2
   002648         265400*                                                                 IX2094.2
   002649         265500     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2094.2 442
   002650      1  265600             PERFORM PASS                                         IX2094.2 679
   002651         265700     ELSE                                                         IX2094.2
   002652      1  265800     MOVE "IX-3; 1.3.4 (1) A; SEE START-TEST-GF-37    " TO RE-MARKIX2094.2 505
   002653      1  265900             PERFORM  FAIL                                        IX2094.2 680
   002654      1  266000             MOVE  "00"  TO CORRECT-A                             IX2094.2 525
   002655      1  266100             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2094.2 442 511
   002656         266200 START-WRITE-GF-46.                                               IX2094.2
   002657         266300     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002658         266400 START-TEST-GF-47.                                                IX2094.2
   002659         266500     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002660         266600     MOVE "START-TEST-GF-47" TO PAR-NAME.                         IX2094.2 500
   002661         266700     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2094.2 442
   002662      1  266800             PERFORM DE-LETE                                      IX2094.2 681
   002663      1  266900             GO TO  START-WRITE-GF-47.                            IX2094.2 2675
   002664         267000*                                                                 IX2094.2
   002665         267100*  START-TEST-GF-47 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002666         267200*                    RESULTING FROM START-TEST-GF-38. THE FILE    IX2094.2
   002667         267300*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002668         267400*                                                                 IX2094.2
   002669         267500     IF      FILESTATUS (2)  EQUAL TO "23"                        IX2094.2 442
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    50
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002670      1  267600             PERFORM  PASS                                        IX2094.2 679
   002671      1  267700             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002672      1  267800     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-38    " TO RE-MARKIX2094.2 505
   002673      1  267900             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002674      1  268000             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2094.2 442 511
   002675         268100 START-WRITE-GF-47.                                               IX2094.2
   002676         268200     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002677         268300 START-TEST-GF-48.                                                IX2094.2
   002678         268400     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002679         268500     MOVE "START-TEST-GF-48" TO PAR-NAME.                         IX2094.2 500
   002680         268600     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2094.2 442
   002681      1  268700             PERFORM DE-LETE                                      IX2094.2 681
   002682      1  268800             GO TO  START-WRITE-GF-48.                            IX2094.2 2694
   002683         268900*                                                                 IX2094.2
   002684         269000*  START-TEST-GF-48 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002685         269100*                    RESULTING FROM START-TEST-GF-39. THE FILE    IX2094.2
   002686         269200*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002687         269300*                                                                 IX2094.2
   002688         269400     IF      FILESTATUS (3)  EQUAL TO "23"                        IX2094.2 442
   002689      1  269500             PERFORM  PASS                                        IX2094.2 679
   002690      1  269600     ELSE PERFORM FAIL                                            IX2094.2 680
   002691      1  269700     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-39    " TO RE-MARKIX2094.2 505
   002692      1  269800             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002693      1  269900             MOVE  FILESTATUS (3) TO COMPUTED-A.                  IX2094.2 442 511
   002694         270000 START-WRITE-GF-48.                                               IX2094.2
   002695         270100     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002696         270200 START-TEST-GF-49.                                                IX2094.2
   002697         270300     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002698         270400     MOVE "START-TEST-GF-49" TO PAR-NAME.                         IX2094.2 500
   002699         270500     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2094.2 442
   002700      1  270600             PERFORM DE-LETE                                      IX2094.2 681
   002701      1  270700             GO TO  START-WRITE-GF-49.                            IX2094.2 2713
   002702         270800*                                                                 IX2094.2
   002703         270900*  START-TEST-GF-49 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002704         271000*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002705         271100*                    RESULTING FROM START-TEST-GF-40. THE FILE    IX2094.2
   002706         271200*                                                                 IX2094.2
   002707         271300     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2094.2 442
   002708      1  271400             PERFORM  PASS                                        IX2094.2 679
   002709      1  271500             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002710      1  271600     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-40    " TO RE-MARKIX2094.2 505
   002711      1  271700             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002712      1  271800             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2094.2 442 511
   002713         271900 START-WRITE-GF-49.                                               IX2094.2
   002714         272000     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002715         272100 START-TEST-GF-50.                                                IX2094.2
   002716         272200     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   002717         272300     MOVE "START-TEST-GF-50" TO PAR-NAME.                         IX2094.2 500
   002718         272400     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2094.2 442
   002719      1  272500             PERFORM DE-LETE                                      IX2094.2 681
   002720      1  272600             GO TO  START-WRITE-GF-50.                            IX2094.2 2732
   002721         272700*                                                                 IX2094.2
   002722         272800*  START-TEST-GF-50 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002723         272900*                    RESULTING FROM START-TEST-GF-41. THE FILE    IX2094.2
   002724         273000*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   002725         273100*                                                                 IX2094.2
   002726         273200     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2094.2 442
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    51
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002727      1  273300             PERFORM  PASS                                        IX2094.2 679
   002728      1  273400     MOVE "IX-3; 1.3.4 (1) A; SEE START-TEST-GF-41    " TO RE-MARKIX2094.2 505
   002729      1  273500             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002730      1  273600             MOVE    "00"  TO CORRECT-A                           IX2094.2 525
   002731      1  273700             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2094.2 442 511
   002732         273800 START-WRITE-GF-50.                                               IX2094.2
   002733         273900     MOVE    "FROM START-TEST-007.05" TO RE-MARK.                 IX2094.2 505
   002734         274000     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002735         274100 START-TEST-GF-51.                                                IX2094.2
   002736         274200     MOVE             "FILE STATUS START:00"   TO FEATURE.        IX2094.2 496
   002737         274300     MOVE "START-TEST-GF-51" TO PAR-NAME.                         IX2094.2 500
   002738         274400     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2094.2 442
   002739      1  274500             PERFORM DE-LETE                                      IX2094.2 681
   002740      1  274600             GO TO  START-WRITE-GF-51.                            IX2094.2 2752
   002741         274700*                                                                 IX2094.2
   002742         274800*  START-TEST-GF-51 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002743         274900*                    RESULTING FROM START-TEST-GF-42. THE FILE    IX2094.2
   002744         275000*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2094.2
   002745         275100*                                                                 IX2094.2
   002746         275200     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2094.2 442
   002747      1  275300             PERFORM  PASS                                        IX2094.2 679
   002748      1  275400             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002749      1  275500     MOVE "IX-3; 1.3.4 (1) A; SEE START-TEST-GF-42    " TO RE-MARKIX2094.2 505
   002750      1  275600             MOVE   "00"  TO CORRECT-A                            IX2094.2 525
   002751      1  275700             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2094.2 442 511
   002752         275800 START-WRITE-GF-51.                                               IX2094.2
   002753         275900     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002754         276000 START-TEST-GF-52.                                                IX2094.2
   002755         276100     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002756         276200     MOVE "START-TEST-GF-52" TO PAR-NAME.                         IX2094.2 500
   002757         276300     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2094.2 442
   002758      1  276400             PERFORM DE-LETE                                      IX2094.2 681
   002759      1  276500             GO TO  START-WRITE-GF-52.                            IX2094.2 2771
   002760         276600*                                                                 IX2094.2
   002761         276700*  START-TEST-GF-52 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002762         276800*                    RESULTING FROM START-TEST-GF-43. THE FILE    IX2094.2
   002763         276900*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2094.2
   002764         277000*                                                                 IX2094.2
   002765         277100     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2094.2 442
   002766      1  277200             PERFORM  PASS                                        IX2094.2 679
   002767      1  277300             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002768      1  277400     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-43    " TO RE-MARKIX2094.2 505
   002769      1  277500             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002770      1  277600             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2094.2 442 511
   002771         277700 START-WRITE-GF-52.                                               IX2094.2
   002772         277800     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002773         277900 START-TEST-GF-53.                                                IX2094.2
   002774         278000     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002775         278100     MOVE "START-TEST-GF-53" TO PAR-NAME.                         IX2094.2 500
   002776         278200     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2094.2 442
   002777      1  278300             PERFORM DE-LETE                                      IX2094.2 681
   002778      1  278400             GO TO  START-WRITE-GF-53.                            IX2094.2 2790
   002779         278500*                                                                 IX2094.2
   002780         278600*  START-TEST-GF-53 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002781         278700*                    RESULTING FROM START-TEST-GF-44. THE FILE    IX2094.2
   002782         278800*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002783         278900*                                                                 IX2094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    52
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002784         279000     IF      FILESTATUS (8)  EQUAL TO "23"                        IX2094.2 442
   002785      1  279100             PERFORM  PASS                                        IX2094.2 679
   002786      1  279200             ELSE  PERFORM  FAIL                                  IX2094.2 680
   002787      1  279300     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-44    " TO RE-MARKIX2094.2 505
   002788      1  279400             MOVE    "23"  TO CORRECT-A                           IX2094.2 525
   002789      1  279500             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2094.2 442 511
   002790         279600 START-WRITE-GF-53.                                               IX2094.2
   002791         279700     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002792         279800 START-TEST-GF-54.                                                IX2094.2
   002793         279900     MOVE             "FILE STATUS START:23"   TO FEATURE.        IX2094.2 496
   002794         280000     MOVE "START-TEST-GF-54" TO PAR-NAME.                         IX2094.2 500
   002795         280100     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2094.2 442
   002796      1  280200             PERFORM DE-LETE                                      IX2094.2 681
   002797      1  280300             GO TO  START-WRITE-GF-54.                            IX2094.2 2809
   002798         280400*                                                                 IX2094.2
   002799         280500*  START-TEST-GF-54 - THIS TEST CHECKS THE FILE STATUS CONTENTS   IX2094.2
   002800         280600*                    RESULTING FROM START-TEST-GF-45. THE FILE    IX2094.2
   002801         280700*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2094.2
   002802         280800*                                                                 IX2094.2
   002803         280900     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2094.2 442
   002804      1  281000             PERFORM  PASS                                        IX2094.2 679
   002805      1  281100     ELSE    PERFORM FAIL                                         IX2094.2 680
   002806      1  281200     MOVE "IX-4; 1.3.4 (3) C; SEE START-TEST-GF-45    " TO RE-MARKIX2094.2 505
   002807      1  281300             MOVE  "23"  TO CORRECT-A                             IX2094.2 525
   002808      1  281400             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2094.2 442 511
   002809         281500 START-WRITE-GF-54.                                               IX2094.2
   002810         281600     PERFORM  PRINT-DETAIL.                                       IX2094.2 683
   002811         281700*START-WRITE-008.                                                 IX2094.2
   002812         281800     GO TO   START-TEST-COMPLETE.                                 IX2094.2 2849
   002813         281900*START-CLOSE-FILES.                                               IX2094.2
   002814         282000*    GO TO   START-TEST-COMPLETE.                                 IX2094.2
   002815         282100 START-INITIALIZE-RECORD.                                         IX2094.2
   002816         282200     MOVE    "GGGGGGGGGG200" TO  FS1-RECKEY-1-13.                 IX2094.2 255
   002817         282300     MOVE    ZERO  TO INIT-FLAG.                                  IX2094.2 IMP 440
   002818         282400     MOVE    9999  TO XRECORD-NUMBER (1).                         IX2094.2 467
   002819         282500     MOVE    SPACE TO IX-FS1R1-F-G-240.                           IX2094.2 IMP 223
   002820         282600     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2094.2 254 227
   002821         282700     START   IX-FS1  KEY IS EQUAL TO IX-FS1-KEY INVALID KEY       IX2094.2 219 228
   002822      1  282800                     MOVE   1  TO INIT-FLAG.                      IX2094.2 440
   002823         282900     READ    IX-FS1  INTO  FILE-RECORD-INFO (1)                   IX2094.2 219 458
   002824      1  283000                     AT END  MOVE  1 TO INIT-FLAG.                IX2094.2 440
   002825         283100     IF      XRECORD-NUMBER (1) NOT EQUAL TO 100                  IX2094.2 467
   002826      1  283200             MOVE 1 TO INIT-FLAG.                                 IX2094.2 440
   002827         283300     MOVE        "**"  TO FS1-STATUS.                             IX2094.2 276
   002828         283400 DISPLAY-RECORD-KEYS.                                             IX2094.2
   002829         283500     MOVE    XRECORD-KEY (1)  TO WRK-FS1-RECKEY.                  IX2094.2 488 254
   002830         283600     MOVE    FS1-RECKEY-1-13  TO COMPUTED-A.                      IX2094.2 255 511
   002831         283700     MOVE    RECKEY-VALUE (RECNO)  TO CORRECT-A.                  IX2094.2 437 275 525
   002832         283800     MOVE    SPACE TO P-OR-F.                                     IX2094.2 IMP 498
   002833         283900     MOVE    "RECORD KEY VALUES" TO RE-MARK.                      IX2094.2 505
   002834         284000     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002835         284100 DISPLAY-ALTERNATE-KEY1.                                          IX2094.2
   002836         284200     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FS1-ALTKEY1.              IX2094.2 490 259
   002837         284300     MOVE    FS1-ALTKEY1-1-20  TO COMPUTED-A.                     IX2094.2 260 511
   002838         284400     MOVE    ALTKEY1-VALUE (RECNO)  TO CORRECT-A.                 IX2094.2 438 275 525
   002839         284500     MOVE    SPACE TO P-OR-F.                                     IX2094.2 IMP 498
   002840         284600     MOVE    "ALTERNATE RECORD KEY1 VALUES"  TO RE-MARK.          IX2094.2 505
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    53
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002841         284700     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002842         284800 DISPLAY-ALTERNATE-KEY2.                                          IX2094.2
   002843         284900     MOVE    ALTERNATE-KEY2 (1) TO WRK-FS1-ALTKEY2.               IX2094.2 492 267
   002844         285000     MOVE    FS1-ALTKEY2-1-20  TO COMPUTED-A.                     IX2094.2 268 511
   002845         285100     MOVE    ALTKEY2-VALUE (RECNO)  TO CORRECT-A.                 IX2094.2 439 275 525
   002846         285200     MOVE    SPACE TO P-OR-F.                                     IX2094.2 IMP 498
   002847         285300     MOVE    "ALTERNATE RECORD KEY2 VALUES"  TO RE-MARK.          IX2094.2 505
   002848         285400     PERFORM PRINT-DETAIL.                                        IX2094.2 683
   002849         285500 START-TEST-COMPLETE.                                             IX2094.2
   002850         285600     EXIT.                                                        IX2094.2
   002851         285700 CCVS-EXIT SECTION.                                               IX2094.2
   002852         285800 CCVS-999999.                                                     IX2094.2
   002853         285900     GO TO CLOSE-FILES.                                           IX2094.2 660
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    54
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      490   ALTERNATE-KEY1 . . . . . . . .  M813 M825 1634 1676 1720 2836
      492   ALTERNATE-KEY2 . . . . . . . .  M814 M826 2278 2319 2362 2526 2573 2843
      282   ALTKEY1-NUM. . . . . . . . . .  M855 861 M867
      438   ALTKEY1-VALUE. . . . . . . . .  810 2838
      283   ALTKEY2-NUM
      439   ALTKEY2-VALUE. . . . . . . . .  811 2845
      556   ANSI-REFERENCE . . . . . . . .  762 769 778
      215   C-ABORT. . . . . . . . . . . .  M641 M664
      209   C-ALL. . . . . . . . . . . . .  M666
      205   C-DATE . . . . . . . . . . . .  M643
      211   C-DELETED. . . . . . . . . . .  M668
      210   C-FAIL . . . . . . . . . . . .  M667
      214   C-INDENT
      212   C-INSPECT. . . . . . . . . . .  M669
      207   C-NO-OF-TESTS. . . . . . . . .  M642
      213   C-NOTE
      208   C-OK . . . . . . . . . . . . .  M665
      206   C-TIME . . . . . . . . . . . .  M644
      535   CCVS-C-1 . . . . . . . . . . .  701 747
      540   CCVS-C-2 . . . . . . . . . . .  702 748
      590   CCVS-E-1 . . . . . . . . . . .  707
      595   CCVS-E-2 . . . . . . . . . . .  716 723 730 735
      598   CCVS-E-2-2 . . . . . . . . . .  M715
      603   CCVS-E-3 . . . . . . . . . . .  736
      612   CCVS-E-4 . . . . . . . . . . .  715
      613   CCVS-E-4-1 . . . . . . . . . .  M713
      615   CCVS-E-4-2 . . . . . . . . . .  M714
      557   CCVS-H-1 . . . . . . . . . . .  696 743
      562   CCVS-H-2A. . . . . . . . . . .  697 744
      571   CCVS-H-2B. . . . . . . . . . .  698 745
      583   CCVS-H-3 . . . . . . . . . . .  699 746
      633   CCVS-PGM-ID. . . . . . . . . .  639 649 649 662 791
      477   CHARS-OR-RECORDS . . . . . . .  M790
      517   CM-18V0
      511   COMPUTED-A . . . . . . . . . .  512 514 515 516 517 774 777 M946 M950 M1000 M1041 M1084 M1123 M1127 M1179 M1183
                                            M1241 M1288 M1335 M1367 M1386 M1405 M1424 M1443 M1462 M1481 M1500 M1519 M1580
                                            M1584 M1634 M1676 M1720 M1761 M1765 M1817 M1821 M1879 M1926 M1973 M2008 M2027
                                            M2046 M2065 M2084 M2103 M2122 M2141 M2160 M2224 M2228 M2278 M2319 M2362 M2404
                                            M2408 M2464 M2468 M2526 M2573 M2620 M2655 M2674 M2693 M2712 M2731 M2751 M2770
                                            M2789 M2808 M2830 M2837 M2844
      512   COMPUTED-N
      510   COMPUTED-X . . . . . . . . . .  M691 759
      514   COMPUTED-0V18
      516   COMPUTED-14V4
      518   COMPUTED-18V0. . . . . . . . .  M835 M875 M882 M959 M1135 M1191 M1593 M1773 M1829 M2237 M2416 M2476
      515   COMPUTED-4V14
      534   COR-ANSI-REFERENCE . . . . . .  M769 M771
      525   CORRECT-A. . . . . . . . . . .  526 527 528 529 530 775 777 M1001 M1042 M1085 M1242 M1289 M1336 M1366 M1385 M1404
                                            M1423 M1442 M1461 M1480 M1499 M1518 M1635 M1677 M1721 M1880 M1927 M1974 M2007
                                            M2026 M2045 M2064 M2083 M2102 M2121 M2140 M2159 M2279 M2320 M2363 M2527 M2574
                                            M2621 M2654 M2673 M2692 M2711 M2730 M2750 M2769 M2788 M2807 M2831 M2838 M2845
      526   CORRECT-N
      524   CORRECT-X. . . . . . . . . . .  M692 761
      527   CORRECT-0V18
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    55
0 Defined   Cross-reference of data names   References

0     529   CORRECT-14V4
      531   CORRECT-18V0 . . . . . . . . .  M834 M876 M883 M962 M1138 M1195 M1597 M1777 M1833 M2240 M2420 M2480
      528   CORRECT-4V14
      530   CR-18V0
      548   DELETE-COUNTER . . . . . . . .  668 M681 710 726 728
      503   DOTVALUE . . . . . . . . . . .  M686
      554   DUMMY-HOLD . . . . . . . . . .  M740 750
      218   DUMMY-RECORD . . . . . . . . .  M696 M697 M698 M699 M701 M702 M703 M705 M707 M716 M723 M730 M735 M736 740 M741
                                            742 M743 M744 M745 M746 M747 M748 M749 M750 754 M755 M764 M779
      601   ENDER-DESC . . . . . . . . . .  M718 M729 M734
      549   ERROR-COUNTER. . . . . . . . .  667 M680 709 719 722
      553   ERROR-HOLD . . . . . . . . . .  666 M709 M710 M710 M711 714
      599   ERROR-TOTAL. . . . . . . . . .  M720 M722 M727 M728 M732 M733
      277   EXCUT-COUNTER-06V00. . . . . .  M818 M830 832 M853 M865 870 875
      496   FEATURE. . . . . . . . . . . .  M797 M852 M890 M1347 M1371 M1390 M1410 M1429 M1448 M1467 M1486 M1505 M1525 M1987
                                            M2012 M2031 M2050 M2069 M2088 M2107 M2126 M2145 M2167 M2634 M2659 M2678 M2697
                                            M2716 M2736 M2755 M2774 M2793
      458   FILE-RECORD-INFO . . . . . . .  M657 815 827 M952 M997 M1038 M1081 M1129 M1185 M1238 M1285 M1332 M1586 M1631
                                            M1673 M1717 M1767 M1823 M1876 M1923 M1970 M2230 M2275 M2316 M2359 M2410 M2470
                                            M2523 M2570 M2617 M2823
      459   FILE-RECORD-INFO-P1-120
      486   FILE-RECORD-INFO-P121-240
      444   FILE-RECORD-INFO-SKELETON. . .  656
      443   FILE-RECORD-INFORMATION-REC
      442   FILESTATUS . . . . . . . . . .  M928 M945 M948 M974 M992 M994 M1015 M1033 M1035 M1056 M1076 M1078 M1099 M1122
                                            M1125 M1150 M1178 M1181 M1206 M1233 M1235 M1256 M1280 M1282 M1303 M1327 M1329
                                            1353 1361 1367 1373 1381 1386 1392 1400 1405 1411 1419 1424 1430 1438 1443 1449
                                            1457 1462 1468 1476 1481 1487 1495 1500 1506 1514 1519 M1562 M1579 M1582 M1608
                                            M1626 M1628 M1650 M1668 M1670 M1692 M1712 M1714 M1735 M1760 M1763 M1788 M1816
                                            M1819 M1844 M1871 M1873 M1894 M1918 M1920 M1941 M1965 M1967 1994 2002 2008 2014
                                            2022 2027 2033 2041 2046 2052 2060 2065 2071 2079 2084 2090 2098 2103 2109 2117
                                            2122 2128 2136 2141 2147 2155 2160 M2206 M2223 M2226 M2252 M2270 M2272 M2293
                                            M2311 M2313 M2334 M2354 M2356 M2377 M2403 M2406 M2431 M2463 M2466 M2491 M2518
                                            M2520 M2541 M2565 M2567 M2588 M2612 M2614 2641 2649 2655 2661 2669 2674 2680
                                            2688 2693 2699 2707 2712 2718 2726 2731 2738 2746 2751 2757 2765 2770 2776 2784
                                            2789 2795 2803 2808
      261   FS1-ALTKEY1-1-10
      260   FS1-ALTKEY1-1-20 . . . . . . .  M810 M932 M977 M1018 M1059 M1102 M1153 M1209 M1259 M1306 M1566 M1611 M1653 M1695
                                            M1738 M1791 M1847 M1897 M1944 M2210 M2255 M2296 M2337 M2380 M2434 M2494 M2544
                                            M2591 2837
      262   FS1-ALTKEY1-1-5
      264   FS1-ALTKEY1-11-13. . . . . . .  M821 861
      265   FS1-ALTKEY1-14-20
      263   FS1-ALTKEY1-6-10
      269   FS1-ALTKEY2-1-10
      268   FS1-ALTKEY2-1-20 . . . . . . .  M811 M933 M978 M1019 M1060 M1103 M1154 M1210 M1260 M1307 M1567 M1612 M1654 M1696
                                            M1739 M1792 M1848 M1898 M1945 M2211 M2256 M2297 M2338 M2381 M2435 M2495 M2545
                                            M2592 2844
      270   FS1-ALTKEY2-1-5
      272   FS1-ALTKEY2-11-13. . . . . . .  M822
      273   FS1-ALTKEY2-14-20
      271   FS1-ALTKEY2-6-10
      256   FS1-RECKEY-1-10
      255   FS1-RECKEY-1-13. . . . . . . .  M809 M931 M976 M1017 M1058 M1101 M1152 M1208 M1258 M1305 M1565 M1610 M1652 M1694
                                            M1737 M1790 M1846 M1896 M1943 M2209 M2254 M2295 M2336 M2379 M2433 M2493 M2543
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    56
0 Defined   Cross-reference of data names   References

0                                           M2590 M2816 2830
      257   FS1-RECKEY-11-13 . . . . . . .  M820 860 882
      276   FS1-STATUS . . . . . . . . . .  197 945 948 992 994 1033 1035 1076 1078 1122 1125 1178 1181 1233 1235 1280 1282
                                            1327 1329 1579 1582 1626 1628 1668 1670 1712 1714 1760 1763 1816 1819 1871 1873
                                            1918 1920 1965 1967 2223 2226 2270 2272 2311 2313 2354 2356 2403 2406 2463 2466
                                            2518 2520 2565 2567 2612 2614 M2827
      441   HOLD-FILESTATUS-RECORD . . . .  M892 M1527 M2169
      627   HYPHEN-LINE. . . . . . . . . .  703 705 749
      593   ID-AGAIN . . . . . . . . . . .  M649
      626   INF-ANSI-REFERENCE . . . . . .  M762 M765 M778 M780
      621   INFO-TEXT. . . . . . . . . . .  M763
      440   INIT-FLAG. . . . . . . . . . .  927 972 1013 1054 1097 1148 1204 1254 1301 1561 1606 1648 1690 1733 1786 1842
                                            1892 1939 2205 2250 2291 2332 2375 2429 2489 2539 2586 M2817 M2822 M2824 M2826
      550   INSPECT-COUNTER. . . . . . . .  669 M678 709 731 733
      279   INVKEY-COUNTER . . . . . . . .  M800 M817 M829 832
      235   IX-ALT-KEY1-AREA . . . . . . .  859 M935 M980 M1021 M1062 M1105 M1156 M1212 M1262 M1309 M1569 M1614 M1656 M1698
                                            M1741 M1794 M1850 M1900 M1947 M2213 M2258 M2299 M2340 M2383 M2437 M2497 M2547
                                            M2593 M2594
      244   IX-ALT-KEY2-AREA . . . . . . .  M936 M981 M1022 M1063 M1106 M1157 M1213 M1263 M1310 M1570 M1615 M1657 M1699 M1742
                                            M1795 M1851 M1901 M1948 M2214 M2259 M2300 M2341 M2384 M2438 M2498 M2548 M2595
      219   IX-FS1 . . . . . . . . . . . .  188 786 848 850 857 887 889 943 949 990 995 1031 1036 1074 1079 1120 1126 1176
                                            1182 1231 1236 1278 1283 1325 1330 1345 1524 1577 1583 1624 1629 1666 1671 1710
                                            1715 1758 1764 1814 1820 1869 1874 1916 1921 1963 1968 1984 2166 2221 2227 2268
                                            2273 2309 2314 2352 2357 2401 2407 2461 2467 2516 2521 2563 2568 2610 2615 2631
                                            2821 2823
      236   IX-FS1-ALTKEY1 . . . . . . . .  195 1578 1625 1667 1711
      237   IX-FS1-ALTKEY1-1-10. . . . . .  1870 1917 1964
      238   IX-FS1-ALTKEY1-1-5 . . . . . .  1759 1815
      240   IX-FS1-ALTKEY1-11-13
      241   IX-FS1-ALTKEY1-14-20
      239   IX-FS1-ALTKEY1-6-10
      245   IX-FS1-ALTKEY2 . . . . . . . .  196 2222 2269 2310 2353
      246   IX-FS1-ALTKEY2-1-10. . . . . .  2517 2564 2611
      247   IX-FS1-ALTKEY2-1-5 . . . . . .  2402 2462
      249   IX-FS1-ALTKEY2-11-13
      250   IX-FS1-ALTKEY2-14-20
      248   IX-FS1-ALTKEY2-6-10
      228   IX-FS1-KEY . . . . . . . . . .  194 944 991 1032 1075 2821
      229   IX-FS1-KEY-1-10. . . . . . . .  1232 1279 1326
      230   IX-FS1-KEY-1-5 . . . . . . . .  1121 1177
      232   IX-FS1-KEY-11-13
      231   IX-FS1-KEY-6-10
      224   IX-FS1-REC-120
      225   IX-FS1-REC-121-240
      223   IX-FS1R1-F-G-240 . . . . . . .  M815 816 M827 828 952 997 1038 1081 1129 1185 1238 1285 1332 1586 1631 1673 1717
                                            1767 1823 1876 1923 1970 2230 2275 2316 2359 2410 2470 2523 2570 2617 M2819
      227   IX-REC-KEY-AREA. . . . . . . .  858 M934 M979 M1020 M1061 M1104 M1155 M1211 M1261 M1308 M1568 M1613 M1655 M1697
                                            M1740 M1793 M1849 M1899 M1946 M2212 M2257 M2298 M2339 M2382 M2436 M2496 M2546
                                            M2820
      436   KEY-VALUES
      278   KEYSUB . . . . . . . . . . . .  M799 M808 809 810 811
      471   ODO-NUMBER
      498   P-OR-F . . . . . . . . . . . .  M678 M679 M680 M681 688 M691 M2832 M2839 M2846
      500   PAR-NAME . . . . . . . . . . .  M693 M798 M844 M851 M891 M926 M970 M1012 M1052 M1095 M1146 M1202 M1252 M1299
                                            M1348 M1372 M1391 M1409 M1428 M1447 M1466 M1485 M1504 M1526 M1604 M1646 M1688
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    57
0 Defined   Cross-reference of data names   References

0                                           M1731 M1784 M1840 M1890 M1937 M1988 M2013 M2032 M2051 M2070 M2089 M2108 M2127
                                            M2146 M2168 M2203 M2248 M2289 M2330 M2373 M2427 M2487 M2537 M2584 M2635 M2660
                                            M2679 M2698 M2717 M2737 M2756 M2775 M2794
      502   PARDOT-X . . . . . . . . . . .  M685
      551   PASS-COUNTER . . . . . . . . .  665 M679 711 713
      216   PRINT-FILE . . . . . . . . . .  186 648 673
      217   PRINT-REC. . . . . . . . . . .  M687 M768 M770
      201   RAW-DATA . . . . . . . . . . .  181 638 640 647 661 663 672
      204   RAW-DATA-KEY . . . . . . . . .  185 M639 M662
      203   RAW-DATA-SATZ. . . . . . . . .  645 670
      505   RE-MARK. . . . . . . . . . . .  M682 M694 M840 M873 M877 M884 M929 M955 M963 M973 M996 M999 M1014 M1037 M1039
                                            M1055 M1080 M1082 M1098 M1139 M1149 M1193 M1205 M1237 M1239 M1255 M1284 M1286
                                            M1302 M1331 M1333 M1364 M1384 M1403 M1422 M1441 M1460 M1479 M1498 M1517 M1563
                                            M1589 M1595 M1607 M1630 M1632 M1639 M1649 M1672 M1674 M1681 M1691 M1716 M1718
                                            M1734 M1775 M1787 M1831 M1843 M1875 M1877 M1893 M1922 M1924 M1940 M1969 M1971
                                            M2005 M2025 M2044 M2063 M2082 M2101 M2120 M2139 M2158 M2207 M2233 M2241 M2251
                                            M2274 M2276 M2292 M2315 M2317 M2333 M2358 M2360 M2376 M2418 M2430 M2478 M2490
                                            M2522 M2524 M2540 M2569 M2571 M2587 M2616 M2618 M2652 M2672 M2691 M2710 M2728
                                            M2733 M2749 M2768 M2787 M2806 M2833 M2840 M2847
      547   REC-CT . . . . . . . . . . . .  684 686 693
      546   REC-SKL-SUB. . . . . . . . . .  M652 M655 657
      281   RECKEY-NUM . . . . . . . . . .  M854 860 M866 883
      437   RECKEY-VALUE . . . . . . . . .  809 2831
      275   RECNO. . . . . . . . . . . . .  M957 M1133 M1189 M1591 M1771 M1827 M2235 M2414 M2474 2831 2838 2845
      555   RECORD-COUNT . . . . . . . . .  M738 739 M751
      284   RECORD-KEY-CONTENT . . . . . .  435
      435   RECORD-KEY-DATA
      481   RECORDS-IN-FILE. . . . . . . .  M796
      280   RECORDS-WRITTEN. . . . . . . .  M833 835 836
      465   REELUNIT-NUMBER
      506   TEST-COMPUTED. . . . . . . . .  768
      521   TEST-CORRECT . . . . . . . . .  770
      574   TEST-ID. . . . . . . . . . . .  M649
      494   TEST-RESULTS . . . . . . . . .  M650 687
      552   TOTAL-ERROR
      469   UPDATE-NUMBER
      259   WRK-FS1-ALTKEY1. . . . . . . .  813 825 M859 935 980 1021 1062 1105 1156 1212 1262 1309 1569 1614 1656 1698 1741
                                            1794 1850 1900 1947 2213 2258 2299 2340 2383 2437 2497 2547 2593 2594 M2836
      267   WRK-FS1-ALTKEY2. . . . . . . .  814 826 936 981 1022 1063 1106 1157 1213 1263 1310 1570 1615 1657 1699 1742 1795
                                            1851 1901 1948 2214 2259 2300 2341 2384 2438 2498 2548 2595 M2843
      254   WRK-FS1-RECKEY . . . . . . . .  812 824 M858 934 979 1020 1061 1104 1155 1211 1261 1308 1568 1613 1655 1697 1740
                                            1793 1849 1899 1946 2212 2257 2298 2339 2382 2436 2496 2546 2820 M2829
      479   XBLOCK-SIZE. . . . . . . . . .  M793
      461   XFILE-NAME . . . . . . . . . .  M787
      483   XFILE-ORGANIZATION . . . . . .  M794
      485   XLABEL-TYPE. . . . . . . . . .  M795
      473   XPROGRAM-NAME. . . . . . . . .  M791
      488   XRECORD-KEY. . . . . . . . . .  M812 M824 1000 1041 1084 1241 1288 1335 1879 1926 1973 2620 2829
      475   XRECORD-LENGTH . . . . . . . .  M792
      463   XRECORD-NAME . . . . . . . . .  M788
      467   XRECORD-NUMBER . . . . . . . .  M789 M807 M823 953 959 1130 1135 1186 1191 1587 1593 1768 1773 1824 1829 2231
                                            2237 2411 2416 2471 2476 M2818 2825
      623   XXCOMPUTED . . . . . . . . . .  M777
      625   XXCORRECT. . . . . . . . . . .  M777
      618   XXINFO . . . . . . . . . . . .  764 779
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    58
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

      773   BAIL-OUT . . . . . . . . . . .  P690
      781   BAIL-OUT-EX. . . . . . . . . .  E690 G775
      776   BAIL-OUT-WRITE . . . . . . . .  G774
      756   BLANK-LINE-PRINT
     2851   CCVS-EXIT
      658   CCVS-INIT-EXIT
      654   CCVS-INIT-FILE . . . . . . . .  P653
     2852   CCVS-999999
      636   CCVS1
      782   CCVS1-EXIT . . . . . . . . . .  G659
      660   CLOSE-FILES. . . . . . . . . .  G2853
      700   COLUMN-NAMES-ROUTINE . . . . .  E651
      681   DE-LETE. . . . . . . . . . . .  P845 P966 P1007 P1048 P1091 P1142 P1198 P1248 P1295 P1342 P1354 P1374 P1393 P1412
                                            P1431 P1450 P1469 P1488 P1507 P1600 P1642 P1684 P1727 P1780 P1836 P1886 P1933
                                            P1980 P1995 P2015 P2034 P2053 P2072 P2091 P2110 P2129 P2148 P2244 P2285 P2326
                                            P2369 P2423 P2483 P2533 P2580 P2627 P2642 P2662 P2681 P2700 P2719 P2739 P2758
                                            P2777 P2796
     2835   DISPLAY-ALTERNATE-KEY1 . . . .  P1592 P1772 P1828
     2842   DISPLAY-ALTERNATE-KEY2 . . . .  P2236 P2415 P2475
     2828   DISPLAY-RECORD-KEYS. . . . . .  P958 P1134 P1190
      646   END-E-1. . . . . . . . . . . .  G640 G645
      671   END-E-2. . . . . . . . . . . .  G663 G670
      704   END-ROUTINE. . . . . . . . . .  P673
      708   END-ROUTINE-1
      717   END-ROUTINE-12
      725   END-ROUTINE-13 . . . . . . . .  E673
      706   END-RTN-EXIT
      680   FAIL . . . . . . . . . . . . .  P839 P874 P881 P961 P998 P1040 P1083 P1137 P1194 P1240 P1287 P1334 P1365 P1383
                                            P1402 P1421 P1440 P1459 P1478 P1497 P1516 P1596 P1633 P1675 P1719 P1776 P1832
                                            P1878 P1925 P1972 P2006 P2024 P2043 P2062 P2081 P2100 P2119 P2138 P2157 P2239
                                            P2277 P2318 P2361 P2419 P2479 P2525 P2572 P2619 P2653 P2671 P2690 P2709 P2729
                                            P2748 P2767 P2786 P2805
      758   FAIL-ROUTINE . . . . . . . . .  P689
      772   FAIL-ROUTINE-EX. . . . . . . .  E689 G766
      767   FAIL-ROUTINE-WRITE . . . . . .  G760 G761
      695   HEAD-ROUTINE . . . . . . . . .  P651
      678   INSPT
      637   OPEN-FILES
      679   PASS . . . . . . . . . . . . .  P837 P871 P954 P1004 P1045 P1088 P1131 P1187 P1245 P1292 P1339 P1362 P1382 P1401
                                            P1420 P1439 P1458 P1477 P1496 P1515 P1588 P1638 P1680 P1724 P1769 P1825 P1883
                                            P1930 P1977 P2003 P2023 P2042 P2061 P2080 P2099 P2118 P2137 P2156 P2232 P2282
                                            P2323 P2366 P2412 P2472 P2530 P2577 P2624 P2650 P2670 P2689 P2708 P2727 P2747
                                            P2766 P2785 P2804
      683   PRINT-DETAIL . . . . . . . . .  P841 P846 P878 P885 P968 P1009 P1050 P1093 P1144 P1200 P1250 P1297 P1344 P1369
                                            P1388 P1407 P1426 P1445 P1464 P1483 P1502 P1521 P1602 P1644 P1686 P1729 P1782
                                            P1838 P1888 P1935 P1982 P2010 P2029 P2048 P2067 P2086 P2105 P2124 P2143 P2162
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    59
0 Defined   Cross-reference of procedures   References

0                                           P2246 P2287 P2328 P2371 P2425 P2485 P2535 P2582 P2629 P2657 P2676 P2695 P2714
                                            P2734 P2753 P2772 P2791 P2810 P2834 P2841 P2848
      886   READ-EXIT-F1-01. . . . . . . .  G879
      880   READ-FAIL-F1-01. . . . . . . .  P864
      849   READ-INIT-F1-01
      869   READ-TEST-F1-01. . . . . . . .  G857
      856   READ-TEST-F1-01-R1 . . . . . .  G868
      784   SECT-0001-IX209A
      965   START-DELETE-GF-01 . . . . . .  G930
     1006   START-DELETE-GF-02 . . . . . .  G975
     1047   START-DELETE-GF-03 . . . . . .  G1016
     1090   START-DELETE-GF-04 . . . . . .  G1057
     1141   START-DELETE-GF-05 . . . . . .  G1100
     1197   START-DELETE-GF-06 . . . . . .  G1151
     1247   START-DELETE-GF-07 . . . . . .  G1207
     1294   START-DELETE-GF-08 . . . . . .  G1257
     1341   START-DELETE-GF-09 . . . . . .  G1304
     1599   START-DELETE-GF-19 . . . . . .  G1564
     1641   START-DELETE-GF-20 . . . . . .  G1609
     1683   START-DELETE-GF-21 . . . . . .  G1651
     1726   START-DELETE-GF-22 . . . . . .  G1693
     1779   START-DELETE-GF-23 . . . . . .  G1736
     1835   START-DELETE-GF-24 . . . . . .  G1789
     1885   START-DELETE-GF-25 . . . . . .  G1845
     1932   START-DELETE-GF-26 . . . . . .  G1895
     1979   START-DELETE-GF-27 . . . . . .  G1942
     2243   START-DELETE-GF-37 . . . . . .  G2208
     2284   START-DELETE-GF-38 . . . . . .  G2253
     2325   START-DELETE-GF-39 . . . . . .  G2294
     2368   START-DELETE-GF-40 . . . . . .  G2335
     2422   START-DELETE-GF-41 . . . . . .  G2378
     2482   START-DELETE-GF-42 . . . . . .  G2432
     2532   START-DELETE-GF-43 . . . . . .  G2492
     2579   START-DELETE-GF-44 . . . . . .  G2542
     2626   START-DELETE-GF-45 . . . . . .  G2589
      960   START-FAIL-GF-01 . . . . . . .  G947 G951
     1136   START-FAIL-GF-05 . . . . . . .  G1124 G1128
     1192   START-FAIL-GF-06 . . . . . . .  G1180 G1184
     1594   START-FAIL-GF-19 . . . . . . .  G1581 G1585
     1774   START-FAIL-GF-23 . . . . . . .  G1762 G1766
     1830   START-FAIL-GF-24 . . . . . . .  G1818 G1822
     2238   START-FAIL-GF-37 . . . . . . .  G2225 G2229
     2417   START-FAIL-GF-41 . . . . . . .  G2405 G2409
     2477   START-FAIL-GF-42 . . . . . . .  G2465 G2469
     2633   START-INIT-FILE-STATUS-03
     1986   START-INIT-FILE-STATUS-2
     1346   START-INIT-GF-FILE-STATUS
      888   START-INIT-GF-01
      924   START-INIT-GF-01-01
      969   START-INIT-GF-02
     1010   START-INIT-GF-03
     1051   START-INIT-GF-04
     1094   START-INIT-GF-05
     1145   START-INIT-GF-06
     1201   START-INIT-GF-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    60
0 Defined   Cross-reference of procedures   References

0    1251   START-INIT-GF-08
     1298   START-INIT-GF-09
     1559   START-INIT-GF-19
     1603   START-INIT-GF-20
     1645   START-INIT-GF-21
     1687   START-INIT-GF-22
     1730   START-INIT-GF-23
     1783   START-INIT-GF-24
     1839   START-INIT-GF-25
     1889   START-INIT-GF-26
     1936   START-INIT-GF-27
     2202   START-INIT-GF-37
     2165   START-INIT-GF-37-ETC
     2247   START-INIT-GF-38
     2288   START-INIT-GF-39
     2329   START-INIT-GF-40
     2372   START-INIT-GF-41
     2426   START-INIT-GF-42
     2486   START-INIT-GF-43
     2536   START-INIT-GF-44
     2583   START-INIT-GF-45
     1523   START-INIT-005
     2815   START-INITIALIZE-RECORD. . . .  P925 P971 P1011 P1053 P1096 P1147 P1203 P1253 P1300 P1560 P1605 P1647 P1689 P1732
                                            P1785 P1841 P1891 P1938 P2204 P2249 P2290 P2331 P2374 P2428 P2488 P2538 P2585
     1003   START-PASS-GF-02 . . . . . . .  G993
     1044   START-PASS-GF-03 . . . . . . .  G1034
     1087   START-PASS-GF-04 . . . . . . .  G1077
     1244   START-PASS-GF-07 . . . . . . .  G1234
     1291   START-PASS-GF-08 . . . . . . .  G1281
     1338   START-PASS-GF-09 . . . . . . .  G1328
     1637   START-PASS-GF-20 . . . . . . .  G1627
     1679   START-PASS-GF-21 . . . . . . .  G1669
     1723   START-PASS-GF-22 . . . . . . .  G1713
     1882   START-PASS-GF-25 . . . . . . .  G1872
     1929   START-PASS-GF-26 . . . . . . .  G1919
     1976   START-PASS-GF-27 . . . . . . .  G1966
     2281   START-PASS-GF-38 . . . . . . .  G2271
     2322   START-PASS-GF-39 . . . . . . .  G2312
     2365   START-PASS-GF-40 . . . . . . .  G2355
     2529   START-PASS-GF-43 . . . . . . .  G2519
     2576   START-PASS-GF-44 . . . . . . .  G2566
     2623   START-PASS-GF-45 . . . . . . .  G2613
     2849   START-TEST-COMPLETE. . . . . .  G2812
      937   START-TEST-GF-01
      982   START-TEST-GF-02
     1023   START-TEST-GF-03
     1064   START-TEST-GF-04
     1107   START-TEST-GF-05
     1158   START-TEST-GF-06
     1214   START-TEST-GF-07
     1264   START-TEST-GF-08
     1311   START-TEST-GF-09
     1352   START-TEST-GF-10
     1370   START-TEST-GF-11
     1389   START-TEST-GF-12
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    61
0 Defined   Cross-reference of procedures   References

0    1408   START-TEST-GF-13
     1427   START-TEST-GF-14
     1446   START-TEST-GF-15
     1484   START-TEST-GF-17
     1503   START-TEST-GF-18
     1571   START-TEST-GF-19
     1616   START-TEST-GF-20
     1658   START-TEST-GF-21
     1700   START-TEST-GF-22
     1743   START-TEST-GF-23
     1796   START-TEST-GF-24
     1852   START-TEST-GF-25
     1902   START-TEST-GF-26
     1949   START-TEST-GF-27
     1993   START-TEST-GF-28
     2011   START-TEST-GF-29
     2030   START-TEST-GF-30
     2049   START-TEST-GF-31
     2068   START-TEST-GF-32
     2087   START-TEST-GF-33
     2106   START-TEST-GF-34
     2125   START-TEST-GF-35
     2144   START-TEST-GF-36
     2215   START-TEST-GF-37
     2260   START-TEST-GF-38
     2301   START-TEST-GF-39
     2342   START-TEST-GF-40
     2385   START-TEST-GF-41
     2439   START-TEST-GF-42
     2499   START-TEST-GF-43
     2549   START-TEST-GF-44
     2596   START-TEST-GF-45
     2640   START-TEST-GF-46
     2658   START-TEST-GF-47
     2677   START-TEST-GF-48
     2696   START-TEST-GF-49
     2715   START-TEST-GF-50
     2735   START-TEST-GF-51
     2754   START-TEST-GF-52
     2773   START-TEST-GF-53
     2792   START-TEST-GF-54
     1465   START-TEST-GGF-16
      967   START-WRITE-GF-01. . . . . . .  G956 G964
     1008   START-WRITE-GF-02. . . . . . .  G1002 G1005
     1049   START-WRITE-GF-03. . . . . . .  G1043 G1046
     1092   START-WRITE-GF-04. . . . . . .  G1086 G1089
     1143   START-WRITE-GF-05. . . . . . .  G1132 G1140
     1199   START-WRITE-GF-06. . . . . . .  G1188 G1196
     1249   START-WRITE-GF-07. . . . . . .  G1243 G1246
     1296   START-WRITE-GF-08. . . . . . .  G1290 G1293
     1343   START-WRITE-GF-09. . . . . . .  G1337 G1340
     1368   START-WRITE-GF-10. . . . . . .  G1355
     1387   START-WRITE-GF-11. . . . . . .  G1375
     1406   START-WRITE-GF-12. . . . . . .  G1394
     1425   START-WRITE-GF-13. . . . . . .  G1413
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    62
0 Defined   Cross-reference of procedures   References

0    1444   START-WRITE-GF-14. . . . . . .  G1432
     1463   START-WRITE-GF-15. . . . . . .  G1451
     1482   START-WRITE-GF-16. . . . . . .  G1470
     1501   START-WRITE-GF-17. . . . . . .  G1489
     1520   START-WRITE-GF-18. . . . . . .  G1508
     1601   START-WRITE-GF-19. . . . . . .  G1590 G1598
     1643   START-WRITE-GF-20. . . . . . .  G1636 G1640
     1685   START-WRITE-GF-21. . . . . . .  G1678 G1682
     1728   START-WRITE-GF-22. . . . . . .  G1722 G1725
     1781   START-WRITE-GF-23. . . . . . .  G1770 G1778
     1837   START-WRITE-GF-24. . . . . . .  G1826 G1834
     1887   START-WRITE-GF-25. . . . . . .  G1881 G1884
     1934   START-WRITE-GF-26. . . . . . .  G1928 G1931
     1981   START-WRITE-GF-27. . . . . . .  G1975 G1978
     2009   START-WRITE-GF-28. . . . . . .  G1996
     2028   START-WRITE-GF-29. . . . . . .  G2016
     2047   START-WRITE-GF-30. . . . . . .  G2035
     2066   START-WRITE-GF-31. . . . . . .  G2054
     2085   START-WRITE-GF-32. . . . . . .  G2073
     2104   START-WRITE-GF-33. . . . . . .  G2092
     2123   START-WRITE-GF-34. . . . . . .  G2111
     2142   START-WRITE-GF-35. . . . . . .  G2130
     2161   START-WRITE-GF-36. . . . . . .  G2149
     2245   START-WRITE-GF-37. . . . . . .  G2234 G2242
     2286   START-WRITE-GF-38. . . . . . .  G2280 G2283
     2327   START-WRITE-GF-39. . . . . . .  G2321 G2324
     2370   START-WRITE-GF-40. . . . . . .  G2364 G2367
     2424   START-WRITE-GF-41. . . . . . .  G2413 G2421
     2484   START-WRITE-GF-42. . . . . . .  G2473 G2481
     2534   START-WRITE-GF-43. . . . . . .  G2528 G2531
     2581   START-WRITE-GF-44. . . . . . .  G2575 G2578
     2628   START-WRITE-GF-45. . . . . . .  G2622 G2625
     2656   START-WRITE-GF-46. . . . . . .  G2643
     2675   START-WRITE-GF-47. . . . . . .  G2663
     2694   START-WRITE-GF-48. . . . . . .  G2682
     2713   START-WRITE-GF-49. . . . . . .  G2701
     2732   START-WRITE-GF-50. . . . . . .  G2720
     2752   START-WRITE-GF-51. . . . . . .  G2740
     2771   START-WRITE-GF-52. . . . . . .  G2759
     2790   START-WRITE-GF-53. . . . . . .  G2778
     2809   START-WRITE-GF-54. . . . . . .  G2797
      676   TERMINATE-CALL
      674   TERMINATE-CCVS
      843   WRITE-DELETE-GF-01
      801   WRITE-INIT-GF-01-01
      785   WRITE-INT-GF-01
      737   WRITE-LINE . . . . . . . . . .  P687 P688 P696 P697 P698 P699 P701 P702 P703 P705 P707 P716 P724 P730 P735 P736
                                            P764 P768 P770 P779
      831   WRITE-TEST-GF-01 . . . . . . .  G805
      847   WRITE-TEST-GF-01-END . . . . .  G842
      806   WRITE-TEST-GF-01-1 . . . . . .  P802 P804
      819   WRITE-TEST-GF-01-2 . . . . . .  P803
      753   WRT-LN . . . . . . . . . . . .  P743 P744 P745 P746 P747 P748 P749 P752 P757
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    63
0 Defined   Cross-reference of programs     References

        3   IX209A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX209A    Date 06/04/2022  Time 12:00:52   Page    64
0LineID  Message code  Message text

    191  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

    216  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    219  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX209A:
 *    Source records = 2853
 *    Data Division statements = 156
 *    Procedure Division statements = 1427
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1435
0End of compilation 1,  program IX209A,  highest severity 0.
0Return code 0
