1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:46   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:46   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2104.2
   000002         000200 PROGRAM-ID.                                                      IX2104.2
   000003         000300     IX210A.                                                      IX2104.2
   000004         000500*                                                              *  IX2104.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2104.2
   000006         000700*                                                              *  IX2104.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2104.2
   000008         000900*                                                              *  IX2104.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2104.2
   000010         001100*                                                              *  IX2104.2
   000011         001300*                                                              *  IX2104.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2104.2
   000013         001500*                                                              *  IX2104.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2104.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2104.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2104.2
   000017         001900*                                                              *  IX2104.2
   000018         002100*    THE PURPOSE OF THE  PROGRAM IS TO TEST USE OF THE            IX2104.2
   000019         002200*    START --- GREATER THAN --- STATEMENT USING FIRST THE PRIME   IX2104.2
   000020         002300*    RECORD KEY AND THEN WITH AN ALTERNATE RECORD KEY             IX2104.2
   000021         002400*    AS THE KEY OF REFERENCE.   THE START STATEMENT NAMES,        IX2104.2
   000022         002500*    IN ITS CONSTRUCT , EITHER THE DATA NAME SPECIFIED IN THE     IX2104.2
   000023         002600*    KEY CLAUSE OR A DATA ITEM THAT IS SUBORDINATE TO THE         IX2104.2
   000024         002700*    KEY NAME.   DIFFERENT KEY VALUES ARE USED FOR TESTING.       IX2104.2
   000025         002800*    IF A KEY VALUE IS PROVIDED WHICH MATCHES A RECORD IN THE FILEIX2104.2
   000026         002900*    WHEN THE START IS EXECUTED THEN THE RECORD IS EXPECTED TO    IX2104.2
   000027         003000*    MADE AVAILABLE BY THE SUBSEQUENT READ STATEMENT.  IF A KEY   IX2104.2
   000028         003100*    VALUE IS PROVIDED WHICH DOES NOT  MATCH ANY RECORD IN THE    IX2104.2
   000029         003200*    FILE THEN THE INVALID KEY PATH IS EXPECTED TO BE TAKEN.      IX2104.2
   000030         003300*    THE FILE STATUS CONTENTS RESULTING FROM EXECUTION OF THE     IX2104.2
   000031         003400*    START TESTS ARE SAVED AND CHECKED IN LATER TESTS.            IX2104.2
   000032         003500*                                                                 IX2104.2
   000033         003600*            REFERENCE   AMERICAN NATIONAL STANDARD               IX2104.2
   000034         003700*                        PROGRAMMING LANGUAGE COBOL, X3.23-1985.  IX2104.2
   000035         003800*                        SECTION IX, INDEX I-O, THE START         IX2104.2
   000036         003900*                        STATEMENT. PARAGRAPHS 4.7.3 (3);         IX2104.2
   000037         004000*                                              4.7.4 (1), (4), (4)IX2104.2
   000038         004100*                                                        AND      IX2104.2
   000039         004200*                        THE FILE STATUS PARAGRAPH 1.3.4          IX2104.2
   000040         004300*                                                                 IX2104.2
   000041         004400*    BEFORE EXECUTION OF THE START IN EACH TEST, A RECORD IS MADE IX2104.2
   000042         004500*    AVAILABLE FROM THE FILE THAT IS DIFFERENT THAN WILL RESULT   IX2104.2
   000043         004600*    FROM THE TEST, AND THE RECORD KEY IS LOADED WITH A KEY VALUE.IX2104.2
   000044         004700*    DEPENDING ON THE NATURE OF THE TEST THE KEY VALUE MAY OR     IX2104.2
   000045         004800*    MAY NOT BE A VALID KEY FOR THE FILE.                         IX2104.2
   000046         004900*                                                                 IX2104.2
   000047         005000*    THIS PROGRAM FIRST CREATES AN  INDEXED SEQUENTIAL FILE       IX2104.2
   000048         005100*    CONTAINING TWO ALTERNATE KEYS AND  THE ONE REQUIRED RECORD   IX2104.2
   000049         005200*    KEY FOR THE FILE.  IMMEDIATELY FOLLOWING FILE CREATION THE   IX2104.2
   000050         005300*    FILE IS READ AND THE RECORDS OF THE FILE VERIFIED FOR        IX2104.2
   000051         005400*    ACCURACY.  NEXT THE TESTS ARE EXECUTED USING THE START ---   IX2104.2
   000052         005500*    GREATER THAN ---STATEMENT.                                   IX2104.2
   000053         005600*    THE RECORDS IN THE FILE ARE CREATED IN SEQUENTIAL ORDER BY   IX2104.2
   000054         005700*    RECORD KEY VALUE.  FOLLOWING  IS A SAMPLE OF THE DATA        IX2104.2
   000055         005800*    CONTENTS FOR THE RECORD KEY AND TWO ALTERNATE RECORD KEYS IN IX2104.2
   000056         005900*    THE FILE.                                                    IX2104.2
   000057         006000*                                                                 IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100*   REC-NO  RECORD-KEY      ALTERNATE-KEY-1     ALTERNATE-KEY-2   IX2104.2
   000059         006200*   ------  ----------      ---------------     ---------------   IX2104.2
   000060         006300*    001   BBBBBBBBBC002 EEEEEEEEEF000ALTKEY1 WWWWWWWWWV398ALTKEY2IX2104.2
   000061         006400*    002   BBBBBBBBCC004 EEEEEEEEFF004ALTKEY1 WWWWWWWWVV396ALTKEY2IX2104.2
   000062         006500*    003   BBBBBBBCCC006 EEEEEEEFFF006ALTKEY1 WWWWWWWVVV394ALTKEY2IX2104.2
   000063         006600*     .          .                 .                    .         IX2104.2
   000064         006700*     .          .                 .                    .         IX2104.2
   000065         006800*     .          .                 .                    .         IX2104.2
   000066         006900*    010   CCCCCCCCCC020 FFFFFFFFFF020ALTKEY1 VVVVVVVVVV380ALTKEY2IX2104.2
   000067         007000*    011   CCCCCCCCCD022 FFFFFFFFFG022ALTKEY1 VVVVVVVVVV380ALTKEY2IX2104.2
   000068         007100*    012   CCCCCCCCDD024 FFFFFFFFGG024ALTKEY1 VVVVVVVVUU376ALTKEY2IX2104.2
   000069         007200*     .          .                 .                    .         IX2104.2
   000070         007300*     .          .                 .                    .         IX2104.2
   000071         007400*     .          .                 .                    .         IX2104.2
   000072         007500*    200   UUUUUUUUUU400 YYYYYYYYYY400ALTKEY1 DDDDDDDDDD000ALTKEY2IX2104.2
   000073         007600*                                                                 IX2104.2
   000074         007700*     NOTE 1 - ALTERNATE KEY NUMBER 2 CONTAINS DUPLICATE KEYS     IX2104.2
   000075         007800*              EVERY 10TH AND 11TH RECORDS.                       IX2104.2
   000076         007900*                                                                 IX2104.2
   000077         008000*     NOTE 2 - THE FIRST 50 RECORDS AND LAST 25 RECORDS OF THE    IX2104.2
   000078         008100*    FILE FOLLOW THE ABOVE SEQUENTIAL KEY PATTERN.  FOR THE MIDDLEIX2104.2
   000079         008200*    125 RECORDS ONLY THE NUMBER PART OF THE KEYS ARE VARIED      IX2104.2
   000080         008300*    AND VARIED IN THE SEQUENCE SHOWN ABOVE.  THAT IS, RECORD-KEY IX2104.2
   000081         008400*    AND ALTERNATE-KEY-1 ARE INCREMENTED BY 2 AND THE ALTERNATE-  IX2104.2
   000082         008500*    KEY-2 IS DECREMENTED BY 2 EACH TIME A RECORD IS WRITTEN TO   IX2104.2
   000083         008600*    THE FILE.  THE FILE IS DESIGNED TO BE LARGE ENOUGH SO THAT   IX2104.2
   000084         008700*    AN I-O OPERATION IS REQUIRED FOR EACH RECORD ACCESSED FROM   IX2104.2
   000085         008800*    THE FILE.                                                    IX2104.2
   000086         008900*                                                                 IX2104.2
   000087         009000*    FILE CHARACTERISTICS ARE: FILE SIZE            = 200 RECORDS IX2104.2
   000088         009100*                              RECORD SIZE          = 240 CHARS.  IX2104.2
   000089         009200*                              RECORD KEY SIZE      = 13  CHARS.  IX2104.2
   000090         009300*                              ALTERNATE KEY 1 SIZE = 20  CHARS.  IX2104.2
   000091         009400*                              ALTERNATE KEY 2 SIZE = 20  CHARS.  IX2104.2
   000092         009500*                              ACCESS MODE          = SEQUENTIAL  IX2104.2
   000093         009600*                                                                 IX2104.2
   000094         009700*    A LIST OF COBOL ELEMENTS WITH THE PARAGRAPH NAME IN PARENTH- IX2104.2
   000095         009800*    ESIS THAT TESTS THE ELEMENT AND A SHORT DESCRIPTION OF THE   IX2104.2
   000096         009900*    TEST FOLLOWS.                                                IX2104.2
   000097         010000*                                                                 IX2104.2
   000098         010100*      PROGRAM COLLATING SEQUENCE CLAUSE. (ALL START TESTS) -     IX2104.2
   000099         010200*            THE PROGRAM COLLATING SEQUENCE CLAUSE SHOULD HAVE NO IX2104.2
   000100         010300*            EFFECT ON THE COMARAISIONS ASSOCIATED WITH THE START IX2104.2
   000101         010400*            STATEMENT.  THIS PROGRAM ASSUMES THAT THE PROGRAM    IX2104.2
   000102         010500*            COLLATING SEQUENCE CLAUSE ALSO DOES NOT IN ANY WAY   IX2104.2
   000103         010600*            EFFECT THE SEQUENTIAL ORDER OF RECORDS ACCESSED      IX2104.2
   000104         010700*            FROM OR WRITTEN TO THE FILE.                         IX2104.2
   000105         010800*      WRITE --- INVALID KEY---. (INX-TEST-001) - THIS TEST CREATEIX2104.2
   000106         010900*            A FILE OF 200 RECORDS CONTAINING ONE RECORD KEY AND  IX2104.2
   000107         011000*            TWO ALTERNATE KEYS.                                  IX2104.2
   000108         011100*      READ ---AT END ---. (INX-TEST-002) - THIS TEST READS THE   IX2104.2
   000109         011200*            FILE CREATED IN INX-TEST-001 AND VERIFIES THAT   THE IX2104.2
   000110         011300*            FILE WAS CREATED CORRECTLY.                          IX2104.2
   000111         011400*      START ---KEY GREATER THAN RECORD-KEY INVALID KEY ---. (INX-IX2104.2
   000112         011500*            TEST-003.01 THRU INX-TEST-003.04) - THE START        IX2104.2
   000113         011600*            STATEMENT IS EXECUTED USING THE RECORD-KEY FOR THE   IX2104.2
   000114         011700*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011800*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2104.2
   000116         011900*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2104.2
   000117         012000*            (.03) AND GREATER THAN THAN THE LAST RECORD IN THE   IX2104.2
   000118         012100*            FILE (.04).                                          IX2104.2
   000119         012200*      START ---KEY GREATER THAN DATA-ITEM  INVALID KEY ---. (INX-IX2104.2
   000120         012300*            TEST-003.05 THRU INX-TEST-003.09) - THE START        IX2104.2
   000121         012400*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2104.2
   000122         012500*            SUBORDINATE TO  THE RECORD-KEY NAME OF THE FILE      IX2104.2
   000123         012600*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2104.2
   000124         012700*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2104.2
   000125         012800*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2104.2
   000126         012900*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2104.2
   000127         013000*            THE FIRST RECORD IN THE FILE (.08) AND GREATER THAN  IX2104.2
   000128         013100*            THE LAST RECORD IN THE FILE (.09.                    IX2104.2
   000129         013200*                                                                 IX2104.2
   000130         013300*            NOTE -- IN SOME OF THE TESTS THE DATA ITEM SPECIFIED IX2104.2
   000131         013400*                    IS AN ENTRY SUBORDINATE TO A REDEFINES       IX2104.2
   000132         013500*                    ENTRY WHICH USES AS ITS OBJECT THE KEY       IX2104.2
   000133         013600*                   NAMED BY THE RECORD KEY CLAUSE.               IX2104.2
   000134         013700*                                                                 IX2104.2
   000135         013800*      FILE STATUS. (INX-TEST-004.01 THRU INX-TEST-004.09) - THESEIX2104.2
   000136         013900*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2104.2
   000137         014000*            FROM THE START IN INX-TEST-003.01 THRU               IX2104.2
   000138         014100*            INX-TEST-003.09.                                     IX2104.2
   000139         014200*      START ---KEY GREATER THAN ALTNATE-KEY INVALID KEY --. (INX-IX2104.2
   000140         014300*            TEST-005.01 THRU INX-TEST-005.04) - THE START        IX2104.2
   000141         014400*            STATEMENT IS EXECUTED USING THE ALTERNATE-KEY FOR THEIX2104.2
   000142         014500*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2104.2
   000143         014600*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2104.2
   000144         014700*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2104.2
   000145         014800*            (.03) AND GREATER THAN THAN THE LAST RECORD IN THE   IX2104.2
   000146         014900*            FILE (.04).                                          IX2104.2
   000147         015000*      START ---KEY GREATER THAN DATA-ITEM   INVALID KEY --. (INX-IX2104.2
   000148         015100*            TEST-005.05 THRU INX-TEST-005.09) - THE START        IX2104.2
   000149         015200*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2104.2
   000150         015300*            SUBORDINATE TO THE ALTERNATE-KEY NAME OF THE FILE    IX2104.2
   000151         015400*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2104.2
   000152         015500*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2104.2
   000153         015600*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2104.2
   000154         015700*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2104.2
   000155         015800*            THE FIRST RECORD IN THE FILE (.08) AND GREATER THAN  IX2104.2
   000156         015900*            THE LAST RECORD IN THE FILE (.09.                    IX2104.2
   000157         016000*                                                                 IX2104.2
   000158         016100*            NOTE -- IN SOME OF THE TESTS THE DATA ITEM SPECIFIED IX2104.2
   000159         016200*                    IS AN ENTRY SUBORDINATE TO A REDEFINES       IX2104.2
   000160         016300*                    ENTRY WHICH USES AS ITS OBJECT THE KEY       IX2104.2
   000161         016400*                   NAMED BY THE RECORD KEY CLAUSE.               IX2104.2
   000162         016500*                                                                 IX2104.2
   000163         016600*      FILE STATUS. (INX-TEST-006.01 THRU INX-TEST-006.09) - THESEIX2104.2
   000164         016700*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2104.2
   000165         016800*            FROM THE START IN INX-TEST-005.01 THRU               IX2104.2
   000166         016900*            INX-TEST-005.09.                                     IX2104.2
   000167         017000*      MULTIPLE STARTS. (INX-TEST-007) -  THIS TEST EXECUTES      IX2104.2
   000168         017100*            SEVERAL START STATEMENTS FOLLOWED BY A READ STATEMENTIX2104.2
   000169         017200*            AND EXPECTS THE RECORD  DESIGNATED BY THE LAST       IX2104.2
   000170         017300*            START BE MADE AVAILABLE.                             IX2104.2
   000171         017400*                                                                 IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000172         017600*                                                                 IX2104.2
   000173         017700 ENVIRONMENT DIVISION.                                            IX2104.2
   000174         017800 CONFIGURATION SECTION.                                           IX2104.2
   000175         017900 SOURCE-COMPUTER.                                                 IX2104.2
   000176         018000     XXXXX082.                                                    IX2104.2
   000177         018100 OBJECT-COMPUTER.                                                 IX2104.2
   000178         018200     XXXXX083                                                     IX2104.2
   000179         018300          PROGRAM COLLATING SEQUENCE IS FOR-INX-START-TEST.       IX2104.2 182
   000180         018400 SPECIAL-NAMES.                                                   IX2104.2
   000181         018500     ALPHABET                                                     IX2104.2
   000182         018600     FOR-INX-START-TEST IS "WVUTSRJIHGFEDCB".                     IX2104.2
   000183         018700 INPUT-OUTPUT SECTION.                                            IX2104.2
   000184         018800 FILE-CONTROL.                                                    IX2104.2
   000185         018900     SELECT RAW-DATA   ASSIGN TO                                  IX2104.2 205
   000186         019000     XXXXX062                                                     IX2104.2
   000187         019100            ORGANIZATION IS INDEXED                               IX2104.2
   000188         019200            ACCESS MODE IS RANDOM                                 IX2104.2
   000189         019300            RECORD KEY IS RAW-DATA-KEY.                           IX2104.2 208
   000190         019400     SELECT PRINT-FILE ASSIGN TO                                  IX2104.2 220
   000191         019500     XXXXX055.                                                    IX2104.2
   000192         019600     SELECT  IX-FS1                                               IX2104.2 223
   000193         019700     ASSIGN TO                                                    IX2104.2
   000194         019800     XXXXX024                                                     IX2104.2
   000195         019900     XXXXX044                                                     IX2104.2

 ==000195==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000196         020000        ACCESS MODE IS SEQUENTIAL                                 IX2104.2
   000197         020100        ORGANIZATION IS INDEXED                                   IX2104.2
   000198         020200        RECORD KEY IS IX-FS1-KEY                                  IX2104.2 232
   000199         020300        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY1                    IX2104.2 243
   000200         020400        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY2 WITH DUPLICATES    IX2104.2 256
   000201         020500        FILE STATUS IS FS1-STATUS.                                IX2104.2 287
   000202         020600 DATA DIVISION.                                                   IX2104.2
   000203         020700 FILE SECTION.                                                    IX2104.2
   000204         020800                                                                  IX2104.2
   000205         020900 FD  RAW-DATA.                                                    IX2104.2
   000206         021000                                                                  IX2104.2
   000207         021100 01  RAW-DATA-SATZ.                                               IX2104.2
   000208         021200     05  RAW-DATA-KEY        PIC X(6).                            IX2104.2
   000209         021300     05  C-DATE              PIC 9(6).                            IX2104.2
   000210         021400     05  C-TIME              PIC 9(8).                            IX2104.2
   000211         021500     05  C-NO-OF-TESTS       PIC 99.                              IX2104.2
   000212         021600     05  C-OK                PIC 999.                             IX2104.2
   000213         021700     05  C-ALL               PIC 999.                             IX2104.2
   000214         021800     05  C-FAIL              PIC 999.                             IX2104.2
   000215         021900     05  C-DELETED           PIC 999.                             IX2104.2
   000216         022000     05  C-INSPECT           PIC 999.                             IX2104.2
   000217         022100     05  C-NOTE              PIC X(13).                           IX2104.2
   000218         022200     05  C-INDENT            PIC X.                               IX2104.2
   000219         022300     05  C-ABORT             PIC X(8).                            IX2104.2
   000220         022400 FD  PRINT-FILE.                                                  IX2104.2

 ==000220==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000221         022500 01  PRINT-REC PICTURE X(120).                                    IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000222         022600 01  DUMMY-RECORD PICTURE X(120).                                 IX2104.2
   000223         022700 FD  IX-FS1                                                       IX2104.2

 ==000223==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000224         022800     LABEL RECORDS ARE STANDARD                                   IX2104.2
   000225         022900     DATA RECORD IS IX-FS1R1-F-G-240                              IX2104.2 *
   000226         023000     RECORD CONTAINS 240 CHARACTERS.                              IX2104.2
   000227         023100 01  IX-FS1R1-F-G-240.                                            IX2104.2
   000228         023200     05 IX-FS1-REC-120           PICTURE X(120).                  IX2104.2
   000229         023300     05 IX-FS1-REC-121-240.                                       IX2104.2
   000230         023400        10 FILLER                PICTURE X(8).                    IX2104.2
   000231         023500        10 IX-REC-KEY-AREA.                                       IX2104.2
   000232         023600           15 IX-FS1-KEY.                                         IX2104.2
   000233         023700              20 IX-FS1-KEY-1-10.                                 IX2104.2
   000234         023800                 25 IX-FS1-KEY-1-5      PICTURE X(5).             IX2104.2
   000235         023900                 25 IX-FS1-KEY-6-10     PICTURE X(5).             IX2104.2
   000236         024000               20 IX-FS1-KEY-11-13      PICTURE X(3).             IX2104.2
   000237         024100           15 IX-REDF-RECKEY REDEFINES IX-FS1-KEY.                IX2104.2 232
   000238         024200              20 R-RECKEY-1-7    PICTURE X(7).                    IX2104.2
   000239         024300              20 R-RECKEY-8-13   PICTURE X(6).                    IX2104.2
   000240         024400           15 FILLER             PICTURE X(16).                   IX2104.2
   000241         024500        10 FILLER                PICTURE X(9).                    IX2104.2
   000242         024600        10 IX-ALT-KEY1-AREA.                                      IX2104.2
   000243         024700           15 IX-FS1-ALTKEY1.                                     IX2104.2
   000244         024800              20 IX-FS1-ALTKEY1-1-10.                             IX2104.2
   000245         024900                 25 IX-FS1-ALTKEY1-1-5  PICTURE X(5).             IX2104.2
   000246         025000                 25 IX-FS1-ALTKEY1-6-10 PICTURE X(5).             IX2104.2
   000247         025100              20 IX-FS1-ALTKEY1-11-13   PICTURE X(3).             IX2104.2
   000248         025200              20 IX-FS1-ALTKEY1-14-20   PICTURE X(7).             IX2104.2
   000249         025300           15 IX-REDF-ALTKEY1 REDEFINES IX-FS1-ALTKEY1.           IX2104.2 243
   000250         025400              20 R-ALTKEY1-1-6   PICTURE X(6).                    IX2104.2
   000251         025500              20 R-ALTKEY1-7-10  PICTURE X(4).                    IX2104.2
   000252         025600              20 R-ALTKEY1-11-20 PICTURE X(10).                   IX2104.2
   000253         025700           15 FILLER             PICTURE X(9).                    IX2104.2
   000254         025800        10 FILLER                PICTURE X(9).                    IX2104.2
   000255         025900        10 IX-ALT-KEY2-AREA.                                      IX2104.2
   000256         026000           15 IX-FS1-ALTKEY2.                                     IX2104.2
   000257         026100              20 IX-FS1-ALTKEY2-1-10.                             IX2104.2
   000258         026200                 25 IX-FS1-ALTKEY2-1-5  PICTURE X(5).             IX2104.2
   000259         026300                 25 IX-FS1-ALTKEY2-6-10 PICTURE X(5).             IX2104.2
   000260         026400              20 IX-FS1-ALTKEY2-11-13   PICTURE X(3).             IX2104.2
   000261         026500              20 IX-FS1-ALTKEY2-14-20   PICTURE X(7).             IX2104.2
   000262         026600           15 FILLER             PICTURE X(9).                    IX2104.2
   000263         026700        10 FILLER                PICTURE X(7).                    IX2104.2
   000264         026800 WORKING-STORAGE SECTION.                                         IX2104.2
   000265         026900 01  WRK-FS1-RECKEY.                                              IX2104.2
   000266         027000     05 FS1-RECKEY-1-13.                                          IX2104.2
   000267         027100        10 FS1-RECKEY-1-10       PICTURE X(10).                   IX2104.2
   000268         027200        10 FS1-RECKEY-11-13      PICTURE 9(3).                    IX2104.2
   000269         027300     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX2104.2 IMP
   000270         027400 01  WRK-FS1-ALTKEY1.                                             IX2104.2
   000271         027500      05 FS1-ALTKEY1-1-20.                                        IX2104.2
   000272         027600       10  FS1-ALTKEY1-1-10.                                      IX2104.2
   000273         027700        15 FS1-ALTKEY1-1-5       PICTURE X(5).                    IX2104.2
   000274         027800        15 FS1-ALTKEY1-6-10      PICTURE X(5).                    IX2104.2
   000275         027900       10 FS1-ALTKEY1-11-13      PICTURE 9(3).                    IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         028000       10 FS1-ALTKEY1-14-20      PICTURE X(7).                    IX2104.2
   000277         028100     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX2104.2 IMP
   000278         028200 01  WRK-FS1-ALTKEY2.                                             IX2104.2
   000279         028300     05 FS1-ALTKEY2-1-20.                                         IX2104.2
   000280         028400        10 FS1-ALTKEY2-1-10.                                      IX2104.2
   000281         028500           15 FS1-ALTKEY2-1-5    PICTURE X(5).                    IX2104.2
   000282         028600           15 FS1-ALTKEY2-6-10   PICTURE X(5).                    IX2104.2
   000283         028700        10 FS1-ALTKEY2-11-13     PICTURE 9(3).                    IX2104.2
   000284         028800        10 FS1-ALTKEY2-14-20     PICTURE X(7).                    IX2104.2
   000285         028900     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX2104.2 IMP
   000286         029000 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX2104.2 IMP
   000287         029100 01  FS1-STATUS                  PICTURE XX   VALUE SPACE.        IX2104.2 IMP
   000288         029200 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX2104.2 IMP
   000289         029300 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX2104.2
   000290         029400 01  INVKEY-COUNTER              PICTURE 9(3) COMPUTATIONAL.      IX2104.2
   000291         029500 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX2104.2
   000292         029600 01  RECKEY-NUM                  PICTURE 9(3).                    IX2104.2
   000293         029700 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX2104.2
   000294         029800 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX2104.2
   000295         029900 01  RECORD-KEY-CONTENT.                                          IX2104.2
   000296         030000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000297         030100          "BBBBBBBBBC002EEEEEEEEEF002ALTKEY1WWWWWWWWWV398ALTKEY2".IX2104.2
   000298         030200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000299         030300          "BBBBBBBBCC004EEEEEEEEFF004ALTKEY1WWWWWWWWVV396ALTKEY2".IX2104.2
   000300         030400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000301         030500          "BBBBBBBCCC006EEEEEEEFFF006ALTKEY1WWWWWWWVVV394ALTKEY2".IX2104.2
   000302         030600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000303         030700          "BBBBBBCCCC008EEEEEEFFFF008ALTKEY1WWWWWWVVVV392ALTKEY2".IX2104.2
   000304         030800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000305         030900          "BBBBBCCCCC010EEEEEFFFFF010ALTKEY1WWWWWVVVVV390ALTKEY2".IX2104.2
   000306         031000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000307         031100          "BBBBCCCCCC012EEEEFFFFFF012ALTKEY1WWWWVVVVVV388ALTKEY2".IX2104.2
   000308         031200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000309         031300          "BBBCCCCCCC014EEEFFFFFFF014ALTKEY1WWWVVVVVVV386ALTKEY2".IX2104.2
   000310         031400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000311         031500          "BBCCCCCCCC016EEFFFFFFFF016ALTKEY1WWVVVVVVVV384ALTKEY2".IX2104.2
   000312         031600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000313         031700          "BCCCCCCCCC018EFFFFFFFFF018ALTKEY1WVVVVVVVVV382ALTKEY2".IX2104.2
   000314         031800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000315         031900          "CCCCCCCCCC020FFFFFFFFFF020ALTKEY1VVVVVVVVVV380ALTKEY2".IX2104.2
   000316         032000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000317         032100          "CCCCCCCCCD022FFFFFFFFFG022ALTKEY1VVVVVVVVVV380ALTKEY2".IX2104.2
   000318         032200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000319         032300          "CCCCCCCCDD024FFFFFFFFGG024ALTKEY1VVVVVVVVUU376ALTKEY2".IX2104.2
   000320         032400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000321         032500          "CCCCCCCDDD026FFFFFFFGGG026ALTKEY1VVVVVVVUUU374ALTKEY2".IX2104.2
   000322         032600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000323         032700          "CCCCCCDDDD028FFFFFFGGGG028ALTKEY1VVVVVVUUUU372ALTKEY2".IX2104.2
   000324         032800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000325         032900          "CCCCCDDDDD030FFFFFGGGGG030ALTKEY1VVVVVUUUUU370ALTKEY2".IX2104.2
   000326         033000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000327         033100          "CCCCDDDDDD032FFFFGGGGGG032ALTKEY1VVVVUUUUUU368ALTKEY2".IX2104.2
   000328         033200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000329         033300          "CCCDDDDDDD034FFFGGGGGGG034ALTKEY1VVVUUUUUUU366ALTKEY2".IX2104.2
   000330         033400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000331         033500          "CCDDDDDDDD036FFGGGGGGGG036ALTKEY1VVUUUUUUUU364ALTKEY2".IX2104.2
   000332         033600     05 FILLER PIC X(53) VALUE                                    IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033700          "CDDDDDDDDD038FGGGGGGGGG038ALTKEY1VUUUUUUUUU362ALTKEY2".IX2104.2
   000334         033800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000335         033900          "DDDDDDDDDD040GGGGGGGGGG040ALTKEY1UUUUUUUUUU360ALTKEY2".IX2104.2
   000336         034000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000337         034100          "DDDDDDDDDE042GGGGGGGGGH042ALTKEY1UUUUUUUUUU360ALTKEY2".IX2104.2
   000338         034200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000339         034300          "DDDDDDDDEE044GGGGGGGGHH044ALTKEY1UUUUUUUUTT356ALTKEY2".IX2104.2
   000340         034400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000341         034500          "DDDDDDDEEE046GGGGGGGHHH046ALTKEY1UUUUUUUTTT354ALTKEY2".IX2104.2
   000342         034600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000343         034700          "DDDDDDEEEE048GGGGGGHHHH048ALTKEY1UUUUUUTTTT352ALTKEY2".IX2104.2
   000344         034800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000345         034900          "DDDDDEEEEE050GGGGGHHHHH050ALTKEY1UUUUUTTTTT350ALTKEY2".IX2104.2
   000346         035000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000347         035100          "DDDDEEEEEE052GGGGHHHHHH052ALTKEY1UUUUTTTTTT348ALTKEY2".IX2104.2
   000348         035200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000349         035300          "DDDEEEEEEE054GGGHHHHHHH054ALTKEY1UUUTTTTTTT346ALTKEY2".IX2104.2
   000350         035400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000351         035500          "DDEEEEEEEE056GGHHHHHHHH056ALTKEY1UUTTTTTTTT344ALTKEY2".IX2104.2
   000352         035600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000353         035700          "DEEEEEEEEE058GHHHHHHHHH058ALTKEY1UTTTTTTTTT342ALTKEY2".IX2104.2
   000354         035800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000355         035900          "EEEEEEEEEE060HHHHHHHHHH060ALTKEY1TTTTTTTTTT340ALTKEY2".IX2104.2
   000356         036000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000357         036100          "EEEEEEEEEF062HHHHHHHHHI062ALTKEY1TTTTTTTTTT340ALTKEY2".IX2104.2
   000358         036200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000359         036300          "EEEEEEEEFF064HHHHHHHHII064ALTKEY1TTTTTTTTSS336ALTKEY2".IX2104.2
   000360         036400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000361         036500          "EEEEEEEFFF066HHHHHHHIII066ALTKEY1TTTTTTTSSS334ALTKEY2".IX2104.2
   000362         036600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000363         036700          "EEEEEEFFFF068HHHHHHIIII068ALTKEY1TTTTTTSSSS332ALTKEY2".IX2104.2
   000364         036800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000365         036900          "EEEEEFFFFF070HHHHHIIIII070ALTKEY1TTTTTSSSSS330ALTKEY2".IX2104.2
   000366         037000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000367         037100          "EEEEFFFFFF072HHHHIIIIII072ALTKEY1TTTTSSSSSS328ALTKEY2".IX2104.2
   000368         037200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000369         037300          "EEEFFFFFFF074HHHIIIIIII074ALTKEY1TTTSSSSSSS326ALTKEY2".IX2104.2
   000370         037400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000371         037500          "EEFFFFFFFF076HHIIIIIIII076ALTKEY1TTSSSSSSSS324ALTKEY2".IX2104.2
   000372         037600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000373         037700          "EFFFFFFFFF078HIIIIIIIII078ALTKEY1TSSSSSSSSS322ALTKEY2".IX2104.2
   000374         037800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000375         037900          "FFFFFFFFFF080IIIIIIIIII080ALTKEY1SSSSSSSSSS320ALTKEY2".IX2104.2
   000376         038000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000377         038100          "FFFFFFFFFG082IIIIIIIIIJ082ALTKEY1SSSSSSSSSS320ALTKEY2".IX2104.2
   000378         038200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000379         038300          "FFFFFFFFGG084IIIIIIIIJJ084ALTKEY1SSSSSSSSRR316ALTKEY2".IX2104.2
   000380         038400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000381         038500          "FFFFFFFGGG086IIIIIIIJJJ086ALTKEY1SSSSSSSRRR314ALTKEY2".IX2104.2
   000382         038600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000383         038700          "FFFFFFGGGG088IIIIIIJJJJ088ALTKEY1SSSSSSRRRR312ALTKEY2".IX2104.2
   000384         038800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000385         038900          "FFFFFGGGGG090IIIIIJJJJJ090ALTKEY1SSSSSRRRRR310ALTKEY2".IX2104.2
   000386         039000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000387         039100          "FFFFGGGGGG092IIIIJJJJJJ092ALTKEY1SSSSRRRRRR308ALTKEY2".IX2104.2
   000388         039200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000389         039300          "FFFGGGGGGG094IIIJJJJJJJ094ALTKEY1SSSRRRRRRR306ALTKEY2".IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000391         039500          "FFGGGGGGGG096IIJJJJJJJJ096ALTKEY1SSRRRRRRRR304ALTKEY2".IX2104.2
   000392         039600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000393         039700          "FGGGGGGGGG098IJJJJJJJJJ098ALTKEY1SRRRRRRRRR302ALTKEY2".IX2104.2
   000394         039800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000395         039900          "GGGGGGGGGG100JJJJJJJJJJ100ALTKEY1RRRRRRRRRR300ALTKEY2".IX2104.2
   000396         040000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000397         040100          "RRRRSSSSSS352VVVVWWWWWW352ALTKEY1GGGGFFFFFF048ALTKEY2".IX2104.2
   000398         040200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000399         040300          "RRRSSSSSSS354VVVWWWWWWW354ALTKEY1GGGFFFFFFF046ALTKEY2".IX2104.2
   000400         040400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000401         040500          "RRSSSSSSSS356VVWWWWWWWW356ALTKEY1GGFFFFFFFF044ALTKEY2".IX2104.2
   000402         040600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000403         040700          "RSSSSSSSSS358VWWWWWWWWW358ALTKEY1GFFFFFFFFF042ALTKEY2".IX2104.2
   000404         040800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000405         040900          "SSSSSSSSSS360WWWWWWWWWW360ALTKEY1FFFFFFFFFF040ALTKEY2".IX2104.2
   000406         041000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000407         041100          "SSSSSSSSST362WWWWWWWWWX362ALTKEY1FFFFFFFFFF040ALTKEY2".IX2104.2
   000408         041200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000409         041300          "SSSSSSSSTT364WWWWWWWWXX364ALTKEY1FFFFFFFFEE036ALTKEY2".IX2104.2
   000410         041400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000411         041500          "SSSSSSSTTT366WWWWWWWXXX366ALTKEY1FFFFFFFEEE034ALTKEY2".IX2104.2
   000412         041600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000413         041700          "SSSSSSTTTT368WWWWWWXXXX368ALTKEY1FFFFFFEEEE032ALTKEY2".IX2104.2
   000414         041800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000415         041900          "SSSSSTTTTT370WWWWWXXXXX370ALTKEY1FFFFFEEEEE030ALTKEY2".IX2104.2
   000416         042000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000417         042100          "SSSSTTTTTT372WWWWXXXXXX372ALTKEY1FFFFEEEEEE028ALTKEY2".IX2104.2
   000418         042200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000419         042300          "SSSTTTTTTT374WWWXXXXXXX374ALTKEY1FFFEEEEEEE026ALTKEY2".IX2104.2
   000420         042400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000421         042500          "SSTTTTTTTT376WWXXXXXXXX376ALTKEY1FFEEEEEEEE024ALTKEY2".IX2104.2
   000422         042600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000423         042700          "STTTTTTTTT378WXXXXXXXXX378ALTKEY1FEEEEEEEEE022ALTKEY2".IX2104.2
   000424         042800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000425         042900          "TTTTTTTTTT380XXXXXXXXXX380ALTKEY1EEEEEEEEEE020ALTKEY2".IX2104.2
   000426         043000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000427         043100          "TTTTTTTTTU382XXXXXXXXXY382ALTKEY1EEEEEEEEEE020ALTKEY2".IX2104.2
   000428         043200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000429         043300          "TTTTTTTTUU384XXXXXXXXYY384ALTKEY1EEEEEEEEDD016ALTKEY2".IX2104.2
   000430         043400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000431         043500          "TTTTTTTUUU386XXXXXXXYYY386ALTKEY1EEEEEEEDDD014ALTKEY2".IX2104.2
   000432         043600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000433         043700          "TTTTTTUUUU388XXXXXXYYYY388ALTKEY1EEEEEEDDDD012ALTKEY2".IX2104.2
   000434         043800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000435         043900          "TTTTTUUUUU390XXXXXYYYYY390ALTKEY1EEEEEDDDDD010ALTKEY2".IX2104.2
   000436         044000     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000437         044100          "TTTTUUUUUU392XXXXYYYYYY392ALTKEY1EEEEDDDDDD008ALTKEY2".IX2104.2
   000438         044200     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000439         044300          "TTTUUUUUUU394XXXYYYYYYY394ALTKEY1EEEDDDDDDD006ALTKEY2".IX2104.2
   000440         044400     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000441         044500          "TTUUUUUUUU396XXYYYYYYYY396ALTKEY1EEDDDDDDDD004ALTKEY2".IX2104.2
   000442         044600     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000443         044700          "TUUUUUUUUU398XYYYYYYYYY398ALTKEY1EDDDDDDDDD002ALTKEY2".IX2104.2
   000444         044800     05 FILLER PIC X(53) VALUE                                    IX2104.2
   000445         044900          "UUUUUUUUUU400YYYYYYYYYY400ALTKEY1DDDDDDDDDD000ALTKEY2".IX2104.2
   000446         045000 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX2104.2 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045100     05 KEY-VALUES                  OCCURS 75  TIMES.             IX2104.2
   000448         045200       10 RECKEY-VALUE           PICTURE X(13).                   IX2104.2
   000449         045300       10 ALTKEY1-VALUE          PICTURE X(20).                   IX2104.2
   000450         045400       10 ALTKEY2-VALUE          PICTURE X(20).                   IX2104.2
   000451         045500 01  INIT-FLAG                   PICTURE 9.                       IX2104.2
   000452         045600 01  HOLD-FILESTATUS-RECORD.                                      IX2104.2
   000453         045700     05 FILESTATUS               PICTURE XX  OCCURS 10 TIMES.     IX2104.2
   000454         045800 01  FILE-RECORD-INFORMATION-REC.                                 IX2104.2
   000455         045900     03 FILE-RECORD-INFO-SKELETON.                                IX2104.2
   000456         046000        05 FILLER                 PICTURE X(48)       VALUE       IX2104.2
   000457         046100             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2104.2
   000458         046200        05 FILLER                 PICTURE X(46)       VALUE       IX2104.2
   000459         046300             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2104.2
   000460         046400        05 FILLER                 PICTURE X(26)       VALUE       IX2104.2
   000461         046500             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2104.2
   000462         046600        05 FILLER                 PICTURE X(37)       VALUE       IX2104.2
   000463         046700             ",RECKEY=                             ".             IX2104.2
   000464         046800        05 FILLER                 PICTURE X(38)       VALUE       IX2104.2
   000465         046900             ",ALTKEY1=                             ".            IX2104.2
   000466         047000        05 FILLER                 PICTURE X(38)       VALUE       IX2104.2
   000467         047100             ",ALTKEY2=                             ".            IX2104.2
   000468         047200        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2104.2 IMP
   000469         047300     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2104.2
   000470         047400        05 FILE-RECORD-INFO-P1-120.                               IX2104.2
   000471         047500           07 FILLER              PIC X(5).                       IX2104.2
   000472         047600           07 XFILE-NAME           PIC X(6).                      IX2104.2
   000473         047700           07 FILLER              PIC X(8).                       IX2104.2
   000474         047800           07 XRECORD-NAME         PIC X(6).                      IX2104.2
   000475         047900           07 FILLER              PIC X(1).                       IX2104.2
   000476         048000           07 REELUNIT-NUMBER     PIC 9(1).                       IX2104.2
   000477         048100           07 FILLER              PIC X(7).                       IX2104.2
   000478         048200           07 XRECORD-NUMBER       PIC 9(6).                      IX2104.2
   000479         048300           07 FILLER              PIC X(6).                       IX2104.2
   000480         048400           07 UPDATE-NUMBER       PIC 9(2).                       IX2104.2
   000481         048500           07 FILLER              PIC X(5).                       IX2104.2
   000482         048600           07 ODO-NUMBER          PIC 9(4).                       IX2104.2
   000483         048700           07 FILLER              PIC X(5).                       IX2104.2
   000484         048800           07 XPROGRAM-NAME        PIC X(5).                      IX2104.2
   000485         048900           07 FILLER              PIC X(7).                       IX2104.2
   000486         049000           07 XRECORD-LENGTH       PIC 9(6).                      IX2104.2
   000487         049100           07 FILLER              PIC X(7).                       IX2104.2
   000488         049200           07 CHARS-OR-RECORDS    PIC X(2).                       IX2104.2
   000489         049300           07 FILLER              PIC X(1).                       IX2104.2
   000490         049400           07 XBLOCK-SIZE          PIC 9(4).                      IX2104.2
   000491         049500           07 FILLER              PIC X(6).                       IX2104.2
   000492         049600           07 RECORDS-IN-FILE     PIC 9(6).                       IX2104.2
   000493         049700           07 FILLER              PIC X(5).                       IX2104.2
   000494         049800           07 XFILE-ORGANIZATION   PIC X(2).                      IX2104.2
   000495         049900           07 FILLER              PIC X(6).                       IX2104.2
   000496         050000           07 XLABEL-TYPE          PIC X(1).                      IX2104.2
   000497         050100        05 FILE-RECORD-INFO-P121-240.                             IX2104.2
   000498         050200           07 FILLER              PIC X(8).                       IX2104.2
   000499         050300           07 XRECORD-KEY          PIC X(29).                     IX2104.2
   000500         050400           07 FILLER              PIC X(9).                       IX2104.2
   000501         050500           07 ALTERNATE-KEY1      PIC X(29).                      IX2104.2
   000502         050600           07 FILLER              PIC X(9).                       IX2104.2
   000503         050700           07 ALTERNATE-KEY2      PIC X(29).                      IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050800           07 FILLER              PIC X(7).                       IX2104.2
   000505         050900 01  TEST-RESULTS.                                                IX2104.2
   000506         051000     02 FILLER                   PIC X      VALUE SPACE.          IX2104.2 IMP
   000507         051100     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2104.2 IMP
   000508         051200     02 FILLER                   PIC X      VALUE SPACE.          IX2104.2 IMP
   000509         051300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2104.2 IMP
   000510         051400     02 FILLER                   PIC X      VALUE SPACE.          IX2104.2 IMP
   000511         051500     02  PAR-NAME.                                                IX2104.2
   000512         051600       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2104.2 IMP
   000513         051700       03  PARDOT-X              PIC X      VALUE SPACE.          IX2104.2 IMP
   000514         051800       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2104.2 IMP
   000515         051900     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2104.2 IMP
   000516         052000     02 RE-MARK                  PIC X(61).                       IX2104.2
   000517         052100 01  TEST-COMPUTED.                                               IX2104.2
   000518         052200     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2104.2 IMP
   000519         052300     02 FILLER                   PIC X(17)  VALUE                 IX2104.2
   000520         052400            "       COMPUTED=".                                   IX2104.2
   000521         052500     02 COMPUTED-X.                                               IX2104.2
   000522         052600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2104.2 IMP
   000523         052700     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2104.2 522
   000524         052800                                 PIC -9(9).9(9).                  IX2104.2
   000525         052900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2104.2 522
   000526         053000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2104.2 522
   000527         053100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2104.2 522
   000528         053200     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2104.2 522
   000529         053300         04 COMPUTED-18V0                    PIC -9(18).          IX2104.2
   000530         053400         04 FILLER                           PIC X.               IX2104.2
   000531         053500     03 FILLER PIC X(50) VALUE SPACE.                             IX2104.2 IMP
   000532         053600 01  TEST-CORRECT.                                                IX2104.2
   000533         053700     02 FILLER PIC X(30) VALUE SPACE.                             IX2104.2 IMP
   000534         053800     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2104.2
   000535         053900     02 CORRECT-X.                                                IX2104.2
   000536         054000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2104.2 IMP
   000537         054100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2104.2 536
   000538         054200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2104.2 536
   000539         054300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2104.2 536
   000540         054400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2104.2 536
   000541         054500     03      CR-18V0 REDEFINES CORRECT-A.                         IX2104.2 536
   000542         054600         04 CORRECT-18V0                     PIC -9(18).          IX2104.2
   000543         054700         04 FILLER                           PIC X.               IX2104.2
   000544         054800     03 FILLER PIC X(2) VALUE SPACE.                              IX2104.2 IMP
   000545         054900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2104.2 IMP
   000546         055000 01  CCVS-C-1.                                                    IX2104.2
   000547         055100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2104.2
   000548         055200-    "SS  PARAGRAPH-NAME                                          IX2104.2
   000549         055300-    "       REMARKS".                                            IX2104.2
   000550         055400     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2104.2 IMP
   000551         055500 01  CCVS-C-2.                                                    IX2104.2
   000552         055600     02 FILLER                     PIC X        VALUE SPACE.      IX2104.2 IMP
   000553         055700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2104.2
   000554         055800     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2104.2 IMP
   000555         055900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2104.2
   000556         056000     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2104.2 IMP
   000557         056100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2104.2 IMP
   000558         056200 01  REC-CT                        PIC 99       VALUE ZERO.       IX2104.2 IMP
   000559         056300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2104.2 IMP
   000560         056400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2104.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2104.2 IMP
   000562         056600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2104.2 IMP
   000563         056700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2104.2 IMP
   000564         056800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2104.2 IMP
   000565         056900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2104.2 IMP
   000566         057000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2104.2 IMP
   000567         057100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2104.2 IMP
   000568         057200 01  CCVS-H-1.                                                    IX2104.2
   000569         057300     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2104.2 IMP
   000570         057400     02  FILLER                    PIC X(42)    VALUE             IX2104.2
   000571         057500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2104.2
   000572         057600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2104.2 IMP
   000573         057700 01  CCVS-H-2A.                                                   IX2104.2
   000574         057800   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2104.2 IMP
   000575         057900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2104.2
   000576         058000   02  FILLER                        PIC XXXX   VALUE             IX2104.2
   000577         058100     "4.2 ".                                                      IX2104.2
   000578         058200   02  FILLER                        PIC X(28)  VALUE             IX2104.2
   000579         058300            " COPY - NOT FOR DISTRIBUTION".                       IX2104.2
   000580         058400   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2104.2 IMP
   000581         058500                                                                  IX2104.2
   000582         058600 01  CCVS-H-2B.                                                   IX2104.2
   000583         058700   02  FILLER                        PIC X(15)  VALUE             IX2104.2
   000584         058800            "TEST RESULT OF ".                                    IX2104.2
   000585         058900   02  TEST-ID                       PIC X(9).                    IX2104.2
   000586         059000   02  FILLER                        PIC X(4)   VALUE             IX2104.2
   000587         059100            " IN ".                                               IX2104.2
   000588         059200   02  FILLER                        PIC X(12)  VALUE             IX2104.2
   000589         059300     " HIGH       ".                                              IX2104.2
   000590         059400   02  FILLER                        PIC X(22)  VALUE             IX2104.2
   000591         059500            " LEVEL VALIDATION FOR ".                             IX2104.2
   000592         059600   02  FILLER                        PIC X(58)  VALUE             IX2104.2
   000593         059700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2104.2
   000594         059800 01  CCVS-H-3.                                                    IX2104.2
   000595         059900     02  FILLER                      PIC X(34)  VALUE             IX2104.2
   000596         060000            " FOR OFFICIAL USE ONLY    ".                         IX2104.2
   000597         060100     02  FILLER                      PIC X(58)  VALUE             IX2104.2
   000598         060200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2104.2
   000599         060300     02  FILLER                      PIC X(28)  VALUE             IX2104.2
   000600         060400            "  COPYRIGHT   1985 ".                                IX2104.2
   000601         060500 01  CCVS-E-1.                                                    IX2104.2
   000602         060600     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2104.2 IMP
   000603         060700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2104.2
   000604         060800     02 ID-AGAIN                     PIC X(9).                    IX2104.2
   000605         060900     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2104.2 IMP
   000606         061000 01  CCVS-E-2.                                                    IX2104.2
   000607         061100     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2104.2 IMP
   000608         061200     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2104.2 IMP
   000609         061300     02 CCVS-E-2-2.                                               IX2104.2
   000610         061400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2104.2 IMP
   000611         061500         03 FILLER                   PIC X      VALUE SPACE.      IX2104.2 IMP
   000612         061600         03 ENDER-DESC               PIC X(44)  VALUE             IX2104.2
   000613         061700            "ERRORS ENCOUNTERED".                                 IX2104.2
   000614         061800 01  CCVS-E-3.                                                    IX2104.2
   000615         061900     02  FILLER                      PIC X(22)  VALUE             IX2104.2
   000616         062000            " FOR OFFICIAL USE ONLY".                             IX2104.2
   000617         062100     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2104.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062200     02  FILLER                      PIC X(58)  VALUE             IX2104.2
   000619         062300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2104.2
   000620         062400     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2104.2 IMP
   000621         062500     02 FILLER                       PIC X(15)  VALUE             IX2104.2
   000622         062600             " COPYRIGHT 1985".                                   IX2104.2
   000623         062700 01  CCVS-E-4.                                                    IX2104.2
   000624         062800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2104.2 IMP
   000625         062900     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2104.2
   000626         063000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2104.2 IMP
   000627         063100     02 FILLER                       PIC X(40)  VALUE             IX2104.2
   000628         063200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2104.2
   000629         063300 01  XXINFO.                                                      IX2104.2
   000630         063400     02 FILLER                       PIC X(19)  VALUE             IX2104.2
   000631         063500            "*** INFORMATION ***".                                IX2104.2
   000632         063600     02 INFO-TEXT.                                                IX2104.2
   000633         063700       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2104.2 IMP
   000634         063800       04 XXCOMPUTED                 PIC X(20).                   IX2104.2
   000635         063900       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2104.2 IMP
   000636         064000       04 XXCORRECT                  PIC X(20).                   IX2104.2
   000637         064100     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2104.2
   000638         064200 01  HYPHEN-LINE.                                                 IX2104.2
   000639         064300     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2104.2 IMP
   000640         064400     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2104.2
   000641         064500-    "*****************************************".                 IX2104.2
   000642         064600     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2104.2
   000643         064700-    "******************************".                            IX2104.2
   000644         064800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2104.2
   000645         064900     "IX210A".                                                    IX2104.2
   000646         065000 PROCEDURE DIVISION.                                              IX2104.2
   000647         065100 CCVS1 SECTION.                                                   IX2104.2
   000648         065200 OPEN-FILES.                                                      IX2104.2
   000649         065300     OPEN I-O RAW-DATA.                                           IX2104.2 205
   000650         065400     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2104.2 644 208
   000651         065500     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2104.2 205 657
   000652         065600     MOVE "ABORTED " TO C-ABORT.                                  IX2104.2 219
   000653         065700     ADD 1 TO C-NO-OF-TESTS.                                      IX2104.2 211
   000654         065800     ACCEPT C-DATE  FROM DATE.                                    IX2104.2 209
   000655         065900     ACCEPT C-TIME  FROM TIME.                                    IX2104.2 210
   000656         066000     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2104.2 207 657
   000657         066100 END-E-1.                                                         IX2104.2
   000658         066200     CLOSE RAW-DATA.                                              IX2104.2 205
   000659         066300     OPEN    OUTPUT PRINT-FILE.                                   IX2104.2 220
   000660         066400     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2104.2 644 585 644 604
   000661         066500     MOVE    SPACE TO TEST-RESULTS.                               IX2104.2 IMP 505
   000662         066600     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2104.2 706 711
   000663         066700     MOVE    ZERO TO REC-SKL-SUB.                                 IX2104.2 IMP 557
   000664         066800     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2104.2 665
   000665         066900 CCVS-INIT-FILE.                                                  IX2104.2
   000666         067000     ADD     1 TO REC-SKL-SUB.                                    IX2104.2 557
   000667         067100     MOVE    FILE-RECORD-INFO-SKELETON                            IX2104.2 455
   000668         067200          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2104.2 469 557
   000669         067300 CCVS-INIT-EXIT.                                                  IX2104.2
   000670         067400     GO TO CCVS1-EXIT.                                            IX2104.2 793
   000671         067500 CLOSE-FILES.                                                     IX2104.2
   000672         067600     OPEN I-O RAW-DATA.                                           IX2104.2 205
   000673         067700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2104.2 644 208
   000674         067800     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2104.2 205 682
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675         067900     MOVE "OK.     " TO C-ABORT.                                  IX2104.2 219
   000676         068000     MOVE PASS-COUNTER TO C-OK.                                   IX2104.2 562 212
   000677         068100     MOVE ERROR-HOLD   TO C-ALL.                                  IX2104.2 564 213
   000678         068200     MOVE ERROR-COUNTER TO C-FAIL.                                IX2104.2 560 214
   000679         068300     MOVE DELETE-COUNTER TO C-DELETED.                            IX2104.2 559 215
   000680         068400     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2104.2 561 216
   000681         068500     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2104.2 207 682
   000682         068600 END-E-2.                                                         IX2104.2
   000683         068700     CLOSE RAW-DATA.                                              IX2104.2 205
   000684         068800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2104.2 715 736 220
   000685         068900 TERMINATE-CCVS.                                                  IX2104.2
   000686         069000     EXIT PROGRAM.                                                IX2104.2
   000687         069100 TERMINATE-CALL.                                                  IX2104.2
   000688         069200     STOP     RUN.                                                IX2104.2
   000689         069300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2104.2 509 561
   000690         069400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2104.2 509 562
   000691         069500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2104.2 509 560
   000692         069600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2104.2 509 559
   000693         069700     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2104.2 516
   000694         069800 PRINT-DETAIL.                                                    IX2104.2
   000695         069900     IF REC-CT NOT EQUAL TO ZERO                                  IX2104.2 558 IMP
   000696      1  070000             MOVE "." TO PARDOT-X                                 IX2104.2 513
   000697      1  070100             MOVE REC-CT TO DOTVALUE.                             IX2104.2 558 514
   000698         070200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2104.2 505 221 748
   000699         070300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2104.2 509 748
   000700      1  070400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2104.2 769 783
   000701      1  070500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2104.2 784 792
   000702         070600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2104.2 IMP 509 IMP 521
   000703         070700     MOVE SPACE TO CORRECT-X.                                     IX2104.2 IMP 535
   000704         070800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2104.2 558 IMP IMP 511
   000705         070900     MOVE     SPACE TO RE-MARK.                                   IX2104.2 IMP 516
   000706         071000 HEAD-ROUTINE.                                                    IX2104.2
   000707         071100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2104.2 568 222 748
   000708         071200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2104.2 573 222 748
   000709         071300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2104.2 582 222 748
   000710         071400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2104.2 594 222 748
   000711         071500 COLUMN-NAMES-ROUTINE.                                            IX2104.2
   000712         071600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2104.2 546 222 748
   000713         071700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2104.2 551 222 748
   000714         071800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2104.2 638 222 748
   000715         071900 END-ROUTINE.                                                     IX2104.2
   000716         072000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2104.2 638 222 748
   000717         072100 END-RTN-EXIT.                                                    IX2104.2
   000718         072200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2104.2 601 222 748
   000719         072300 END-ROUTINE-1.                                                   IX2104.2
   000720         072400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2104.2 560 564 561
   000721         072500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2104.2 564 559 564
   000722         072600      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2104.2 562 564
   000723         072700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2104.2
   000724         072800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2104.2 562 624
   000725         072900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2104.2 564 626
   000726         073000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2104.2 623 609
   000727         073100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2104.2 606 222 748
   000728         073200  END-ROUTINE-12.                                                 IX2104.2
   000729         073300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2104.2 612
   000730         073400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2104.2 560 IMP
   000731      1  073500         MOVE "NO " TO ERROR-TOTAL                                IX2104.2 610
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073600         ELSE                                                     IX2104.2
   000733      1  073700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2104.2 560 610
   000734         073800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2104.2 606 222
   000735         073900     PERFORM WRITE-LINE.                                          IX2104.2 748
   000736         074000 END-ROUTINE-13.                                                  IX2104.2
   000737         074100     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2104.2 559 IMP
   000738      1  074200         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2104.2 610
   000739      1  074300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2104.2 559 610
   000740         074400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2104.2 612
   000741         074500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2104.2 606 222 748
   000742         074600      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2104.2 561 IMP
   000743      1  074700          MOVE "NO " TO ERROR-TOTAL                               IX2104.2 610
   000744      1  074800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2104.2 561 610
   000745         074900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2104.2 612
   000746         075000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2104.2 606 222 748
   000747         075100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2104.2 614 222 748
   000748         075200 WRITE-LINE.                                                      IX2104.2
   000749         075300     ADD 1 TO RECORD-COUNT.                                       IX2104.2 566
   000750         075400     IF RECORD-COUNT GREATER 42                                   IX2104.2 566
   000751      1  075500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2104.2 222 565
   000752      1  075600         MOVE SPACE TO DUMMY-RECORD                               IX2104.2 IMP 222
   000753      1  075700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2104.2 222
   000754      1  075800         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2104.2 568 222 764
   000755      1  075900         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2104.2 573 222 764
   000756      1  076000         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2104.2 582 222 764
   000757      1  076100         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2104.2 594 222 764
   000758      1  076200         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2104.2 546 222 764
   000759      1  076300         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2104.2 551 222 764
   000760      1  076400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2104.2 638 222 764
   000761      1  076500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2104.2 565 222
   000762      1  076600         MOVE ZERO TO RECORD-COUNT.                               IX2104.2 IMP 566
   000763         076700     PERFORM WRT-LN.                                              IX2104.2 764
   000764         076800 WRT-LN.                                                          IX2104.2
   000765         076900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2104.2 222
   000766         077000     MOVE SPACE TO DUMMY-RECORD.                                  IX2104.2 IMP 222
   000767         077100 BLANK-LINE-PRINT.                                                IX2104.2
   000768         077200     PERFORM WRT-LN.                                              IX2104.2 764
   000769         077300 FAIL-ROUTINE.                                                    IX2104.2
   000770         077400     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2104.2 521 IMP
   000771      1  077500            GO TO   FAIL-ROUTINE-WRITE.                           IX2104.2 778
   000772         077600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2104.2 535 IMP 778
   000773         077700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2104.2 567 637
   000774         077800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2104.2 632
   000775         077900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2104.2 629 222 748
   000776         078000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2104.2 IMP 637
   000777         078100     GO TO  FAIL-ROUTINE-EX.                                      IX2104.2 783
   000778         078200 FAIL-ROUTINE-WRITE.                                              IX2104.2
   000779         078300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2104.2 517 221 748
   000780         078400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2104.2 567 545
   000781         078500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2104.2 532 221 748
   000782         078600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2104.2 IMP 545
   000783         078700 FAIL-ROUTINE-EX. EXIT.                                           IX2104.2
   000784         078800 BAIL-OUT.                                                        IX2104.2
   000785         078900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2104.2 522 IMP 787
   000786         079000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2104.2 536 IMP 792
   000787         079100 BAIL-OUT-WRITE.                                                  IX2104.2
   000788         079200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2104.2 536 636 522 634
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2104.2 567 637
   000790         079400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2104.2 629 222 748
   000791         079500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2104.2 IMP 637
   000792         079600 BAIL-OUT-EX. EXIT.                                               IX2104.2
   000793         079700 CCVS1-EXIT.                                                      IX2104.2
   000794         079800     EXIT.                                                        IX2104.2
   000795         079900 SECT-0001-IX210A SECTION.                                        IX2104.2
   000796         080000 WRITE-INT-GF.                                                    IX2104.2
   000797         080100     OPEN    OUTPUT IX-FS1.                                       IX2104.2 223
   000798         080200     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX2104.2 472
   000799         080300     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2104.2 474
   000800         080400     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2104.2 IMP 478
   000801         080500     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2104.2 488
   000802         080600     MOVE    CCVS-PGM-ID TO  XPROGRAM-NAME       (1).             IX2104.2 644 484
   000803         080700     MOVE    240      TO  XRECORD-LENGTH      (1).                IX2104.2 486
   000804         080800     MOVE    001      TO  XBLOCK-SIZE         (1).                IX2104.2 490
   000805         080900     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2104.2 494
   000806         081000     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2104.2 496
   000807         081100     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2104.2 492
   000808         081200     MOVE    "CREATE-FILE-FS1" TO FEATURE.                        IX2104.2 507
   000809         081300     MOVE    "WRITE-TEST-GF-1"  TO PAR-NAME.                      IX2104.2 511
   000810         081400     MOVE    ZERO TO KEYSUB.                                      IX2104.2 IMP 289
   000811         081500     MOVE    ZERO TO INVKEY-COUNTER.                              IX2104.2 IMP 290
   000812         081600 WRITE-INIT-GF-01.                                                IX2104.2
   000813         081700     PERFORM WRITE-TEST-GF-01  50 TIMES.                          IX2104.2 817
   000814         081800     PERFORM WRITE-TEST-GF-02  125 TIMES.                         IX2104.2 830
   000815         081900     PERFORM WRITE-TEST-GF-01  25 TIMES.                          IX2104.2 817
   000816         082000     GO TO   WRITE-TEST-GF-1.                                     IX2104.2 842
   000817         082100 WRITE-TEST-GF-01.                                                IX2104.2
   000818         082200     ADD     001  TO XRECORD-NUMBER (1).                          IX2104.2 478
   000819         082300     ADD     001  TO  KEYSUB.                                     IX2104.2 289
   000820         082400     MOVE    RECKEY-VALUE (KEYSUB) TO FS1-RECKEY-1-13.            IX2104.2 448 289 266
   000821         082500     MOVE    ALTKEY1-VALUE (KEYSUB) TO FS1-ALTKEY1-1-20.          IX2104.2 449 289 271
   000822         082600     MOVE    ALTKEY2-VALUE (KEYSUB) TO FS1-ALTKEY2-1-20.          IX2104.2 450 289 279
   000823         082700     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2104.2 265 499
   000824         082800     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2104.2 270 501
   000825         082900     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2104.2 278 503
   000826         083000     MOVE    FILE-RECORD-INFO (1)  TO IX-FS1R1-F-G-240.           IX2104.2 469 227
   000827         083100     WRITE   IX-FS1R1-F-G-240                                     IX2104.2 227
   000828      1  083200                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2104.2 290
   000829         083300     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2104.2 288
   000830         083400 WRITE-TEST-GF-02.                                                IX2104.2
   000831         083500     ADD     002  TO FS1-RECKEY-11-13.                            IX2104.2 268
   000832         083600     ADD     002 TO FS1-ALTKEY1-11-13.                            IX2104.2 275
   000833         083700     SUBTRACT  002 FROM FS1-ALTKEY2-11-13.                        IX2104.2 283
   000834         083800     ADD     001  TO XRECORD-NUMBER (1).                          IX2104.2 478
   000835         083900     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2104.2 265 499
   000836         084000     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2104.2 270 501
   000837         084100     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2104.2 278 503
   000838         084200     MOVE    FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.            IX2104.2 469 227
   000839         084300     WRITE   IX-FS1R1-F-G-240                                     IX2104.2 227
   000840      1  084400                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2104.2 290
   000841         084500     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2104.2 288
   000842         084600 WRITE-TEST-GF-1.                                                 IX2104.2
   000843         084700     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2104.2 290 288
   000844         084800             GIVING RECORDS-WRITTEN.                              IX2104.2 291
   000845         084900     MOVE    200  TO CORRECT-18V0.                                IX2104.2 542
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         085000     MOVE    RECORDS-WRITTEN TO COMPUTED-18V0.                    IX2104.2 291 529
   000847         085100     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2104.2 291
   000848      1  085200             PERFORM  PASS                                        IX2104.2 690
   000849         085300             ELSE                                                 IX2104.2
   000850      1  085400             PERFORM FAIL.                                        IX2104.2 691
   000851         085500     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2104.2 516
   000852         085600     GO TO   WRITE-TEST-GF-END.                                   IX2104.2 855
   000853         085700 WRITE-DELETE-GF-1.                                               IX2104.2
   000854         085800     PERFORM DE-LETE.                                             IX2104.2 692
   000855         085900 WRITE-TEST-GF-END.                                               IX2104.2
   000856         086000     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   000857         086100     CLOSE   IX-FS1.                                              IX2104.2 223
   000858         086200 READ-INIT-F1.                                                    IX2104.2
   000859         086300     OPEN    INPUT  IX-FS1.                                       IX2104.2 223
   000860         086400     MOVE    "READ FILE IX-FS1" TO FEATURE.                       IX2104.2 507
   000861         086500     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2104.2 IMP 288
   000862         086600     MOVE    02   TO RECKEY-NUM.                                  IX2104.2 292
   000863         086700     MOVE    002 TO ALTKEY1-NUM.                                  IX2104.2 293
   000864         086800 READ-TEST-F1-R1.                                                 IX2104.2
   000865         086900     READ    IX-FS1  AT END  GO TO READ-TEST-F1.                  IX2104.2 223 879
   000866         087000     MOVE    IX-REC-KEY-AREA TO WRK-FS1-RECKEY.                   IX2104.2 231 265
   000867         087100     MOVE    IX-ALT-KEY1-AREA TO WRK-FS1-ALTKEY1.                 IX2104.2 242 270
   000868         087200     IF      FS1-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2104.2 268 292
   000869         087300             AND FS1-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2104.2 275 293
   000870      1  087400             NEXT SENTENCE                                        IX2104.2
   000871         087500             ELSE                                                 IX2104.2
   000872      1  087600             PERFORM  READ-FAIL-F1.                               IX2104.2 887
   000873         087700     IF      EXCUT-COUNTER-06V00 GREATER THAN 200                 IX2104.2 288
   000874      1  087800             GO TO READ-TEST-F1.                                  IX2104.2 879
   000875         087900     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2104.2 288
   000876         088000     ADD     002  TO RECKEY-NUM                                   IX2104.2 292
   000877         088100     ADD     002  TO ALTKEY1-NUM.                                 IX2104.2 293
   000878         088200     GO TO   READ-TEST-F1-R1.                                     IX2104.2 864
   000879         088300 READ-TEST-F1.                                                    IX2104.2
   000880         088400     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2104.2 288
   000881      1  088500             PERFORM PASS ELSE                                    IX2104.2 690
   000882      1  088600             PERFORM FAIL.                                        IX2104.2 691
   000883         088700     MOVE    EXCUT-COUNTER-06V00 TO  COMPUTED-18V0.               IX2104.2 288 529
   000884         088800     MOVE    200  TO  CORRECT-18V0.                               IX2104.2 542
   000885         088900     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2104.2 516
   000886         089000     GO TO   READ-EXIT-F1.                                        IX2104.2 892
   000887         089100 READ-FAIL-F1.                                                    IX2104.2
   000888         089200     PERFORM FAIL.                                                IX2104.2 691
   000889         089300     MOVE    FS1-RECKEY-11-13  TO COMPUTED-18V0.                  IX2104.2 268 529
   000890         089400     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2104.2 292 542
   000891         089500     MOVE "NUM EMBEDDED IN RECKEY; IX-41 & IX-28"  TO RE-MARK.    IX2104.2 516
   000892         089600 READ-EXIT-F1.                                                    IX2104.2
   000893         089700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   000894         089800     CLOSE   IX-FS1.                                              IX2104.2 223
   000895         089900 START-INIT.                                                      IX2104.2
   000896         090000     OPEN    INPUT  IX-FS1.                                       IX2104.2 223
   000897         090100     MOVE    "START GT RECKEY " TO FEATURE.                       IX2104.2 507
   000898         090200     MOVE    "START-TEST-GF-01" TO PAR-NAME.                      IX2104.2 511
   000899         090300     MOVE    SPACE TO HOLD-FILESTATUS-RECORD.                     IX2104.2 IMP 452
   000900         090400*                                                                 IX2104.2
   000901         090500* THE "START -- GREATER THAN--" IS CHECKED FOR PROPER POSITIONING IX2104.2
   000902         090600* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090700* START-TEST-GF  USE ONLY THE PRIME RECORD KEY FOR ESTABLISHING   IX2104.2
   000904         090800* THE CURRENT RECORD POINTER FOR THE FILE.  THE FOLLOWING IS A    IX2104.2
   000905         090900* SUMMARY OF THE TEST CONDITIONS AND THE EXPECTED ACTION TO BE    IX2104.2
   000906         091000* TAKEN FOR THE  TESTS.                                           IX2104.2
   000907         091100*                                                                 IX2104.2
   000908         091200*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2104.2
   000909         091300*                                                                 IX2104.2
   000910         091400*   START-TEST-GF-01 - EQUAL A RECORD IN FILE / RECORD FOUND      IX2104.2
   000911         091500*   START-TEST-GF-02 - BETWEEN 2 KEY VALUES / RECORD FOUND        IX2104.2
   000912         091600*   START-TEST-GF-03 - LESS THAN FIRST FILE REC. / REC. FOUND     IX2104.2
   000913         091700*   START-TEST-GF-04 - GREATER THAN LAST FILE RECORD / INVALID KEYIX2104.2
   000914         091800*   START-TEST-GF-05 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2104.2
   000915         091900*   START-TEST-GF-06 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2104.2
   000916         092000*   START-TEST-GF-07 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2104.2
   000917         092100*   START-TEST-GF-08 - UNEQUAL SIZE OPERANDS (UNEQUAL) / REC FOUNDIX2104.2
   000918         092200*   START-TEST-GF-09 - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEY IX2104.2
   000919         092300*                                                                 IX2104.2
   000920         092400*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2104.2
   000921         092500*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2104.2
   000922         092600*  IF AN INVALID KEY IS EXPECTED FROM THE TEST, THE KEYS          IX2104.2
   000923         092700*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2104.2
   000924         092800*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2104.2
   000925         092900*  MATCH RECORDS IN THE FILE.  IF KEY MATCH IS EXPECTED FROM      IX2104.2
   000926         093000*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2104.2
   000927         093100*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2104.2
   000928         093200*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2104.2
   000929         093300*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2104.2
   000930         093400*                                                                 IX2104.2
   000931         093500 START-INIT-GF-01.                                                IX2104.2
   000932         093600     MOVE    "START-TEST-GF-01" TO PAR-NAME.                      IX2104.2 511
   000933         093700     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   000934         093800     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   000935      1  093900             MOVE   "**"  TO FILESTATUS (1)                       IX2104.2 453
   000936      1  094000             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
   000937      1  094100             GO TO START-DELETE-GF-01.                            IX2104.2 972
   000938         094200     MOVE    "CCCCCCCCCD022" TO FS1-RECKEY-1-13.                  IX2104.2 266
   000939         094300     MOVE    "EEEEEFFFFF022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   000940         094400     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   000941         094500     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   000942         094600     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   000943         094700     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   000944         094800 START-TEST-GF-01.                                                IX2104.2
   000945         094900*                                                                 IX2104.2
   000946         095000*  START-TEST-GF-01  - THE START SHOULD FIND A RECORD IN THE FILE IX2104.2
   000947         095100*                    WHICH HAS A RECORD KEY VALUE OF              IX2104.2
   000948         095200*                    CCCCCCCCDD024  (RECORD NUMBER 12).           IX2104.2
   000949         095300*                                                                 IX2104.2
   000950         095400     START   IX-FS1                                               IX2104.2 223
   000951         095500                    KEY IS GREATER THAN IX-FS1-KEY                IX2104.2 232
   000952      1  095600          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (1)         IX2104.2 287 453
   000953      1  095700                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   000954      1  095800                        GO TO START-FAIL-GF-01.                   IX2104.2 967
   000955         095900     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2104.2 287 453
   000956         096000     READ    IX-FS1  AT END                                       IX2104.2 223
   000957      1  096100                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   000958      1  096200                     GO TO START-FAIL-GF-01.                      IX2104.2 967
   000959         096300     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960         096400     IF      XRECORD-NUMBER (1)  EQUAL TO 12                      IX2104.2 478
   000961      1  096500             PERFORM PASS                                         IX2104.2 690
   000962      1  096600             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   000963      1  096700             GO TO START-EXIT-GF-01.                              IX2104.2 974
   000964         096800     MOVE    12  TO RECNO.                                        IX2104.2 286
   000965         096900     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
   000966         097000     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   000967         097100 START-FAIL-GF-01.                                                IX2104.2
   000968         097200     PERFORM FAIL.                                                IX2104.2 691
   000969         097300     MOVE    12  TO CORRECT-18V0.                                 IX2104.2 542
   000970         097400     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   000971         097500     GO TO   START-EXIT-GF-01.                                    IX2104.2 974
   000972         097600 START-DELETE-GF-01.                                              IX2104.2
   000973         097700     PERFORM DE-LETE.                                             IX2104.2 692
   000974         097800 START-EXIT-GF-01.                                                IX2104.2
   000975         097900     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   000976         098000 START-INIT-GF-02.                                                IX2104.2
   000977         098100     MOVE    "START GT RECKEY " TO FEATURE.                       IX2104.2 507
   000978         098200     MOVE    "START-TEST-GF-02" TO PAR-NAME.                      IX2104.2 511
   000979         098300     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   000980         098400     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   000981      1  098500             MOVE   "**"  TO FILESTATUS (2)                       IX2104.2 453
   000982      1  098600             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
   000983      1  098700             GO TO START-DELETE-GF-02.                            IX2104.2 1023
   000984         098800     MOVE    "EEEEEEEFFF067" TO FS1-RECKEY-1-13.                  IX2104.2 266
   000985         098900     MOVE    "HHHHHHHHII064ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   000986         099000     MOVE    "TTTTTTTTSS336ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   000987         099100     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   000988         099200     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   000989         099300     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   000990         099400 START-TEST-GF-02.                                                IX2104.2
   000991         099500*                                                                 IX2104.2
   000992         099600*  START-TEST-GF-02 - THE START SHOULD FIND A RECORD IN THE FILE  IX2104.2
   000993         099700*                    WHICH HAS A RECORD KEY VALUE OF EEEEEEFFFF068IX2104.2
   000994         099800*                    (RECORD NUMBER 34).  THIS KEY VALUE IS       IX2104.2
   000995         099900*                    SEQUENTIALLY A LOGICAL RECORD HIGHER THAN    IX2104.2
   000996         100000*                    THE RECORD CONTAINING THE KEY VALUE  LOADED  IX2104.2
   000997         100100*                    INTO THE RECORD KEY BEFORE THE START WAS     IX2104.2
   000998         100200*                    EXECUTED.  THE KEY VALUE INITIALLY LOADED    IX2104.2
   000999         100300*                    WAS A VALUE BETWEEN TWO EXISTING KEY VALUES. IX2104.2
   001000         100400*                                                                 IX2104.2
   001001         100500     START   IX-FS1                                               IX2104.2 223
   001002         100600        KEY GREATER THAN OR EQUAL TO IX-FS1-KEY                   IX2104.2 232
   001003      1  100700          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (2)         IX2104.2 287 453
   001004      1  100800                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001005      1  100900                        GO TO START-FAIL-GF-02.                   IX2104.2 1018
   001006         101000     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2104.2 287 453
   001007         101100     READ    IX-FS1  AT END                                       IX2104.2 223
   001008      1  101200                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001009      1  101300                     GO TO START-FAIL-GF-02.                      IX2104.2 1018
   001010         101400     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
   001011         101500     IF      XRECORD-NUMBER (1) EQUAL TO 34                       IX2104.2 478
   001012      1  101600             PERFORM PASS                                         IX2104.2 690
   001013      1  101700             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   001014      1  101800             GO TO START-EXIT-GF-02.                              IX2104.2 1025
   001015         101900     MOVE    34  TO RECNO.                                        IX2104.2 286
   001016         102000     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001017         102100     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   001018         102200 START-FAIL-GF-02.                                                IX2104.2
   001019         102300     PERFORM FAIL.                                                IX2104.2 691
   001020         102400     MOVE    34   TO CORRECT-18V0.                                IX2104.2 542
   001021         102500     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001022         102600     GO TO   START-EXIT-GF-02.                                    IX2104.2 1025
   001023         102700 START-DELETE-GF-02.                                              IX2104.2
   001024         102800     PERFORM DE-LETE.                                             IX2104.2 692
   001025         102900 START-EXIT-GF-02.                                                IX2104.2
   001026         103000     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001027         103100 START-INIT-GF-03.                                                IX2104.2
   001028         103200     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001029         103300     MOVE    "START GT RECKEY " TO FEATURE.                       IX2104.2 507
   001030         103400     MOVE    "START-TEST-GF-03" TO PAR-NAME.                      IX2104.2 511
   001031         103500     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001032      1  103600             MOVE   "**"  TO FILESTATUS (3)                       IX2104.2 453
   001033      1  103700             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
   001034      1  103800             GO TO START-DELETE-GF-03.                            IX2104.2 1074
   001035         103900     MOVE    "BBBBBBBBBC001" TO FS1-RECKEY-1-13.                  IX2104.2 266
   001036         104000     MOVE    "EEEEEEEEEF003ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001037         104100     MOVE    "WWWWWWWWWV399ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001038         104200     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   001039         104300     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   001040         104400     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   001041         104500 START-TEST-GF-03.                                                IX2104.2
   001042         104600*                                                                 IX2104.2
   001043         104700*  START-TEST-GF-03  - THE START STATEMENT SHOULD FIND A          IX2104.2
   001044         104800*                    RECORD IN THE FILE WHICH HAS A RECORD KEY    IX2104.2
   001045         104900*                    VALUE OF "BBBBBBBBBC002" (RECORD NUMBER 1).  IX2104.2
   001046         105000*                    THE KEY WAS LOADED BEFORE THE START IS       IX2104.2
   001047         105100*                    EXECUTED WITH THE VALUE THAT IS SEQUENTIALLY IX2104.2
   001048         105200*                    LOWER THAN ANY CURRENTLY EXISTING KEY IN     IX2104.2
   001049         105300*                    THE FILE.                                    IX2104.2
   001050         105400*                                                                 IX2104.2
   001051         105500     START   IX-FS1                                               IX2104.2 223
   001052         105600                    KEY IS GREATER THAN IX-FS1-KEY                IX2104.2 232
   001053      1  105700          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (3)         IX2104.2 287 453
   001054      1  105800                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001055      1  105900                        GO TO START-FAIL-GF-03                    IX2104.2 1069
   001056         106000            END-START.                                            IX2104.2
   001057         106100     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2104.2 287 453
   001058         106200     READ    IX-FS1  AT END                                       IX2104.2 223
   001059      1  106300                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001060      1  106400                     GO TO START-FAIL-GF-03.                      IX2104.2 1069
   001061         106500     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
   001062         106600     IF      XRECORD-NUMBER (1) EQUAL TO 01                       IX2104.2 478
   001063      1  106700             PERFORM PASS                                         IX2104.2 690
   001064      1  106800             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   001065      1  106900             GO TO START-EXIT-GF-03.                              IX2104.2 1076
   001066         107000     MOVE    01  TO RECNO.                                        IX2104.2 286
   001067         107100     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
   001068         107200     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   001069         107300 START-FAIL-GF-03.                                                IX2104.2
   001070         107400     PERFORM FAIL.                                                IX2104.2 691
   001071         107500     MOVE    01   TO CORRECT-18V0.                                IX2104.2 542
   001072         107600     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001073         107700     GO TO   START-EXIT-GF-03.                                    IX2104.2 1076
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001074         107800 START-DELETE-GF-03.                                              IX2104.2
   001075         107900     PERFORM DE-LETE.                                             IX2104.2 692
   001076         108000 START-EXIT-GF-03.                                                IX2104.2
   001077         108100     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001078         108200 START-INIT-GF-04.                                                IX2104.2
   001079         108300     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001080         108400     MOVE    "START GT RECKEY " TO FEATURE.                       IX2104.2 507
   001081         108500     MOVE    "START-TEST-GF-04" TO PAR-NAME.                      IX2104.2 511
   001082         108600     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001083      1  108700             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001084      1  108800             MOVE   "**"  TO FILESTATUS (4)                       IX2104.2 453
   001085      1  108900             GO TO   START-DELETE-GF-04.                          IX2104.2 1119
   001086         109000     MOVE    "UUUUUUUUUU401"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001087         109100     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001088         109200     MOVE    "DDDDDDDDDD000ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001089         109300     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001090         109400     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001091         109500     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001092         109600 START-TEST-GF-04.                                                IX2104.2
   001093         109700*                                                                 IX2104.2
   001094         109800*  START-TEST-GF-04 -  THE START STATEMENT SHOULD NOT FIND A      IX2104.2
   001095         109900*                    RECORD IN THE  FILE WHICH HAS A RECORD       IX2104.2
   001096         110000*                    KEY VALUE GREATER THAN "UUUUUUUUUU401". THIS IX2104.2
   001097         110100*                    VALUE IS SEQUENTIALLY GREATER THAN           IX2104.2
   001098         110200*                    ANY RECORD KEY CURRENTLY EXISTING IN         IX2104.2
   001099         110300*                    THE FILE.  AN INVALID KEY CONDITION          IX2104.2
   001100         110400*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2104.2
   001101         110500*                                                                 IX2104.2
   001102         110600     START   IX-FS1                                               IX2104.2 223
   001103         110700                    KEY IS GREATER THAN IX-FS1-KEY                IX2104.2 232
   001104      1  110800          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2104.2 287 453
   001105      1  110900                         GO TO START-PASS-GF-04.                  IX2104.2 1115
   001106         111000     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2104.2 287 453
   001107         111100     READ    IX-FS1 AT END                                        IX2104.2 223
   001108      1  111200                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   001109         111300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001110         111400     PERFORM FAIL.                                                IX2104.2 691
   001111         111500     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2104.2 499 522
   001112         111600     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2104.2 536
   001113         111700     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001114         111800     GO TO   START-EXIT-GF-04.                                    IX2104.2 1121
   001115         111900 START-PASS-GF-04.                                                IX2104.2
   001116         112000     PERFORM  PASS.                                               IX2104.2 690
   001117         112100     MOVE     "INVALID KEY OK."  TO RE-MARK.                      IX2104.2 516
   001118         112200     GO TO   START-EXIT-GF-04.                                    IX2104.2 1121
   001119         112300 START-DELETE-GF-04.                                              IX2104.2
   001120         112400     PERFORM DE-LETE.                                             IX2104.2 692
   001121         112500 START-EXIT-GF-04.                                                IX2104.2
   001122         112600     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001123         112700 START-INIT-GF-05.                                                IX2104.2
   001124         112800     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001125         112900     MOVE    "START GT RECKEY " TO FEATURE.                       IX2104.2 507
   001126         113000     MOVE    "START-TEST-GF-05" TO PAR-NAME.                      IX2104.2 511
   001127         113100     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001128      1  113200             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001129      1  113300             MOVE   "**"  TO FILESTATUS (5)                       IX2104.2 453
   001130      1  113400             GO TO   START-DELETE-GF-05.                          IX2104.2 1172
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001131         113500     MOVE    "CDDDDDDDDD039" TO FS1-RECKEY-1-13.                  IX2104.2 266
   001132         113600     MOVE    "IIIIIIIIJJ083ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001133         113700     MOVE    "ABCXXXXXXX400ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001134         113800     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001135         113900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001136         114000     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001137         114100 START-TEST-GF-05.                                                IX2104.2
   001138         114200*  START-TEST-GF-05 -  THE START STATEMENT USES AN OPERAND        IX2104.2
   001139         114300*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2104.2
   001140         114400*                    OF A RECORD   KEY BUT IS THE NAME OF A       IX2104.2
   001141         114500*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2104.2
   001142         114600*                    RECORD KEY.  THE CONTENTS OF THE DATA ITEM   IX2104.2
   001143         114700*                    (POSITIONS 1 THRU 7 OF THE RECORD KEY)       IX2104.2
   001144         114800*                    IS A UNIQUE KEY VALUE FOR THE FILE. THE      IX2104.2
   001145         114900*                    BALANCE OF THE KEY (POSITIONS 8 THRU 13) IS  IX2104.2
   001146         115000*                    NOT A VALID KEY VALUE FOR THE FILE.  THE     IX2104.2
   001147         115100*                    RECORD WITH THE RECORD KEY "DDDDDDDDDD040"   IX2104.2
   001148         115200*                    (RECORD NUMBER 20) IS EXPECTED TO BE FOUND.  IX2104.2
   001149         115300*                                                                 IX2104.2
   001150         115400     START   IX-FS1                                               IX2104.2 223
   001151         115500                    KEY IS GREATER THAN R-RECKEY-1-7              IX2104.2 238
   001152      1  115600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2104.2 287 453
   001153      1  115700                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001154      1  115800                     GO TO START-FAIL-GF-05.                      IX2104.2 1167
   001155         115900     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2104.2 287 453
   001156         116000     READ    IX-FS1  AT END                                       IX2104.2 223
   001157      1  116100                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001158      1  116200                     GO TO  START-FAIL-GF-05.                     IX2104.2 1167
   001159         116300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001160         116400     IF      XRECORD-NUMBER (1) EQUAL TO 20                       IX2104.2 478
   001161      1  116500             PERFORM  PASS                                        IX2104.2 690
   001162      1  116600             MOVE  "SUBORDINATE DATA ITEM OF KEY" TO RE-MARK      IX2104.2 516
   001163      1  116700             GO TO START-EXIT-GF-05.                              IX2104.2 1174
   001164         116800     MOVE    20  TO RECNO.                                        IX2104.2 286
   001165         116900     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
   001166         117000     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001167         117100 START-FAIL-GF-05.                                                IX2104.2
   001168         117200     PERFORM  FAIL.                                               IX2104.2 691
   001169         117300     MOVE    20  TO CORRECT-18V0.                                 IX2104.2 542
   001170         117400     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001171         117500     GO TO   START-EXIT-GF-05.                                    IX2104.2 1174
   001172         117600 START-DELETE-GF-05.                                              IX2104.2
   001173         117700     PERFORM DE-LETE.                                             IX2104.2 692
   001174         117800 START-EXIT-GF-05.                                                IX2104.2
   001175         117900     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001176         118000 START-INIT-GF-06.                                                IX2104.2
   001177         118100     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001178         118200     MOVE "START GT RECKEY " TO FEATURE.                          IX2104.2 507
   001179         118300     MOVE "START-TEST-GF-06" TO PAR-NAME.                         IX2104.2 511
   001180         118400     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001181      1  118500             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001182      1  118600             MOVE   "**"  TO FILESTATUS (6)                       IX2104.2 453
   001183      1  118700             GO TO   START-DELETE-GF-06.                          IX2104.2 1230
   001184         118800     MOVE    "TTTTTTTTTT380"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001185         118900     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001186         119000     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001187         119100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001188         119200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001189         119300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001190         119400 START-TEST-GF-06.                                                IX2104.2
   001191         119500*                                                                 IX2104.2
   001192         119600*  START-TEST-GF-06 -  THE START STATEMENT USES AN OPERAND IN THE IX2104.2
   001193         119700*                    KEY PHRASE WHICH IS NOT THE NAME OF A RECORD IX2104.2
   001194         119800*                    KEY BUT IS THE NAME OF A DATA ITEM THAT IS   IX2104.2
   001195         119900*                    SUBORDINATE TO THE RECORD KEY.  THE CONTENTS IX2104.2
   001196         120000*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2104.2
   001197         120100*                    RECORD KEY)  IS A DUPLICATE OF THE FIRST     IX2104.2
   001198         120200*                    5 POSITIONS OF 5 OTHER RECORDS IN THE FILE.  IX2104.2
   001199         120300*                    THIS TEST EXPECTS THE RECORD POINTER         IX2104.2
   001200         120400*                    TO BE POSITIONED TO RECORD KEY TTTTUUUUUU392 IX2104.2
   001201         120500*                    (RECORD NUMBER 196) WHICH WAS THE RECORD     IX2104.2
   001202         120600*                    WRITTEN TO THE FILE AFTER THE LAST RECORD    IX2104.2
   001203         120700*                    THAT CONTAINS TTTTT IN THE FIRST 5 POSITIONS IX2104.2
   001204         120800*                    OF THE KEY.  THE RECORD KEY WAS LOADED WITH  IX2104.2
   001205         120900*                    THE VALUE "TTTTTTTTTT380" (KEY FOR RECORD    IX2104.2
   001206         121000*                    NUMBER 190) BEFORE THE START WAS EXECUTED.   IX2104.2
   001207         121100*                                                                 IX2104.2
   001208         121200     START   IX-FS1                                               IX2104.2 223
   001209         121300                    KEY IS GREATER THAN IX-FS1-KEY-1-5            IX2104.2 234
   001210      1  121400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (6)       IX2104.2 287 453
   001211      1  121500                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2104.2 522
   001212      1  121600                     GO TO START-FAIL-GF-06.                      IX2104.2 1225
   001213         121700     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2104.2 287 453
   001214         121800     READ    IX-FS1  AT END                                       IX2104.2 223
   001215      1  121900                     MOVE "AT END ON READ" TO COMPUTED-A          IX2104.2 522
   001216      1  122000                     GO TO START-FAIL-GF-06.                      IX2104.2 1225
   001217         122100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001218         122200     IF      XRECORD-NUMBER (1) EQUAL TO 196                      IX2104.2 478
   001219      1  122300             PERFORM  PASS                                        IX2104.2 690
   001220      1  122400             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2104.2 516
   001221      1  122500             GO TO START-EXIT-GF-06.                              IX2104.2 1232
   001222         122600     MOVE    71  TO RECNO.                                        IX2104.2 286
   001223         122700     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
   001224         122800     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001225         122900 START-FAIL-GF-06.                                                IX2104.2
   001226         123000     PERFORM  FAIL.                                               IX2104.2 691
   001227         123100     MOVE    196  TO CORRECT-18V0.                                IX2104.2 542
   001228         123200     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001229         123300     GO TO   START-EXIT-GF-06.                                    IX2104.2 1232
   001230         123400 START-DELETE-GF-06.                                              IX2104.2
   001231         123500     PERFORM DE-LETE.                                             IX2104.2 692
   001232         123600 START-EXIT-GF-06.                                                IX2104.2
   001233         123700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001234         123800 START-INIT-GF-07.                                                IX2104.2
   001235         123900     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001236         124000     MOVE "START GT RECKEY " TO FEATURE.                          IX2104.2 507
   001237         124100     MOVE "START-TEST-GF-07" TO PAR-NAME.                         IX2104.2 511
   001238         124200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001239      1  124300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001240      1  124400             MOVE   "**"  TO FILESTATUS (7)                       IX2104.2 453
   001241      1  124500             GO TO   START-DELETE-GF-07.                          IX2104.2 1278
   001242         124600     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001243         124700     MOVE    "FFFFFFFFFG022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001244         124800     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001245         124900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001246         125000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001247         125100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001248         125200 START-TEST-GF-07.                                                IX2104.2
   001249         125300*                                                                 IX2104.2
   001250         125400*  START-TEST-GF-07 -  THE START STATEMENT USES AN OPERAND IN THE IX2104.2
   001251         125500*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2104.2
   001252         125600*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2104.2
   001253         125700*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2104.2
   001254         125800*                    (POSITIONS 1 THRU 7 OF THE RECORD KEY)       IX2104.2
   001255         125900*                    IS LOADED WITH "UUUUUUU" WHICH IS THE        IX2104.2
   001256         126000*                    KEY VALUE OF THE LAST RECORD IN THE FILE.    IX2104.2
   001257         126100*                    THERE SHOULD BE NO RECORD IN THE FILE GREATERIX2104.2
   001258         126200*                    THAN THIS KEY VALUE THUS AND INVALID KEY     IX2104.2
   001259         126300*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2104.2
   001260         126400*                                                                 IX2104.2
   001261         126500     START  IX-FS1                                                IX2104.2 223
   001262         126600                   KEY IS GREATER THAN R-RECKEY-1-7               IX2104.2 238
   001263      1  126700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2104.2 287 453
   001264      1  126800                     GO TO START-PASS-GF-07.                      IX2104.2 1274
   001265         126900     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2104.2 287 453
   001266         127000     READ    IX-FS1  AT END                                       IX2104.2 223
   001267      1  127100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   001268         127200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001269         127300     PERFORM FAIL.                                                IX2104.2 691
   001270         127400     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2104.2 499 522
   001271         127500     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2104.2 536
   001272         127600     MOVE "AT END PATH TAKEN & IX-36 ETC " TO RE-MARK.            IX2104.2 516
   001273         127700     GO TO   START-EXIT-GF-07.                                    IX2104.2 1280
   001274         127800 START-PASS-GF-07.                                                IX2104.2
   001275         127900     PERFORM PASS.                                                IX2104.2 690
   001276         128000     MOVE    "INVALID KEY OK."  TO RE-MARK.                       IX2104.2 516
   001277         128100     GO TO   START-EXIT-GF-07.                                    IX2104.2 1280
   001278         128200 START-DELETE-GF-07.                                              IX2104.2
   001279         128300     PERFORM DE-LETE.                                             IX2104.2 692
   001280         128400 START-EXIT-GF-07.                                                IX2104.2
   001281         128500     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001282         128600 START-INIT-GF-08.                                                IX2104.2
   001283         128700     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001284         128800     MOVE "START GT RECKEY " TO FEATURE.                          IX2104.2 507
   001285         128900     MOVE "START-TEST-GF-08" TO PAR-NAME.                         IX2104.2 511
   001286         129000     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001287      1  129100             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001288      1  129200             MOVE   "**"  TO FILESTATUS (8)                       IX2104.2 453
   001289      1  129300             GO TO   START-DELETE-GF-08.                          IX2104.2 1332
   001290         129400     MOVE    "ABBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001291         129500     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001292         129600     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001293         129700     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001294         129800     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001295         129900     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001296         130000 START-TEST-GF-08.                                                IX2104.2
   001297         130100*                                                                 IX2104.2
   001298         130200*  START-TEST-GF-08 -  THIS TEST USES AN OPERAND IN THE KEY       IX2104.2
   001299         130300*                    PHRASE OF THE START STATEMENT WHICH IS A DATAIX2104.2
   001300         130400*                    ITEM SUBORDINATE TO THE RECORD KEY NAME.  THEIX2104.2
   001301         130500*                    CONTENTS OF THE DATA ITEM (POSITIONS 1 THRU  IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001302         130600*                    7 OF THE RECORD KEY) IS LOADED WITH "ABBBBBBBIX2104.2
   001303         130700*                    BC".  THIS KEY VALUE IS LOWER THAN ANY RECORDIX2104.2
   001304         130800*                    KEY VALUE IN POSITIONS 1 THRU 7 EXISTING     IX2104.2
   001305         130900*                    IN THE FILE.  THE START STATEMENT WITH THE   IX2104.2
   001306         131000*                    KEY IS GREATER THAN PHRASE IS EXECUTED AND   IX2104.2
   001307         131100*                    SHOULD FIND THE RECORD WITH THE KEY VALUE    IX2104.2
   001308         131200*                    "BBBBBBBBBC002" (RECORD NUMBER 01).          IX2104.2
   001309         131300*                                                                 IX2104.2
   001310         131400     START   IX-FS1                                               IX2104.2 223
   001311         131500                    KEY IS GREATER THAN R-RECKEY-1-7              IX2104.2 238
   001312      1  131600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2104.2 287 453
   001313      1  131700                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2104.2 522
   001314      1  131800                     GO TO START-FAIL-GF-08.                      IX2104.2 1327
   001315         131900     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2104.2 287 453
   001316         132000     READ    IX-FS1  AT END                                       IX2104.2 223
   001317      1  132100                     MOVE "AT END ON READ" TO COMPUTED-A          IX2104.2 522
   001318      1  132200                     GO TO START-FAIL-GF-08.                      IX2104.2 1327
   001319         132300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001320         132400     IF      XRECORD-NUMBER (1) EQUAL TO 001                      IX2104.2 478
   001321      1  132500             PERFORM  PASS                                        IX2104.2 690
   001322      1  132600             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2104.2 516
   001323      1  132700             GO TO START-EXIT-GF-08.                              IX2104.2 1334
   001324         132800     MOVE    01  TO RECNO.                                        IX2104.2 286
   001325         132900     PERFORM DISPLAY-RECORD-KEYS.                                 IX2104.2 2304
   001326         133000     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001327         133100 START-FAIL-GF-08.                                                IX2104.2
   001328         133200     PERFORM  FAIL.                                               IX2104.2 691
   001329         133300     MOVE    001   TO CORRECT-18V0.                               IX2104.2 542
   001330         133400     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001331         133500     GO TO   START-EXIT-GF-08.                                    IX2104.2 1334
   001332         133600 START-DELETE-GF-08.                                              IX2104.2
   001333         133700     PERFORM DE-LETE.                                             IX2104.2 692
   001334         133800 START-EXIT-GF-08.                                                IX2104.2
   001335         133900     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001336         134000 START-INIT-GF-09.                                                IX2104.2
   001337         134100     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001338         134200     MOVE "START GT RECKEY " TO FEATURE.                          IX2104.2 507
   001339         134300     MOVE "START-TEST-GF-09" TO PAR-NAME.                         IX2104.2 511
   001340         134400     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001341      1  134500             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001342      1  134600             MOVE   "**"  TO FILESTATUS (9)                       IX2104.2 453
   001343      1  134700             GO TO   START-DELETE-GF-09.                          IX2104.2 1380
   001344         134800     MOVE    "UUUUUUVVVV400"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001345         134900     MOVE    "EEEEEEEEEF002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001346         135000     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001347         135100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001348         135200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001349         135300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001350         135400 START-TEST-GF-09.                                                IX2104.2
   001351         135500*                                                                 IX2104.2
   001352         135600*  START-TEST-GF-09 -  THIS TEST USES AN OPERAND IN THE           IX2104.2
   001353         135700*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2104.2
   001354         135800*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2104.2
   001355         135900*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2104.2
   001356         136000*                    (POSITIONS 1 THRU 7  OF THE RECORD KEY) IS   IX2104.2
   001357         136100*                    LOADED WITH "UUUUUUV".  THIS KEY VALUE       IX2104.2
   001358         136200*                    IS GREATER THAN ANY RECORD KEY VALUE IN      IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001359         136300*                    POSITION 1 THRU 7 EXISTING IN THE FILE       IX2104.2
   001360         136400*                    THEREFORE AN INVALID KEY CONDITION IS        IX2104.2
   001361         136500*                    EXPECTED WHEN THE START STATEMENT IS         IX2104.2
   001362         136600*                    EXECUTED.                                    IX2104.2
   001363         136700*                                                                 IX2104.2
   001364         136800     START   IX-FS1                                               IX2104.2 223
   001365         136900                    KEY IS GREATER THAN R-RECKEY-1-7              IX2104.2 238
   001366      1  137000          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (9)       IX2104.2 287 453
   001367      1  137100                     GO TO START-PASS-GF-09.                      IX2104.2 1376
   001368         137200     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2104.2 287 453
   001369         137300     READ    IX-FS1  AT END                                       IX2104.2 223
   001370      1  137400      MOVE "IX-36 ETS &     AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   001371         137500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001372         137600     PERFORM FAIL.                                                IX2104.2 691
   001373         137700     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2104.2 499 522
   001374         137800     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2104.2 536
   001375         137900     GO TO   START-EXIT-GF-09.                                    IX2104.2 1382
   001376         138000 START-PASS-GF-09.                                                IX2104.2
   001377         138100     PERFORM PASS.                                                IX2104.2 690
   001378         138200     MOVE    "INVALID KEY OK."  TO RE-MARK.                       IX2104.2 516
   001379         138300     GO TO   START-EXIT-GF-09.                                    IX2104.2 1382
   001380         138400 START-DELETE-GF-09.                                              IX2104.2
   001381         138500     PERFORM DE-LETE.                                             IX2104.2 692
   001382         138600 START-EXIT-GF-09.                                                IX2104.2
   001383         138700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001384         138800 START-TERM-GF.                                                   IX2104.2
   001385         138900     CLOSE   IX-FS1.                                              IX2104.2 223
   001386         139000 START-INIT-GF-10.                                                IX2104.2
   001387         139100     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001388         139200     MOVE "START-TEST-GF-10" TO PAR-NAME.                         IX2104.2 511
   001389         139300*                                                                 IX2104.2
   001390         139400*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2104.2
   001391         139500*  CAPTURED FROM THE TESTS IN START-TEST-GF-01 TO -09             IX2104.2
   001392         139600*                                                                 IX2104.2
   001393         139700 START-TEST-GF-10.                                                IX2104.2
   001394         139800     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2104.2 453
   001395      1  139900             PERFORM DE-LETE                                      IX2104.2 692
   001396      1  140000             GO TO  START-WRITE-GF-10.                            IX2104.2 1409
   001397         140100*                                                                 IX2104.2
   001398         140200*  START-TEST-GF-10  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001399         140300*                    RESULTING FROM START-TEST-GF-01.  THE FILE   IX2104.2
   001400         140400*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2104.2
   001401         140500*                                                                 IX2104.2
   001402         140600     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2104.2 453
   001403      1  140700             PERFORM PASS                                         IX2104.2 690
   001404         140800     ELSE                                                         IX2104.2
   001405      1  140900         MOVE "FROM START-TEST-GF-01; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001406      1  141000             PERFORM  FAIL                                        IX2104.2 691
   001407      1  141100             MOVE  "00"  TO CORRECT-A                             IX2104.2 536
   001408      1  141200             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2104.2 453 522
   001409         141300 START-WRITE-GF-10.                                               IX2104.2
   001410         141400     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001411         141500 START-TEST-GF-11.                                                IX2104.2
   001412         141600     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001413         141700     MOVE "START-TEST-GF-11" TO PAR-NAME.                         IX2104.2 511
   001414         141800     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2104.2 453
   001415      1  141900             PERFORM DE-LETE                                      IX2104.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001416      1  142000             GO TO  START-WRITE-GF-11.                            IX2104.2 1428
   001417         142100*                                                                 IX2104.2
   001418         142200*  START-TEST-GF-02  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001419         142300*                    RESULTING FROM START-TEST-003.02. THE FILE   IX2104.2
   001420         142400*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   001421         142500*                                                                 IX2104.2
   001422         142600     IF      FILESTATUS (2) EQUAL TO "00"                         IX2104.2 453
   001423      1  142700             PERFORM  PASS                                        IX2104.2 690
   001424      1  142800             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001425      1  142900         MOVE "FROM START-TEST-GF-02; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001426      1  143000             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   001427      1  143100             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2104.2 453 522
   001428         143200 START-WRITE-GF-11.                                               IX2104.2
   001429         143300     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001430         143400 START-TEST-GF-12.                                                IX2104.2
   001431         143500     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001432         143600     MOVE "START-TEST-GF-12" TO PAR-NAME.                         IX2104.2 511
   001433         143700     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2104.2 453
   001434      1  143800             PERFORM DE-LETE                                      IX2104.2 692
   001435      1  143900             GO TO  START-WRITE-GF-12.                            IX2104.2 1447
   001436         144000*                                                                 IX2104.2
   001437         144100*  START-TEST-GF-03  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001438         144200*                    RESULTING FROM START-TEST-003.03. THE FILE   IX2104.2
   001439         144300*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   001440         144400*                                                                 IX2104.2
   001441         144500     IF      FILESTATUS (3) EQUAL TO "00"                         IX2104.2 453
   001442      1  144600             PERFORM  PASS                                        IX2104.2 690
   001443      1  144700             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001444      1  144800         MOVE "FROM START-TEST-GF-03; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001445      1  144900             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   001446      1  145000             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2104.2 453 522
   001447         145100 START-WRITE-GF-12.                                               IX2104.2
   001448         145200     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001449         145300 START-TEST-GF-13.                                                IX2104.2
   001450         145400     MOVE "FILE STATUS START:23"  TO FEATURE.                     IX2104.2 507
   001451         145500     MOVE "START-TEST-GF-13" TO PAR-NAME.                         IX2104.2 511
   001452         145600     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2104.2 453
   001453      1  145700             PERFORM DE-LETE                                      IX2104.2 692
   001454      1  145800             GO TO  START-WRITE-GF-13.                            IX2104.2 1466
   001455         145900*                                                                 IX2104.2
   001456         146000*  START-TEST-GF-04  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001457         146100*                    RESULTING FROM START-TEST-003.04. THE FILE   IX2104.2
   001458         146200*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2104.2
   001459         146300*                                                                 IX2104.2
   001460         146400     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2104.2 453
   001461      1  146500             PERFORM  PASS                                        IX2104.2 690
   001462      1  146600             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001463      1  146700         MOVE "FROM START-TEST-GF-04; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   001464      1  146800             MOVE    "23"  TO CORRECT-A                           IX2104.2 536
   001465      1  146900             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2104.2 453 522
   001466         147000 START-WRITE-GF-13.                                               IX2104.2
   001467         147100     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001468         147200 START-TEST-GF-14.                                                IX2104.2
   001469         147300     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001470         147400     MOVE "START-TEST-GF-14" TO PAR-NAME.                         IX2104.2 511
   001471         147500     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2104.2 453
   001472      1  147600             PERFORM DE-LETE                                      IX2104.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001473      1  147700             GO TO  START-WRITE-GF-14.                            IX2104.2 1485
   001474         147800*                                                                 IX2104.2
   001475         147900*  START-TEST-GF-05  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001476         148000*                    RESULTING FROM START-TEST-GF-05.  THE FILE   IX2104.2
   001477         148100*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   001478         148200*                                                                 IX2104.2
   001479         148300     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2104.2 453
   001480      1  148400             PERFORM  PASS                                        IX2104.2 690
   001481      1  148500             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001482      1  148600         MOVE "FROM START-TEST-GF-05; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001483      1  148700             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   001484      1  148800             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2104.2 453 522
   001485         148900 START-WRITE-GF-14.                                               IX2104.2
   001486         149000     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001487         149100 START-TEST-GF-15.                                                IX2104.2
   001488         149200     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001489         149300     MOVE "START-TEST-GF-15" TO PAR-NAME.                         IX2104.2 511
   001490         149400     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2104.2 453
   001491      1  149500             PERFORM DE-LETE                                      IX2104.2 692
   001492      1  149600             GO TO  START-WRITE-GF-15.                            IX2104.2 1504
   001493         149700*                                                                 IX2104.2
   001494         149800*  START-TEST-GF-15  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001495         149900*                    RESULTING FROM START-TEST-GF-06.  THE FILE   IX2104.2
   001496         150000*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   001497         150100*                                                                 IX2104.2
   001498         150200     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2104.2 453
   001499      1  150300             PERFORM  PASS                                        IX2104.2 690
   001500      1  150400             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001501      1  150500         MOVE "FROM START-TEST-GF-01; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001502      1  150600             MOVE   "00"  TO CORRECT-A                            IX2104.2 536
   001503      1  150700             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2104.2 453 522
   001504         150800 START-WRITE-GF-15.                                               IX2104.2
   001505         150900     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001506         151000 START-TEST-GF-16.                                                IX2104.2
   001507         151100     MOVE "FILE STATUS START:23"  TO FEATURE.                     IX2104.2 507
   001508         151200     MOVE "START-TEST-GF-16" TO PAR-NAME.                         IX2104.2 511
   001509         151300     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2104.2 453
   001510      1  151400             PERFORM DE-LETE                                      IX2104.2 692
   001511      1  151500             GO TO  START-WRITE-GF-16.                            IX2104.2 1523
   001512         151600*                                                                 IX2104.2
   001513         151700*  START-TEST-GF-16  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001514         151800*                    RESULTING FROM START-TEST-GF-07.  THE FILE   IX2104.2
   001515         151900*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2104.2
   001516         152000*                                                                 IX2104.2
   001517         152100     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2104.2 453
   001518      1  152200             PERFORM  PASS                                        IX2104.2 690
   001519      1  152300             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001520      1  152400         MOVE "FROM START-TEST-GF-07; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   001521      1  152500             MOVE    "23"  TO CORRECT-A                           IX2104.2 536
   001522      1  152600             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2104.2 453 522
   001523         152700 START-WRITE-GF-16.                                               IX2104.2
   001524         152800       PERFORM  PRINT-DETAIL.                                     IX2104.2 694
   001525         152900 START-TEST-GF-17.                                                IX2104.2
   001526         153000     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   001527         153100     MOVE "START-TEST-GF-17" TO PAR-NAME.                         IX2104.2 511
   001528         153200     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2104.2 453
   001529      1  153300             PERFORM DE-LETE                                      IX2104.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001530      1  153400             GO TO  START-WRITE-GF-17.                            IX2104.2 1542
   001531         153500*                                                                 IX2104.2
   001532         153600*  START-TEST-GF-17  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001533         153700*                    RESULTING FROM START-TEST-GF-08.  THE FILE   IX2104.2
   001534         153800*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   001535         153900*                                                                 IX2104.2
   001536         154000     IF      FILESTATUS (8) EQUAL TO "00"                         IX2104.2 453
   001537      1  154100             PERFORM  PASS                                        IX2104.2 690
   001538      1  154200             ELSE  PERFORM  FAIL                                  IX2104.2 691
   001539      1  154300         MOVE "FROM START-TEST-GF-08; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   001540      1  154400             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   001541      1  154500             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2104.2 453 522
   001542         154600 START-WRITE-GF-17.                                               IX2104.2
   001543         154700     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001544         154800 START-TEST-GF-18.                                                IX2104.2
   001545         154900     MOVE "FILE STATUS START:23"  TO FEATURE.                     IX2104.2 507
   001546         155000     MOVE "START-TEST-GF-18" TO PAR-NAME.                         IX2104.2 511
   001547         155100     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2104.2 453
   001548      1  155200             PERFORM DE-LETE                                      IX2104.2 692
   001549      1  155300             GO TO  START-WRITE-GF-18.                            IX2104.2 1561
   001550         155400*                                                                 IX2104.2
   001551         155500*  START-WRITE-GF-18 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   001552         155600*                    RESULTING FROM START-TEST-GF-09.  THE FILE   IX2104.2
   001553         155700*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2104.2
   001554         155800*                                                                 IX2104.2
   001555         155900     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2104.2 453
   001556      1  156000             PERFORM PASS                                         IX2104.2 690
   001557      1  156100     ELSE    PERFORM FAIL                                         IX2104.2 691
   001558      1  156200         MOVE "FROM START-TEST-GF-09; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   001559      1  156300             MOVE  "23"  TO CORRECT-A                             IX2104.2 536
   001560      1  156400             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2104.2 453 522
   001561         156500 START-WRITE-GF-18.                                               IX2104.2
   001562         156600     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   001563         156700                                                                  IX2104.2
   001564         156800                                                                  IX2104.2
   001565         156900 START-INIT-GF-19-0.                                              IX2104.2
   001566         157000     OPEN    INPUT  IX-FS1.                                       IX2104.2 223
   001567         157100     MOVE    SPACE TO HOLD-FILESTATUS-RECORD.                     IX2104.2 IMP 452
   001568         157200*                                                                 IX2104.2
   001569         157300* THE "START -- GREATER THAN--" IS CHECKED FOR PROPER POSITIONING IX2104.2
   001570         157400* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2104.2
   001571         157500* START-TEST-GF  USES ONLY THE ALTERNATE RECORD KEY WITHOUT THE   IX2104.2
   001572         157600* THE DUPLICATES OPTION FOR ESTABLISHING THE CURRENT RECORD       IX2104.2
   001573         157700* POINTER FOR THE FILE.  THE FOLLOWING IS A SUMMARY OF THE TEST   IX2104.2
   001574         157800* CONDITIONS AND THE EXPECTED ACTION TO BE TAKEN FOR THE TESTS.   IX2104.2
   001575         157900*                                                                 IX2104.2
   001576         158000*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2104.2
   001577         158100*                                                                 IX2104.2
   001578         158200*   START-TEST-GF-01  - EQUAL A RECORD IN FILE / RECORD FOUND     IX2104.2
   001579         158300*   START-TEST-GF-02  - BETWEEN 2 KEY VALUES / RECORD FOUND       IX2104.2
   001580         158400*   START-TEST-GF-03  - LESS THAN FIRST FILE REC. / REC. FOUND    IX2104.2
   001581         158500*   START-TEST-GF-04  - GREATER THAN LAST FILE RECORD / INVALID KEIX2104.2
   001582         158600*   START-TEST-GF-05 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2104.2
   001583         158700*   START-TEST-GF-06 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2104.2
   001584         158800*   START-TEST-GF-07 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2104.2
   001585         158900*   START-TEST-GF-08 - UNEQUAL SIZE OPERANDS (UNEQUAL) / REC FOUNDIX2104.2
   001586         159000*   START-TEST-GF-09 - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEY IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001587         159100*                                                                 IX2104.2
   001588         159200*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2104.2
   001589         159300*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2104.2
   001590         159400*  IF AN INVALID KEY IS EXPECTED FROM THE TEST, THE KEYS          IX2104.2
   001591         159500*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2104.2
   001592         159600*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2104.2
   001593         159700*  MATCH RECORDS IN THE FILE.  IF KEY MATCH IS EXPECTED FROM      IX2104.2
   001594         159800*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2104.2
   001595         159900*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2104.2
   001596         160000*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2104.2
   001597         160100*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2104.2
   001598         160200*                                                                 IX2104.2
   001599         160300 START-INIT-GF-19.                                                IX2104.2
   001600         160400     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001601         160500     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001602         160600     MOVE "START-TEST-GF-19"  TO PAR-NAME.                        IX2104.2 511
   001603         160700     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001604      1  160800             MOVE   "**"  TO FILESTATUS (1)                       IX2104.2 453
   001605      1  160900             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
   001606      1  161000             GO TO START-DELETE-GF-19.                            IX2104.2 1641
   001607         161100     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001608         161200     MOVE    "XXXXXXXXXY382ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001609         161300     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001610         161400     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   001611         161500     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   001612         161600     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   001613         161700 START-TEST-19.                                                   IX2104.2
   001614         161800*                                                                 IX2104.2
   001615         161900*  START-TEST-GF-19  - THE START SHOULD FIND A RECORD IN THE FILE IX2104.2
   001616         162000*                    WHICH HAS AN ALTERNATE KEY VALUE OF          IX2104.2
   001617         162100*                    XXXXXXXXYY384ALTKEY1 (RECORD NUMBER 192).    IX2104.2
   001618         162200*                                                                 IX2104.2
   001619         162300     START   IX-FS1                                               IX2104.2 223
   001620         162400                    KEY IS GREATER THAN IX-FS1-ALTKEY1            IX2104.2 243
   001621      1  162500          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (1)         IX2104.2 287 453
   001622      1  162600                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001623      1  162700                        GO TO START-FAIL-GF-19.                   IX2104.2 1636
   001624         162800     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2104.2 287 453
   001625         162900     READ    IX-FS1  AT END                                       IX2104.2 223
   001626      1  163000                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001627      1  163100                     GO TO START-FAIL-GF-19.                      IX2104.2 1636
   001628         163200     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
   001629         163300     IF      XRECORD-NUMBER (1)  EQUAL TO 192                     IX2104.2 478
   001630      1  163400             PERFORM PASS                                         IX2104.2 690
   001631      1  163500             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   001632      1  163600             GO TO START-EXIT-GF-19.                              IX2104.2 1643
   001633         163700     MOVE    67  TO RECNO.                                        IX2104.2 286
   001634         163800     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001635         163900     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   001636         164000 START-FAIL-GF-19.                                                IX2104.2
   001637         164100     PERFORM FAIL.                                                IX2104.2 691
   001638         164200     MOVE    192  TO CORRECT-18V0.                                IX2104.2 542
   001639         164300     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001640         164400     GO TO   START-EXIT-GF-19.                                    IX2104.2 1643
   001641         164500 START-DELETE-GF-19.                                              IX2104.2
   001642         164600     PERFORM DE-LETE.                                             IX2104.2 692
   001643         164700 START-EXIT-GF-19.                                                IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001644         164800     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001645         164900 START-INIT-GF-20.                                                IX2104.2
   001646         165000     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001647         165100     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001648         165200     MOVE "START-TEST-GF-20"  TO PAR-NAME.                        IX2104.2 511
   001649         165300     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001650      1  165400             MOVE   "**"  TO FILESTATUS (2)                       IX2104.2 453
   001651      1  165500             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
   001652      1  165600             GO TO START-DELETE-GF-20.                            IX2104.2 1690
   001653         165700     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001654         165800     MOVE    "HHHHHHHIII67ALTKEY1"  TO FS1-ALTKEY1-1-20.          IX2104.2 271
   001655         165900     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001656         166000     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   001657         166100     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   001658         166200     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   001659         166300 START-TEST-GF-20.                                                IX2104.2
   001660         166400*                                                                 IX2104.2
   001661         166500*  START-TEST-GF-20  - THE START SHOULD FIND A RECORD IN THE FILE IX2104.2
   001662         166600*                    WHICH HAS AN ALTERNATE KEY VALUE OF          IX2104.2
   001663         166700*                    HHHHHHIIII068ALTKEY1 (RECORD NUMBER 34).     IX2104.2
   001664         166800*                    THE DATA ITEM WAS LOADED WITH A KEY VALUE    IX2104.2
   001665         166900*                    SEQUENTIALLY LOCATED BETWEEN TWO CURRENTLY   IX2104.2
   001666         167000*                    EXISTING ALTERNATE KEYS IN THE FILE.         IX2104.2
   001667         167100*                                                                 IX2104.2
   001668         167200     START   IX-FS1                                               IX2104.2 223
   001669         167300                    KEY IS GREATER THAN IX-FS1-ALTKEY1            IX2104.2 243
   001670      1  167400          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (2)         IX2104.2 287 453
   001671      1  167500                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001672      1  167600                        GO TO START-FAIL-GF-20.                   IX2104.2 1685
   001673         167700     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2104.2 287 453
   001674         167800     READ    IX-FS1  AT END                                       IX2104.2 223
   001675      1  167900                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001676      1  168000                     GO TO START-FAIL-GF-20.                      IX2104.2 1685
   001677         168100     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
   001678         168200     IF      XRECORD-NUMBER (1)  EQUAL TO 034                     IX2104.2 478
   001679      1  168300             PERFORM PASS                                         IX2104.2 690
   001680      1  168400             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   001681      1  168500             GO TO START-EXIT-GF-20.                              IX2104.2 1692
   001682         168600     MOVE    34  TO RECNO.                                        IX2104.2 286
   001683         168700     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001684         168800     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   001685         168900 START-FAIL-GF-20.                                                IX2104.2
   001686         169000     PERFORM FAIL.                                                IX2104.2 691
   001687         169100     MOVE    034  TO CORRECT-18V0.                                IX2104.2 542
   001688         169200     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001689         169300     GO TO   START-EXIT-GF-20.                                    IX2104.2 1692
   001690         169400 START-DELETE-GF-20.                                              IX2104.2
   001691         169500     PERFORM DE-LETE.                                             IX2104.2 692
   001692         169600 START-EXIT-GF-20.                                                IX2104.2
   001693         169700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001694         169800 START-INIT-GF-21.                                                IX2104.2
   001695         169900     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001696         170000     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001697         170100     MOVE "START-TEST-GF-21"  TO PAR-NAME.                        IX2104.2 511
   001698         170200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001699      1  170300             MOVE   "**"  TO FILESTATUS (3)                       IX2104.2 453
   001700      1  170400             MOVE   "TEST IMPROPERLY INITIALIZED" TO RE-MARK      IX2104.2 516
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001701      1  170500             GO TO START-DELETE-GF-21.                            IX2104.2 1740
   001702         170600     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001703         170700     MOVE    "EEEEEEEEEF001ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001704         170800     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001705         170900     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   001706         171000     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   001707         171100     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   001708         171200 START-TEST-GF-21.                                                IX2104.2
   001709         171300*                                                                 IX2104.2
   001710         171400*  START-TEST-GF-21  - THE START STATEMENT SHOULD FIND A          IX2104.2
   001711         171500*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2104.2
   001712         171600*                    KEY VALUE OF EEEEEEEEEF002ALTKEY1 (RECORD    IX2104.2
   001713         171700*                    NUMBER 01).  THE ALTERNATE KEY WAS LOADED    IX2104.2
   001714         171800*                    WITH A VALUE THAT IS SEQUENTIALLY LOWER      IX2104.2
   001715         171900*                    THAN ANY CURRENTLY EXISTNNG KEY IN THE FILE  IX2104.2
   001716         172000*                    BEFORE THE START WAS EXECUTED.               IX2104.2
   001717         172100*                                                                 IX2104.2
   001718         172200     START   IX-FS1                                               IX2104.2 223
   001719         172300                    KEY IS GREATER THAN IX-FS1-ALTKEY1            IX2104.2 243
   001720      1  172400          INVALID KEY   MOVE FS1-STATUS TO FILESTATUS (3)         IX2104.2 287 453
   001721      1  172500                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001722      1  172600                        GO TO START-FAIL-GF-21.                   IX2104.2 1735
   001723         172700     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2104.2 287 453
   001724         172800     READ    IX-FS1  AT END                                       IX2104.2 223
   001725      1  172900                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001726      1  173000                     GO TO START-FAIL-GF-21.                      IX2104.2 1735
   001727         173100     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2104.2 227 469
   001728         173200     IF      XRECORD-NUMBER (1)  EQUAL TO 001                     IX2104.2 478
   001729      1  173300             PERFORM PASS                                         IX2104.2 690
   001730      1  173400             MOVE SPACE TO RE-MARK                                IX2104.2 IMP 516
   001731      1  173500             GO TO START-EXIT-GF-21.                              IX2104.2 1742
   001732         173600     MOVE    01  TO RECNO.                                        IX2104.2 286
   001733         173700     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001734         173800     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2104.2 478 529
   001735         173900 START-FAIL-GF-21.                                                IX2104.2
   001736         174000     PERFORM FAIL.                                                IX2104.2 691
   001737         174100     MOVE    001  TO CORRECT-18V0.                                IX2104.2 542
   001738         174200     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001739         174300     GO TO   START-EXIT-GF-21.                                    IX2104.2 1742
   001740         174400 START-DELETE-GF-21.                                              IX2104.2
   001741         174500     PERFORM DE-LETE.                                             IX2104.2 692
   001742         174600 START-EXIT-GF-21.                                                IX2104.2
   001743         174700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001744         174800 START-INIT-GF-22.                                                IX2104.2
   001745         174900     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001746         175000     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001747         175100     MOVE "START-TEST-GF-22"  TO PAR-NAME.                        IX2104.2 511
   001748         175200     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001749      1  175300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001750      1  175400             MOVE   "**"  TO FILESTATUS (4)                       IX2104.2 453
   001751      1  175500             GO TO   START-DELETE-GF-22.                          IX2104.2 1784
   001752         175600     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001753         175700     MOVE    "YYYYYYYYYY401ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001754         175800     MOVE    "DDDDDDDDDD000ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2104.2 279
   001755         175900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001756         176000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001757         176100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001758         176200 START-TEST-GF-22.                                                IX2104.2
   001759         176300*                                                                 IX2104.2
   001760         176400*  START-TEST-GF-04  - THE START STATEMENT SHOULD NOT FIND A      IX2104.2
   001761         176500*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2104.2
   001762         176600*                    KEY VALUE OF YYYYYYYYYY401ALTKEY1.  THIS     IX2104.2
   001763         176700*                    VALUE IS SEQUENTIALLY GREATER THAN           IX2104.2
   001764         176800*                    ANY ALTERNATE KEY CURRENTLY EXISTING IN      IX2104.2
   001765         176900*                    THE FILE.  AN INVALID KEY CONDITION          IX2104.2
   001766         177000*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2104.2
   001767         177100*                                                                 IX2104.2
   001768         177200     START   IX-FS1                                               IX2104.2 223
   001769         177300                    KEY IS GREATER THAN IX-FS1-ALTKEY1            IX2104.2 243
   001770      1  177400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2104.2 287 453
   001771      1  177500                         GO TO START-PASS-GF-22.                  IX2104.2 1780
   001772         177600     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2104.2 287 453
   001773         177700     READ    IX-FS1 AT END                                        IX2104.2 223
   001774      1  177800                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   001775         177900     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001776         178000     PERFORM FAIL.                                                IX2104.2 691
   001777         178100     MOVE    ALTERNATE-KEY1 (1) TO COMPUTED-A.                    IX2104.2 501 522
   001778         178200     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2104.2 536
   001779         178300     GO TO   START-EXIT-GF-22.                                    IX2104.2 1786
   001780         178400 START-PASS-GF-22.                                                IX2104.2
   001781         178500     PERFORM  PASS.                                               IX2104.2 690
   001782         178600     MOVE     "INVALID KEY OK."  TO RE-MARK.                      IX2104.2 516
   001783         178700     GO TO   START-EXIT-GF-22.                                    IX2104.2 1786
   001784         178800 START-DELETE-GF-22.                                              IX2104.2
   001785         178900     PERFORM DE-LETE.                                             IX2104.2 692
   001786         179000 START-EXIT-GF-22.                                                IX2104.2
   001787         179100     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001788         179200 START-INIT-GF-23.                                                IX2104.2
   001789         179300     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001790         179400     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001791         179500     MOVE "START-TEST-GF-23"  TO PAR-NAME.                        IX2104.2 511
   001792         179600     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001793      1  179700             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001794      1  179800             MOVE   "**"  TO FILESTATUS (5)                       IX2104.2 453
   001795      1  179900             GO TO   START-DELETE-GF-23.                          IX2104.2 1840
   001796         180000     MOVE    "CDDDDDDDDD039"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001797         180100     MOVE    "GGGGHHHHHH100ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001798         180200     MOVE    "ABCXXXXXXX400ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001799         180300     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001800         180400     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001801         180500     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001802         180600 START-TEST-GF-23.                                                IX2104.2
   001803         180700*                                                                 IX2104.2
   001804         180800*  START-TEST-GF-23  - THE START STATEMENT USES AN OPERAND        IX2104.2
   001805         180900*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2104.2
   001806         181000*                    OF AN ALTERNATE KEY BUT IS THE NAME OF A     IX2104.2
   001807         181100*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2104.2
   001808         181200*                    ALTERNATE KEY.  THE CONTENTS OF THE DATA ITEMIX2104.2
   001809         181300*                    (POSITIONS 1 THRU 6 OF THE ALTERNATE KEY)    IX2104.2
   001810         181400*                    IS A UNIQUE KEY VALUE FOR THE FILE.  THE     IX2104.2
   001811         181500*                    BALANCE OF THE KEY (POSITIONS 7 THRU 20 OF   IX2104.2
   001812         181600*                    THE ALTERNATE KEY IS NOT A VALID KEY VALUE   IX2104.2
   001813         181700*                    FOR THE FILE.  THE                           IX2104.2
   001814         181800*                    RECORD WITH THE ALTERNATE KEY "GGGHHHHHHH054 IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001815         181900*                    ALTKEY1 (RECORD NUMBER 27) IS EXPECTED TO    IX2104.2
   001816         182000*                    BE FOUND.                                    IX2104.2
   001817         182100*                                                                 IX2104.2
   001818         182200     START   IX-FS1                                               IX2104.2 223
   001819         182300                    KEY IS GREATER THAN R-ALTKEY1-1-6             IX2104.2 250
   001820      1  182400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2104.2 287 453
   001821      1  182500                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2104.2 522
   001822      1  182600                     GO TO START-FAIL-GF-23.                      IX2104.2 1835
   001823         182700     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2104.2 287 453
   001824         182800     READ    IX-FS1  AT END                                       IX2104.2 223
   001825      1  182900                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2104.2 522
   001826      1  183000                     GO TO  START-FAIL-GF-23.                     IX2104.2 1835
   001827         183100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001828         183200     IF      XRECORD-NUMBER (1)  EQUAL TO 27                      IX2104.2 478
   001829      1  183300             PERFORM  PASS                                        IX2104.2 690
   001830      1  183400             MOVE  "SUBORDINATE DATA ITEM OF KEY" TO RE-MARK      IX2104.2 516
   001831      1  183500             GO TO START-EXIT-GF-23.                              IX2104.2 1842
   001832         183600     MOVE    27  TO RECNO.                                        IX2104.2 286
   001833         183700     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001834         183800     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001835         183900 START-FAIL-GF-23.                                                IX2104.2
   001836         184000     PERFORM  FAIL.                                               IX2104.2 691
   001837         184100     MOVE    27  TO CORRECT-18V0.                                 IX2104.2 542
   001838         184200     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001839         184300     GO TO   START-EXIT-GF-23.                                    IX2104.2 1842
   001840         184400 START-DELETE-GF-23.                                              IX2104.2
   001841         184500     PERFORM DE-LETE.                                             IX2104.2 692
   001842         184600 START-EXIT-GF-23.                                                IX2104.2
   001843         184700     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001844         184800 START-INIT-GF-24.                                                IX2104.2
   001845         184900     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001846         185000     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001847         185100     MOVE "START-TEST-GF-24"  TO PAR-NAME.                        IX2104.2 511
   001848         185200     IF INIT-FLAG NOT EQUAL  TO ZERO                              IX2104.2 451 IMP
   001849      1  185300             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001850      1  185400             MOVE   "**"  TO FILESTATUS (6)                       IX2104.2 453
   001851      1  185500             GO TO   START-DELETE-GF-24.                          IX2104.2 1899
   001852         185600     MOVE    "YYYYYUUUUU390"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001853         185700     MOVE    "XXXXXXXXXX380ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2104.2 271
   001854         185800     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001855         185900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001856         186000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001857         186100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001858         186200 START-TEST-GF-24.                                                IX2104.2
   001859         186300*                                                                 IX2104.2
   001860         186400*  START-TEST-GF-24  - THE START STATEMENT USES AN OPERAND IN THE IX2104.2
   001861         186500*                    KEY PHRASE WHICH IS NOT THE NAME OF AN       IX2104.2
   001862         186600*                    ALTERNATE KEY BUT IS THE NAME OF A DATA ITEM IX2104.2
   001863         186700*                    THAT IS SUBORDINATE TO THE KEY.  THE CONTENTSIX2104.2
   001864         186800*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2104.2
   001865         186900*                    ALTERNATE KEY) IS A DUPLICATE OF THE FIRST   IX2104.2
   001866         187000*                    5 POSITIONS OF 5 OTHER RECORDS IN THE FILE.  IX2104.2
   001867         187100*                    THIS TEST EXPECTS THE RECORD POINTER         IX2104.2
   001868         187200*                    TO BE POSITIONED TO RECORD KEY XXXXYYYYYY392 IX2104.2
   001869         187300*                    ALTKEY1 (RECORD NUMBER 196) WHICH WAS THE    IX2104.2
   001870         187400*                    RECORD WRITTEN AFTER THE LAST RECORD THAT    IX2104.2
   001871         187500*                    CONTAINS XXXXX IN THE FIRST 5 POSITIONS OF   IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001872         187600*                  THE KEY.  THE ALTERNATE KEY WAS LOADED WITH THEIX2104.2
   001873         187700*                    VALUE XXXXXXXXXX380ALTKEY1 (KEY FOR RECORD   IX2104.2
   001874         187800*                    NUMBER 190) BEFORE THE START WAS EXECUTED.   IX2104.2
   001875         187900*                                                                 IX2104.2
   001876         188000     START   IX-FS1                                               IX2104.2 223
   001877         188100                    KEY IS GREATER THAN IX-FS1-ALTKEY1-1-5        IX2104.2 245
   001878         188200                     INVALID KEY                                  IX2104.2
   001879      1  188300                         MOVE  FS1-STATUS TO FILESTATUS (6)       IX2104.2 287 453
   001880      1  188400                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2104.2 522
   001881      1  188500                     GO TO START-FAIL-GF-24.                      IX2104.2 1894
   001882         188600     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2104.2 287 453
   001883         188700     READ    IX-FS1  AT END                                       IX2104.2 223
   001884      1  188800                     MOVE "AT END ON READ" TO COMPUTED-A          IX2104.2 522
   001885      1  188900                     GO TO START-FAIL-GF-24.                      IX2104.2 1894
   001886         189000     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001887         189100     IF      XRECORD-NUMBER (1) EQUAL TO 196                      IX2104.2 478
   001888      1  189200             PERFORM  PASS                                        IX2104.2 690
   001889      1  189300             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2104.2 516
   001890      1  189400             GO TO START-EXIT-GF-24.                              IX2104.2 1901
   001891         189500     MOVE    71  TO RECNO.                                        IX2104.2 286
   001892         189600     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001893         189700     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001894         189800 START-FAIL-GF-24.                                                IX2104.2
   001895         189900     PERFORM  FAIL.                                               IX2104.2 691
   001896         190000     MOVE    196  TO CORRECT-18V0.                                IX2104.2 542
   001897         190100     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   001898         190200     GO TO   START-EXIT-GF-24.                                    IX2104.2 1901
   001899         190300 START-DELETE-GF-24.                                              IX2104.2
   001900         190400     PERFORM DE-LETE.                                             IX2104.2 692
   001901         190500 START-EXIT-GF-24.                                                IX2104.2
   001902         190600     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001903         190700 START-INIT-GF-25.                                                IX2104.2
   001904         190800     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001905         190900     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001906         191000     MOVE "START-TEST-GF-25"  TO PAR-NAME.                        IX2104.2 511
   001907         191100     IF INIT-FLAG NOT EQUAL TO ZERO                               IX2104.2 451 IMP
   001908      1  191200             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001909      1  191300             MOVE   "**"  TO FILESTATUS (7)                       IX2104.2 453
   001910      1  191400             GO TO   START-DELETE-GF-25.                          IX2104.2 1947
   001911         191500     MOVE    "CCCCCCCCCD022"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001912         191600     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001913         191700     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001914         191800     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001915         191900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001916         192000     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001917         192100 START-TEST-GF-25.                                                IX2104.2
   001918         192200*                                                                 IX2104.2
   001919         192300*  START-TEST-GF-25  - THE START STATEMENT USES AN OPERAND IN THE IX2104.2
   001920         192400*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2104.2
   001921         192500*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2104.2
   001922         192600*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2104.2
   001923         192700*                    POSITIONS 1 THRU 6 OF THE ALTERNATE KEY)     IX2104.2
   001924         192800*                    IS LOADED WITH YYYYYY WHICH IS THE KEY VALUE IX2104.2
   001925         192900*                    OF THE LAST RECORD IN THE FILE.  THERE SHOULDIX2104.2
   001926         193000*                    BE NO RECORD IN THE FILE WITH A KEY VALUE    IX2104.2
   001927         193100*                    GREATER THUS AN INVALID KEY IS EXPECTED      IX2104.2
   001928         193200*                    WHEN THE START IS EXECUTED.                  IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001929         193300*                                                                 IX2104.2
   001930         193400     START   IX-FS1                                               IX2104.2 223
   001931         193500                    KEY IS GREATER THAN R-ALTKEY1-1-6             IX2104.2 250
   001932      1  193600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2104.2 287 453
   001933      1  193700                     GO TO START-PASS-GF-25.                      IX2104.2 1943
   001934         193800     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2104.2 287 453
   001935         193900     READ    IX-FS1  AT END                                       IX2104.2 223
   001936      1  194000                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   001937         194100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001938         194200     PERFORM FAIL.                                                IX2104.2 691
   001939         194300     MOVE "AT END PATH AND IX-36 ETC " TO RE-MARK.                IX2104.2 516
   001940         194400     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2104.2 499 522
   001941         194500     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2104.2 536
   001942         194600     GO TO   START-EXIT-GF-25.                                    IX2104.2 1949
   001943         194700 START-PASS-GF-25.                                                IX2104.2
   001944         194800     PERFORM PASS.                                                IX2104.2 690
   001945         194900     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2104.2 516
   001946         195000     GO TO   START-EXIT-GF-25.                                    IX2104.2 1949
   001947         195100 START-DELETE-GF-25.                                              IX2104.2
   001948         195200     PERFORM DE-LETE.                                             IX2104.2 692
   001949         195300 START-EXIT-GF-25.                                                IX2104.2
   001950         195400     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   001951         195500 START-INIT-GF-26.                                                IX2104.2
   001952         195600     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   001953         195700     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   001954         195800     MOVE "START-TEST-GF-26"  TO PAR-NAME.                        IX2104.2 511
   001955         195900     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   001956      1  196000             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   001957      1  196100             MOVE   "**"  TO FILESTATUS (8)                       IX2104.2 453
   001958      1  196200             GO TO   START-DELETE-GF-26.                          IX2104.2 2002
   001959         196300     MOVE    "YYYYYUUUUU390"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   001960         196400     MOVE    "EEEEDEEEEE002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   001961         196500     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   001962         196600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   001963         196700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   001964         196800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   001965         196900 START-TEST-GF-26.                                                IX2104.2
   001966         197000*                                                                 IX2104.2
   001967         197100*  START-TEST-GF-26  - THIS TEST USES AN OPERAND IN THE           IX2104.2
   001968         197200*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2104.2
   001969         197300*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2104.2
   001970         197400*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2104.2
   001971         197500*                    (POSITIONS 1 THRU 6 OF THE ALTERNATE KEY) IS IX2104.2
   001972         197600*                    LOADED WITH "EEEEDE".  THIS KEY VALUE        IX2104.2
   001973         197700*                    IS LOWER THAN ANY ALTERNATE KEY VALUE IN     IX2104.2
   001974         197800*                    POSITION 1 THRU 6 EXISTING IN THE FILE       IX2104.2
   001975         197900*                    THE START STATEMENT WITH THE KEY IS GREATER  IX2104.2
   001976         198000*                    THAN PHRASE IS EXECUTED AND SHOULD FIND A    IX2104.2
   001977         198100*                    RECORD WITH THE KEY VALUE "EEEEEEEEEF002     IX2104.2
   001978         198200*                    ALTKEY1 (RECORD NUMBER 01).                  IX2104.2
   001979         198300*                                                                 IX2104.2
   001980         198400     START   IX-FS1                                               IX2104.2 223
   001981         198500                    KEY IS GREATER THAN R-ALTKEY1-1-6             IX2104.2 250
   001982      1  198600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2104.2 287 453
   001983      1  198700                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2104.2 522
   001984      1  198800                     GO TO START-FAIL-GF-26.                      IX2104.2 1997
   001985         198900     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2104.2 287 453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001986         199000     READ    IX-FS1  AT END                                       IX2104.2 223
   001987      1  199100                     MOVE "AT END ON READ" TO COMPUTED-A          IX2104.2 522
   001988      1  199200                     GO TO START-FAIL-GF-26.                      IX2104.2 1997
   001989         199300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   001990         199400     IF      XRECORD-NUMBER (1) EQUAL TO 001                      IX2104.2 478
   001991      1  199500             PERFORM  PASS                                        IX2104.2 690
   001992      1  199600             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2104.2 516
   001993      1  199700             GO TO START-EXIT-GF-26.                              IX2104.2 2004
   001994         199800     MOVE    01  TO RECNO.                                        IX2104.2 286
   001995         199900     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2104.2 2311
   001996         200000     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2104.2 478 529
   001997         200100 START-FAIL-GF-26.                                                IX2104.2
   001998         200200     PERFORM  FAIL.                                               IX2104.2 691
   001999         200300     MOVE    001   TO CORRECT-18V0.                               IX2104.2 542
   002000         200400     MOVE "RECORD NUMBER; IX-36 ETC " TO RE-MARK.                 IX2104.2 516
   002001         200500     GO TO   START-EXIT-GF-26.                                    IX2104.2 2004
   002002         200600 START-DELETE-GF-26.                                              IX2104.2
   002003         200700     PERFORM DE-LETE.                                             IX2104.2 692
   002004         200800 START-EXIT-GF-26.                                                IX2104.2
   002005         200900     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   002006         201000 START-INIT-GF-27.                                                IX2104.2
   002007         201100     PERFORM START-INITIALIZE-RECORD.                             IX2104.2 2290
   002008         201200     MOVE "STR GT ALTKY W/O DUP" TO FEATURE.                      IX2104.2 507
   002009         201300     MOVE "START-TEST-GF-27"  TO PAR-NAME.                        IX2104.2 511
   002010         201400     IF      INIT-FLAG NOT EQUAL TO ZERO                          IX2104.2 451 IMP
   002011      1  201500             MOVE    "TEST IMPROPERLY INITIALIZED"  TO RE-MARK    IX2104.2 516
   002012      1  201600             MOVE   "**"  TO FILESTATUS (9)                       IX2104.2 453
   002013      1  201700             GO TO   START-DELETE-GF-27.                          IX2104.2 2051
   002014         201800     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   002015         201900     MOVE    "YYYYYZYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   002016         202000     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   002017         202100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2104.2 265 231
   002018         202200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2104.2 270 242
   002019         202300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2104.2 278 255
   002020         202400 START-TEST-GF-27.                                                IX2104.2
   002021         202500*                                                                 IX2104.2
   002022         202600*  START-TEST-GF-27  - THIS TEST USES AN OPERAND IN THE           IX2104.2
   002023         202700*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2104.2
   002024         202800*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2104.2
   002025         202900*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2104.2
   002026         203000*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2104.2
   002027         203100*                    LOADED WITH "YYYYYZYYYY". THIS KEY VALUE     IX2104.2
   002028         203200*                    IS GREATER THAN ANY ALTERNATE KEY VALUE IN   IX2104.2
   002029         203300*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2104.2
   002030         203400*                    THEREFORE AN INVALID KEY CONDITION IS        IX2104.2
   002031         203500*                    EXPECTED WHEN THE START STATEMENT IS         IX2104.2
   002032         203600*                    EXECUTED.                                    IX2104.2
   002033         203700*                                                                 IX2104.2
   002034         203800     START   IX-FS1                                               IX2104.2 223
   002035         203900                    KEY IS GREATER THAN IX-FS1-ALTKEY1-1-10       IX2104.2 244
   002036         204000                                 INVALID KEY                      IX2104.2
   002037      1  204100                         MOVE  FS1-STATUS TO FILESTATUS (9)       IX2104.2 287 453
   002038      1  204200                     GO TO START-PASS-GF-27.                      IX2104.2 2047
   002039         204300     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2104.2 287 453
   002040         204400     READ    IX-FS1  AT END                                       IX2104.2 223
   002041      1  204500       MOVE "IX-36 ETC.;    AT END PATH TAKEN ON READ" TO RE-MARK.IX2104.2 516
   002042         204600     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002043         204700     PERFORM FAIL.                                                IX2104.2 691
   002044         204800     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2104.2 499 522
   002045         204900     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2104.2 536
   002046         205000     GO TO   START-EXIT-GF-27.                                    IX2104.2 2053
   002047         205100 START-PASS-GF-27.                                                IX2104.2
   002048         205200     PERFORM PASS.                                                IX2104.2 690
   002049         205300     MOVE    "INVALID KEY OK." TO RE-MARK.                        IX2104.2 516
   002050         205400     GO TO   START-EXIT-GF-27.                                    IX2104.2 2053
   002051         205500 START-DELETE-GF-27.                                              IX2104.2
   002052         205600     PERFORM DE-LETE.                                             IX2104.2 692
   002053         205700 START-EXIT-GF-27.                                                IX2104.2
   002054         205800     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   002055         205900                                                                  IX2104.2
   002056         206000     CLOSE   IX-FS1.                                              IX2104.2 223
   002057         206100                                                                  IX2104.2
   002058         206200*                                                                 IX2104.2
   002059         206300*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2104.2
   002060         206400*  CAPTURED FROM THE TESTS IN START-TEST-005.                     IX2104.2
   002061         206500*                                                                 IX2104.2
   002062         206600 START-TEST-GF-28.                                                IX2104.2
   002063         206700     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002064         206800     MOVE "START-TEST-GF-28"  TO PAR-NAME.                        IX2104.2 511
   002065         206900     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2104.2 453
   002066      1  207000             PERFORM DE-LETE                                      IX2104.2 692
   002067      1  207100             GO TO  START-WRITE-GF-28.                            IX2104.2 2080
   002068         207200*                                                                 IX2104.2
   002069         207300*  START-TEST-GF-28  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002070         207400*                    RESULTING FROM START-TEST-GF-19.  THE FILE   IX2104.2
   002071         207500*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2104.2
   002072         207600*                                                                 IX2104.2
   002073         207700     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2104.2 453
   002074      1  207800             PERFORM PASS                                         IX2104.2 690
   002075         207900     ELSE                                                         IX2104.2
   002076      1  208000         MOVE "FROM START-TEST-GF-19; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002077      1  208100             PERFORM  FAIL                                        IX2104.2 691
   002078      1  208200             MOVE  "00"  TO CORRECT-A                             IX2104.2 536
   002079      1  208300             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2104.2 453 522
   002080         208400 START-WRITE-GF-28.                                               IX2104.2
   002081         208500     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002082         208600 START-TEST-GF-29.                                                IX2104.2
   002083         208700     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002084         208800     MOVE "START-TEST-GF-29"  TO PAR-NAME.                        IX2104.2 511
   002085         208900     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2104.2 453
   002086      1  209000             PERFORM DE-LETE                                      IX2104.2 692
   002087      1  209100             GO TO  START-WRITE-GF-29.                            IX2104.2 2099
   002088         209200*                                                                 IX2104.2
   002089         209300*  START-TEST-GF-29  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002090         209400*                    RESULTING FROM START-TEST-GF-20.  THE FILE   IX2104.2
   002091         209500*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   002092         209600*                                                                 IX2104.2
   002093         209700     IF      FILESTATUS (2) EQUAL TO "00"                         IX2104.2 453
   002094      1  209800             PERFORM  PASS                                        IX2104.2 690
   002095      1  209900             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002096      1  210000         MOVE "FROM START-TEST-GF-20; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002097      1  210100             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   002098      1  210200             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2104.2 453 522
   002099         210300 START-WRITE-GF-29.                                               IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002100         210400     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002101         210500 START-TEST-GF-30.                                                IX2104.2
   002102         210600     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002103         210700     MOVE "START-TEST-GF-30"  TO PAR-NAME.                        IX2104.2 511
   002104         210800     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2104.2 453
   002105      1  210900             PERFORM DE-LETE                                      IX2104.2 692
   002106      1  211000             GO TO  START-WRITE-GF-30.                            IX2104.2 2118
   002107         211100*                                                                 IX2104.2
   002108         211200*  START-TEST-GF-30  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002109         211300*                    RESULTING FROM START-TEST-GF-21.  THE FILE   IX2104.2
   002110         211400*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   002111         211500*                                                                 IX2104.2
   002112         211600     IF      FILESTATUS (3) EQUAL TO "00"                         IX2104.2 453
   002113      1  211700             PERFORM  PASS                                        IX2104.2 690
   002114      1  211800             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002115      1  211900         MOVE "FROM START-TEST-GF-21; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002116      1  212000             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   002117      1  212100             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2104.2 453 522
   002118         212200 START-WRITE-GF-30.                                               IX2104.2
   002119         212300     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002120         212400 START-TEST-GF-31.                                                IX2104.2
   002121         212500     MOVE "FILE STATUS START:23"  TO FEATURE.                     IX2104.2 507
   002122         212600     MOVE "START-TEST-GF-31"  TO PAR-NAME.                        IX2104.2 511
   002123         212700     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2104.2 453
   002124      1  212800             PERFORM DE-LETE                                      IX2104.2 692
   002125      1  212900             GO TO  START-WRITE-GF-31.                            IX2104.2 2137
   002126         213000*                                                                 IX2104.2
   002127         213100*  START-TEST-GF-31  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002128         213200*                    RESULTING FROM START-TEST-GF-22.  THE FILE   IX2104.2
   002129         213300*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2104.2
   002130         213400*                                                                 IX2104.2
   002131         213500     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2104.2 453
   002132      1  213600             PERFORM  PASS                                        IX2104.2 690
   002133      1  213700             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002134      1  213800         MOVE "FROM START-TEST-GF-22; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   002135      1  213900             MOVE    "23"  TO CORRECT-A                           IX2104.2 536
   002136      1  214000             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2104.2 453 522
   002137         214100 START-WRITE-GF-31.                                               IX2104.2
   002138         214200     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002139         214300 START-TEST-GF-32.                                                IX2104.2
   002140         214400     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002141         214500     MOVE "START-TEST-GF-32"  TO PAR-NAME.                        IX2104.2 511
   002142         214600     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2104.2 453
   002143      1  214700             PERFORM DE-LETE                                      IX2104.2 692
   002144      1  214800             GO TO  START-WRITE-GF-32.                            IX2104.2 2156
   002145         214900*                                                                 IX2104.2
   002146         215000*  START-TEST-GF.05  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002147         215100*                    RESULTING FROM START-TEST-GF-23.  THE FILE   IX2104.2
   002148         215200*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   002149         215300*                                                                 IX2104.2
   002150         215400     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2104.2 453
   002151      1  215500             PERFORM  PASS                                        IX2104.2 690
   002152      1  215600             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002153      1  215700         MOVE "FROM START-TEST-GF-23; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002154      1  215800             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   002155      1  215900             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2104.2 453 522
   002156         216000 START-WRITE-GF-32.                                               IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002157         216100     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002158         216200 START-TEST-GF-33.                                                IX2104.2
   002159         216300     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002160         216400     MOVE "START-TEST-GF-33"  TO PAR-NAME.                        IX2104.2 511
   002161         216500     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2104.2 453
   002162      1  216600             PERFORM DE-LETE                                      IX2104.2 692
   002163      1  216700             GO TO  START-WRITE-GF-33.                            IX2104.2 2175
   002164         216800*                                                                 IX2104.2
   002165         216900*  START-TEST-GF-33  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002166         217000*                    RESULTING FROM START-TEST-GF-24.  THE FILE   IX2104.2
   002167         217100*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   002168         217200*                                                                 IX2104.2
   002169         217300     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2104.2 453
   002170      1  217400             PERFORM  PASS                                        IX2104.2 690
   002171      1  217500             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002172      1  217600         MOVE "FROM START-TEST-GF-24; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002173      1  217700             MOVE   "00"  TO CORRECT-A                            IX2104.2 536
   002174      1  217800             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2104.2 453 522
   002175         217900 START-WRITE-GF-33.                                               IX2104.2
   002176         218000     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002177         218100 START-TEST-GF-34.                                                IX2104.2
   002178         218200     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002179         218300     MOVE "START-TEST-GF-34"  TO PAR-NAME.                        IX2104.2 511
   002180         218400     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2104.2 453
   002181      1  218500             PERFORM DE-LETE                                      IX2104.2 692
   002182      1  218600             GO TO  START-WRITE-GF-34.                            IX2104.2 2194
   002183         218700*                                                                 IX2104.2
   002184         218800*  START-TEST-GF-34  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002185         218900*                    RESULTING FROM START-TEST-GF-25.  THE FILE   IX2104.2
   002186         219000*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2104.2
   002187         219100*                                                                 IX2104.2
   002188         219200     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2104.2 453
   002189      1  219300             PERFORM  PASS                                        IX2104.2 690
   002190      1  219400             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002191      1  219500         MOVE "FROM START-TEST-GF-25; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   002192      1  219600             MOVE    "23"  TO CORRECT-A                           IX2104.2 536
   002193      1  219700             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2104.2 453 522
   002194         219800 START-WRITE-GF-34.                                               IX2104.2
   002195         219900     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002196         220000 START-TEST-GF-35.                                                IX2104.2
   002197         220100     MOVE "FILE STATUS START:00"  TO FEATURE.                     IX2104.2 507
   002198         220200     MOVE "START-TEST-GF-35"  TO PAR-NAME.                        IX2104.2 511
   002199         220300     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2104.2 453
   002200      1  220400             PERFORM DE-LETE                                      IX2104.2 692
   002201      1  220500             GO TO  START-WRITE-GF-35.                            IX2104.2 2213
   002202         220600*                                                                 IX2104.2
   002203         220700*  START-TEST-GF-35  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002204         220800*                    RESULTING FROM START-TEST-GF-26.  THE FILE   IX2104.2
   002205         220900*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2104.2
   002206         221000*                                                                 IX2104.2
   002207         221100     IF      FILESTATUS (8) EQUAL TO "00"                         IX2104.2 453
   002208      1  221200             PERFORM  PASS                                        IX2104.2 690
   002209      1  221300             ELSE  PERFORM  FAIL                                  IX2104.2 691
   002210      1  221400         MOVE "FROM START-TEST-GF-26; IX-3 1.3.4 (1) A" TO RE-MARKIX2104.2 516
   002211      1  221500             MOVE    "00"  TO CORRECT-A                           IX2104.2 536
   002212      1  221600             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2104.2 453 522
   002213         221700 START-WRITE-GF-35.                                               IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002214         221800     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002215         221900 START-TEST-GF-36.                                                IX2104.2
   002216         222000     MOVE "FILE STATUS START:23"  TO FEATURE.                     IX2104.2 507
   002217         222100     MOVE "START-TEST-GF-36"  TO PAR-NAME.                        IX2104.2 511
   002218         222200     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2104.2 453
   002219      1  222300             PERFORM DE-LETE                                      IX2104.2 692
   002220      1  222400             GO TO  START-WRITE-GF-36.                            IX2104.2 2232
   002221         222500*                                                                 IX2104.2
   002222         222600*  START-TEST-GF-36  - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2104.2
   002223         222700*                    RESULTING FROM START-TEST-GF-27.  THE FILE   IX2104.2
   002224         222800*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2104.2
   002225         222900*                                                                 IX2104.2
   002226         223000     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2104.2 453
   002227      1  223100             PERFORM PASS                                         IX2104.2 690
   002228      1  223200     ELSE    PERFORM FAIL                                         IX2104.2 691
   002229      1  223300         MOVE "FROM START-TEST-GF-27; IX-4 1.3.4 (3) C" TO RE-MARKIX2104.2 516
   002230      1  223400             MOVE  "23"  TO CORRECT-A                             IX2104.2 536
   002231      1  223500             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2104.2 453 522
   002232         223600 START-WRITE-GF-36.                                               IX2104.2
   002233         223700     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002234         223800                                                                  IX2104.2
   002235         223900                                                                  IX2104.2
   002236         224000 START-INIT-GF-SERIES.                                            IX2104.2
   002237         224100     OPEN  I-O   IX-FS1.                                          IX2104.2 223
   002238         224200     MOVE     "START SERIES" TO FEATURE.                          IX2104.2 507
   002239         224300     MOVE    "START-TEST-GF-37" TO PAR-NAME.                      IX2104.2 511
   002240         224400     MOVE    ZERO TO INVKEY-COUNTER.                              IX2104.2 IMP 290
   002241         224500*                                                                 IX2104.2
   002242         224600*    THIS TEST EXECUTES SEVERAL START STATEMENTS USING DIFFERENT  IX2104.2
   002243         224700*    KEY VALUES.  FOLLOWING EXECUTION OF THE LAST START           IX2104.2
   002244         224800*    STATEMENT THE READ STATEMENT IS EXECUTED.  THE START         IX2104.2
   002245         224900*    STATEMENT SHOULD HAVE POSITION THE RECORD POINTER            IX2104.2
   002246         225000*    SUCH THAT RECORD NUMBER 49 IS MADE AVAILABLE FOLLOWING       IX2104.2
   002247         225100*    EXECUTION OF THE READ STATEMENT.  THE KEY OF REFERENCE       IX2104.2
   002248         225200*    SHOULD BE ALTERNATE-KEY-2.                                   IX2104.2
   002249         225300*                                                                 IX2104.2
   002250         225400 START-TEST-GF-37.                                                IX2104.2
   002251         225500     MOVE    "FGGGGGGGGG098"  TO FS1-RECKEY-1-13.                 IX2104.2 266
   002252         225600     MOVE    "WWWWWWWXXX366ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2104.2 271
   002253         225700     MOVE    "RRRRRRRRRR300ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2104.2 279
   002254         225800     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   002255         225900     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2104.2 270 242
   002256         226000     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2104.2 278 255
   002257         226100     START   IX-FS1                                               IX2104.2 223
   002258         226200                     KEY IS EQUAL TO IX-FS1-ALTKEY2               IX2104.2 256
   002259      1  226300                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2104.2 290
   002260         226400     START   IX-FS1                                               IX2104.2 223
   002261      1  226500                      INVALID KEY  ADD  01  TO INVKEY-COUNTER.    IX2104.2 290
   002262         226600     START   IX-FS1                                               IX2104.2 223
   002263         226700                    KEY IS NOT LESS THAN R-ALTKEY1-1-6            IX2104.2 250
   002264      1  226800                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2104.2 290
   002265         226900     START   IX-FS1                                               IX2104.2 223
   002266         227000                     KEY IS GREATER THAN IX-FS1-ALTKEY2-1-5       IX2104.2 258
   002267      1  227100                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2104.2 290
   002268         227200     READ    IX-FS1  AT END                                       IX2104.2 223
   002269      1  227300                     MOVE  "AT END ON READ"  TO COMPUTED-A        IX2104.2 522
   002270      1  227400                     GO TO  START-FAIL-GF-37.                     IX2104.2 2278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002271         227500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2104.2 227 469
   002272         227600     IF      XRECORD-NUMBER (1) EQUAL TO 49                       IX2104.2 478
   002273      1  227700             PERFORM  PASS                                        IX2104.2 690
   002274      1  227800             MOVE    "MULTIPLE STARTS BEFORE READ " TO RE-MARK    IX2104.2 516
   002275      1  227900             GO TO  START-EXIT-GF-37.                             IX2104.2 2285
   002276         228000     MOVE    49   TO RECNO.                                       IX2104.2 286
   002277         228100     PERFORM   DISPLAY-ALTERNATE-KEY2.                            IX2104.2 2318
   002278         228200 START-FAIL-GF-37.                                                IX2104.2
   002279         228300     PERFORM FAIL.                                                IX2104.2 691
   002280         228400     MOVE    49  TO CORRECT-18V0.                                 IX2104.2 542
   002281         228500     MOVE "AFTER MULTIPLE STARTS; IX-36 ETC " TO RE-MARK.         IX2104.2 516
   002282         228600     GO TO START-EXIT-GF-37.                                      IX2104.2 2285
   002283         228700 START-DELETE-GF-37.                                              IX2104.2
   002284         228800     PERFORM DE-LETE.                                             IX2104.2 692
   002285         228900 START-EXIT-GF-37.                                                IX2104.2
   002286         229000     PERFORM  PRINT-DETAIL.                                       IX2104.2 694
   002287         229100     CLOSE   IX-FS1.                                              IX2104.2 223
   002288         229200 START-CLOSE-FILES.                                               IX2104.2
   002289         229300     GO TO   START-TEST-COMPLETE.                                 IX2104.2 2325
   002290         229400 START-INITIALIZE-RECORD.                                         IX2104.2
   002291         229500     MOVE    "**"  TO FS1-STATUS.                                 IX2104.2 287
   002292         229600     MOVE    "GGGGGGGGGG200" TO  FS1-RECKEY-1-13.                 IX2104.2 266
   002293         229700     MOVE    ZERO  TO INIT-FLAG.                                  IX2104.2 IMP 451
   002294         229800     MOVE    9999  TO XRECORD-NUMBER (1).                         IX2104.2 478
   002295         229900     MOVE    SPACE TO IX-FS1R1-F-G-240.                           IX2104.2 IMP 227
   002296         230000     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2104.2 265 231
   002297         230100     START   IX-FS1                                               IX2104.2 223
   002298         230200                     KEY IS EQUAL TO IX-FS1-KEY                   IX2104.2 232
   002299      1  230300          INVALID KEY MOVE  1  TO INIT-FLAG.                      IX2104.2 451
   002300         230400     READ    IX-FS1  INTO  FILE-RECORD-INFO (1)                   IX2104.2 223 469
   002301      1  230500                     AT END  MOVE  1 TO INIT-FLAG.                IX2104.2 451
   002302         230600     IF      XRECORD-NUMBER (1) NOT EQUAL TO 100                  IX2104.2 478
   002303      1  230700             MOVE 1 TO INIT-FLAG.                                 IX2104.2 451
   002304         230800 DISPLAY-RECORD-KEYS.                                             IX2104.2
   002305         230900     MOVE    XRECORD-KEY (1)  TO WRK-FS1-RECKEY.                  IX2104.2 499 265
   002306         231000     MOVE    FS1-RECKEY-1-13  TO COMPUTED-A.                      IX2104.2 266 522
   002307         231100     MOVE    RECKEY-VALUE (RECNO)  TO CORRECT-A.                  IX2104.2 448 286 536
   002308         231200     MOVE    SPACE TO P-OR-F.                                     IX2104.2 IMP 509
   002309         231300     MOVE    "RECORD KEY VALUES" TO RE-MARK.                      IX2104.2 516
   002310         231400     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   002311         231500 DISPLAY-ALTERNATE-KEY1.                                          IX2104.2
   002312         231600     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FS1-ALTKEY1.              IX2104.2 501 270
   002313         231700     MOVE    FS1-ALTKEY1-1-20  TO COMPUTED-A.                     IX2104.2 271 522
   002314         231800     MOVE    ALTKEY1-VALUE (RECNO)  TO CORRECT-A.                 IX2104.2 449 286 536
   002315         231900     MOVE    SPACE TO P-OR-F.                                     IX2104.2 IMP 509
   002316         232000     MOVE    "ALTERNATE RECORD KEY1 VALUES"  TO RE-MARK.          IX2104.2 516
   002317         232100     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   002318         232200 DISPLAY-ALTERNATE-KEY2.                                          IX2104.2
   002319         232300     MOVE    ALTERNATE-KEY2 (1) TO WRK-FS1-ALTKEY2.               IX2104.2 503 278
   002320         232400     MOVE    FS1-ALTKEY2-1-20  TO COMPUTED-A.                     IX2104.2 279 522
   002321         232500     MOVE    ALTKEY2-VALUE (RECNO)  TO CORRECT-A.                 IX2104.2 450 286 536
   002322         232600     MOVE    SPACE TO P-OR-F.                                     IX2104.2 IMP 509
   002323         232700     MOVE    "ALTERNATE RECORD KEY2 VALUES"  TO RE-MARK.          IX2104.2 516
   002324         232800     PERFORM PRINT-DETAIL.                                        IX2104.2 694
   002325         232900 START-TEST-COMPLETE.                                             IX2104.2
   002326         233000     EXIT.                                                        IX2104.2
   002327         233100 CCVS-EXIT SECTION.                                               IX2104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002328         233200 CCVS-999999.                                                     IX2104.2
   002329         233300     GO TO CLOSE-FILES.                                           IX2104.2 671
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    45
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      501   ALTERNATE-KEY1 . . . . . . . .  M824 M836 1777 2312
      503   ALTERNATE-KEY2 . . . . . . . .  M825 M837 2319
      293   ALTKEY1-NUM. . . . . . . . . .  M863 869 M877
      449   ALTKEY1-VALUE. . . . . . . . .  821 2314
      294   ALTKEY2-NUM
      450   ALTKEY2-VALUE. . . . . . . . .  822 2321
      567   ANSI-REFERENCE . . . . . . . .  773 780 789
      219   C-ABORT. . . . . . . . . . . .  M652 M675
      213   C-ALL. . . . . . . . . . . . .  M677
      209   C-DATE . . . . . . . . . . . .  M654
      215   C-DELETED. . . . . . . . . . .  M679
      214   C-FAIL . . . . . . . . . . . .  M678
      218   C-INDENT
      216   C-INSPECT. . . . . . . . . . .  M680
      211   C-NO-OF-TESTS. . . . . . . . .  M653
      217   C-NOTE
      212   C-OK . . . . . . . . . . . . .  M676
      210   C-TIME . . . . . . . . . . . .  M655
      546   CCVS-C-1 . . . . . . . . . . .  712 758
      551   CCVS-C-2 . . . . . . . . . . .  713 759
      601   CCVS-E-1 . . . . . . . . . . .  718
      606   CCVS-E-2 . . . . . . . . . . .  727 734 741 746
      609   CCVS-E-2-2 . . . . . . . . . .  M726
      614   CCVS-E-3 . . . . . . . . . . .  747
      623   CCVS-E-4 . . . . . . . . . . .  726
      624   CCVS-E-4-1 . . . . . . . . . .  M724
      626   CCVS-E-4-2 . . . . . . . . . .  M725
      568   CCVS-H-1 . . . . . . . . . . .  707 754
      573   CCVS-H-2A. . . . . . . . . . .  708 755
      582   CCVS-H-2B. . . . . . . . . . .  709 756
      594   CCVS-H-3 . . . . . . . . . . .  710 757
      644   CCVS-PGM-ID. . . . . . . . . .  650 660 660 673 802
      488   CHARS-OR-RECORDS . . . . . . .  M801
      528   CM-18V0
      522   COMPUTED-A . . . . . . . . . .  523 525 526 527 528 785 788 M953 M957 M1004 M1008 M1054 M1059 M1111 M1153 M1157
                                            M1211 M1215 M1270 M1313 M1317 M1373 M1408 M1427 M1446 M1465 M1484 M1503 M1522
                                            M1541 M1560 M1622 M1626 M1671 M1675 M1721 M1725 M1777 M1821 M1825 M1880 M1884
                                            M1940 M1983 M1987 M2044 M2079 M2098 M2117 M2136 M2155 M2174 M2193 M2212 M2231
                                            M2269 M2306 M2313 M2320
      523   COMPUTED-N
      521   COMPUTED-X . . . . . . . . . .  M702 770
      525   COMPUTED-0V18
      527   COMPUTED-14V4
      529   COMPUTED-18V0. . . . . . . . .  M846 M883 M889 M966 M1017 M1068 M1166 M1224 M1326 M1635 M1684 M1734 M1834 M1893
                                            M1996
      526   COMPUTED-4V14
      545   COR-ANSI-REFERENCE . . . . . .  M780 M782
      536   CORRECT-A. . . . . . . . . . .  537 538 539 540 541 786 788 M1112 M1271 M1374 M1407 M1426 M1445 M1464 M1483 M1502
                                            M1521 M1540 M1559 M1778 M1941 M2045 M2078 M2097 M2116 M2135 M2154 M2173 M2192
                                            M2211 M2230 M2307 M2314 M2321
      537   CORRECT-N
      535   CORRECT-X. . . . . . . . . . .  M703 772
      538   CORRECT-0V18
      540   CORRECT-14V4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    46
0 Defined   Cross-reference of data names   References

0     542   CORRECT-18V0 . . . . . . . . .  M845 M884 M890 M969 M1020 M1071 M1169 M1227 M1329 M1638 M1687 M1737 M1837 M1896
                                            M1999 M2280
      539   CORRECT-4V14
      541   CR-18V0
      559   DELETE-COUNTER . . . . . . . .  679 M692 721 737 739
      514   DOTVALUE . . . . . . . . . . .  M697
      565   DUMMY-HOLD . . . . . . . . . .  M751 761
      222   DUMMY-RECORD . . . . . . . . .  M707 M708 M709 M710 M712 M713 M714 M716 M718 M727 M734 M741 M746 M747 751 M752
                                            753 M754 M755 M756 M757 M758 M759 M760 M761 765 M766 M775 M790
      612   ENDER-DESC . . . . . . . . . .  M729 M740 M745
      560   ERROR-COUNTER. . . . . . . . .  678 M691 720 730 733
      564   ERROR-HOLD . . . . . . . . . .  677 M720 M721 M721 M722 725
      610   ERROR-TOTAL. . . . . . . . . .  M731 M733 M738 M739 M743 M744
      288   EXCUT-COUNTER-06V00. . . . . .  M829 M841 843 M861 873 M875 880 883
      507   FEATURE. . . . . . . . . . . .  M808 M860 M897 M977 M1029 M1080 M1125 M1178 M1236 M1284 M1338 M1387 M1412 M1431
                                            M1450 M1469 M1488 M1507 M1526 M1545 M1601 M1647 M1696 M1746 M1790 M1846 M1905
                                            M1953 M2008 M2063 M2083 M2102 M2121 M2140 M2159 M2178 M2197 M2216 M2238
      469   FILE-RECORD-INFO . . . . . . .  M668 826 838 M959 M1010 M1061 M1109 M1159 M1217 M1268 M1319 M1371 M1628 M1677
                                            M1727 M1775 M1827 M1886 M1937 M1989 M2042 M2271 M2300
      470   FILE-RECORD-INFO-P1-120
      497   FILE-RECORD-INFO-P121-240
      455   FILE-RECORD-INFO-SKELETON. . .  667
      454   FILE-RECORD-INFORMATION-REC
      453   FILESTATUS . . . . . . . . . .  M935 M952 M955 M981 M1003 M1006 M1032 M1053 M1057 M1084 M1104 M1106 M1129 M1152
                                            M1155 M1182 M1210 M1213 M1240 M1263 M1265 M1288 M1312 M1315 M1342 M1366 M1368
                                            1394 1402 1408 1414 1422 1427 1433 1441 1446 1452 1460 1465 1471 1479 1484 1490
                                            1498 1503 1509 1517 1522 1528 1536 1541 1547 1555 1560 M1604 M1621 M1624 M1650
                                            M1670 M1673 M1699 M1720 M1723 M1750 M1770 M1772 M1794 M1820 M1823 M1850 M1879
                                            M1882 M1909 M1932 M1934 M1957 M1982 M1985 M2012 M2037 M2039 2065 2073 2079 2085
                                            2093 2098 2104 2112 2117 2123 2131 2136 2142 2150 2155 2161 2169 2174 2180 2188
                                            2193 2199 2207 2212 2218 2226 2231
      182   FOR-INX-START-TEST . . . . . .  179
      272   FS1-ALTKEY1-1-10
      271   FS1-ALTKEY1-1-20 . . . . . . .  M821 M939 M985 M1036 M1087 M1132 M1185 M1243 M1291 M1345 M1608 M1654 M1703 M1753
                                            M1797 M1853 M1912 M1960 M2015 M2252 2313
      273   FS1-ALTKEY1-1-5
      275   FS1-ALTKEY1-11-13. . . . . . .  M832 869
      276   FS1-ALTKEY1-14-20
      274   FS1-ALTKEY1-6-10
      280   FS1-ALTKEY2-1-10
      279   FS1-ALTKEY2-1-20 . . . . . . .  M822 M940 M986 M1037 M1088 M1133 M1186 M1244 M1292 M1346 M1609 M1655 M1704 M1754
                                            M1798 M1854 M1913 M1961 M2016 M2253 2320
      281   FS1-ALTKEY2-1-5
      283   FS1-ALTKEY2-11-13. . . . . . .  M833
      284   FS1-ALTKEY2-14-20
      282   FS1-ALTKEY2-6-10
      267   FS1-RECKEY-1-10
      266   FS1-RECKEY-1-13. . . . . . . .  M820 M938 M984 M1035 M1086 M1131 M1184 M1242 M1290 M1344 M1607 M1653 M1702 M1752
                                            M1796 M1852 M1911 M1959 M2014 M2251 M2292 2306
      268   FS1-RECKEY-11-13 . . . . . . .  M831 868 889
      287   FS1-STATUS . . . . . . . . . .  201 952 955 1003 1006 1053 1057 1104 1106 1152 1155 1210 1213 1263 1265 1312
                                            1315 1366 1368 1621 1624 1670 1673 1720 1723 1770 1772 1820 1823 1879 1882 1932
                                            1934 1982 1985 2037 2039 M2291
      452   HOLD-FILESTATUS-RECORD . . . .  M899 M1567
      638   HYPHEN-LINE. . . . . . . . . .  714 716 760
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    47
0 Defined   Cross-reference of data names   References

0     604   ID-AGAIN . . . . . . . . . . .  M660
      637   INF-ANSI-REFERENCE . . . . . .  M773 M776 M789 M791
      632   INFO-TEXT. . . . . . . . . . .  M774
      451   INIT-FLAG. . . . . . . . . . .  934 980 1031 1082 1127 1180 1238 1286 1340 1603 1649 1698 1748 1792 1848 1907
                                            1955 2010 M2293 M2299 M2301 M2303
      561   INSPECT-COUNTER. . . . . . . .  680 M689 720 742 744
      290   INVKEY-COUNTER . . . . . . . .  M811 M828 M840 843 M2240 M2259 M2261 M2264 M2267
      242   IX-ALT-KEY1-AREA . . . . . . .  867 M942 M988 M1039 M1090 M1135 M1188 M1246 M1294 M1348 M1611 M1657 M1706 M1756
                                            M1800 M1856 M1915 M1963 M2018 M2255
      255   IX-ALT-KEY2-AREA . . . . . . .  M943 M989 M1040 M1091 M1136 M1189 M1247 M1295 M1349 M1612 M1658 M1707 M1757 M1801
                                            M1857 M1916 M1964 M2019 M2256
      223   IX-FS1 . . . . . . . . . . . .  192 797 857 859 865 894 896 950 956 1001 1007 1051 1058 1102 1107 1150 1156 1208
                                            1214 1261 1266 1310 1316 1364 1369 1385 1566 1619 1625 1668 1674 1718 1724 1768
                                            1773 1818 1824 1876 1883 1930 1935 1980 1986 2034 2040 2056 2237 2257 2260 2262
                                            2265 2268 2287 2297 2300
      243   IX-FS1-ALTKEY1 . . . . . . . .  249 199 1620 1669 1719 1769
      244   IX-FS1-ALTKEY1-1-10. . . . . .  2035
      245   IX-FS1-ALTKEY1-1-5 . . . . . .  1877
      247   IX-FS1-ALTKEY1-11-13
      248   IX-FS1-ALTKEY1-14-20
      246   IX-FS1-ALTKEY1-6-10
      256   IX-FS1-ALTKEY2 . . . . . . . .  200 2258
      257   IX-FS1-ALTKEY2-1-10
      258   IX-FS1-ALTKEY2-1-5 . . . . . .  2266
      260   IX-FS1-ALTKEY2-11-13
      261   IX-FS1-ALTKEY2-14-20
      259   IX-FS1-ALTKEY2-6-10
      232   IX-FS1-KEY . . . . . . . . . .  237 198 951 1002 1052 1103 2298
      233   IX-FS1-KEY-1-10
      234   IX-FS1-KEY-1-5 . . . . . . . .  1209
      236   IX-FS1-KEY-11-13
      235   IX-FS1-KEY-6-10
      228   IX-FS1-REC-120
      229   IX-FS1-REC-121-240
      227   IX-FS1R1-F-G-240 . . . . . . .  M826 827 M838 839 959 1010 1061 1109 1159 1217 1268 1319 1371 1628 1677 1727
                                            1775 1827 1886 1937 1989 2042 2271 M2295
      231   IX-REC-KEY-AREA. . . . . . . .  866 M941 M987 M1038 M1089 M1134 M1187 M1245 M1293 M1347 M1610 M1656 M1705 M1755
                                            M1799 M1855 M1914 M1962 M2017 M2254 M2296
      249   IX-REDF-ALTKEY1
      237   IX-REDF-RECKEY
      447   KEY-VALUES
      289   KEYSUB . . . . . . . . . . . .  M810 M819 820 821 822
      482   ODO-NUMBER
      509   P-OR-F . . . . . . . . . . . .  M689 M690 M691 M692 699 M702 M2308 M2315 M2322
      511   PAR-NAME . . . . . . . . . . .  M704 M809 M898 M932 M978 M1030 M1081 M1126 M1179 M1237 M1285 M1339 M1388 M1413
                                            M1432 M1451 M1470 M1489 M1508 M1527 M1546 M1602 M1648 M1697 M1747 M1791 M1847
                                            M1906 M1954 M2009 M2064 M2084 M2103 M2122 M2141 M2160 M2179 M2198 M2217 M2239
      513   PARDOT-X . . . . . . . . . . .  M696
      562   PASS-COUNTER . . . . . . . . .  676 M690 722 724
      220   PRINT-FILE . . . . . . . . . .  190 659 684
      221   PRINT-REC. . . . . . . . . . .  M698 M779 M781
      250   R-ALTKEY1-1-6. . . . . . . . .  1819 1931 1981 2263
      252   R-ALTKEY1-11-20
      251   R-ALTKEY1-7-10
      238   R-RECKEY-1-7 . . . . . . . . .  1151 1262 1311 1365
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    48
0 Defined   Cross-reference of data names   References

0     239   R-RECKEY-8-13
      205   RAW-DATA . . . . . . . . . . .  185 649 651 658 672 674 683
      208   RAW-DATA-KEY . . . . . . . . .  189 M650 M673
      207   RAW-DATA-SATZ. . . . . . . . .  656 681
      516   RE-MARK. . . . . . . . . . . .  M693 M705 M851 M885 M891 M936 M962 M970 M982 M1013 M1021 M1033 M1064 M1072 M1083
                                            M1108 M1113 M1117 M1128 M1162 M1170 M1181 M1220 M1228 M1239 M1267 M1272 M1276
                                            M1287 M1322 M1330 M1341 M1370 M1378 M1405 M1425 M1444 M1463 M1482 M1501 M1520
                                            M1539 M1558 M1605 M1631 M1639 M1651 M1680 M1688 M1700 M1730 M1738 M1749 M1774
                                            M1782 M1793 M1830 M1838 M1849 M1889 M1897 M1908 M1936 M1939 M1945 M1956 M1992
                                            M2000 M2011 M2041 M2049 M2076 M2096 M2115 M2134 M2153 M2172 M2191 M2210 M2229
                                            M2274 M2281 M2309 M2316 M2323
      558   REC-CT . . . . . . . . . . . .  695 697 704
      557   REC-SKL-SUB. . . . . . . . . .  M663 M666 668
      292   RECKEY-NUM . . . . . . . . . .  M862 868 M876 890
      448   RECKEY-VALUE . . . . . . . . .  820 2307
      286   RECNO. . . . . . . . . . . . .  M964 M1015 M1066 M1164 M1222 M1324 M1633 M1682 M1732 M1832 M1891 M1994 M2276
                                            2307 2314 2321
      566   RECORD-COUNT . . . . . . . . .  M749 750 M762
      295   RECORD-KEY-CONTENT . . . . . .  446
      446   RECORD-KEY-DATA
      492   RECORDS-IN-FILE. . . . . . . .  M807
      291   RECORDS-WRITTEN. . . . . . . .  M844 846 847
      476   REELUNIT-NUMBER
      517   TEST-COMPUTED. . . . . . . . .  779
      532   TEST-CORRECT . . . . . . . . .  781
      585   TEST-ID. . . . . . . . . . . .  M660
      505   TEST-RESULTS . . . . . . . . .  M661 698
      563   TOTAL-ERROR
      480   UPDATE-NUMBER
      270   WRK-FS1-ALTKEY1. . . . . . . .  824 836 M867 942 988 1039 1090 1135 1188 1246 1294 1348 1611 1657 1706 1756 1800
                                            1856 1915 1963 2018 2255 M2312
      278   WRK-FS1-ALTKEY2. . . . . . . .  825 837 943 989 1040 1091 1136 1189 1247 1295 1349 1612 1658 1707 1757 1801 1857
                                            1916 1964 2019 2256 M2319
      265   WRK-FS1-RECKEY . . . . . . . .  823 835 M866 941 987 1038 1089 1134 1187 1245 1293 1347 1610 1656 1705 1755 1799
                                            1855 1914 1962 2017 2254 2296 M2305
      490   XBLOCK-SIZE. . . . . . . . . .  M804
      472   XFILE-NAME . . . . . . . . . .  M798
      494   XFILE-ORGANIZATION . . . . . .  M805
      496   XLABEL-TYPE. . . . . . . . . .  M806
      484   XPROGRAM-NAME. . . . . . . . .  M802
      499   XRECORD-KEY. . . . . . . . . .  M823 M835 1111 1270 1373 1940 2044 2305
      486   XRECORD-LENGTH . . . . . . . .  M803
      474   XRECORD-NAME . . . . . . . . .  M799
      478   XRECORD-NUMBER . . . . . . . .  M800 M818 M834 960 966 1011 1017 1062 1068 1160 1166 1218 1224 1320 1326 1629
                                            1635 1678 1684 1728 1734 1828 1834 1887 1893 1990 1996 2272 M2294 2302
      634   XXCOMPUTED . . . . . . . . . .  M788
      636   XXCORRECT. . . . . . . . . . .  M788
      629   XXINFO . . . . . . . . . . . .  775 790
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    49
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

      784   BAIL-OUT . . . . . . . . . . .  P701
      792   BAIL-OUT-EX. . . . . . . . . .  E701 G786
      787   BAIL-OUT-WRITE . . . . . . . .  G785
      767   BLANK-LINE-PRINT
     2327   CCVS-EXIT
      669   CCVS-INIT-EXIT
      665   CCVS-INIT-FILE . . . . . . . .  P664
     2328   CCVS-999999
      647   CCVS1
      793   CCVS1-EXIT . . . . . . . . . .  G670
      671   CLOSE-FILES. . . . . . . . . .  G2329
      711   COLUMN-NAMES-ROUTINE . . . . .  E662
      692   DE-LETE. . . . . . . . . . . .  P854 P973 P1024 P1075 P1120 P1173 P1231 P1279 P1333 P1381 P1395 P1415 P1434 P1453
                                            P1472 P1491 P1510 P1529 P1548 P1642 P1691 P1741 P1785 P1841 P1900 P1948 P2003
                                            P2052 P2066 P2086 P2105 P2124 P2143 P2162 P2181 P2200 P2219 P2284
     2311   DISPLAY-ALTERNATE-KEY1 . . . .  P1634 P1683 P1733 P1833 P1892 P1995
     2318   DISPLAY-ALTERNATE-KEY2 . . . .  P2277
     2304   DISPLAY-RECORD-KEYS. . . . . .  P965 P1016 P1067 P1165 P1223 P1325
      657   END-E-1. . . . . . . . . . . .  G651 G656
      682   END-E-2. . . . . . . . . . . .  G674 G681
      715   END-ROUTINE. . . . . . . . . .  P684
      719   END-ROUTINE-1
      728   END-ROUTINE-12
      736   END-ROUTINE-13 . . . . . . . .  E684
      717   END-RTN-EXIT
      691   FAIL . . . . . . . . . . . . .  P850 P882 P888 P968 P1019 P1070 P1110 P1168 P1226 P1269 P1328 P1372 P1406 P1424
                                            P1443 P1462 P1481 P1500 P1519 P1538 P1557 P1637 P1686 P1736 P1776 P1836 P1895
                                            P1938 P1998 P2043 P2077 P2095 P2114 P2133 P2152 P2171 P2190 P2209 P2228 P2279
      769   FAIL-ROUTINE . . . . . . . . .  P700
      783   FAIL-ROUTINE-EX. . . . . . . .  E700 G777
      778   FAIL-ROUTINE-WRITE . . . . . .  G771 G772
      706   HEAD-ROUTINE . . . . . . . . .  P662
      689   INSPT
      648   OPEN-FILES
      690   PASS . . . . . . . . . . . . .  P848 P881 P961 P1012 P1063 P1116 P1161 P1219 P1275 P1321 P1377 P1403 P1423 P1442
                                            P1461 P1480 P1499 P1518 P1537 P1556 P1630 P1679 P1729 P1781 P1829 P1888 P1944
                                            P1991 P2048 P2074 P2094 P2113 P2132 P2151 P2170 P2189 P2208 P2227 P2273
      694   PRINT-DETAIL . . . . . . . . .  P856 P893 P975 P1026 P1077 P1122 P1175 P1233 P1281 P1335 P1383 P1410 P1429 P1448
                                            P1467 P1486 P1505 P1524 P1543 P1562 P1644 P1693 P1743 P1787 P1843 P1902 P1950
                                            P2005 P2054 P2081 P2100 P2119 P2138 P2157 P2176 P2195 P2214 P2233 P2286 P2310
                                            P2317 P2324
      892   READ-EXIT-F1 . . . . . . . . .  G886
      887   READ-FAIL-F1 . . . . . . . . .  P872
      858   READ-INIT-F1
      879   READ-TEST-F1 . . . . . . . . .  G865 G874
      864   READ-TEST-F1-R1. . . . . . . .  G878
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    50
0 Defined   Cross-reference of procedures   References

0     795   SECT-0001-IX210A
     2288   START-CLOSE-FILES
      972   START-DELETE-GF-01 . . . . . .  G937
     1023   START-DELETE-GF-02 . . . . . .  G983
     1074   START-DELETE-GF-03 . . . . . .  G1034
     1119   START-DELETE-GF-04 . . . . . .  G1085
     1172   START-DELETE-GF-05 . . . . . .  G1130
     1230   START-DELETE-GF-06 . . . . . .  G1183
     1278   START-DELETE-GF-07 . . . . . .  G1241
     1332   START-DELETE-GF-08 . . . . . .  G1289
     1380   START-DELETE-GF-09 . . . . . .  G1343
     1641   START-DELETE-GF-19 . . . . . .  G1606
     1690   START-DELETE-GF-20 . . . . . .  G1652
     1740   START-DELETE-GF-21 . . . . . .  G1701
     1784   START-DELETE-GF-22 . . . . . .  G1751
     1840   START-DELETE-GF-23 . . . . . .  G1795
     1899   START-DELETE-GF-24 . . . . . .  G1851
     1947   START-DELETE-GF-25 . . . . . .  G1910
     2002   START-DELETE-GF-26 . . . . . .  G1958
     2051   START-DELETE-GF-27 . . . . . .  G2013
     2283   START-DELETE-GF-37
      974   START-EXIT-GF-01 . . . . . . .  G963 G971
     1025   START-EXIT-GF-02 . . . . . . .  G1014 G1022
     1076   START-EXIT-GF-03 . . . . . . .  G1065 G1073
     1121   START-EXIT-GF-04 . . . . . . .  G1114 G1118
     1174   START-EXIT-GF-05 . . . . . . .  G1163 G1171
     1232   START-EXIT-GF-06 . . . . . . .  G1221 G1229
     1280   START-EXIT-GF-07 . . . . . . .  G1273 G1277
     1334   START-EXIT-GF-08 . . . . . . .  G1323 G1331
     1382   START-EXIT-GF-09 . . . . . . .  G1375 G1379
     1643   START-EXIT-GF-19 . . . . . . .  G1632 G1640
     1692   START-EXIT-GF-20 . . . . . . .  G1681 G1689
     1742   START-EXIT-GF-21 . . . . . . .  G1731 G1739
     1786   START-EXIT-GF-22 . . . . . . .  G1779 G1783
     1842   START-EXIT-GF-23 . . . . . . .  G1831 G1839
     1901   START-EXIT-GF-24 . . . . . . .  G1890 G1898
     1949   START-EXIT-GF-25 . . . . . . .  G1942 G1946
     2004   START-EXIT-GF-26 . . . . . . .  G1993 G2001
     2053   START-EXIT-GF-27 . . . . . . .  G2046 G2050
     2285   START-EXIT-GF-37 . . . . . . .  G2275 G2282
      967   START-FAIL-GF-01 . . . . . . .  G954 G958
     1018   START-FAIL-GF-02 . . . . . . .  G1005 G1009
     1069   START-FAIL-GF-03 . . . . . . .  G1055 G1060
     1167   START-FAIL-GF-05 . . . . . . .  G1154 G1158
     1225   START-FAIL-GF-06 . . . . . . .  G1212 G1216
     1327   START-FAIL-GF-08 . . . . . . .  G1314 G1318
     1636   START-FAIL-GF-19 . . . . . . .  G1623 G1627
     1685   START-FAIL-GF-20 . . . . . . .  G1672 G1676
     1735   START-FAIL-GF-21 . . . . . . .  G1722 G1726
     1835   START-FAIL-GF-23 . . . . . . .  G1822 G1826
     1894   START-FAIL-GF-24 . . . . . . .  G1881 G1885
     1997   START-FAIL-GF-26 . . . . . . .  G1984 G1988
     2278   START-FAIL-GF-37 . . . . . . .  G2270
      895   START-INIT
     2236   START-INIT-GF-SERIES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    51
0 Defined   Cross-reference of procedures   References

0     931   START-INIT-GF-01
      976   START-INIT-GF-02
     1027   START-INIT-GF-03
     1078   START-INIT-GF-04
     1123   START-INIT-GF-05
     1176   START-INIT-GF-06
     1234   START-INIT-GF-07
     1282   START-INIT-GF-08
     1336   START-INIT-GF-09
     1386   START-INIT-GF-10
     1599   START-INIT-GF-19
     1565   START-INIT-GF-19-0
     1645   START-INIT-GF-20
     1694   START-INIT-GF-21
     1744   START-INIT-GF-22
     1788   START-INIT-GF-23
     1844   START-INIT-GF-24
     1903   START-INIT-GF-25
     1951   START-INIT-GF-26
     2006   START-INIT-GF-27
     2290   START-INITIALIZE-RECORD. . . .  P933 P979 P1028 P1079 P1124 P1177 P1235 P1283 P1337 P1600 P1646 P1695 P1745 P1789
                                            P1845 P1904 P1952 P2007
     1115   START-PASS-GF-04 . . . . . . .  G1105
     1274   START-PASS-GF-07 . . . . . . .  G1264
     1376   START-PASS-GF-09 . . . . . . .  G1367
     1780   START-PASS-GF-22 . . . . . . .  G1771
     1943   START-PASS-GF-25 . . . . . . .  G1933
     2047   START-PASS-GF-27 . . . . . . .  G2038
     1384   START-TERM-GF
     2325   START-TEST-COMPLETE. . . . . .  G2289
      944   START-TEST-GF-01
      990   START-TEST-GF-02
     1041   START-TEST-GF-03
     1092   START-TEST-GF-04
     1137   START-TEST-GF-05
     1190   START-TEST-GF-06
     1248   START-TEST-GF-07
     1296   START-TEST-GF-08
     1350   START-TEST-GF-09
     1393   START-TEST-GF-10
     1411   START-TEST-GF-11
     1430   START-TEST-GF-12
     1449   START-TEST-GF-13
     1468   START-TEST-GF-14
     1487   START-TEST-GF-15
     1506   START-TEST-GF-16
     1525   START-TEST-GF-17
     1544   START-TEST-GF-18
     1659   START-TEST-GF-20
     1708   START-TEST-GF-21
     1758   START-TEST-GF-22
     1802   START-TEST-GF-23
     1858   START-TEST-GF-24
     1917   START-TEST-GF-25
     1965   START-TEST-GF-26
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    52
0 Defined   Cross-reference of procedures   References

0    2020   START-TEST-GF-27
     2062   START-TEST-GF-28
     2082   START-TEST-GF-29
     2101   START-TEST-GF-30
     2120   START-TEST-GF-31
     2139   START-TEST-GF-32
     2158   START-TEST-GF-33
     2177   START-TEST-GF-34
     2196   START-TEST-GF-35
     2215   START-TEST-GF-36
     2250   START-TEST-GF-37
     1613   START-TEST-19
     1409   START-WRITE-GF-10. . . . . . .  G1396
     1428   START-WRITE-GF-11. . . . . . .  G1416
     1447   START-WRITE-GF-12. . . . . . .  G1435
     1466   START-WRITE-GF-13. . . . . . .  G1454
     1485   START-WRITE-GF-14. . . . . . .  G1473
     1504   START-WRITE-GF-15. . . . . . .  G1492
     1523   START-WRITE-GF-16. . . . . . .  G1511
     1542   START-WRITE-GF-17. . . . . . .  G1530
     1561   START-WRITE-GF-18. . . . . . .  G1549
     2080   START-WRITE-GF-28. . . . . . .  G2067
     2099   START-WRITE-GF-29. . . . . . .  G2087
     2118   START-WRITE-GF-30. . . . . . .  G2106
     2137   START-WRITE-GF-31. . . . . . .  G2125
     2156   START-WRITE-GF-32. . . . . . .  G2144
     2175   START-WRITE-GF-33. . . . . . .  G2163
     2194   START-WRITE-GF-34. . . . . . .  G2182
     2213   START-WRITE-GF-35. . . . . . .  G2201
     2232   START-WRITE-GF-36. . . . . . .  G2220
      687   TERMINATE-CALL
      685   TERMINATE-CCVS
      853   WRITE-DELETE-GF-1
      812   WRITE-INIT-GF-01
      796   WRITE-INT-GF
      748   WRITE-LINE . . . . . . . . . .  P698 P699 P707 P708 P709 P710 P712 P713 P714 P716 P718 P727 P735 P741 P746 P747
                                            P775 P779 P781 P790
      855   WRITE-TEST-GF-END. . . . . . .  G852
      817   WRITE-TEST-GF-01 . . . . . . .  P813 P815
      830   WRITE-TEST-GF-02 . . . . . . .  P814
      842   WRITE-TEST-GF-1. . . . . . . .  G816
      764   WRT-LN . . . . . . . . . . . .  P754 P755 P756 P757 P758 P759 P760 P763 P768
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    53
0 Defined   Cross-reference of programs     References

        3   IX210A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX210A    Date 06/04/2022  Time 12:00:46   Page    54
0LineID  Message code  Message text

    195  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

    220  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    223  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX210A:
 *    Source records = 2329
 *    Data Division statements = 163
 *    Procedure Division statements = 1134
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1142
0End of compilation 1,  program IX210A,  highest severity 0.
0Return code 0
