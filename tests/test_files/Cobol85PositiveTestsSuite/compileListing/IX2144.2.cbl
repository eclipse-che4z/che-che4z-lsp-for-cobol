1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:22   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:22   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2144.2
   000002         000200 PROGRAM-ID.                                                      IX2144.2
   000003         000300     IX214A.                                                      IX2144.2
   000004         000500*                                                              *  IX2144.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2144.2
   000006         000700*                                                              *  IX2144.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2144.2
   000008         000900*                                                              *  IX2144.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2144.2
   000010         001100*                                                              *  IX2144.2
   000011         001300*                                                              *  IX2144.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2144.2
   000013         001500*                                                              *  IX2144.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2144.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2144.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2144.2
   000017         001900*                                                              *  IX2144.2
   000018         002100*         "IX214A"                                                IX2144.2
   000019         002300*    THE PURPOSE OF THE  PROGRAM IS TO TEST USE OF THE            IX2144.2
   000020         002400*    START --- NOT LESS THAN --- STATEMENT USING FIRST THE PRIME  IX2144.2
   000021         002500*    RECORD KEY AND THEN WITH AN ALTERNATE RECORD KEY             IX2144.2
   000022         002600*    AS THE KEY OF REFERENCE.   THE START STATEMENT NAMES,        IX2144.2
   000023         002700*    IN ITS CONSTRUCT , EITHER THE DATA NAME SPECIFIED IN THE     IX2144.2
   000024         002800*    KEY CLAUSE OR A DATA ITEM THAT IS SUBORDINATE TO THE         IX2144.2
   000025         002900*    KEY NAME.   DIFFERENT KEY VALUES ARE USED FOR TESTING.       IX2144.2
   000026         003000*    IF A KEY VALUE IS PROVIDED WHICH MATCHES A RECORD IN THE FILEIX2144.2
   000027         003100*    WHEN THE START IS EXECUTED THEN THE RECORD IS EXPECTED TO    IX2144.2
   000028         003200*    MADE AVAILABLE BY THE SUBSEQUENT READ STATEMENT.  IF A KEY   IX2144.2
   000029         003300*    VALUE IS PROVIDED WHICH DOES NOT  MATCH ANY RECORD IN THE    IX2144.2
   000030         003400*    FILE THEN THE INVALID KEY PATH IS EXPECTED TO BE TAKEN.      IX2144.2
   000031         003500*    THE FILE STATUS CONTENTS RESULTING FROM EXECUTION OF THE     IX2144.2
   000032         003600*    START TESTS ARE SAVED AND CHECKED IN LATER TESTS.            IX2144.2
   000033         003700*                                                                 IX2144.2
   000034         003800*            REFERENCE   AMERICAN NATIONAL STANDARD               IX2144.2
   000035         003900*                        PROGRAMMING LANGUAGE COBOL, X3.23-1985.  IX2144.2
   000036         004000*                        SECTION IX, INDEX I-O, THE START         IX2144.2
   000037         004100*                        STATEMENT. PARAGRAPHS 4.7.3 (3), (4);    IX2144.2
   000038         004200*                                              4.7.4 (1), (4), (5)IX2144.2
   000039         004300*                                                        AND      IX2144.2
   000040         004400*                        THE FILE STATUS PARAGRAPH 1.3.4          IX2144.2
   000041         004500*                                                                 IX2144.2
   000042         004600*    BEFORE EXECUTION OF THE START IN EACH TEST, A RECORD IS MADE IX2144.2
   000043         004700*    AVAILABLE FROM THE FILE THAT IS DIFFERENT THAN WILL RESULT   IX2144.2
   000044         004800*    FROM THE TEST.  IF DURING THIS PROCEDURE AN INVALID KEY OCCURIX2144.2
   000045         004900*    THE TEST IS DELETED.  ALSO BEFORE EACH TEST THE RECORD KEY ISIX2144.2
   000046         005000*    LOADED WITH A KEY VALUE AND DEPENDING ON THE NATURE OF THE TEIX2144.2
   000047         005100*    THE KEY VALUE MAY OR MAY NOT BE A VALID KEY FOR THE FILE.    IX2144.2
   000048         005200*                                                                 IX2144.2
   000049         005300*    THIS PROGRAM FIRST CREATES AN  INDEXED SEQUENTIAL FILE       IX2144.2
   000050         005400*    CONTAINING TWO ALTERNATE KEYS AND  THE ONE REQUIRED RECORD   IX2144.2
   000051         005500*    KEY FOR THE FILE.  IMMEDIATELY FOLLOWING FILE CREATION THE   IX2144.2
   000052         005600*    FILE IS READ AND THE RECORDS OF THE FILE VERIFIED FOR        IX2144.2
   000053         005700*    ACCURACY.  NEXT THE TESTS ARE EXECUTED USING THE START ---   IX2144.2
   000054         005800*    NOT LESS THAN ---STATEMENT.                                  IX2144.2
   000055         005900*    THE RECORDS IN THE FILE ARE CREATED IN SEQUENTIAL ORDER BY   IX2144.2
   000056         006000*    RECORD KEY VALUE.  FOLLOWING  IS A SAMPLE OF THE DATA        IX2144.2
   000057         006100*    CONTENTS FOR THE RECORD KEY AND TWO ALTERNATE RECORD KEYS IN IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200*    THE FILE.                                                    IX2144.2
   000059         006300*                                                                 IX2144.2
   000060         006400*   REC-NO  RECORD-KEY      ALTERNATE-KEY-1     ALTERNATE-KEY-2   IX2144.2
   000061         006500*   ------  ----------      ---------------     ---------------   IX2144.2
   000062         006600*    001   BBBBBBBBBC002 EEEEEEEEEF000ALTKEY1 WWWWWWWWWV398ALTKEY2IX2144.2
   000063         006700*    002   BBBBBBBBCC004 EEEEEEEEFF004ALTKEY1 WWWWWWWWVV396ALTKEY2IX2144.2
   000064         006800*    003   BBBBBBBCCC006 EEEEEEEFFF006ALTKEY1 WWWWWWWVVV394ALTKEY2IX2144.2
   000065         006900*     .          .                 .                    .         IX2144.2
   000066         007000*     .          .                 .                    .         IX2144.2
   000067         007100*     .          .                 .                    .         IX2144.2
   000068         007200*    010   CCCCCCCCCC020 FFFFFFFFFF020ALTKEY1 VVVVVVVVVV380ALTKEY2IX2144.2
   000069         007300*    011   CCCCCCCCCD022 FFFFFFFFFG022ALTKEY1 VVVVVVVVVV380ALTKEY2IX2144.2
   000070         007400*    012   CCCCCCCCDD024 FFFFFFFFGG024ALTKEY1 VVVVVVVVUU376ALTKEY2IX2144.2
   000071         007500*     .          .                 .                    .         IX2144.2
   000072         007600*     .          .                 .                    .         IX2144.2
   000073         007700*     .          .                 .                    .         IX2144.2
   000074         007800*    200   UUUUUUUUUU400 YYYYYYYYYY400ALTKEY1 DDDDDDDDDD000ALTKEY2IX2144.2
   000075         007900*                                                                 IX2144.2
   000076         008000*     NOTE 1 - ALTERNATE KEY NUMBER 2 CONTAINS DUPLICATE KEYS     IX2144.2
   000077         008100*              EVERY 10TH AND 11TH RECORDS.                       IX2144.2
   000078         008200*                                                                 IX2144.2
   000079         008300*     NOTE 2 - THE FIRST 50 RECORDS AND LAST 25 RECORDS OF THE    IX2144.2
   000080         008400*    FILE FOLLOW THE ABOVE SEQUENTIAL KEY PATTERN.  FOR THE MIDDLEIX2144.2
   000081         008500*    125 RECORDS ONLY THE NUMBER PART OF THE KEYS ARE VARIED      IX2144.2
   000082         008600*    AND VARIED IN THE SEQUENCE SHOWN ABOVE.  THAT IS, RECORD-KEY IX2144.2
   000083         008700*    AND ALTERNATE-KEY-1 ARE INCREMENTED BY 2 AND THE ALTERNATE-  IX2144.2
   000084         008800*    KEY-2 IS DECREMENTED BY 2 EACH TIME A RECORD IS WRITTEN TO   IX2144.2
   000085         008900*    THE FILE.  THE FILE IS DESIGNED TO BE LARGE ENOUGH SO THAT   IX2144.2
   000086         009000*    AN I-O OPERATION IS REQUIRED FOR EACH RECORD ACCESSED FROM   IX2144.2
   000087         009100*    THE FILE.                                                    IX2144.2
   000088         009200*                                                                 IX2144.2
   000089         009300*    FILE CHARACTERISTICS ARE: FILE SIZE            = 200 RECORDS IX2144.2
   000090         009400*                              RECORD SIZE          = 240 CHARS.  IX2144.2
   000091         009500*                              RECORD KEY SIZE      = 13  CHARS.  IX2144.2
   000092         009600*                              ALTERNATE KEY 1 SIZE = 20  CHARS.  IX2144.2
   000093         009700*                              ALTERNATE KEY 2 SIZE = 20  CHARS.  IX2144.2
   000094         009800*                              ACCESS MODE          = SEQUENTIAL  IX2144.2
   000095         009900*                                                                 IX2144.2
   000096         010000*    A LIST OF COBOL ELEMENTS WITH THE PARAGRAPH NAME IN PARENTH- IX2144.2
   000097         010100*    ESIS THAT TESTS THE ELEMENT AND A SHORT DESCRIPTION OF THE   IX2144.2
   000098         010200*    TEST FOLLOWS.                                                IX2144.2
   000099         010300*                                                                 IX2144.2
   000100         010400*      PROGRAM COLLATING SEQUENCE CLAUSE. (ALL START TESTS) -     IX2144.2
   000101         010500*            THE PROGRAM COLLATING SEQUENCE CLAUSE SHOULD HAVE NO IX2144.2
   000102         010600*            EFFECT ON THE COMARAISIONS ASSOCIATED WITH THE START IX2144.2
   000103         010700*            STATEMENT.  THIS PROGRAM ASSUMES THAT THE PROGRAM    IX2144.2
   000104         010800*            COLLATING SEQUENCE CLAUSE ALSO DOES NOT IN ANY WAY   IX2144.2
   000105         010900*            EFFECT THE SEQUENTIAL ORDER OF RECORDS ACCESSED      IX2144.2
   000106         011000*            FROM OR WRITTEN TO THE FILE.                         IX2144.2
   000107         011100*      WRITE --- INVALID KEY---. (INX-TEST-001) - THIS TEST CREATEIX2144.2
   000108         011200*            A FILE OF 200 RECORDS CONTAINING ONE RECORD KEY AND  IX2144.2
   000109         011300*            TWO ALTERNATE KEYS.                                  IX2144.2
   000110         011400*      READ ---AT END ---. (INX-TEST-002) - THIS TEST READS THE   IX2144.2
   000111         011500*            FILE CREATED IN INX-TEST-001 AND VERIFIES THAT   THE IX2144.2
   000112         011600*            FILE WAS CREATED CORRECTLY.                          IX2144.2
   000113         011700*      START ---KEY NOT LESS THAN RECORD-KEY INVALID KEY ---. (INXIX2144.2
   000114         011800*            TEST-003.01 THRU INX-TEST-003.04) - THE START        IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011900*            STATEMENT IS EXECUTED USING THE RECORD-KEY FOR THE   IX2144.2
   000116         012000*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2144.2
   000117         012100*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2144.2
   000118         012200*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2144.2
   000119         012300*            (.03) AND NOT LESS THAN THAN THE LAST RECORD IN THE  IX2144.2
   000120         012400*            FILE (.04).                                          IX2144.2
   000121         012500*      START ---KEY NOT LESS THAN DATA-ITEM  INVALID KEY ---. (INXIX2144.2
   000122         012600*            TEST-003.05 THRU INX-TEST-003.09) - THE START        IX2144.2
   000123         012700*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2144.2
   000124         012800*            SUBORDINATE TO  THE RECORD-KEY NAME OF THE FILE      IX2144.2
   000125         012900*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2144.2
   000126         013000*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2144.2
   000127         013100*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2144.2
   000128         013200*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2144.2
   000129         013300*            THE FIRST RECORD IN THE FILE (.08) AND NOT LESS THAN IX2144.2
   000130         013400*            THE LAST RECORD IN THE FILE (.09.                    IX2144.2
   000131         013500*                                                                 IX2144.2
   000132         013600*            NOTE -- IN SOME OF THE TESTS THE DATA ITEM SPECIFIED IX2144.2
   000133         013700*                    IS AN ENTRY SUBORDINATE TO A REDEFINES       IX2144.2
   000134         013800*                    ENTRY WHICH USES AS ITS OBJECT THE KEY       IX2144.2
   000135         013900*                   NAMED BY THE RECORD KEY CLAUSE.               IX2144.2
   000136         014000*                                                                 IX2144.2
   000137         014100*      FILE STATUS. (INX-TEST-004.01 THRU INX-TEST-004.09) - THESEIX2144.2
   000138         014200*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2144.2
   000139         014300*            FROM THE START IN INX-TEST-003.01 THRU               IX2144.2
   000140         014400*            INX-TEST-003.09.                                     IX2144.2
   000141         014500*      START ---KEY NOT LESS THAN ALTNATE-KEY INVALID KEY --. (INXIX2144.2
   000142         014600*            TEST-005.01 THRU INX-TEST-005.04) - THE START        IX2144.2
   000143         014700*            STATEMENT IS EXECUTED USING THE ALTERNATE-KEY FOR THEIX2144.2
   000144         014800*            FILE CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2144.2
   000145         014900*            RECORD IN THE FILE (.01), BETWEEN TWO EXISTING KEY   IX2144.2
   000146         015000*            VALUES (02), LESS THAN THE FIRST RECORD IN THE FILE  IX2144.2
   000147         015100*            (.03) AND NOT LESS THAN THAN THE LAST RECORD IN THE  IX2144.2
   000148         015200*            FILE (.04).                                          IX2144.2
   000149         015300*      START ---KEY NOT LESS THAN DATA-ITEM   INVALID KEY --. (INXIX2144.2
   000150         015400*            TEST-005.05 THRU INX-TEST-005.09) - THE START        IX2144.2
   000151         015500*            STATEMENT IS EXECUTED USING A DATA ITEM WHICH IS     IX2144.2
   000152         015600*            SUBORDINATE TO THE ALTERNATE-KEY NAME OF THE FILE    IX2144.2
   000153         015700*            AND  CONTAINING KEY VALUES WHICH RESPECTIVELY EQUAL AIX2144.2
   000154         015800*            RECORD IN THE FILE (.05), EQUAL A VALUE PRESENT IN   IX2144.2
   000155         015900*            IN MORE THAN ONE RECORD IN THE FILE (.06),           IX2144.2
   000156         016000*            NOT EQUAL TO ANY RECORD IN THE FILE (.07, LESS THAN  IX2144.2
   000157         016100*            THE FIRST RECORD IN THE FILE (.08) AND NOT LESS THAN IX2144.2
   000158         016200*            THE LAST RECORD IN THE FILE (.09.                    IX2144.2
   000159         016300*                                                                 IX2144.2
   000160         016400*            NOTE -- IN SOME OF THE TESTS THE DATA ITEM SPECIFIED IX2144.2
   000161         016500*                    IS AN ENTRY SUBORDINATE TO A REDEFINES       IX2144.2
   000162         016600*                    ENTRY WHICH USES AS ITS OBJECT THE KEY       IX2144.2
   000163         016700*                   NAMED BY THE RECORD KEY CLAUSE.               IX2144.2
   000164         016800*                                                                 IX2144.2
   000165         016900*      FILE STATUS. (INX-TEST-006.01 THRU INX-TEST-006.09) - THESEIX2144.2
   000166         017000*            TESTS CHECK THE CONTENTS OF THE FILE STATUS RESULTINGIX2144.2
   000167         017100*            FROM THE START IN INX-TEST-005.01 THRU               IX2144.2
   000168         017200*            INX-TEST-005.09.                                     IX2144.2
   000169         017300*      MULTIPLE STARTS. (INX-TEST-007) -  THIS TEST EXECUTES      IX2144.2
   000170         017400*            SEVERAL START STATEMENTS FOLLOWED BY A READ STATEMENTIX2144.2
   000171         017500*            AND EXPECTS THE RECORD  DESIGNATED BY THE LAST       IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000172         017600*            START BE MADE AVAILABLE.                             IX2144.2
   000173         017700*                                                                 IX2144.2
   000174         017900*                                                                 IX2144.2
   000175         018000 ENVIRONMENT DIVISION.                                            IX2144.2
   000176         018100 CONFIGURATION SECTION.                                           IX2144.2
   000177         018200 SOURCE-COMPUTER.                                                 IX2144.2
   000178         018300     XXXXX082.                                                    IX2144.2
   000179         018400 OBJECT-COMPUTER.                                                 IX2144.2
   000180         018500     XXXXX083                                                     IX2144.2
   000181         018600          PROGRAM COLLATING SEQUENCE IS FOR-INX-START-TEST.       IX2144.2 184
   000182         018700 SPECIAL-NAMES.                                                   IX2144.2
   000183         018800     ALPHABET                                                     IX2144.2
   000184         018900     FOR-INX-START-TEST IS "WVUTSRJIHGFEDCB".                     IX2144.2
   000185         019000 INPUT-OUTPUT SECTION.                                            IX2144.2
   000186         019100 FILE-CONTROL.                                                    IX2144.2
   000187         019200     SELECT RAW-DATA   ASSIGN TO                                  IX2144.2 207
   000188         019300     XXXXX062                                                     IX2144.2
   000189         019400            ORGANIZATION IS INDEXED                               IX2144.2
   000190         019500            ACCESS MODE IS RANDOM                                 IX2144.2
   000191         019600            RECORD KEY IS RAW-DATA-KEY.                           IX2144.2 210
   000192         019700     SELECT PRINT-FILE ASSIGN TO                                  IX2144.2 222
   000193         019800     XXXXX055.                                                    IX2144.2
   000194         019900     SELECT  IX-FS1                                               IX2144.2 225
   000195         020000     ASSIGN TO                                                    IX2144.2
   000196         020100     XXXXX024                                                     IX2144.2
   000197         020200     XXXXX044                                                     IX2144.2

 ==000197==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000198         020300        ACCESS MODE IS SEQUENTIAL                                 IX2144.2
   000199         020400        ORGANIZATION IS INDEXED                                   IX2144.2
   000200         020500        RECORD KEY IS IX-FS1-KEY                                  IX2144.2 234
   000201         020600        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY1                    IX2144.2 245
   000202         020700        ALTERNATE RECORD KEY IS IX-FS1-ALTKEY2 WITH DUPLICATES    IX2144.2 258
   000203         020800        FILE STATUS IS FS1-STATUS.                                IX2144.2 289
   000204         020900 DATA DIVISION.                                                   IX2144.2
   000205         021000 FILE SECTION.                                                    IX2144.2
   000206         021100                                                                  IX2144.2
   000207         021200 FD  RAW-DATA.                                                    IX2144.2
   000208         021300                                                                  IX2144.2
   000209         021400 01  RAW-DATA-SATZ.                                               IX2144.2
   000210         021500     05  RAW-DATA-KEY        PIC X(6).                            IX2144.2
   000211         021600     05  C-DATE              PIC 9(6).                            IX2144.2
   000212         021700     05  C-TIME              PIC 9(8).                            IX2144.2
   000213         021800     05  C-NO-OF-TESTS       PIC 99.                              IX2144.2
   000214         021900     05  C-OK                PIC 999.                             IX2144.2
   000215         022000     05  C-ALL               PIC 999.                             IX2144.2
   000216         022100     05  C-FAIL              PIC 999.                             IX2144.2
   000217         022200     05  C-DELETED           PIC 999.                             IX2144.2
   000218         022300     05  C-INSPECT           PIC 999.                             IX2144.2
   000219         022400     05  C-NOTE              PIC X(13).                           IX2144.2
   000220         022500     05  C-INDENT            PIC X.                               IX2144.2
   000221         022600     05  C-ABORT             PIC X(8).                            IX2144.2
   000222         022700 FD  PRINT-FILE.                                                  IX2144.2

 ==000222==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   000223         022800 01  PRINT-REC PICTURE X(120).                                    IX2144.2
   000224         022900 01  DUMMY-RECORD PICTURE X(120).                                 IX2144.2
   000225         023000 FD  IX-FS1                                                       IX2144.2

 ==000225==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000226         023100     LABEL RECORDS ARE STANDARD                                   IX2144.2
   000227         023200     DATA RECORD IS IX-FS1R1-F-G-240                              IX2144.2 *
   000228         023300     RECORD CONTAINS 240 CHARACTERS.                              IX2144.2
   000229         023400 01  IX-FS1R1-F-G-240.                                            IX2144.2
   000230         023500     05 IX-FS1-REC-120           PICTURE X(120).                  IX2144.2
   000231         023600     05 IX-FS1-REC-121-240.                                       IX2144.2
   000232         023700        10 FILLER                PICTURE X(8).                    IX2144.2
   000233         023800        10 IX-REC-KEY-AREA.                                       IX2144.2
   000234         023900           15 IX-FS1-KEY.                                         IX2144.2
   000235         024000              20 IX-FS1-KEY-1-10.                                 IX2144.2
   000236         024100                 25 IX-FS1-KEY-1-5      PICTURE X(5).             IX2144.2
   000237         024200                 25 IX-FS1-KEY-6-10     PICTURE X(5).             IX2144.2
   000238         024300               20 IX-FS1-KEY-11-13      PICTURE X(3).             IX2144.2
   000239         024400           15 IX-REDF-RECKEY REDEFINES IX-FS1-KEY.                IX2144.2 234
   000240         024500              20 R-RECKEY-1-7    PICTURE X(7).                    IX2144.2
   000241         024600              20 R-RECKEY-8-13   PICTURE X(6).                    IX2144.2
   000242         024700           15 FILLER             PICTURE X(16).                   IX2144.2
   000243         024800        10 FILLER                PICTURE X(9).                    IX2144.2
   000244         024900        10 IX-ALT-KEY1-AREA.                                      IX2144.2
   000245         025000           15 IX-FS1-ALTKEY1.                                     IX2144.2
   000246         025100              20 IX-FS1-ALTKEY1-1-10.                             IX2144.2
   000247         025200                 25 IX-FS1-ALTKEY1-1-5  PICTURE X(5).             IX2144.2
   000248         025300                 25 IX-FS1-ALTKEY1-6-10 PICTURE X(5).             IX2144.2
   000249         025400              20 IX-FS1-ALTKEY1-11-13   PICTURE X(3).             IX2144.2
   000250         025500              20 IX-FS1-ALTKEY1-14-20   PICTURE X(7).             IX2144.2
   000251         025600           15 IX-REDF-ALTKEY1 REDEFINES IX-FS1-ALTKEY1.           IX2144.2 245
   000252         025700              20 R-ALTKEY1-1-6   PICTURE X(6).                    IX2144.2
   000253         025800              20 R-ALTKEY1-7-10  PICTURE X(4).                    IX2144.2
   000254         025900              20 R-ALTKEY1-11-20 PICTURE X(10).                   IX2144.2
   000255         026000           15 FILLER             PICTURE X(9).                    IX2144.2
   000256         026100        10 FILLER                PICTURE X(9).                    IX2144.2
   000257         026200        10 IX-ALT-KEY2-AREA.                                      IX2144.2
   000258         026300           15 IX-FS1-ALTKEY2.                                     IX2144.2
   000259         026400              20 IX-FS1-ALTKEY2-1-10.                             IX2144.2
   000260         026500                 25 IX-FS1-ALTKEY2-1-5  PICTURE X(5).             IX2144.2
   000261         026600                 25 IX-FS1-ALTKEY2-6-10 PICTURE X(5).             IX2144.2
   000262         026700              20 IX-FS1-ALTKEY2-11-13   PICTURE X(3).             IX2144.2
   000263         026800              20 IX-FS1-ALTKEY2-14-20   PICTURE X(7).             IX2144.2
   000264         026900           15 FILLER             PICTURE X(9).                    IX2144.2
   000265         027000        10 FILLER                PICTURE X(7).                    IX2144.2
   000266         027100 WORKING-STORAGE SECTION.                                         IX2144.2
   000267         027200 01  WRK-FS1-RECKEY.                                              IX2144.2
   000268         027300     05 FS1-RECKEY-1-13.                                          IX2144.2
   000269         027400        10 FS1-RECKEY-1-10       PICTURE X(10).                   IX2144.2
   000270         027500        10 FS1-RECKEY-11-13      PICTURE 9(3).                    IX2144.2
   000271         027600     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX2144.2 IMP
   000272         027700 01  WRK-FS1-ALTKEY1.                                             IX2144.2
   000273         027800      05 FS1-ALTKEY1-1-20.                                        IX2144.2
   000274         027900       10  FS1-ALTKEY1-1-10.                                      IX2144.2
   000275         028000        15 FS1-ALTKEY1-1-5       PICTURE X(5).                    IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         028100        15 FS1-ALTKEY1-6-10      PICTURE X(5).                    IX2144.2
   000277         028200       10 FS1-ALTKEY1-11-13      PICTURE 9(3).                    IX2144.2
   000278         028300       10 FS1-ALTKEY1-14-20      PICTURE X(7).                    IX2144.2
   000279         028400     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX2144.2 IMP
   000280         028500 01  WRK-FS1-ALTKEY2.                                             IX2144.2
   000281         028600     05 FS1-ALTKEY2-1-20.                                         IX2144.2
   000282         028700        10 FS1-ALTKEY2-1-10.                                      IX2144.2
   000283         028800           15 FS1-ALTKEY2-1-5    PICTURE X(5).                    IX2144.2
   000284         028900           15 FS1-ALTKEY2-6-10   PICTURE X(5).                    IX2144.2
   000285         029000        10 FS1-ALTKEY2-11-13     PICTURE 9(3).                    IX2144.2
   000286         029100        10 FS1-ALTKEY2-14-20     PICTURE X(7).                    IX2144.2
   000287         029200     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX2144.2 IMP
   000288         029300 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX2144.2 IMP
   000289         029400 01  FS1-STATUS                  PICTURE XX   VALUE SPACE.        IX2144.2 IMP
   000290         029500 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX2144.2 IMP
   000291         029600 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX2144.2
   000292         029700 01  INVKEY-COUNTER              PICTURE 9(3) COMPUTATIONAL.      IX2144.2
   000293         029800 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX2144.2
   000294         029900 01  RECKEY-NUM                  PICTURE 9(3).                    IX2144.2
   000295         030000 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX2144.2
   000296         030100 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX2144.2
   000297         030200 01  RECORD-KEY-CONTENT.                                          IX2144.2
   000298         030300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000299         030400          "BBBBBBBBBC002EEEEEEEEEF002ALTKEY1WWWWWWWWWV398ALTKEY2".IX2144.2
   000300         030500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000301         030600          "BBBBBBBBCC004EEEEEEEEFF004ALTKEY1WWWWWWWWVV396ALTKEY2".IX2144.2
   000302         030700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000303         030800          "BBBBBBBCCC006EEEEEEEFFF006ALTKEY1WWWWWWWVVV394ALTKEY2".IX2144.2
   000304         030900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000305         031000          "BBBBBBCCCC008EEEEEEFFFF008ALTKEY1WWWWWWVVVV392ALTKEY2".IX2144.2
   000306         031100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000307         031200          "BBBBBCCCCC010EEEEEFFFFF010ALTKEY1WWWWWVVVVV390ALTKEY2".IX2144.2
   000308         031300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000309         031400          "BBBBCCCCCC012EEEEFFFFFF012ALTKEY1WWWWVVVVVV388ALTKEY2".IX2144.2
   000310         031500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000311         031600          "BBBCCCCCCC014EEEFFFFFFF014ALTKEY1WWWVVVVVVV386ALTKEY2".IX2144.2
   000312         031700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000313         031800          "BBCCCCCCCC016EEFFFFFFFF016ALTKEY1WWVVVVVVVV384ALTKEY2".IX2144.2
   000314         031900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000315         032000          "BCCCCCCCCC018EFFFFFFFFF018ALTKEY1WVVVVVVVVV382ALTKEY2".IX2144.2
   000316         032100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000317         032200          "CCCCCCCCCC020FFFFFFFFFF020ALTKEY1VVVVVVVVVV380ALTKEY2".IX2144.2
   000318         032300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000319         032400          "CCCCCCCCCD022FFFFFFFFFG022ALTKEY1VVVVVVVVVV380ALTKEY2".IX2144.2
   000320         032500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000321         032600          "CCCCCCCCDD024FFFFFFFFGG024ALTKEY1VVVVVVVVUU376ALTKEY2".IX2144.2
   000322         032700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000323         032800          "CCCCCCCDDD026FFFFFFFGGG026ALTKEY1VVVVVVVUUU374ALTKEY2".IX2144.2
   000324         032900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000325         033000          "CCCCCCDDDD028FFFFFFGGGG028ALTKEY1VVVVVVUUUU372ALTKEY2".IX2144.2
   000326         033100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000327         033200          "CCCCCDDDDD030FFFFFGGGGG030ALTKEY1VVVVVUUUUU370ALTKEY2".IX2144.2
   000328         033300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000329         033400          "CCCCDDDDDD032FFFFGGGGGG032ALTKEY1VVVVUUUUUU368ALTKEY2".IX2144.2
   000330         033500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000331         033600          "CCCDDDDDDD034FFFGGGGGGG034ALTKEY1VVVUUUUUUU366ALTKEY2".IX2144.2
   000332         033700     05 FILLER PIC X(53) VALUE                                    IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033800          "CCDDDDDDDD036FFGGGGGGGG036ALTKEY1VVUUUUUUUU364ALTKEY2".IX2144.2
   000334         033900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000335         034000          "CDDDDDDDDD038FGGGGGGGGG038ALTKEY1VUUUUUUUUU362ALTKEY2".IX2144.2
   000336         034100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000337         034200          "DDDDDDDDDD040GGGGGGGGGG040ALTKEY1UUUUUUUUUU360ALTKEY2".IX2144.2
   000338         034300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000339         034400          "DDDDDDDDDE042GGGGGGGGGH042ALTKEY1UUUUUUUUUU360ALTKEY2".IX2144.2
   000340         034500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000341         034600          "DDDDDDDDEE044GGGGGGGGHH044ALTKEY1UUUUUUUUTT356ALTKEY2".IX2144.2
   000342         034700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000343         034800          "DDDDDDDEEE046GGGGGGGHHH046ALTKEY1UUUUUUUTTT354ALTKEY2".IX2144.2
   000344         034900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000345         035000          "DDDDDDEEEE048GGGGGGHHHH048ALTKEY1UUUUUUTTTT352ALTKEY2".IX2144.2
   000346         035100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000347         035200          "DDDDDEEEEE050GGGGGHHHHH050ALTKEY1UUUUUTTTTT350ALTKEY2".IX2144.2
   000348         035300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000349         035400          "DDDDEEEEEE052GGGGHHHHHH052ALTKEY1UUUUTTTTTT348ALTKEY2".IX2144.2
   000350         035500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000351         035600          "DDDEEEEEEE054GGGHHHHHHH054ALTKEY1UUUTTTTTTT346ALTKEY2".IX2144.2
   000352         035700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000353         035800          "DDEEEEEEEE056GGHHHHHHHH056ALTKEY1UUTTTTTTTT344ALTKEY2".IX2144.2
   000354         035900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000355         036000          "DEEEEEEEEE058GHHHHHHHHH058ALTKEY1UTTTTTTTTT342ALTKEY2".IX2144.2
   000356         036100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000357         036200          "EEEEEEEEEE060HHHHHHHHHH060ALTKEY1TTTTTTTTTT340ALTKEY2".IX2144.2
   000358         036300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000359         036400          "EEEEEEEEEF062HHHHHHHHHI062ALTKEY1TTTTTTTTTT340ALTKEY2".IX2144.2
   000360         036500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000361         036600          "EEEEEEEEFF064HHHHHHHHII064ALTKEY1TTTTTTTTSS336ALTKEY2".IX2144.2
   000362         036700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000363         036800          "EEEEEEEFFF066HHHHHHHIII066ALTKEY1TTTTTTTSSS334ALTKEY2".IX2144.2
   000364         036900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000365         037000          "EEEEEEFFFF068HHHHHHIIII068ALTKEY1TTTTTTSSSS332ALTKEY2".IX2144.2
   000366         037100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000367         037200          "EEEEEFFFFF070HHHHHIIIII070ALTKEY1TTTTTSSSSS330ALTKEY2".IX2144.2
   000368         037300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000369         037400          "EEEEFFFFFF072HHHHIIIIII072ALTKEY1TTTTSSSSSS328ALTKEY2".IX2144.2
   000370         037500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000371         037600          "EEEFFFFFFF074HHHIIIIIII074ALTKEY1TTTSSSSSSS326ALTKEY2".IX2144.2
   000372         037700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000373         037800          "EEFFFFFFFF076HHIIIIIIII076ALTKEY1TTSSSSSSSS324ALTKEY2".IX2144.2
   000374         037900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000375         038000          "EFFFFFFFFF078HIIIIIIIII078ALTKEY1TSSSSSSSSS322ALTKEY2".IX2144.2
   000376         038100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000377         038200          "FFFFFFFFFF080IIIIIIIIII080ALTKEY1SSSSSSSSSS320ALTKEY2".IX2144.2
   000378         038300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000379         038400          "FFFFFFFFFG082IIIIIIIIIJ082ALTKEY1SSSSSSSSSS320ALTKEY2".IX2144.2
   000380         038500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000381         038600          "FFFFFFFFGG084IIIIIIIIJJ084ALTKEY1SSSSSSSSRR316ALTKEY2".IX2144.2
   000382         038700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000383         038800          "FFFFFFFGGG086IIIIIIIJJJ086ALTKEY1SSSSSSSRRR314ALTKEY2".IX2144.2
   000384         038900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000385         039000          "FFFFFFGGGG088IIIIIIJJJJ088ALTKEY1SSSSSSRRRR312ALTKEY2".IX2144.2
   000386         039100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000387         039200          "FFFFFGGGGG090IIIIIJJJJJ090ALTKEY1SSSSSRRRRR310ALTKEY2".IX2144.2
   000388         039300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000389         039400          "FFFFGGGGGG092IIIIJJJJJJ092ALTKEY1SSSSRRRRRR308ALTKEY2".IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000391         039600          "FFFGGGGGGG094IIIJJJJJJJ094ALTKEY1SSSRRRRRRR306ALTKEY2".IX2144.2
   000392         039700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000393         039800          "FFGGGGGGGG096IIJJJJJJJJ096ALTKEY1SSRRRRRRRR304ALTKEY2".IX2144.2
   000394         039900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000395         040000          "FGGGGGGGGG098IJJJJJJJJJ098ALTKEY1SRRRRRRRRR302ALTKEY2".IX2144.2
   000396         040100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000397         040200          "GGGGGGGGGG100JJJJJJJJJJ100ALTKEY1RRRRRRRRRR300ALTKEY2".IX2144.2
   000398         040300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000399         040400          "RRRRSSSSSS352VVVVWWWWWW352ALTKEY1GGGGFFFFFF048ALTKEY2".IX2144.2
   000400         040500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000401         040600          "RRRSSSSSSS354VVVWWWWWWW354ALTKEY1GGGFFFFFFF046ALTKEY2".IX2144.2
   000402         040700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000403         040800          "RRSSSSSSSS356VVWWWWWWWW356ALTKEY1GGFFFFFFFF044ALTKEY2".IX2144.2
   000404         040900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000405         041000          "RSSSSSSSSS358VWWWWWWWWW358ALTKEY1GFFFFFFFFF042ALTKEY2".IX2144.2
   000406         041100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000407         041200          "SSSSSSSSSS360WWWWWWWWWW360ALTKEY1FFFFFFFFFF040ALTKEY2".IX2144.2
   000408         041300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000409         041400          "SSSSSSSSST362WWWWWWWWWX362ALTKEY1FFFFFFFFFF040ALTKEY2".IX2144.2
   000410         041500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000411         041600          "SSSSSSSSTT364WWWWWWWWXX364ALTKEY1FFFFFFFFEE036ALTKEY2".IX2144.2
   000412         041700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000413         041800          "SSSSSSSTTT366WWWWWWWXXX366ALTKEY1FFFFFFFEEE034ALTKEY2".IX2144.2
   000414         041900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000415         042000          "SSSSSSTTTT368WWWWWWXXXX368ALTKEY1FFFFFFEEEE032ALTKEY2".IX2144.2
   000416         042100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000417         042200          "SSSSSTTTTT370WWWWWXXXXX370ALTKEY1FFFFFEEEEE030ALTKEY2".IX2144.2
   000418         042300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000419         042400          "SSSSTTTTTT372WWWWXXXXXX372ALTKEY1FFFFEEEEEE028ALTKEY2".IX2144.2
   000420         042500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000421         042600          "SSSTTTTTTT374WWWXXXXXXX374ALTKEY1FFFEEEEEEE026ALTKEY2".IX2144.2
   000422         042700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000423         042800          "SSTTTTTTTT376WWXXXXXXXX376ALTKEY1FFEEEEEEEE024ALTKEY2".IX2144.2
   000424         042900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000425         043000          "STTTTTTTTT378WXXXXXXXXX378ALTKEY1FEEEEEEEEE022ALTKEY2".IX2144.2
   000426         043100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000427         043200          "TTTTTTTTTT380XXXXXXXXXX380ALTKEY1EEEEEEEEEE020ALTKEY2".IX2144.2
   000428         043300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000429         043400          "TTTTTTTTTU382XXXXXXXXXY382ALTKEY1EEEEEEEEEE020ALTKEY2".IX2144.2
   000430         043500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000431         043600          "TTTTTTTTUU384XXXXXXXXYY384ALTKEY1EEEEEEEEDD016ALTKEY2".IX2144.2
   000432         043700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000433         043800          "TTTTTTTUUU386XXXXXXXYYY386ALTKEY1EEEEEEEDDD014ALTKEY2".IX2144.2
   000434         043900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000435         044000          "TTTTTTUUUU388XXXXXXYYYY388ALTKEY1EEEEEEDDDD012ALTKEY2".IX2144.2
   000436         044100     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000437         044200          "TTTTTUUUUU390XXXXXYYYYY390ALTKEY1EEEEEDDDDD010ALTKEY2".IX2144.2
   000438         044300     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000439         044400          "TTTTUUUUUU392XXXXYYYYYY392ALTKEY1EEEEDDDDDD008ALTKEY2".IX2144.2
   000440         044500     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000441         044600          "TTTUUUUUUU394XXXYYYYYYY394ALTKEY1EEEDDDDDDD006ALTKEY2".IX2144.2
   000442         044700     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000443         044800          "TTUUUUUUUU396XXYYYYYYYY396ALTKEY1EEDDDDDDDD004ALTKEY2".IX2144.2
   000444         044900     05 FILLER PIC X(53) VALUE                                    IX2144.2
   000445         045000          "TUUUUUUUUU398XYYYYYYYYY398ALTKEY1EDDDDDDDDD002ALTKEY2".IX2144.2
   000446         045100     05 FILLER PIC X(53) VALUE                                    IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045200          "UUUUUUUUUU400YYYYYYYYYY400ALTKEY1DDDDDDDDDD000ALTKEY2".IX2144.2
   000448         045300 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX2144.2 297
   000449         045400     05 KEY-VALUES                  OCCURS 75  TIMES.             IX2144.2
   000450         045500       10 RECKEY-VALUE           PICTURE X(13).                   IX2144.2
   000451         045600       10 ALTKEY1-VALUE          PICTURE X(20).                   IX2144.2
   000452         045700       10 ALTKEY2-VALUE          PICTURE X(20).                   IX2144.2
   000453         045800 01  INIT-FLAG                   PICTURE 9.                       IX2144.2
   000454         045900 01  HOLD-FILESTATUS-RECORD.                                      IX2144.2
   000455         046000     05 FILESTATUS               PICTURE XX  OCCURS 10 TIMES.     IX2144.2
   000456         046100 01  FILE-RECORD-INFORMATION-REC.                                 IX2144.2
   000457         046200     03 FILE-RECORD-INFO-SKELETON.                                IX2144.2
   000458         046300        05 FILLER                 PICTURE X(48)       VALUE       IX2144.2
   000459         046400             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2144.2
   000460         046500        05 FILLER                 PICTURE X(46)       VALUE       IX2144.2
   000461         046600             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2144.2
   000462         046700        05 FILLER                 PICTURE X(26)       VALUE       IX2144.2
   000463         046800             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2144.2
   000464         046900        05 FILLER                 PICTURE X(37)       VALUE       IX2144.2
   000465         047000             ",RECKEY=                             ".             IX2144.2
   000466         047100        05 FILLER                 PICTURE X(38)       VALUE       IX2144.2
   000467         047200             ",ALTKEY1=                             ".            IX2144.2
   000468         047300        05 FILLER                 PICTURE X(38)       VALUE       IX2144.2
   000469         047400             ",ALTKEY2=                             ".            IX2144.2
   000470         047500        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2144.2 IMP
   000471         047600     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2144.2
   000472         047700        05 FILE-RECORD-INFO-P1-120.                               IX2144.2
   000473         047800           07 FILLER              PIC X(5).                       IX2144.2
   000474         047900           07 XFILE-NAME           PIC X(6).                      IX2144.2
   000475         048000           07 FILLER              PIC X(8).                       IX2144.2
   000476         048100           07 XRECORD-NAME         PIC X(6).                      IX2144.2
   000477         048200           07 FILLER              PIC X(1).                       IX2144.2
   000478         048300           07 REELUNIT-NUMBER     PIC 9(1).                       IX2144.2
   000479         048400           07 FILLER              PIC X(7).                       IX2144.2
   000480         048500           07 XRECORD-NUMBER       PIC 9(6).                      IX2144.2
   000481         048600           07 FILLER              PIC X(6).                       IX2144.2
   000482         048700           07 UPDATE-NUMBER       PIC 9(2).                       IX2144.2
   000483         048800           07 FILLER              PIC X(5).                       IX2144.2
   000484         048900           07 ODO-NUMBER          PIC 9(4).                       IX2144.2
   000485         049000           07 FILLER              PIC X(5).                       IX2144.2
   000486         049100           07 XPROGRAM-NAME        PIC X(5).                      IX2144.2
   000487         049200           07 FILLER              PIC X(7).                       IX2144.2
   000488         049300           07 XRECORD-LENGTH       PIC 9(6).                      IX2144.2
   000489         049400           07 FILLER              PIC X(7).                       IX2144.2
   000490         049500           07 CHARS-OR-RECORDS    PIC X(2).                       IX2144.2
   000491         049600           07 FILLER              PIC X(1).                       IX2144.2
   000492         049700           07 XBLOCK-SIZE          PIC 9(4).                      IX2144.2
   000493         049800           07 FILLER              PIC X(6).                       IX2144.2
   000494         049900           07 RECORDS-IN-FILE     PIC 9(6).                       IX2144.2
   000495         050000           07 FILLER              PIC X(5).                       IX2144.2
   000496         050100           07 XFILE-ORGANIZATION   PIC X(2).                      IX2144.2
   000497         050200           07 FILLER              PIC X(6).                       IX2144.2
   000498         050300           07 XLABEL-TYPE          PIC X(1).                      IX2144.2
   000499         050400        05 FILE-RECORD-INFO-P121-240.                             IX2144.2
   000500         050500           07 FILLER              PIC X(8).                       IX2144.2
   000501         050600           07 XRECORD-KEY          PIC X(29).                     IX2144.2
   000502         050700           07 FILLER              PIC X(9).                       IX2144.2
   000503         050800           07 ALTERNATE-KEY1      PIC X(29).                      IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050900           07 FILLER              PIC X(9).                       IX2144.2
   000505         051000           07 ALTERNATE-KEY2      PIC X(29).                      IX2144.2
   000506         051100           07 FILLER              PIC X(7).                       IX2144.2
   000507         051200 01  TEST-RESULTS.                                                IX2144.2
   000508         051300     02 FILLER                   PIC X      VALUE SPACE.          IX2144.2 IMP
   000509         051400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2144.2 IMP
   000510         051500     02 FILLER                   PIC X      VALUE SPACE.          IX2144.2 IMP
   000511         051600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2144.2 IMP
   000512         051700     02 FILLER                   PIC X      VALUE SPACE.          IX2144.2 IMP
   000513         051800     02  PAR-NAME.                                                IX2144.2
   000514         051900       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2144.2 IMP
   000515         052000       03  PARDOT-X              PIC X      VALUE SPACE.          IX2144.2 IMP
   000516         052100       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2144.2 IMP
   000517         052200     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2144.2 IMP
   000518         052300     02 RE-MARK                  PIC X(61).                       IX2144.2
   000519         052400 01  TEST-COMPUTED.                                               IX2144.2
   000520         052500     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2144.2 IMP
   000521         052600     02 FILLER                   PIC X(17)  VALUE                 IX2144.2
   000522         052700            "       COMPUTED=".                                   IX2144.2
   000523         052800     02 COMPUTED-X.                                               IX2144.2
   000524         052900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2144.2 IMP
   000525         053000     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2144.2 524
   000526         053100                                 PIC -9(9).9(9).                  IX2144.2
   000527         053200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2144.2 524
   000528         053300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2144.2 524
   000529         053400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2144.2 524
   000530         053500     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2144.2 524
   000531         053600         04 COMPUTED-18V0                    PIC -9(18).          IX2144.2
   000532         053700         04 FILLER                           PIC X.               IX2144.2
   000533         053800     03 FILLER PIC X(50) VALUE SPACE.                             IX2144.2 IMP
   000534         053900 01  TEST-CORRECT.                                                IX2144.2
   000535         054000     02 FILLER PIC X(30) VALUE SPACE.                             IX2144.2 IMP
   000536         054100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2144.2
   000537         054200     02 CORRECT-X.                                                IX2144.2
   000538         054300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2144.2 IMP
   000539         054400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2144.2 538
   000540         054500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2144.2 538
   000541         054600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2144.2 538
   000542         054700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2144.2 538
   000543         054800     03      CR-18V0 REDEFINES CORRECT-A.                         IX2144.2 538
   000544         054900         04 CORRECT-18V0                     PIC -9(18).          IX2144.2
   000545         055000         04 FILLER                           PIC X.               IX2144.2
   000546         055100     03 FILLER PIC X(2) VALUE SPACE.                              IX2144.2 IMP
   000547         055200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2144.2 IMP
   000548         055300 01  CCVS-C-1.                                                    IX2144.2
   000549         055400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2144.2
   000550         055500-    "SS  PARAGRAPH-NAME                                          IX2144.2
   000551         055600-    "       REMARKS".                                            IX2144.2
   000552         055700     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2144.2 IMP
   000553         055800 01  CCVS-C-2.                                                    IX2144.2
   000554         055900     02 FILLER                     PIC X        VALUE SPACE.      IX2144.2 IMP
   000555         056000     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2144.2
   000556         056100     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2144.2 IMP
   000557         056200     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2144.2
   000558         056300     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2144.2 IMP
   000559         056400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2144.2 IMP
   000560         056500 01  REC-CT                        PIC 99       VALUE ZERO.       IX2144.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2144.2 IMP
   000562         056700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2144.2 IMP
   000563         056800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2144.2 IMP
   000564         056900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2144.2 IMP
   000565         057000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2144.2 IMP
   000566         057100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2144.2 IMP
   000567         057200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2144.2 IMP
   000568         057300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2144.2 IMP
   000569         057400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2144.2 IMP
   000570         057500 01  CCVS-H-1.                                                    IX2144.2
   000571         057600     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2144.2 IMP
   000572         057700     02  FILLER                    PIC X(42)    VALUE             IX2144.2
   000573         057800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2144.2
   000574         057900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2144.2 IMP
   000575         058000 01  CCVS-H-2A.                                                   IX2144.2
   000576         058100   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2144.2 IMP
   000577         058200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2144.2
   000578         058300   02  FILLER                        PIC XXXX   VALUE             IX2144.2
   000579         058400     "4.2 ".                                                      IX2144.2
   000580         058500   02  FILLER                        PIC X(28)  VALUE             IX2144.2
   000581         058600            " COPY - NOT FOR DISTRIBUTION".                       IX2144.2
   000582         058700   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2144.2 IMP
   000583         058800                                                                  IX2144.2
   000584         058900 01  CCVS-H-2B.                                                   IX2144.2
   000585         059000   02  FILLER                        PIC X(15)  VALUE             IX2144.2
   000586         059100            "TEST RESULT OF ".                                    IX2144.2
   000587         059200   02  TEST-ID                       PIC X(9).                    IX2144.2
   000588         059300   02  FILLER                        PIC X(4)   VALUE             IX2144.2
   000589         059400            " IN ".                                               IX2144.2
   000590         059500   02  FILLER                        PIC X(12)  VALUE             IX2144.2
   000591         059600     " HIGH       ".                                              IX2144.2
   000592         059700   02  FILLER                        PIC X(22)  VALUE             IX2144.2
   000593         059800            " LEVEL VALIDATION FOR ".                             IX2144.2
   000594         059900   02  FILLER                        PIC X(58)  VALUE             IX2144.2
   000595         060000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2144.2
   000596         060100 01  CCVS-H-3.                                                    IX2144.2
   000597         060200     02  FILLER                      PIC X(34)  VALUE             IX2144.2
   000598         060300            " FOR OFFICIAL USE ONLY    ".                         IX2144.2
   000599         060400     02  FILLER                      PIC X(58)  VALUE             IX2144.2
   000600         060500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2144.2
   000601         060600     02  FILLER                      PIC X(28)  VALUE             IX2144.2
   000602         060700            "  COPYRIGHT   1985 ".                                IX2144.2
   000603         060800 01  CCVS-E-1.                                                    IX2144.2
   000604         060900     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2144.2 IMP
   000605         061000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2144.2
   000606         061100     02 ID-AGAIN                     PIC X(9).                    IX2144.2
   000607         061200     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2144.2 IMP
   000608         061300 01  CCVS-E-2.                                                    IX2144.2
   000609         061400     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2144.2 IMP
   000610         061500     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2144.2 IMP
   000611         061600     02 CCVS-E-2-2.                                               IX2144.2
   000612         061700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2144.2 IMP
   000613         061800         03 FILLER                   PIC X      VALUE SPACE.      IX2144.2 IMP
   000614         061900         03 ENDER-DESC               PIC X(44)  VALUE             IX2144.2
   000615         062000            "ERRORS ENCOUNTERED".                                 IX2144.2
   000616         062100 01  CCVS-E-3.                                                    IX2144.2
   000617         062200     02  FILLER                      PIC X(22)  VALUE             IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062300            " FOR OFFICIAL USE ONLY".                             IX2144.2
   000619         062400     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2144.2 IMP
   000620         062500     02  FILLER                      PIC X(58)  VALUE             IX2144.2
   000621         062600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2144.2
   000622         062700     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2144.2 IMP
   000623         062800     02 FILLER                       PIC X(15)  VALUE             IX2144.2
   000624         062900             " COPYRIGHT 1985".                                   IX2144.2
   000625         063000 01  CCVS-E-4.                                                    IX2144.2
   000626         063100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2144.2 IMP
   000627         063200     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2144.2
   000628         063300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2144.2 IMP
   000629         063400     02 FILLER                       PIC X(40)  VALUE             IX2144.2
   000630         063500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2144.2
   000631         063600 01  XXINFO.                                                      IX2144.2
   000632         063700     02 FILLER                       PIC X(19)  VALUE             IX2144.2
   000633         063800            "*** INFORMATION ***".                                IX2144.2
   000634         063900     02 INFO-TEXT.                                                IX2144.2
   000635         064000       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2144.2 IMP
   000636         064100       04 XXCOMPUTED                 PIC X(20).                   IX2144.2
   000637         064200       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2144.2 IMP
   000638         064300       04 XXCORRECT                  PIC X(20).                   IX2144.2
   000639         064400     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2144.2
   000640         064500 01  HYPHEN-LINE.                                                 IX2144.2
   000641         064600     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2144.2 IMP
   000642         064700     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2144.2
   000643         064800-    "*****************************************".                 IX2144.2
   000644         064900     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2144.2
   000645         065000-    "******************************".                            IX2144.2
   000646         065100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2144.2
   000647         065200     "IX214A".                                                    IX2144.2
   000648         065300 PROCEDURE DIVISION.                                              IX2144.2
   000649         065400 CCVS1 SECTION.                                                   IX2144.2
   000650         065500 OPEN-FILES.                                                      IX2144.2
   000651         065600     OPEN I-O RAW-DATA.                                           IX2144.2 207
   000652         065700     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2144.2 646 210
   000653         065800     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2144.2 207 659
   000654         065900     MOVE "ABORTED " TO C-ABORT.                                  IX2144.2 221
   000655         066000     ADD 1 TO C-NO-OF-TESTS.                                      IX2144.2 213
   000656         066100     ACCEPT C-DATE  FROM DATE.                                    IX2144.2 211
   000657         066200     ACCEPT C-TIME  FROM TIME.                                    IX2144.2 212
   000658         066300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2144.2 209 659
   000659         066400 END-E-1.                                                         IX2144.2
   000660         066500     CLOSE RAW-DATA.                                              IX2144.2 207
   000661         066600     OPEN    OUTPUT PRINT-FILE.                                   IX2144.2 222
   000662         066700     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2144.2 646 587 646 606
   000663         066800     MOVE    SPACE TO TEST-RESULTS.                               IX2144.2 IMP 507
   000664         066900     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2144.2 708 713
   000665         067000     MOVE    ZERO TO REC-SKL-SUB.                                 IX2144.2 IMP 559
   000666         067100     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2144.2 667
   000667         067200 CCVS-INIT-FILE.                                                  IX2144.2
   000668         067300     ADD     1 TO REC-SKL-SUB.                                    IX2144.2 559
   000669         067400     MOVE    FILE-RECORD-INFO-SKELETON                            IX2144.2 457
   000670         067500          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2144.2 471 559
   000671         067600 CCVS-INIT-EXIT.                                                  IX2144.2
   000672         067700     GO TO CCVS1-EXIT.                                            IX2144.2 795
   000673         067800 CLOSE-FILES.                                                     IX2144.2
   000674         067900     OPEN I-O RAW-DATA.                                           IX2144.2 207
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675         068000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2144.2 646 210
   000676         068100     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2144.2 207 684
   000677         068200     MOVE "OK.     " TO C-ABORT.                                  IX2144.2 221
   000678         068300     MOVE PASS-COUNTER TO C-OK.                                   IX2144.2 564 214
   000679         068400     MOVE ERROR-HOLD   TO C-ALL.                                  IX2144.2 566 215
   000680         068500     MOVE ERROR-COUNTER TO C-FAIL.                                IX2144.2 562 216
   000681         068600     MOVE DELETE-COUNTER TO C-DELETED.                            IX2144.2 561 217
   000682         068700     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2144.2 563 218
   000683         068800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2144.2 209 684
   000684         068900 END-E-2.                                                         IX2144.2
   000685         069000     CLOSE RAW-DATA.                                              IX2144.2 207
   000686         069100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2144.2 717 738 222
   000687         069200 TERMINATE-CCVS.                                                  IX2144.2
   000688         069300     EXIT PROGRAM.                                                IX2144.2
   000689         069400 TERMINATE-CALL.                                                  IX2144.2
   000690         069500     STOP     RUN.                                                IX2144.2
   000691         069600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2144.2 511 563
   000692         069700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2144.2 511 564
   000693         069800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2144.2 511 562
   000694         069900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2144.2 511 561
   000695         070000     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2144.2 518
   000696         070100 PRINT-DETAIL.                                                    IX2144.2
   000697         070200     IF REC-CT NOT EQUAL TO ZERO                                  IX2144.2 560 IMP
   000698      1  070300             MOVE "." TO PARDOT-X                                 IX2144.2 515
   000699      1  070400             MOVE REC-CT TO DOTVALUE.                             IX2144.2 560 516
   000700         070500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2144.2 507 223 750
   000701         070600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2144.2 511 750
   000702      1  070700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2144.2 771 785
   000703      1  070800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2144.2 786 794
   000704         070900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2144.2 IMP 511 IMP 523
   000705         071000     MOVE SPACE TO CORRECT-X.                                     IX2144.2 IMP 537
   000706         071100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2144.2 560 IMP IMP 513
   000707         071200     MOVE     SPACE TO RE-MARK.                                   IX2144.2 IMP 518
   000708         071300 HEAD-ROUTINE.                                                    IX2144.2
   000709         071400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2144.2 570 224 750
   000710         071500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2144.2 575 224 750
   000711         071600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2144.2 584 224 750
   000712         071700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2144.2 596 224 750
   000713         071800 COLUMN-NAMES-ROUTINE.                                            IX2144.2
   000714         071900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2144.2 548 224 750
   000715         072000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2144.2 553 224 750
   000716         072100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2144.2 640 224 750
   000717         072200 END-ROUTINE.                                                     IX2144.2
   000718         072300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2144.2 640 224 750
   000719         072400 END-RTN-EXIT.                                                    IX2144.2
   000720         072500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2144.2 603 224 750
   000721         072600 END-ROUTINE-1.                                                   IX2144.2
   000722         072700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2144.2 562 566 563
   000723         072800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2144.2 566 561 566
   000724         072900      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2144.2 564 566
   000725         073000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2144.2
   000726         073100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2144.2 564 626
   000727         073200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2144.2 566 628
   000728         073300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2144.2 625 611
   000729         073400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2144.2 608 224 750
   000730         073500  END-ROUTINE-12.                                                 IX2144.2
   000731         073600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2144.2 614
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2144.2 562 IMP
   000733      1  073800         MOVE "NO " TO ERROR-TOTAL                                IX2144.2 612
   000734         073900         ELSE                                                     IX2144.2
   000735      1  074000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2144.2 562 612
   000736         074100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2144.2 608 224
   000737         074200     PERFORM WRITE-LINE.                                          IX2144.2 750
   000738         074300 END-ROUTINE-13.                                                  IX2144.2
   000739         074400     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2144.2 561 IMP
   000740      1  074500         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2144.2 612
   000741      1  074600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2144.2 561 612
   000742         074700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2144.2 614
   000743         074800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2144.2 608 224 750
   000744         074900      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2144.2 563 IMP
   000745      1  075000          MOVE "NO " TO ERROR-TOTAL                               IX2144.2 612
   000746      1  075100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2144.2 563 612
   000747         075200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2144.2 614
   000748         075300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2144.2 608 224 750
   000749         075400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2144.2 616 224 750
   000750         075500 WRITE-LINE.                                                      IX2144.2
   000751         075600     ADD 1 TO RECORD-COUNT.                                       IX2144.2 568
   000752         075700     IF RECORD-COUNT GREATER 42                                   IX2144.2 568
   000753      1  075800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2144.2 224 567
   000754      1  075900         MOVE SPACE TO DUMMY-RECORD                               IX2144.2 IMP 224
   000755      1  076000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2144.2 224
   000756      1  076100         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2144.2 570 224 766
   000757      1  076200         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2144.2 575 224 766
   000758      1  076300         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2144.2 584 224 766
   000759      1  076400         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2144.2 596 224 766
   000760      1  076500         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2144.2 548 224 766
   000761      1  076600         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2144.2 553 224 766
   000762      1  076700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2144.2 640 224 766
   000763      1  076800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2144.2 567 224
   000764      1  076900         MOVE ZERO TO RECORD-COUNT.                               IX2144.2 IMP 568
   000765         077000     PERFORM WRT-LN.                                              IX2144.2 766
   000766         077100 WRT-LN.                                                          IX2144.2
   000767         077200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2144.2 224
   000768         077300     MOVE SPACE TO DUMMY-RECORD.                                  IX2144.2 IMP 224
   000769         077400 BLANK-LINE-PRINT.                                                IX2144.2
   000770         077500     PERFORM WRT-LN.                                              IX2144.2 766
   000771         077600 FAIL-ROUTINE.                                                    IX2144.2
   000772         077700     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2144.2 523 IMP
   000773      1  077800            GO TO   FAIL-ROUTINE-WRITE.                           IX2144.2 780
   000774         077900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2144.2 537 IMP 780
   000775         078000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2144.2 569 639
   000776         078100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2144.2 634
   000777         078200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2144.2 631 224 750
   000778         078300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2144.2 IMP 639
   000779         078400     GO TO  FAIL-ROUTINE-EX.                                      IX2144.2 785
   000780         078500 FAIL-ROUTINE-WRITE.                                              IX2144.2
   000781         078600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2144.2 519 223 750
   000782         078700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2144.2 569 547
   000783         078800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2144.2 534 223 750
   000784         078900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2144.2 IMP 547
   000785         079000 FAIL-ROUTINE-EX. EXIT.                                           IX2144.2
   000786         079100 BAIL-OUT.                                                        IX2144.2
   000787         079200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2144.2 524 IMP 789
   000788         079300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2144.2 538 IMP 794
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079400 BAIL-OUT-WRITE.                                                  IX2144.2
   000790         079500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2144.2 538 638 524 636
   000791         079600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2144.2 569 639
   000792         079700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2144.2 631 224 750
   000793         079800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2144.2 IMP 639
   000794         079900 BAIL-OUT-EX. EXIT.                                               IX2144.2
   000795         080000 CCVS1-EXIT.                                                      IX2144.2
   000796         080100     EXIT.                                                        IX2144.2
   000797         080200 SECT-0001-IX214A SECTION.                                        IX2144.2
   000798         080300 WRITE-INT-GF-01.                                                 IX2144.2
   000799         080400     OPEN    OUTPUT IX-FS1.                                       IX2144.2 225
   000800         080500     MOVE    "IX-FS1" TO XFILE-NAME           (1).                IX2144.2 474
   000801         080600     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2144.2 476
   000802         080700     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2144.2 IMP 480
   000803         080800     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2144.2 490
   000804         080900     MOVE "IX214A"    TO  XPROGRAM-NAME       (1).                IX2144.2 486
   000805         081000     MOVE    240      TO  XRECORD-LENGTH      (1).                IX2144.2 488
   000806         081100     MOVE    001      TO  XBLOCK-SIZE         (1).                IX2144.2 492
   000807         081200     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2144.2 496
   000808         081300     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2144.2 498
   000809         081400     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2144.2 494
   000810         081500     MOVE    "CREATE-FILE-FS1" TO FEATURE.                        IX2144.2 509
   000811         081600     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2144.2 513
   000812         081700     MOVE    ZERO TO KEYSUB.                                      IX2144.2 IMP 291
   000813         081800     MOVE    ZERO TO INVKEY-COUNTER.                              IX2144.2 IMP 292
   000814         081900 WRITE-INIT-GF-01-01.                                             IX2144.2
   000815         082000     PERFORM WRITE-TEST-GF-01-R1 50 TIMES.                        IX2144.2 819
   000816         082100     PERFORM WRITE-TEST-GF-01-R2 125 TIMES.                       IX2144.2 832
   000817         082200     PERFORM WRITE-TEST-GF-01-R1 25 TIMES.                        IX2144.2 819
   000818         082300     GO TO   WRITE-TEST-GF-01.                                    IX2144.2 844
   000819         082400 WRITE-TEST-GF-01-R1.                                             IX2144.2
   000820         082500     ADD     001  TO XRECORD-NUMBER (1).                          IX2144.2 480
   000821         082600     ADD     001  TO  KEYSUB.                                     IX2144.2 291
   000822         082700     MOVE    RECKEY-VALUE (KEYSUB) TO FS1-RECKEY-1-13.            IX2144.2 450 291 268
   000823         082800     MOVE    ALTKEY1-VALUE (KEYSUB) TO FS1-ALTKEY1-1-20.          IX2144.2 451 291 273
   000824         082900     MOVE    ALTKEY2-VALUE (KEYSUB) TO FS1-ALTKEY2-1-20.          IX2144.2 452 291 281
   000825         083000     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2144.2 267 501
   000826         083100     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2144.2 272 503
   000827         083200     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2144.2 280 505
   000828         083300     MOVE    FILE-RECORD-INFO (1)  TO IX-FS1R1-F-G-240.           IX2144.2 471 229
   000829         083400     WRITE   IX-FS1R1-F-G-240                                     IX2144.2 229
   000830      1  083500                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2144.2 292
   000831         083600     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2144.2 290
   000832         083700 WRITE-TEST-GF-01-R2.                                             IX2144.2
   000833         083800     ADD     002  TO FS1-RECKEY-11-13.                            IX2144.2 270
   000834         083900     ADD     002 TO FS1-ALTKEY1-11-13.                            IX2144.2 277
   000835         084000     SUBTRACT  002 FROM FS1-ALTKEY2-11-13.                        IX2144.2 285
   000836         084100     ADD     001  TO XRECORD-NUMBER (1).                          IX2144.2 480
   000837         084200     MOVE    WRK-FS1-RECKEY   TO    XRECORD-KEY (1).              IX2144.2 267 501
   000838         084300     MOVE    WRK-FS1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2144.2 272 503
   000839         084400     MOVE    WRK-FS1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2144.2 280 505
   000840         084500     MOVE    FILE-RECORD-INFO (1) TO IX-FS1R1-F-G-240.            IX2144.2 471 229
   000841         084600     WRITE   IX-FS1R1-F-G-240                                     IX2144.2 229
   000842      1  084700                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2144.2 292
   000843         084800     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2144.2 290
   000844         084900 WRITE-TEST-GF-01.                                                IX2144.2
   000845         085000     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2144.2 292 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         085100             GIVING RECORDS-WRITTEN.                              IX2144.2 293
   000847         085200     MOVE    200  TO CORRECT-18V0.                                IX2144.2 544
   000848         085300     MOVE    RECORDS-WRITTEN TO COMPUTED-18V0.                    IX2144.2 293 531
   000849         085400     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2144.2 293
   000850      1  085500             PERFORM  PASS                                        IX2144.2 692
   000851         085600             ELSE                                                 IX2144.2
   000852      1  085700             PERFORM FAIL.                                        IX2144.2 693
   000853         085800     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2144.2 518
   000854         085900     GO TO   WRITE-TEST-GF-01-END.                                IX2144.2 857
   000855         086000 WRITE-DELETE-GF-01.                                              IX2144.2
   000856         086100     PERFORM DE-LETE.                                             IX2144.2 694
   000857         086200 WRITE-TEST-GF-01-END.                                            IX2144.2
   000858         086300     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   000859         086400     CLOSE   IX-FS1.                                              IX2144.2 225
   000860         086500                                                                  IX2144.2
   000861         086600                                                                  IX2144.2
   000862         086700 READ-INIT-F1-01.                                                 IX2144.2
   000863         086800     OPEN    INPUT  IX-FS1.                                       IX2144.2 225
   000864         086900     MOVE    "READ-TEST-F1-01" TO PAR-NAME.                       IX2144.2 513
   000865         087000     MOVE    "READ FILE IX-FS1" TO FEATURE.                       IX2144.2 509
   000866         087100     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2144.2 IMP 290
   000867         087200     MOVE    02   TO RECKEY-NUM.                                  IX2144.2 294
   000868         087300     MOVE    002 TO ALTKEY1-NUM.                                  IX2144.2 295
   000869         087400 READ-TEST-F1-01-R1.                                              IX2144.2
   000870         087500     READ    IX-FS1  AT END  GO TO READ-TEST-F1-01.               IX2144.2 225 884
   000871         087600     MOVE    IX-REC-KEY-AREA TO WRK-FS1-RECKEY.                   IX2144.2 233 267
   000872         087700     MOVE    IX-ALT-KEY1-AREA TO WRK-FS1-ALTKEY1.                 IX2144.2 244 272
   000873         087800     IF      FS1-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2144.2 270 294
   000874         087900             AND FS1-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2144.2 277 295
   000875      1  088000             NEXT SENTENCE                                        IX2144.2
   000876         088100             ELSE                                                 IX2144.2
   000877      1  088200             PERFORM  READ-FAIL-F1-01.                            IX2144.2 892
   000878         088300     IF      EXCUT-COUNTER-06V00 NOT LESS THAN 200                IX2144.2 290
   000879      1  088400             GO TO READ-TEST-F1-01.                               IX2144.2 884
   000880         088500     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2144.2 290
   000881         088600     ADD     002  TO RECKEY-NUM                                   IX2144.2 294
   000882         088700     ADD     002  TO ALTKEY1-NUM.                                 IX2144.2 295
   000883         088800     GO TO   READ-TEST-F1-01-R1.                                  IX2144.2 869
   000884         088900 READ-TEST-F1-01.                                                 IX2144.2
   000885         089000     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2144.2 290
   000886      1  089100             PERFORM PASS ELSE                                    IX2144.2 692
   000887      1  089200             PERFORM FAIL.                                        IX2144.2 693
   000888         089300     MOVE    EXCUT-COUNTER-06V00 TO  COMPUTED-18V0.               IX2144.2 290 531
   000889         089400     MOVE    200  TO  CORRECT-18V0.                               IX2144.2 544
   000890         089500     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2144.2 518
   000891         089600     GO TO   READ-WRITE-F1-01.                                    IX2144.2 897
   000892         089700 READ-FAIL-F1-01.                                                 IX2144.2
   000893         089800     PERFORM FAIL.                                                IX2144.2 693
   000894         089900     MOVE    FS1-RECKEY-11-13  TO COMPUTED-18V0.                  IX2144.2 270 531
   000895         090000     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2144.2 294 544
   000896         090100     MOVE    "NUM EMBEDDED IN RECKEY"  TO RE-MARK.                IX2144.2 518
   000897         090200 READ-WRITE-F1-01.                                                IX2144.2
   000898         090300     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   000899         090400     CLOSE   IX-FS1.                                              IX2144.2 225
   000900         090500 START-INIT.                                                      IX2144.2
   000901         090600     OPEN    INPUT  IX-FS1.                                       IX2144.2 225
   000902         090700     MOVE    "START NLT RECKEY " TO FEATURE.                      IX2144.2 509
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090800     MOVE "START-TEST-GF-01" TO PAR-NAME.                         IX2144.2 513
   000904         090900     MOVE    SPACE TO HOLD-FILESTATUS-RECORD.                     IX2144.2 IMP 454
   000905         091000*                                                                 IX2144.2
   000906         091100* THE "START -- NOT LESS THAN--" IS CHECKED FOR PROPER POSITIONINGIX2144.2
   000907         091200* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2144.2
   000908         091300* START-TEST-GF- USE ONLY THE PRIME RECORD KEY FOR ESTABLISHING   IX2144.2
   000909         091400* THE CURRENT RECORD POINTER FOR THE FILE.  THE FOLLOWING IS A    IX2144.2
   000910         091500* SUMMARY OF THE TEST CONDITIONS AND THE EXPECTED ACTION TO BE    IX2144.2
   000911         091600* TAKEN FOR THE  TESTS.                                           IX2144.2
   000912         091700*                                                                 IX2144.2
   000913         091800*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2144.2
   000914         091900*                                                                 IX2144.2
   000915         092000*   START-TEST-GF-01 - EQUAL A RECORD IN FILE / RECORD FOUND      IX2144.2
   000916         092100*   START-TEST-GF-02 - BETWEEN 2 KEY VALUES / RECORD FOUND        IX2144.2
   000917         092200*   START-TEST-GF-03 - LESS THAN FIRST FILE REC. / REC. FOUND     IX2144.2
   000918         092300*   START-TEST-GF-04 - NOT LESS THAN LAST FILE RECORD / INVALID KEIX2144.2
   000919         092400*   START-TEST-GF-05 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2144.2
   000920         092500*   START-TEST-GF-06 - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUNIX2144.2
   000921         092600*   START-TEST-GF-07 - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEYIX2144.2
   000922         092700*   START-TEST-GF-08 - UNEQUAL SIZE OPERANDS (UNEQUAL) / REC FOUNDIX2144.2
   000923         092800*   START-TEST-GF-09 - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEY IX2144.2
   000924         092900*                                                                 IX2144.2
   000925         093000*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2144.2
   000926         093100*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2144.2
   000927         093200*  IF DURING THIS INITIALIZATION AN INVALID KEY OCCURS THE TEST   IX2144.2
   000928         093300*  WILL BE DELETED AND CONTROL WILL BE PASSED TO THE NEXT TEST.   IX2144.2
   000929         093400*  WHEN TESTING IF AN INVALID KEY IS EXPECTED, THE KEYS           IX2144.2
   000930         093500*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2144.2
   000931         093600*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2144.2
   000932         093700*  MATCH RECORDS IN THE FILE.  BUT IF A KEY MATCH IS EXPECTED FROMIX2144.2
   000933         093800*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2144.2
   000934         093900*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2144.2
   000935         094000*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2144.2
   000936         094100*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2144.2
   000937         094200*                                                                 IX2144.2
   000938         094300 START-INIT-GF-01.                                                IX2144.2
   000939         094400     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   000940         094500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   000941      1  094600             PERFORM START-INIT-ERROR                             IX2144.2 2320
   000942      1  094700             GO TO START-DELETE-GF-01.                            IX2144.2 978
   000943         094800     MOVE    "CCCCCCCCCD022" TO FS1-RECKEY-1-13.                  IX2144.2 268
   000944         094900     MOVE    "EEEEEFFFFF022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   000945         095000     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   000946         095100     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   000947         095200     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   000948         095300     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   000949         095400 START-TEST-GF-01.                                                IX2144.2
   000950         095500*                                                                 IX2144.2
   000951         095600*  START-TEST-GF-.01 - THE START SHOULD FIND A RECORD IN THE FILE IX2144.2
   000952         095700*                    WHICH HAS A RECORD KEY VALUE OF              IX2144.2
   000953         095800*                    CCCCCCCCDD022  (RECORD NUMBER 11).           IX2144.2
   000954         095900*                                                                 IX2144.2
   000955         096000     START   IX-FS1                                               IX2144.2 225
   000956         096100                    KEY IS NOT LESS THAN IX-FS1-KEY               IX2144.2 234
   000957      1  096200       INVALID KEY     MOVE FS1-STATUS TO FILESTATUS (1)          IX2144.2 289 455
   000958      1  096300                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   000959      1  096400                        GO TO START-FAIL-GF-01.                   IX2144.2 972
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960         096500     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2144.2 289 455
   000961         096600     READ    IX-FS1  AT END                                       IX2144.2 225
   000962      1  096700                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   000963      1  096800                     GO TO START-FAIL-GF-01.                      IX2144.2 972
   000964         096900     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   000965         097000     IF      XRECORD-NUMBER (1)  EQUAL TO 11                      IX2144.2 480
   000966      1  097100             PERFORM PASS                                         IX2144.2 692
   000967      1  097200             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   000968      1  097300             GO TO START-WRITE-GF-01.                             IX2144.2 980
   000969         097400     MOVE    11  TO RECNO.                                        IX2144.2 288
   000970         097500     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   000971         097600     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   000972         097700 START-FAIL-GF-01.                                                IX2144.2
   000973         097800     PERFORM FAIL.                                                IX2144.2 693
   000974         097900     MOVE    11  TO CORRECT-18V0.                                 IX2144.2 544
   000975         098000     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   000976         098100           TO RE-MARK.                                            IX2144.2 518
   000977         098200     GO TO   START-WRITE-GF-01.                                   IX2144.2 980
   000978         098300 START-DELETE-GF-01.                                              IX2144.2
   000979         098400     PERFORM DE-LETE.                                             IX2144.2 694
   000980         098500 START-WRITE-GF-01.                                               IX2144.2
   000981         098600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   000982         098700 START-INIT-GF-02.                                                IX2144.2
   000983         098800     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   000984         098900     MOVE "START-TEST-GF-02" TO PAR-NAME.                         IX2144.2 513
   000985         099000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   000986      1  099100             PERFORM START-INIT-ERROR                             IX2144.2 2320
   000987      1  099200             GO TO START-DELETE-GF-02.                            IX2144.2 1028
   000988         099300     MOVE    "EEEEEEEFFF067" TO FS1-RECKEY-1-13.                  IX2144.2 268
   000989         099400     MOVE    "HHHHHHHHII064ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   000990         099500     MOVE    "TTTTTTTTSS336ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   000991         099600     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   000992         099700     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   000993         099800     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   000994         099900 START-TEST-GF-02.                                                IX2144.2
   000995         100000*                                                                 IX2144.2
   000996         100100*  START-TEST-GF-.02 - THE START SHOULD FIND A RECORD IN THE FILE IX2144.2
   000997         100200*                    WHICH HAS A RECORD KEY VALUE OF EEEEEEFFFF068IX2144.2
   000998         100300*                    (RECORD NUMBER 34).  THIS KEY VALUE IS       IX2144.2
   000999         100400*                    SEQUENTIALLY A LOGICAL RECORD HIGHER THAN    IX2144.2
   001000         100500*                    THE RECORD CONTAINING THE KEY VALUE  LOADED  IX2144.2
   001001         100600*                    INTO THE RECORD KEY BEFORE THE START WAS     IX2144.2
   001002         100700*                    EXECUTED.  THE KEY VALUE INITIALLY LOADED    IX2144.2
   001003         100800*                    WAS A VALUE BETWEEN TWO EXISTING KEY VALUES. IX2144.2
   001004         100900*                                                                 IX2144.2
   001005         101000     START   IX-FS1                                               IX2144.2 225
   001006         101100                    KEY NOT LESS THAN IX-FS1-KEY                  IX2144.2 234
   001007      1  101200        INVALID KEY    MOVE FS1-STATUS TO FILESTATUS (2)          IX2144.2 289 455
   001008      1  101300                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001009      1  101400                        GO TO START-FAIL-GF-02.                   IX2144.2 1022
   001010         101500     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2144.2 289 455
   001011         101600     READ    IX-FS1  AT END                                       IX2144.2 225
   001012      1  101700                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001013      1  101800                     GO TO START-FAIL-GF-02.                      IX2144.2 1022
   001014         101900     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   001015         102000     IF      XRECORD-NUMBER (1) EQUAL TO 34                       IX2144.2 480
   001016      1  102100             PERFORM PASS                                         IX2144.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001017      1  102200             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   001018      1  102300             GO TO START-WRITE-GF-02.                             IX2144.2 1030
   001019         102400     MOVE    34  TO RECNO.                                        IX2144.2 288
   001020         102500     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   001021         102600     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   001022         102700 START-FAIL-GF-02.                                                IX2144.2
   001023         102800     PERFORM FAIL.                                                IX2144.2 693
   001024         102900     MOVE    34   TO CORRECT-18V0.                                IX2144.2 544
   001025         103000     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001026         103100           TO RE-MARK.                                            IX2144.2 518
   001027         103200     GO TO   START-WRITE-GF-02.                                   IX2144.2 1030
   001028         103300 START-DELETE-GF-02.                                              IX2144.2
   001029         103400     PERFORM DE-LETE.                                             IX2144.2 694
   001030         103500 START-WRITE-GF-02.                                               IX2144.2
   001031         103600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001032         103700 START-INIT-GF-03.                                                IX2144.2
   001033         103800     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001034         103900     MOVE "START-TEST-GF-03" TO PAR-NAME.                         IX2144.2 513
   001035         104000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001036      1  104100             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001037      1  104200             GO TO START-DELETE-GF-03.                            IX2144.2 1077
   001038         104300     MOVE    "BBBBBBBBBC001" TO FS1-RECKEY-1-13.                  IX2144.2 268
   001039         104400     MOVE    "EEEEEEEEEF003ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001040         104500     MOVE    "WWWWWWWWWV399ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001041         104600     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   001042         104700     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   001043         104800     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   001044         104900 START-TEST-GF-03.                                                IX2144.2
   001045         105000*                                                                 IX2144.2
   001046         105100*  START-TEST-GF-.03 - THE START STATEMENT SHOULD FIND A          IX2144.2
   001047         105200*                    RECORD IN THE FILE WHICH HAS A RECORD KEY    IX2144.2
   001048         105300*                    VALUE OF "BBBBBBBBBC002" (RECORD NUMBER 1).  IX2144.2
   001049         105400*                    THE KEY WAS LOADED BEFORE THE START IS       IX2144.2
   001050         105500*                    EXECUTED WITH THE VALUE THAT IS SEQUENTIALLY IX2144.2
   001051         105600*                    LOWER THAN ANY CURRENTLY EXISTING KEY IN     IX2144.2
   001052         105700*                    THE FILE.                                    IX2144.2
   001053         105800*                                                                 IX2144.2
   001054         105900     START   IX-FS1                                               IX2144.2 225
   001055         106000                    KEY IS NOT LESS THAN IX-FS1-KEY               IX2144.2 234
   001056      1  106100       INVALID KEY      MOVE FS1-STATUS TO FILESTATUS (3)         IX2144.2 289 455
   001057      1  106200                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001058      1  106300                        GO TO START-FAIL-GF-03.                   IX2144.2 1071
   001059         106400     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2144.2 289 455
   001060         106500     READ    IX-FS1  AT END                                       IX2144.2 225
   001061      1  106600                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001062      1  106700                     GO TO START-FAIL-GF-03.                      IX2144.2 1071
   001063         106800     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   001064         106900     IF      XRECORD-NUMBER (1) EQUAL TO 01                       IX2144.2 480
   001065      1  107000             PERFORM PASS                                         IX2144.2 692
   001066      1  107100             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   001067      1  107200             GO TO START-WRITE-GF-03.                             IX2144.2 1079
   001068         107300     MOVE    01  TO RECNO.                                        IX2144.2 288
   001069         107400     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   001070         107500     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   001071         107600 START-FAIL-GF-03.                                                IX2144.2
   001072         107700     PERFORM FAIL.                                                IX2144.2 693
   001073         107800     MOVE    01   TO CORRECT-18V0.                                IX2144.2 544
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001074         107900     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001075         108000           TO RE-MARK.                                            IX2144.2 518
   001076         108100     GO TO   START-WRITE-GF-03.                                   IX2144.2 1079
   001077         108200 START-DELETE-GF-03.                                              IX2144.2
   001078         108300     PERFORM DE-LETE.                                             IX2144.2 694
   001079         108400 START-WRITE-GF-03.                                               IX2144.2
   001080         108500     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001081         108600 START-INIT-GF-04.                                                IX2144.2
   001082         108700     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001083         108800     MOVE "START-TEST-GF-04" TO PAR-NAME.                         IX2144.2 513
   001084         108900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001085      1  109000             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001086      1  109100             GO TO START-DELETE-GF-04.                            IX2144.2 1121
   001087         109200     MOVE    "UUUUUUUUUU401"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001088         109300     MOVE    "YYYYYYYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001089         109400     MOVE    "DDDDDDDDDD000ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001090         109500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001091         109600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001092         109700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001093         109800 START-TEST-GF-04.                                                IX2144.2
   001094         109900*                                                                 IX2144.2
   001095         110000*  START-TEST-GF-.04 - THE START STATEMENT SHOULD NOT FIND A      IX2144.2
   001096         110100*                    RECORD IN THE  FILE WHICH HAS A RECORD       IX2144.2
   001097         110200*                    KEY VALUE NOT LESS THAN "UUUUUUUUUU401". THISIX2144.2
   001098         110300*                    VALUE IS SEQUENTIALLY NOT LESS THAN          IX2144.2
   001099         110400*                    ANY RECORD KEY CURRENTLY EXISTING IN         IX2144.2
   001100         110500*                    THE FILE.  AN INVALID KEY CONDITION          IX2144.2
   001101         110600*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2144.2
   001102         110700*                                                                 IX2144.2
   001103         110800     START   IX-FS1                                               IX2144.2 225
   001104         110900                    KEY IS NOT LESS THAN IX-FS1-KEY               IX2144.2 234
   001105      1  111000          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (4)       IX2144.2 289 455
   001106      1  111100                         GO TO START-PASS-GF-04.                  IX2144.2 1117
   001107         111200     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2144.2 289 455
   001108         111300     READ    IX-FS1 AT END                                        IX2144.2 225
   001109      1  111400                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   001110         111500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001111         111600     PERFORM FAIL.                                                IX2144.2 693
   001112         111700     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2144.2 501 524
   001113         111800     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2144.2 538
   001114         111900     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   001115         112000           TO RE-MARK.                                            IX2144.2 518
   001116         112100     GO TO   START-WRITE-GF-04.                                   IX2144.2 1123
   001117         112200 START-PASS-GF-04.                                                IX2144.2
   001118         112300     PERFORM  PASS.                                               IX2144.2 692
   001119         112400     MOVE     "INVALID KEY"  TO RE-MARK.                          IX2144.2 518
   001120         112500     GO TO   START-WRITE-GF-04.                                   IX2144.2 1123
   001121         112600 START-DELETE-GF-04.                                              IX2144.2
   001122         112700     PERFORM DE-LETE.                                             IX2144.2 694
   001123         112800 START-WRITE-GF-04.                                               IX2144.2
   001124         112900     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001125         113000 START-INIT-GF-05.                                                IX2144.2
   001126         113100     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001127         113200     MOVE "START-TEST-GF-05" TO PAR-NAME.                         IX2144.2 513
   001128         113300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001129      1  113400             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001130      1  113500             GO TO START-DELETE-GF-05.                            IX2144.2 1173
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001131         113600     MOVE    "CDDDDDDDDD039" TO FS1-RECKEY-1-13.                  IX2144.2 268
   001132         113700     MOVE    "IIIIIIIIJJ083ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001133         113800     MOVE    "ABCXXXXXXX400ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001134         113900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001135         114000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001136         114100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001137         114200 START-TEST-GF-05.                                                IX2144.2
   001138         114300*  START-TEST-GF-.05 - THE START STATEMENT USES AN OPERAND        IX2144.2
   001139         114400*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2144.2
   001140         114500*                    OF A RECORD   KEY BUT IS THE NAME OF A       IX2144.2
   001141         114600*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2144.2
   001142         114700*                    RECORD KEY.  THE CONTENTS OF THE DATA ITEM   IX2144.2
   001143         114800*                    (POSITIONS 1 THRU 7 OF THE RECORD KEY)       IX2144.2
   001144         114900*                    IS A UNIQUE KEY VALUE FOR THE FILE. THE      IX2144.2
   001145         115000*                    BALANCE OF THE KEY (POSITIONS 8 THRU 13) IS  IX2144.2
   001146         115100*                    NOT A VALID KEY VALUE FOR THE FILE.  THE     IX2144.2
   001147         115200*                    RECORD WITH THE RECORD KEY "CDDDDDDDDD038"   IX2144.2
   001148         115300*                    (RECORD NUMBER 19) IS EXPECTED TO BE FOUND.  IX2144.2
   001149         115400*                                                                 IX2144.2
   001150         115500     START   IX-FS1                                               IX2144.2 225
   001151         115600                    KEY IS NOT LESS THAN R-RECKEY-1-7             IX2144.2 240
   001152      1  115700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2144.2 289 455
   001153      1  115800                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001154      1  115900                     GO TO START-FAIL-GF-05.                      IX2144.2 1167
   001155         116000     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2144.2 289 455
   001156         116100     READ    IX-FS1  AT END                                       IX2144.2 225
   001157      1  116200                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001158      1  116300                     GO TO  START-FAIL-GF-05.                     IX2144.2 1167
   001159         116400     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001160         116500     IF      XRECORD-NUMBER (1) EQUAL TO 19                       IX2144.2 480
   001161      1  116600             PERFORM  PASS                                        IX2144.2 692
   001162      1  116700             MOVE  "SUBORDINATE DATA ITEM OF KEY" TO RE-MARK      IX2144.2 518
   001163      1  116800             GO TO START-WRITE-GF-05.                             IX2144.2 1175
   001164         116900     MOVE    19  TO RECNO.                                        IX2144.2 288
   001165         117000     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   001166         117100     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001167         117200 START-FAIL-GF-05.                                                IX2144.2
   001168         117300     PERFORM  FAIL.                                               IX2144.2 693
   001169         117400     MOVE    19  TO CORRECT-18V0.                                 IX2144.2 544
   001170         117500     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001171         117600           TO RE-MARK.                                            IX2144.2 518
   001172         117700     GO TO   START-WRITE-GF-05.                                   IX2144.2 1175
   001173         117800 START-DELETE-GF-05.                                              IX2144.2
   001174         117900     PERFORM DE-LETE.                                             IX2144.2 694
   001175         118000 START-WRITE-GF-05.                                               IX2144.2
   001176         118100     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001177         118200 START-INIT-GF-06.                                                IX2144.2
   001178         118300     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001179         118400     MOVE "START-TEST-GF-06" TO PAR-NAME.                         IX2144.2 513
   001180         118500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001181      1  118600             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001182      1  118700             GO TO START-DELETE-GF-06.                            IX2144.2 1230
   001183         118800     MOVE    "TTTTTUUUUU390"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001184         118900     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001185         119000     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001186         119100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001187         119200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001188         119300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001189         119400 START-TEST-GF-06.                                                IX2144.2
   001190         119500*                                                                 IX2144.2
   001191         119600*  START-TEST-GF-.06 - THE START STATEMENT USES AN OPERAND IN THE IX2144.2
   001192         119700*                    KEY PHRASE WHICH IS NOT THE NAME OF A RECORD IX2144.2
   001193         119800*                    KEY BUT IS THE NAME OF A DATA ITEM THAT IS   IX2144.2
   001194         119900*                    SUBORDINATE TO THE RECORD KEY.  THE CONTENTS IX2144.2
   001195         120000*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2144.2
   001196         120100*                    RECORD KEY)  IS A DUPLICATE OF THE FIRST     IX2144.2
   001197         120200*                    5 POSITIONS OF 6 OTHER RECORDS IN THE FILE.  IX2144.2
   001198         120300*                    THIS TEST EXPECTS THE RECORD POINTER         IX2144.2
   001199         120400*                    TO BE POSITIONED TO RECORD KEY TTTTTTTTTT380 IX2144.2
   001200         120500*                    (RECORD NUMBER 190) WHICH WAS THE FIRST      IX2144.2
   001201         120600*                    RECORD WRITTEN TO THE FILE                   IX2144.2
   001202         120700*                    THAT CONTAINS TTTTT IN THE FIRST 5 POSITIONS IX2144.2
   001203         120800*                    OF THE KEY.  THE RECORD KEY WAS LOADED WITH  IX2144.2
   001204         120900*                    THE VALUE "TTTTTUUUUU390" (KEY FOR RECORD    IX2144.2
   001205         121000*                    NUMBER 195) BEFORE THE START WAS EXECUTED.   IX2144.2
   001206         121100*                                                                 IX2144.2
   001207         121200     START   IX-FS1                                               IX2144.2 225
   001208         121300                    KEY IS NOT LESS THAN IX-FS1-KEY-1-5           IX2144.2 236
   001209      1  121400                INVALID KEY  MOVE  FS1-STATUS TO FILESTATUS (6)   IX2144.2 289 455
   001210      1  121500                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2144.2 524
   001211      1  121600                     GO TO START-FAIL-GF-06.                      IX2144.2 1224
   001212         121700     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2144.2 289 455
   001213         121800     READ    IX-FS1  AT END                                       IX2144.2 225
   001214      1  121900                     MOVE "AT END ON READ" TO COMPUTED-A          IX2144.2 524
   001215      1  122000                     GO TO START-FAIL-GF-06.                      IX2144.2 1224
   001216         122100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001217         122200     IF      XRECORD-NUMBER (1) EQUAL TO 190                      IX2144.2 480
   001218      1  122300             PERFORM  PASS                                        IX2144.2 692
   001219      1  122400             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2144.2 518
   001220      1  122500             GO TO START-WRITE-GF-06.                             IX2144.2 1232
   001221         122600     MOVE    65  TO RECNO.                                        IX2144.2 288
   001222         122700     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   001223         122800     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001224         122900 START-FAIL-GF-06.                                                IX2144.2
   001225         123000     PERFORM  FAIL.                                               IX2144.2 693
   001226         123100     MOVE    190  TO CORRECT-18V0.                                IX2144.2 544
   001227         123200     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001228         123300           TO RE-MARK.                                            IX2144.2 518
   001229         123400     GO TO   START-WRITE-GF-06.                                   IX2144.2 1232
   001230         123500 START-DELETE-GF-06.                                              IX2144.2
   001231         123600     PERFORM DE-LETE.                                             IX2144.2 694
   001232         123700 START-WRITE-GF-06.                                               IX2144.2
   001233         123800     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001234         123900 START-INIT-GF-07.                                                IX2144.2
   001235         124000     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001236         124100     MOVE "START-TEST-GF-07" TO PAR-NAME.                         IX2144.2 513
   001237         124200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001238      1  124300             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001239      1  124400             GO TO START-DELETE-GF-07.                            IX2144.2 1277
   001240         124500     MOVE    "UUUUUUVUUU410"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001241         124600     MOVE    "FFFFFFFFFG022ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001242         124700     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001243         124800     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001244         124900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001245         125000     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001246         125100 START-TEST-GF-07.                                                IX2144.2
   001247         125200*                                                                 IX2144.2
   001248         125300*  START-TEST-GF-.07 - THE START STATEMENT USES AN OPERAND IN THE IX2144.2
   001249         125400*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2144.2
   001250         125500*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2144.2
   001251         125600*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2144.2
   001252         125700*                    (POSITIONS 1 THRU 7 OF THE RECORD KEY)       IX2144.2
   001253         125800*                    IS LOADED WITH "UUUUUUV" WHICH IS HIGHER THANIX2144.2
   001254         125900*                    THE KEY VALUE OF THE LAST RECORD IN THE FILE.IX2144.2
   001255         126000*                    THERE SHOULD BE NO RECORD IN THE FILE NOT    IX2144.2
   001256         126100*                    LESS THAN THIS KEY VALUE THUS AND INVALID KEYIX2144.2
   001257         126200*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2144.2
   001258         126300*                                                                 IX2144.2
   001259         126400     START  IX-FS1                                                IX2144.2 225
   001260         126500                   KEY IS NOT LESS THAN R-RECKEY-1-7              IX2144.2 240
   001261      1  126600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2144.2 289 455
   001262      1  126700                     GO TO START-PASS-GF-07.                      IX2144.2 1273
   001263         126800     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2144.2 289 455
   001264         126900     READ    IX-FS1  AT END                                       IX2144.2 225
   001265      1  127000                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   001266         127100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001267         127200     PERFORM FAIL.                                                IX2144.2 693
   001268         127300     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2144.2 501 524
   001269         127400     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2144.2 538
   001270         127500     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   001271         127600           TO RE-MARK.                                            IX2144.2 518
   001272         127700     GO TO   START-WRITE-GF-07.                                   IX2144.2 1279
   001273         127800 START-PASS-GF-07.                                                IX2144.2
   001274         127900     PERFORM PASS.                                                IX2144.2 692
   001275         128000     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2144.2 518
   001276         128100     GO TO   START-WRITE-GF-07.                                   IX2144.2 1279
   001277         128200 START-DELETE-GF-07.                                              IX2144.2
   001278         128300     PERFORM DE-LETE.                                             IX2144.2 694
   001279         128400 START-WRITE-GF-07.                                               IX2144.2
   001280         128500     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001281         128600 START-INIT-GF-08.                                                IX2144.2
   001282         128700     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001283         128800     MOVE "START-TEST-GF-08" TO PAR-NAME.                         IX2144.2 513
   001284         128900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001285      1  129000             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001286      1  129100             GO TO START-DELETE-GF-08.                            IX2144.2 1330
   001287         129200     MOVE    "ABBBBBBBBC002"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001288         129300     MOVE    "XYYYYYYYYY399ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001289         129400     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001290         129500     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001291         129600     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001292         129700     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001293         129800 START-TEST-GF-08.                                                IX2144.2
   001294         129900*                                                                 IX2144.2
   001295         130000*  START-TEST-GF-.08 - THIS TEST USES AN OPERAND IN THE KEY       IX2144.2
   001296         130100*                    PHRASE OF THE START STATEMENT WHICH IS A DATAIX2144.2
   001297         130200*                    ITEM SUBORDINATE TO THE RECORD KEY NAME.  THEIX2144.2
   001298         130300*                    CONTENTS OF THE DATA ITEM (POSITIONS 1 THRU  IX2144.2
   001299         130400*                    7 OF THE RECORD KEY) IS LOADED WITH "ABBBBBB"IX2144.2
   001300         130500*                    THIS KEY VALUE IS LOWER THAN ANY RECORD      IX2144.2
   001301         130600*                    KEY VALUE IN POSITIONS 1 THRU 7 EXISTING     IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001302         130700*                    IN THE FILE.  THE START STATEMENT WITH THE   IX2144.2
   001303         130800*                    KEY IS NOT LESS THAN PHRASE IS EXECUTED AND  IX2144.2
   001304         130900*                    SHOULD FIND THE RECORD WITH THE KEY VALUE    IX2144.2
   001305         131000*                    "BBBBBBBBBC002" (RECORD NUMBER 01).          IX2144.2
   001306         131100*                                                                 IX2144.2
   001307         131200     START   IX-FS1                                               IX2144.2 225
   001308         131300                    KEY IS NOT LESS THAN R-RECKEY-1-7             IX2144.2 240
   001309      1  131400          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2144.2 289 455
   001310      1  131500                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2144.2 524
   001311      1  131600                     GO TO START-FAIL-GF-08.                      IX2144.2 1324
   001312         131700     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2144.2 289 455
   001313         131800     READ    IX-FS1  AT END                                       IX2144.2 225
   001314      1  131900                     MOVE "AT END ON READ" TO COMPUTED-A          IX2144.2 524
   001315      1  132000                     GO TO START-FAIL-GF-08.                      IX2144.2 1324
   001316         132100     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001317         132200     IF      XRECORD-NUMBER (1) EQUAL TO 001                      IX2144.2 480
   001318      1  132300             PERFORM  PASS                                        IX2144.2 692
   001319      1  132400             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2144.2 518
   001320      1  132500             GO TO START-WRITE-GF-08.                             IX2144.2 1332
   001321         132600     MOVE    01  TO RECNO.                                        IX2144.2 288
   001322         132700     PERFORM DISPLAY-RECORD-KEYS.                                 IX2144.2 2328
   001323         132800     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001324         132900 START-FAIL-GF-08.                                                IX2144.2
   001325         133000     PERFORM  FAIL.                                               IX2144.2 693
   001326         133100     MOVE    001   TO CORRECT-18V0.                               IX2144.2 544
   001327         133200     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001328         133300           TO RE-MARK.                                            IX2144.2 518
   001329         133400     GO TO   START-WRITE-GF-08.                                   IX2144.2 1332
   001330         133500 START-DELETE-GF-08.                                              IX2144.2
   001331         133600     PERFORM DE-LETE.                                             IX2144.2 694
   001332         133700 START-WRITE-GF-08.                                               IX2144.2
   001333         133800     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001334         133900 START-INIT-GF-09.                                                IX2144.2
   001335         134000     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001336         134100     MOVE "START-TEST-GF-09" TO PAR-NAME.                         IX2144.2 513
   001337         134200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001338      1  134300             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001339      1  134400             GO TO START-DELETE-GF-09.                            IX2144.2 1378
   001340         134500     MOVE    "UUUUUUVVVV400"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001341         134600     MOVE    "EEEEEEEEEF002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001342         134700     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001343         134800     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001344         134900     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001345         135000     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001346         135100 START-TEST-GF-09.                                                IX2144.2
   001347         135200*                                                                 IX2144.2
   001348         135300*  START-TEST-GF-.09 - THIS TEST USES AN OPERAND IN THE           IX2144.2
   001349         135400*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2144.2
   001350         135500*                    A DATA ITEM SUBORDINATE TO THE RECORD KEY    IX2144.2
   001351         135600*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2144.2
   001352         135700*                    (POSITIONS 1 THRU 7  OF THE RECORD KEY) IS   IX2144.2
   001353         135800*                    LOADED WITH "UUUUUUV".  THIS KEY VALUE       IX2144.2
   001354         135900*                    IS NOT LESS THAN ANY RECORD KEY VALUE IN     IX2144.2
   001355         136000*                    POSITION 1 THRU 7 EXISTING IN THE FILE       IX2144.2
   001356         136100*                    THEREFORE AN INVALID KEY CONDITION IS        IX2144.2
   001357         136200*                    EXPECTED WHEN THE START STATEMENT IS         IX2144.2
   001358         136300*                    EXECUTED.                                    IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001359         136400*                                                                 IX2144.2
   001360         136500     START   IX-FS1                                               IX2144.2 225
   001361         136600                    KEY IS NOT LESS THAN R-RECKEY-1-7             IX2144.2 240
   001362      1  136700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (9)       IX2144.2 289 455
   001363      1  136800                     GO TO START-PASS-GF-09.                      IX2144.2 1374
   001364         136900     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2144.2 289 455
   001365         137000     READ    IX-FS1  AT END                                       IX2144.2 225
   001366      1  137100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   001367         137200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001368         137300     PERFORM FAIL.                                                IX2144.2 693
   001369         137400     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2144.2 501 524
   001370         137500     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2144.2 538
   001371         137600     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   001372         137700           TO RE-MARK.                                            IX2144.2 518
   001373         137800     GO TO   START-WRITE-GF-09.                                   IX2144.2 1380
   001374         137900 START-PASS-GF-09.                                                IX2144.2
   001375         138000     PERFORM PASS.                                                IX2144.2 692
   001376         138100     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2144.2 518
   001377         138200     GO TO   START-WRITE-GF-09.                                   IX2144.2 1380
   001378         138300 START-DELETE-GF-09.                                              IX2144.2
   001379         138400     PERFORM DE-LETE.                                             IX2144.2 694
   001380         138500 START-WRITE-GF-09.                                               IX2144.2
   001381         138600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001382         138700     CLOSE   IX-FS1.                                              IX2144.2 225
   001383         138800                                                                  IX2144.2
   001384         138900*                                                                 IX2144.2
   001385         139000*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2144.2
   001386         139100*  CAPTURED FROM THE TESTS IN START-TEST-GF-.                     IX2144.2
   001387         139200*                                                                 IX2144.2
   001388         139300 START-TEST-GF-10.                                                IX2144.2
   001389         139400     MOVE              "FILE STATUS START:00"  TO FEATURE.        IX2144.2 509
   001390         139500     MOVE "START-TEST-GF-10" TO PAR-NAME.                         IX2144.2 513
   001391         139600     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2144.2 455
   001392      1  139700             PERFORM DE-LETE                                      IX2144.2 694
   001393      1  139800             MOVE "FROM START-TEST-GF-01"  TO CORRECT-A           IX2144.2 538
   001394      1  139900             GO TO  START-TEST-GF-10A.                            IX2144.2 1407
   001395         140000*                                                                 IX2144.2
   001396         140100*  START-TEST-004.01 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001397         140200*                    RESULTING FROM START-TEST-GF-01.  THE FILE   IX2144.2
   001398         140300*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2144.2
   001399         140400*                                                                 IX2144.2
   001400         140500     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2144.2 455
   001401      1  140600             PERFORM PASS                                         IX2144.2 692
   001402         140700     ELSE                                                         IX2144.2
   001403      1  140800         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-01" TO RE-MARKIX2144.2 518
   001404      1  140900             PERFORM  FAIL                                        IX2144.2 693
   001405      1  141000             MOVE  "00"  TO CORRECT-A                             IX2144.2 538
   001406      1  141100             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2144.2 455 524
   001407         141200 START-TEST-GF-10A.                                               IX2144.2
   001408         141300     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001409         141400 START-TEST-GF-11.                                                IX2144.2
   001410         141500     MOVE              "FILE STATUS START:00"  TO FEATURE.        IX2144.2 509
   001411         141600     MOVE "START-TEST-GF-11" TO PAR-NAME.                         IX2144.2 513
   001412         141700     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2144.2 455
   001413      1  141800             PERFORM DE-LETE                                      IX2144.2 694
   001414      1  141900             MOVE "FROM START-TEST-GF-02"  TO CORRECT-A           IX2144.2 538
   001415      1  142000             GO TO  START-TEST-GF-11A.                            IX2144.2 1427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001416         142100*                                                                 IX2144.2
   001417         142200*  START-TEST-004.02 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001418         142300*                    RESULTING FROM START-TEST-GF-02.  THE FILE   IX2144.2
   001419         142400*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   001420         142500*                                                                 IX2144.2
   001421         142600     IF      FILESTATUS (2) EQUAL TO "00"                         IX2144.2 455
   001422      1  142700             PERFORM  PASS                                        IX2144.2 692
   001423      1  142800             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001424      1  142900         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-02" TO RE-MARKIX2144.2 518
   001425      1  143000             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   001426      1  143100             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2144.2 455 524
   001427         143200 START-TEST-GF-11A.                                               IX2144.2
   001428         143300     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001429         143400 START-TEST-GF-12.                                                IX2144.2
   001430         143500     MOVE "START-TEST-GF-12" TO PAR-NAME.                         IX2144.2 513
   001431         143600     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2144.2 455
   001432      1  143700             PERFORM DE-LETE                                      IX2144.2 694
   001433      1  143800             MOVE "FROM START-TEST-GF-03"  TO CORRECT-A           IX2144.2 538
   001434      1  143900             GO TO  START-TEST-GF-12A.                            IX2144.2 1446
   001435         144000*                                                                 IX2144.2
   001436         144100*  START-TEST-004.03 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001437         144200*                    RESULTING FROM START-TEST-GF-03.  THE FILE   IX2144.2
   001438         144300*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   001439         144400*                                                                 IX2144.2
   001440         144500     IF      FILESTATUS (3) EQUAL TO "00"                         IX2144.2 455
   001441      1  144600             PERFORM  PASS                                        IX2144.2 692
   001442      1  144700             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001443      1  144800         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-03" TO RE-MARKIX2144.2 518
   001444      1  144900             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   001445      1  145000             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2144.2 455 524
   001446         145100 START-TEST-GF-12A.                                               IX2144.2
   001447         145200     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001448         145300 START-TEST-GF-13.                                                IX2144.2
   001449         145400     MOVE              "FILE STATUS START:23"  TO FEATURE.        IX2144.2 509
   001450         145500     MOVE "START-TEST-GF-13" TO PAR-NAME.                         IX2144.2 513
   001451         145600     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2144.2 455
   001452      1  145700             PERFORM DE-LETE                                      IX2144.2 694
   001453      1  145800             MOVE "FROM START-TEST-GF-04"  TO CORRECT-A           IX2144.2 538
   001454      1  145900             GO TO  START-TEST-GF-13A.                            IX2144.2 1466
   001455         146000*                                                                 IX2144.2
   001456         146100*  START-TEST-004.04 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001457         146200*                    RESULTING FROM START-TEST-GF-04.  THE FILE   IX2144.2
   001458         146300*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2144.2
   001459         146400*                                                                 IX2144.2
   001460         146500     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2144.2 455
   001461      1  146600             PERFORM  PASS                                        IX2144.2 692
   001462      1  146700             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001463      1  146800         MOVE "FROM START-TEST-GF-04; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   001464      1  146900             MOVE    "23"  TO CORRECT-A                           IX2144.2 538
   001465      1  147000             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2144.2 455 524
   001466         147100 START-TEST-GF-13A.                                               IX2144.2
   001467         147200     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001468         147300 START-TEST-GF-14.                                                IX2144.2
   001469         147400     MOVE              "FILE STATUS START:00"  TO FEATURE.        IX2144.2 509
   001470         147500     MOVE "START-TEST-GF-14" TO PAR-NAME.                         IX2144.2 513
   001471         147600     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2144.2 455
   001472      1  147700             PERFORM DE-LETE                                      IX2144.2 694
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001473      1  147800             MOVE "FROM START-TEST-GF-05"  TO CORRECT-A           IX2144.2 538
   001474      1  147900             GO TO  START-TEST-GF-14A.                            IX2144.2 1486
   001475         148000*                                                                 IX2144.2
   001476         148100*  START-TEST-004.05 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001477         148200*                    RESULTING FROM START-TEST-GF-05.  THE FILE   IX2144.2
   001478         148300*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   001479         148400*                                                                 IX2144.2
   001480         148500     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2144.2 455
   001481      1  148600             PERFORM  PASS                                        IX2144.2 692
   001482      1  148700             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001483      1  148800         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-05" TO RE-MARKIX2144.2 518
   001484      1  148900             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   001485      1  149000             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2144.2 455 524
   001486         149100 START-TEST-GF-14A.                                               IX2144.2
   001487         149200     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001488         149300 START-TEST-GF-15.                                                IX2144.2
   001489         149400     MOVE "START-TEST-GF-15" TO PAR-NAME.                         IX2144.2 513
   001490         149500     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2144.2 455
   001491      1  149600             PERFORM DE-LETE                                      IX2144.2 694
   001492      1  149700             MOVE "FROM START-TEST-GF-06"  TO CORRECT-A           IX2144.2 538
   001493      1  149800             GO TO  START-TEST-GF-15A.                            IX2144.2 1505
   001494         149900*                                                                 IX2144.2
   001495         150000*  START-TEST-004.06 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001496         150100*                    RESULTING FROM START-TEST-GF-06.  THE FILE   IX2144.2
   001497         150200*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   001498         150300*                                                                 IX2144.2
   001499         150400     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2144.2 455
   001500      1  150500             PERFORM  PASS                                        IX2144.2 692
   001501      1  150600             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001502      1  150700         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-06" TO RE-MARKIX2144.2 518
   001503      1  150800             MOVE   "00"  TO CORRECT-A                            IX2144.2 538
   001504      1  150900             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2144.2 455 524
   001505         151000 START-TEST-GF-15A.                                               IX2144.2
   001506         151100     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001507         151200 START-TEST-GF-16.                                                IX2144.2
   001508         151300     MOVE              "FILE STATUS START:23"  TO FEATURE.        IX2144.2 509
   001509         151400     MOVE "START-TEST-GF-16" TO PAR-NAME.                         IX2144.2 513
   001510         151500     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2144.2 455
   001511      1  151600             PERFORM DE-LETE                                      IX2144.2 694
   001512      1  151700             MOVE "FROM START-TEST-GF-07"  TO CORRECT-A           IX2144.2 538
   001513      1  151800             GO TO  START-TEST-GF-16A.                            IX2144.2 1525
   001514         151900*                                                                 IX2144.2
   001515         152000*  START-TEST-004.07 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001516         152100*                    RESULTING FROM START-TEST-GF-07.  THE FILE   IX2144.2
   001517         152200*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2144.2
   001518         152300*                                                                 IX2144.2
   001519         152400     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2144.2 455
   001520      1  152500             PERFORM  PASS                                        IX2144.2 692
   001521      1  152600             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001522      1  152700         MOVE "FROM START-TEST-GF-07; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   001523      1  152800             MOVE    "23"  TO CORRECT-A                           IX2144.2 538
   001524      1  152900             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2144.2 455 524
   001525         153000 START-TEST-GF-16A.                                               IX2144.2
   001526         153100     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001527         153200 START-TEST-GF-17.                                                IX2144.2
   001528         153300     MOVE              "FILE STATUS START:00"  TO FEATURE.        IX2144.2 509
   001529         153400     MOVE "START-TEST-GF-17" TO PAR-NAME.                         IX2144.2 513
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001530         153500     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2144.2 455
   001531      1  153600             PERFORM DE-LETE                                      IX2144.2 694
   001532      1  153700             MOVE "FROM START-TEST-GF-08"  TO CORRECT-A           IX2144.2 538
   001533      1  153800             GO TO  START-TEST-GF-17A.                            IX2144.2 1545
   001534         153900*                                                                 IX2144.2
   001535         154000*  START-TEST-004.08 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001536         154100*                    RESULTING FROM START-TEST-GF-08.  THE FILE   IX2144.2
   001537         154200*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   001538         154300*                                                                 IX2144.2
   001539         154400     IF      FILESTATUS (8) EQUAL TO "00"                         IX2144.2 455
   001540      1  154500             PERFORM  PASS                                        IX2144.2 692
   001541      1  154600             ELSE  PERFORM  FAIL                                  IX2144.2 693
   001542      1  154700         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-08" TO RE-MARKIX2144.2 518
   001543      1  154800             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   001544      1  154900             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2144.2 455 524
   001545         155000 START-TEST-GF-17A.                                               IX2144.2
   001546         155100     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001547         155200 START-TEST-GF-18.                                                IX2144.2
   001548         155300     MOVE              "FILE STATUS START:23"  TO FEATURE.        IX2144.2 509
   001549         155400     MOVE "START-TEST-GF-18" TO PAR-NAME.                         IX2144.2 513
   001550         155500     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2144.2 455
   001551      1  155600             PERFORM DE-LETE                                      IX2144.2 694
   001552      1  155700             MOVE "FROM START-TEST-GF-09"  TO CORRECT-A           IX2144.2 538
   001553      1  155800             GO TO  START-TEST-GF-18A.                            IX2144.2 1565
   001554         155900*                                                                 IX2144.2
   001555         156000*  START-TEST-004.09 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   001556         156100*                    RESULTING FROM START-TEST-GF-09.  THE FILE   IX2144.2
   001557         156200*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2144.2
   001558         156300*                                                                 IX2144.2
   001559         156400     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2144.2 455
   001560      1  156500             PERFORM PASS                                         IX2144.2 692
   001561      1  156600     ELSE    PERFORM FAIL                                         IX2144.2 693
   001562      1  156700         MOVE "FROM START-TEST-GF-09; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   001563      1  156800             MOVE  "23"  TO CORRECT-A                             IX2144.2 538
   001564      1  156900             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2144.2 455 524
   001565         157000 START-TEST-GF-18A.                                               IX2144.2
   001566         157100     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   001567         157200                                                                  IX2144.2
   001568         157300                                                                  IX2144.2
   001569         157400*START-INIT-005.                                                  IX2144.2
   001570         157500     OPEN    INPUT  IX-FS1.                                       IX2144.2 225
   001571         157600     MOVE    "STR NLT ALTKY W/O DUP" TO FEATURE.                  IX2144.2 509
   001572         157700     MOVE    SPACE TO HOLD-FILESTATUS-RECORD.                     IX2144.2 IMP 454
   001573         157800*                                                                 IX2144.2
   001574         157900* THE "START -  NOT LESS THAN--" IS CHECKED FOR PROPER POSITIONINGIX2144.2
   001575         158000* OF THE RECORD POINTER FOR THE SUBSEQUENT READ STATEMENT.        IX2144.2
   001576         158100* START-TEST-GF  USES ONLY THE ALTERNATE RECORD KEY WITHOUT THE   IX2144.2
   001577         158200* THE DUPLICATES OPTION FOR ESTABLISHING THE CURRENT RECORD       IX2144.2
   001578         158300* POINTER FOR THE FILE.  THE FOLLOWING IS A SUMMARY OF THE TEST   IX2144.2
   001579         158400* CONDITIONS AND THE EXPECTED ACTION TO BE TAKEN FOR THE TESTS.   IX2144.2
   001580         158500*                                                                 IX2144.2
   001581         158600*                      CONDITIONS (CONTENTS OF KEY) / ACTION      IX2144.2
   001582         158700*                                                                 IX2144.2
   001583         158800*   START-TEST-GF-19  - EQUAL A RECORD IN FILE / RECORD FOUND     IX2144.2
   001584         158900*   START-TEST-GF-20  - BETWEEN 2 KEY VALUES / RECORD FOUND       IX2144.2
   001585         159000*   START-TEST-GF-21  - LESS THAN FIRST FILE REC. / REC. FOUND    IX2144.2
   001586         159100*   START-TEST-GF-22  - NOT LESS THAN LAST FILE RECORD / INVALID KIX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001587         159200*   START-TEST-GF-23  - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUIX2144.2
   001588         159300*   START-TEST-GF-24  - UNEQUAL SIZE OPERANDS (EQUAL) / RECORD FOUIX2144.2
   001589         159400*   START-TEST-GF-25  - UNEQUAL SIZE OPERANDS (UNEQUAL) / INVLD KEIX2144.2
   001590         159500*   START-TEST-GF-26  - UNEQUAL SIZE OPERANDS (UNEQUAL) / REC FOUNIX2144.2
   001591         159600*   START-TEST-GF-27  - UNEQUAL SIZE OPERANDS (UNEQUAL) /INVLD KEYIX2144.2
   001592         159700*                                                                 IX2144.2
   001593         159800*  BEFORE EACH TEST A RECORD IS MADE AVAILABLE WHICH IS DIFFERENT IX2144.2
   001594         159900*  THAN THE ONE WHICH IS EXPECTED TO BE PRESENT FOLLOWING A TEST. IX2144.2
   001595         160000*  IF DURING THIS INITIALIZATION AN INVALID KEY OCCURS THE TEST   IX2144.2
   001596         160100*  WILL BE DELETED AND CONTROL WILL BE PASSED TO THE NEXT TEST.   IX2144.2
   001597         160200*  WHEN TESTING IF AN INVALID KEY IS EXPECTED, THE KEYS           IX2144.2
   001598         160300*  ASSOCIATED WITH THE FILE WHICH ARE NOT PARTICIPATING IN THE    IX2144.2
   001599         160400*  START STATEMENT WILL BE LOADED WITH VALUES WHICH WOULD         IX2144.2
   001600         160500*  MATCH RECORDS IN THE FILE.  BUT IF A KEY MATCH IS EXPECTED FROMIX2144.2
   001601         160600*  THE TEST, THE KEYS ASSOCIATED WITH THE FILE WHICH ARE NOT      IX2144.2
   001602         160700*  PARTICIPATING IN THE START STATEMENT WILL BE LOADED WITH       IX2144.2
   001603         160800*  VALUES WHICH WOULD NOT MATCH RECORDS IN THE FILE.  THE FILE    IX2144.2
   001604         160900*  STATUS FROM EXECUTION OF EACH START IS CAPTURED FOR LATER TESTSIX2144.2
   001605         161000*                                                                 IX2144.2
   001606         161100 START-INIT-GF-19.                                                IX2144.2
   001607         161200     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001608         161300     MOVE "START-TEST-GF-19"  TO PAR-NAME.                        IX2144.2 513
   001609         161400     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001610      1  161500             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001611      1  161600             GO TO START-DELETE-GF-19.                            IX2144.2 1647
   001612         161700     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001613         161800     MOVE    "XXXXXXXXYY384ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001614         161900     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001615         162000     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   001616         162100     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   001617         162200     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   001618         162300 START-TEST-GF-19.                                                IX2144.2
   001619         162400*                                                                 IX2144.2
   001620         162500*  START-TEST-GF.01  - THE START SHOULD FIND A RECORD IN THE FILE IX2144.2
   001621         162600*                    WHICH HAS AN ALTERNATE KEY VALUE OF          IX2144.2
   001622         162700*                    XXXXXXXXYY384ALTKEY1 (RECORD NUMBER 192).    IX2144.2
   001623         162800*                                                                 IX2144.2
   001624         162900     START   IX-FS1                                               IX2144.2 225
   001625         163000                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1           IX2144.2 245
   001626      1  163100                INVALID KEY  MOVE FS1-STATUS TO FILESTATUS (1)    IX2144.2 289 455
   001627      1  163200                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001628      1  163300                        GO TO START-FAIL-GF-19.                   IX2144.2 1641
   001629         163400     MOVE    FS1-STATUS TO FILESTATUS (1).                        IX2144.2 289 455
   001630         163500     READ    IX-FS1  AT END                                       IX2144.2 225
   001631      1  163600                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001632      1  163700                     GO TO START-FAIL-GF-19.                      IX2144.2 1641
   001633         163800     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   001634         163900     IF      XRECORD-NUMBER (1)  EQUAL TO 192                     IX2144.2 480
   001635      1  164000             PERFORM PASS                                         IX2144.2 692
   001636      1  164100             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   001637      1  164200             GO TO START-WRITE-GF-19.                             IX2144.2 1649
   001638         164300     MOVE    67  TO RECNO.                                        IX2144.2 288
   001639         164400     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001640         164500     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   001641         164600 START-FAIL-GF-19.                                                IX2144.2
   001642         164700     PERFORM FAIL.                                                IX2144.2 693
   001643         164800     MOVE    192  TO CORRECT-18V0.                                IX2144.2 544
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001644         164900     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001645         165000           TO RE-MARK.                                            IX2144.2 518
   001646         165100     GO TO   START-WRITE-GF-19.                                   IX2144.2 1649
   001647         165200 START-DELETE-GF-19.                                              IX2144.2
   001648         165300     PERFORM DE-LETE.                                             IX2144.2 694
   001649         165400 START-WRITE-GF-19.                                               IX2144.2
   001650         165500     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001651         165600 START-INIT-GF-20.                                                IX2144.2
   001652         165700     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001653         165800     MOVE "START-TEST-GF-20"  TO PAR-NAME.                        IX2144.2 513
   001654         165900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001655      1  166000             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001656      1  166100             GO TO START-DELETE-GF-20.                            IX2144.2 1695
   001657         166200     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001658         166300     MOVE    "HHHHHHHIII67ALTKEY1"  TO FS1-ALTKEY1-1-20.          IX2144.2 273
   001659         166400     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001660         166500     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   001661         166600     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   001662         166700     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   001663         166800 START-TEST-GF-20.                                                IX2144.2
   001664         166900*                                                                 IX2144.2
   001665         167000*  START-TEST-GF.02  - THE START SHOULD FIND A RECORD IN THE FILE IX2144.2
   001666         167100*                    WHICH HAS AN ALTERNATE KEY VALUE OF          IX2144.2
   001667         167200*                    HHHHHHIIII068ALTKEY1 (RECORD NUMBER 34).     IX2144.2
   001668         167300*                    THE DATA ITEM WAS LOADED WITH A KEY VALUE    IX2144.2
   001669         167400*                    SEQUENTIALLY LOCATED BETWEEN TWO CURRENTLY   IX2144.2
   001670         167500*                    EXISTING ALTERNATE KEYS IN THE FILE.         IX2144.2
   001671         167600*                                                                 IX2144.2
   001672         167700     START   IX-FS1                                               IX2144.2 225
   001673         167800                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1           IX2144.2 245
   001674      1  167900                INVALID KEY  MOVE FS1-STATUS TO FILESTATUS (2)    IX2144.2 289 455
   001675      1  168000                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001676      1  168100                        GO TO START-FAIL-GF-20.                   IX2144.2 1689
   001677         168200     MOVE    FS1-STATUS TO FILESTATUS (2).                        IX2144.2 289 455
   001678         168300     READ    IX-FS1  AT END                                       IX2144.2 225
   001679      1  168400                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001680      1  168500                     GO TO START-FAIL-GF-20.                      IX2144.2 1689
   001681         168600     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   001682         168700     IF      XRECORD-NUMBER (1)  EQUAL TO 034                     IX2144.2 480
   001683      1  168800             PERFORM PASS                                         IX2144.2 692
   001684      1  168900             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   001685      1  169000             GO TO START-WRITE-GF-20.                             IX2144.2 1697
   001686         169100     MOVE    34  TO RECNO.                                        IX2144.2 288
   001687         169200     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001688         169300     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   001689         169400 START-FAIL-GF-20.                                                IX2144.2
   001690         169500     PERFORM FAIL.                                                IX2144.2 693
   001691         169600     MOVE    034  TO CORRECT-18V0.                                IX2144.2 544
   001692         169700     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001693         169800           TO RE-MARK.                                            IX2144.2 518
   001694         169900     GO TO   START-WRITE-GF-20.                                   IX2144.2 1697
   001695         170000 START-DELETE-GF-20.                                              IX2144.2
   001696         170100     PERFORM DE-LETE.                                             IX2144.2 694
   001697         170200 START-WRITE-GF-20.                                               IX2144.2
   001698         170300     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001699         170400 START-INIT-GF-21.                                                IX2144.2
   001700         170500     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001701         170600     MOVE "START-TEST-GF-21"  TO PAR-NAME.                        IX2144.2 513
   001702         170700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001703      1  170800             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001704      1  170900             GO TO START-DELETE-GF-21.                            IX2144.2 1744
   001705         171000     MOVE    "CCCCCDDDDD022"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001706         171100     MOVE    "EEEEEEEEEF001ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001707         171200     MOVE    "EEEEEFFFFF022ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001708         171300     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   001709         171400     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   001710         171500     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   001711         171600 START-TEST-GF-21.                                                IX2144.2
   001712         171700*                                                                 IX2144.2
   001713         171800*  START-TEST-GF.03  - THE START STATEMENT SHOULD FIND A          IX2144.2
   001714         171900*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2144.2
   001715         172000*                    KEY VALUE OF EEEEEEEEEF002ALTKEY1 (RECORD    IX2144.2
   001716         172100*                    NUMBER 01).  THE ALTERNATE KEY WAS LOADED    IX2144.2
   001717         172200*                    WITH A VALUE THAT IS SEQUENTIALLY LOWER      IX2144.2
   001718         172300*                    THAN ANY CURRENTLY EXISTNNG KEY IN THE FILE  IX2144.2
   001719         172400*                    BEFORE THE START WAS EXECUTED.               IX2144.2
   001720         172500*                                                                 IX2144.2
   001721         172600     START   IX-FS1                                               IX2144.2 225
   001722         172700                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1           IX2144.2 245
   001723      1  172800                INVALID KEY  MOVE FS1-STATUS TO FILESTATUS (3)    IX2144.2 289 455
   001724      1  172900                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001725      1  173000                        GO TO START-FAIL-GF-21.                   IX2144.2 1738
   001726         173100     MOVE    FS1-STATUS TO FILESTATUS (3).                        IX2144.2 289 455
   001727         173200     READ    IX-FS1  AT END                                       IX2144.2 225
   001728      1  173300                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001729      1  173400                     GO TO START-FAIL-GF-21.                      IX2144.2 1738
   001730         173500     MOVE    IX-FS1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2144.2 229 471
   001731         173600     IF      XRECORD-NUMBER (1)  EQUAL TO 001                     IX2144.2 480
   001732      1  173700             PERFORM PASS                                         IX2144.2 692
   001733      1  173800             MOVE SPACE TO RE-MARK                                IX2144.2 IMP 518
   001734      1  173900             GO TO START-WRITE-GF-21.                             IX2144.2 1746
   001735         174000     MOVE    01  TO RECNO.                                        IX2144.2 288
   001736         174100     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001737         174200     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2144.2 480 531
   001738         174300 START-FAIL-GF-21.                                                IX2144.2
   001739         174400     PERFORM FAIL.                                                IX2144.2 693
   001740         174500     MOVE    001  TO CORRECT-18V0.                                IX2144.2 544
   001741         174600     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001742         174700           TO RE-MARK.                                            IX2144.2 518
   001743         174800     GO TO   START-WRITE-GF-21.                                   IX2144.2 1746
   001744         174900 START-DELETE-GF-21.                                              IX2144.2
   001745         175000     PERFORM DE-LETE.                                             IX2144.2 694
   001746         175100 START-WRITE-GF-21.                                               IX2144.2
   001747         175200     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001748         175300 START-INIT-GF-22.                                                IX2144.2
   001749         175400     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001750         175500     MOVE "START-TEST-GF-22"  TO PAR-NAME.                        IX2144.2 513
   001751         175600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001752      1  175700             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001753      1  175800             GO TO START-DELETE-GF-22.                            IX2144.2 1788
   001754         175900     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001755         176000     MOVE    "YYYYYYYYYY401ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001756         176100     MOVE    "DDDDDDDDDD000ALTKEY2" TO FS1-ALTKEY2-1-20.          IX2144.2 281
   001757         176200     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001758         176300     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001759         176400     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001760         176500 START-TEST-GF-22.                                                IX2144.2
   001761         176600*                                                                 IX2144.2
   001762         176700*  START-TEST-GF.04  - THE START STATEMENT SHOULD NOT FIND A      IX2144.2
   001763         176800*                    RECORD IN THE FILE WHICH HAS AN ALTERNATE    IX2144.2
   001764         176900*                    KEY VALUE OF YYYYYYYYYY401ALTKEY1.  THIS     IX2144.2
   001765         177000*                    VALUE IS SEQUENTIALLY NOT LESS THAN          IX2144.2
   001766         177100*                    ANY ALTERNATE KEY CURRENTLY EXISTING IN      IX2144.2
   001767         177200*                    THE FILE.  AN INVALID KEY CONDITION          IX2144.2
   001768         177300*                    IS EXPECTED WHEN THE START IS EXECUTED.      IX2144.2
   001769         177400*                                                                 IX2144.2
   001770         177500     START   IX-FS1                                               IX2144.2 225
   001771         177600                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1           IX2144.2 245
   001772      1  177700                INVALID KEY  MOVE  FS1-STATUS TO FILESTATUS (4)   IX2144.2 289 455
   001773      1  177800                         GO TO START-PASS-GF-22.                  IX2144.2 1784
   001774         177900     MOVE    FS1-STATUS TO FILESTATUS (4).                        IX2144.2 289 455
   001775         178000     READ    IX-FS1 AT END                                        IX2144.2 225
   001776      1  178100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   001777         178200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001778         178300     PERFORM FAIL.                                                IX2144.2 693
   001779         178400     MOVE    ALTERNATE-KEY1 (1) TO COMPUTED-A.                    IX2144.2 503 524
   001780         178500     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2144.2 538
   001781         178600     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   001782         178700           TO RE-MARK.                                            IX2144.2 518
   001783         178800     GO TO   START-WRITE-GF-22.                                   IX2144.2 1790
   001784         178900 START-PASS-GF-22.                                                IX2144.2
   001785         179000     PERFORM  PASS.                                               IX2144.2 692
   001786         179100     MOVE     "INVALID KEY"  TO RE-MARK.                          IX2144.2 518
   001787         179200     GO TO   START-WRITE-GF-22.                                   IX2144.2 1790
   001788         179300 START-DELETE-GF-22.                                              IX2144.2
   001789         179400     PERFORM DE-LETE.                                             IX2144.2 694
   001790         179500 START-WRITE-GF-22.                                               IX2144.2
   001791         179600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001792         179700 START-INIT-GF-23.                                                IX2144.2
   001793         179800     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001794         179900     MOVE "START-TEST-GF-23"  TO PAR-NAME.                        IX2144.2 513
   001795         180000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001796      1  180100             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001797      1  180200             GO TO START-DELETE-GF-23.                            IX2144.2 1843
   001798         180300     MOVE    "CDDDDDDDDD039"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001799         180400     MOVE    "GGGGHHHHHH100ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001800         180500     MOVE    "ABCXXXXXXX400ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001801         180600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001802         180700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001803         180800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001804         180900 START-TEST-GF-23.                                                IX2144.2
   001805         181000*                                                                 IX2144.2
   001806         181100*  START-TEST-GF.05  - THE START STATEMENT USES AN OPERAND        IX2144.2
   001807         181200*                    IN THE KEY PHRASE WHICH IS NOT THE NAME      IX2144.2
   001808         181300*                    OF AN ALTERNATE KEY BUT IS THE NAME OF A     IX2144.2
   001809         181400*                    DATA ITEM WHICH IS SUBORDINATE TO THE        IX2144.2
   001810         181500*                    ALTERNATE KEY.  THE CONTENTS OF THE DATA ITEMIX2144.2
   001811         181600*                    (POSITIONS 1 THRU 6 OF THE ALTERNATE KEY)    IX2144.2
   001812         181700*                    IS A UNIQUE KEY VALUE FOR THE FILE.  THE     IX2144.2
   001813         181800*                    BALANCE OF THE KEY (POSITIONS 7 THRU 20 OF   IX2144.2
   001814         181900*                    THE ALTERNATE KEY IS NOT A VALID KEY VALUE   IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001815         182000*                    FOR THE FILE.  THE                           IX2144.2
   001816         182100*                    RECORD WITH THE ALTERNATE KEY GGGGHHHHHH052  IX2144.2
   001817         182200*                    ALTKEY1 (RECORD NUMBER 26) IS EXPECTED TO    IX2144.2
   001818         182300*                    BE FOUND.                                    IX2144.2
   001819         182400*                                                                 IX2144.2
   001820         182500     START   IX-FS1                                               IX2144.2 225
   001821         182600                    KEY IS NOT LESS THAN R-ALTKEY1-1-6            IX2144.2 252
   001822      1  182700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (5)       IX2144.2 289 455
   001823      1  182800                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   001824      1  182900                     GO TO START-FAIL-GF-23.                      IX2144.2 1837
   001825         183000     MOVE    FS1-STATUS TO FILESTATUS (5).                        IX2144.2 289 455
   001826         183100     READ    IX-FS1  AT END                                       IX2144.2 225
   001827      1  183200                     MOVE  "AT END ON READ" TO COMPUTED-A         IX2144.2 524
   001828      1  183300                     GO TO  START-FAIL-GF-23.                     IX2144.2 1837
   001829         183400     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001830         183500     IF      XRECORD-NUMBER (1)  EQUAL TO 26                      IX2144.2 480
   001831      1  183600             PERFORM  PASS                                        IX2144.2 692
   001832      1  183700             MOVE  "SUBORDINATE DATA ITEM OF KEY" TO RE-MARK      IX2144.2 518
   001833      1  183800             GO TO START-WRITE-GF-23.                             IX2144.2 1845
   001834         183900     MOVE    26  TO RECNO.                                        IX2144.2 288
   001835         184000     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001836         184100     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001837         184200 START-FAIL-GF-23.                                                IX2144.2
   001838         184300     PERFORM  FAIL.                                               IX2144.2 693
   001839         184400     MOVE    26  TO CORRECT-18V0.                                 IX2144.2 544
   001840         184500     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001841         184600           TO RE-MARK.                                            IX2144.2 518
   001842         184700     GO TO   START-WRITE-GF-23.                                   IX2144.2 1845
   001843         184800 START-DELETE-GF-23.                                              IX2144.2
   001844         184900     PERFORM DE-LETE.                                             IX2144.2 694
   001845         185000 START-WRITE-GF-23.                                               IX2144.2
   001846         185100     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001847         185200 START-INIT-GF-24.                                                IX2144.2
   001848         185300     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001849         185400     MOVE "START-TEST-GF-24"  TO PAR-NAME.                        IX2144.2 513
   001850         185500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001851      1  185600             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001852      1  185700             GO TO START-DELETE-GF-24.                            IX2144.2 1901
   001853         185800     MOVE    "YYYYYUUUUU390"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001854         185900     MOVE    "XXXXXYYYYY390ALTKEY1" TO FS1-ALTKEY1-1-20.          IX2144.2 273
   001855         186000     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001856         186100     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001857         186200     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001858         186300     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001859         186400 START-TEST-GF-24.                                                IX2144.2
   001860         186500*                                                                 IX2144.2
   001861         186600*  START-TEST-GF.06  - THE START STATEMENT USES AN OPERAND IN THE IX2144.2
   001862         186700*                    KEY PHRASE WHICH IS NOT THE NAME OF AN       IX2144.2
   001863         186800*                    ALTERNATE KEY BUT IS THE NAME OF A DATA ITEM IX2144.2
   001864         186900*                    THAT IS SUBORDINATE TO THE KEY.  THE CONTENTSIX2144.2
   001865         187000*                    OF THE DATA ITEM (POSITIONS 1 THRU 5 OF THE  IX2144.2
   001866         187100*                    ALTERNATE KEY) IS A DUPLICATE OF THE FIRST   IX2144.2
   001867         187200*                    5 POSITIONS OF 6 OTHER RECORDS IN THE FILE.  IX2144.2
   001868         187300*                    THIS TEST EXPECTS THE RECORD POINTER         IX2144.2
   001869         187400*                    TO BE POSITIONED TO RECORD KEY XXXXXXXXXX380 IX2144.2
   001870         187500*                    ALTKEY1 (RECORD NUMBER 190) WHICH WAS THE FIRIX2144.2
   001871         187600*                    RECORD WRITTEN THAT                          IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001872         187700*                    CONTAINS XXXXX IN THE FIRST 5 POSITIONS OF THIX2144.2
   001873         187800*                    KEY.  THE ALTERNATE KEY WAS LOADED WITH THE  IX2144.2
   001874         187900*                    VALUE XXXXXYYYYY390ALTKEY1 (KEY FOR RECORD   IX2144.2
   001875         188000*                    NUMBER 195) BEFORE THE START WAS EXECUTED.   IX2144.2
   001876         188100*                                                                 IX2144.2
   001877         188200     START   IX-FS1                                               IX2144.2 225
   001878         188300                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1-1-5       IX2144.2 247
   001879         188400                     INVALID KEY                                  IX2144.2
   001880      1  188500                         MOVE  FS1-STATUS TO FILESTATUS (6)       IX2144.2 289 455
   001881      1  188600                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2144.2 524
   001882      1  188700                     GO TO START-FAIL-GF-24.                      IX2144.2 1895
   001883         188800     MOVE    FS1-STATUS TO FILESTATUS (6).                        IX2144.2 289 455
   001884         188900     READ    IX-FS1  AT END                                       IX2144.2 225
   001885      1  189000                     MOVE "AT END ON READ" TO COMPUTED-A          IX2144.2 524
   001886      1  189100                     GO TO START-FAIL-GF-24.                      IX2144.2 1895
   001887         189200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001888         189300     IF      XRECORD-NUMBER (1) EQUAL TO 190                      IX2144.2 480
   001889      1  189400             PERFORM  PASS                                        IX2144.2 692
   001890      1  189500             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2144.2 518
   001891      1  189600             GO TO START-WRITE-GF-24.                             IX2144.2 1903
   001892         189700     MOVE    65  TO RECNO.                                        IX2144.2 288
   001893         189800     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001894         189900     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001895         190000 START-FAIL-GF-24.                                                IX2144.2
   001896         190100     PERFORM  FAIL.                                               IX2144.2 693
   001897         190200     MOVE    190  TO CORRECT-18V0.                                IX2144.2 544
   001898         190300     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   001899         190400           TO RE-MARK.                                            IX2144.2 518
   001900         190500     GO TO   START-WRITE-GF-24.                                   IX2144.2 1903
   001901         190600 START-DELETE-GF-24.                                              IX2144.2
   001902         190700     PERFORM DE-LETE.                                             IX2144.2 694
   001903         190800 START-WRITE-GF-24.                                               IX2144.2
   001904         190900     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001905         191000 START-INIT-GF-25.                                                IX2144.2
   001906         191100     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001907         191200     MOVE "START-TEST-GF-25"  TO PAR-NAME.                        IX2144.2 513
   001908         191300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001909      1  191400             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001910      1  191500             GO TO START-DELETE-GF-25.                            IX2144.2 1948
   001911         191600     MOVE    "CCCCCCCCCD022"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001912         191700     MOVE    "YYYYYZYYYY410ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001913         191800     MOVE    "VVVVVVVVVV380ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001914         191900     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001915         192000     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001916         192100     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001917         192200 START-TEST-GF-25.                                                IX2144.2
   001918         192300*                                                                 IX2144.2
   001919         192400*  START-TEST-GF.07  - THE START STATEMENT USES AN OPERAND IN THE IX2144.2
   001920         192500*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2144.2
   001921         192600*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2144.2
   001922         192700*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2144.2
   001923         192800*                    POSITIONS 1 THRU 6 OF THE ALTERNATE KEY)     IX2144.2
   001924         192900*                    IS LOADED WITH YYYYYZ WHICH IS HIGHER THAN THIX2144.2
   001925         193000*                    KEY VALUE OF THE LAST RECORD IN THE FILE.  THIX2144.2
   001926         193100*                    SHOULD BE NO RECORD IN THE FILE NOT LESS THANIX2144.2
   001927         193200*                    KEY VALUE THUS AN INVALID KEY IS EXPECTED    IX2144.2
   001928         193300*                    WHEN THE START IS EXECUTED.                  IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001929         193400*                                                                 IX2144.2
   001930         193500     START   IX-FS1                                               IX2144.2 225
   001931         193600                    KEY IS NOT LESS THAN R-ALTKEY1-1-6            IX2144.2 252
   001932      1  193700          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (7)       IX2144.2 289 455
   001933      1  193800                     GO TO START-PASS-GF-25.                      IX2144.2 1944
   001934         193900     MOVE    FS1-STATUS TO FILESTATUS (7).                        IX2144.2 289 455
   001935         194000     READ    IX-FS1  AT END                                       IX2144.2 225
   001936      1  194100                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   001937         194200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001938         194300     PERFORM FAIL.                                                IX2144.2 693
   001939         194400     MOVE    XRECORD-KEY (1) TO COMPUTED-A.                       IX2144.2 501 524
   001940         194500     MOVE    "INVALID KEY" TO CORRECT-A.                          IX2144.2 538
   001941         194600     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   001942         194700           TO RE-MARK.                                            IX2144.2 518
   001943         194800     GO TO   START-WRITE-GF-25.                                   IX2144.2 1950
   001944         194900 START-PASS-GF-25.                                                IX2144.2
   001945         195000     PERFORM PASS.                                                IX2144.2 692
   001946         195100     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2144.2 518
   001947         195200     GO TO   START-WRITE-GF-25.                                   IX2144.2 1950
   001948         195300 START-DELETE-GF-25.                                              IX2144.2
   001949         195400     PERFORM DE-LETE.                                             IX2144.2 694
   001950         195500 START-WRITE-GF-25.                                               IX2144.2
   001951         195600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   001952         195700 START-INIT-GF-26.                                                IX2144.2
   001953         195800     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   001954         195900     MOVE "START-TEST-GF-26"  TO PAR-NAME.                        IX2144.2 513
   001955         196000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   001956      1  196100             PERFORM START-INIT-ERROR                             IX2144.2 2320
   001957      1  196200             GO TO START-DELETE-GF-26.                            IX2144.2 2002
   001958         196300     MOVE    "YYYYYUUUUU390"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   001959         196400     MOVE    "EEEEDEEEEE002ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   001960         196500     MOVE    "WWWWWWWWWV399ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   001961         196600     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   001962         196700     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   001963         196800     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   001964         196900 START-TEST-GF-26.                                                IX2144.2
   001965         197000*                                                                 IX2144.2
   001966         197100*  START-TEST-GF.08  - THIS TEST USES AN OPERAND IN THE           IX2144.2
   001967         197200*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2144.2
   001968         197300*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2144.2
   001969         197400*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2144.2
   001970         197500*                    (POSITIONS 1 THRU 6 OF THE ALTERNATE KEY) IS IX2144.2
   001971         197600*                    LOADED WITH "EEEEDE".  THIS KEY VALUE        IX2144.2
   001972         197700*                    IS LOWER THAN ANY ALTERNATE KEY VALUE IN     IX2144.2
   001973         197800*                    POSITION 1 THRU 6 EXISTING IN THE FILE       IX2144.2
   001974         197900*                    THE START STATEMENT WITH THE KEY IS NOT LESS IX2144.2
   001975         198000*                    THAN PHRASE IS EXECUTED AND SHOULD FIND A    IX2144.2
   001976         198100*                    RECORD WITH THE KEY VALUE "EEEEEEEEEF002     IX2144.2
   001977         198200*                    ALTKEY1 (RECORD NUMBER 01).                  IX2144.2
   001978         198300*                                                                 IX2144.2
   001979         198400     START   IX-FS1                                               IX2144.2 225
   001980         198500                    KEY IS NOT LESS THAN R-ALTKEY1-1-6            IX2144.2 252
   001981      1  198600          INVALID KEY    MOVE  FS1-STATUS TO FILESTATUS (8)       IX2144.2 289 455
   001982      1  198700                     MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2144.2 524
   001983      1  198800                     GO TO START-FAIL-GF-26.                      IX2144.2 1996
   001984         198900     MOVE    FS1-STATUS TO FILESTATUS (8).                        IX2144.2 289 455
   001985         199000     READ    IX-FS1  AT END                                       IX2144.2 225
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001986      1  199100                     MOVE "AT END ON READ" TO COMPUTED-A          IX2144.2 524
   001987      1  199200                     GO TO START-FAIL-GF-26.                      IX2144.2 1996
   001988         199300     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   001989         199400     IF      XRECORD-NUMBER (1) EQUAL TO 001                      IX2144.2 480
   001990      1  199500             PERFORM  PASS                                        IX2144.2 692
   001991      1  199600             MOVE  "SUBORDINATE DATA ITEM IN KEY"  TO RE-MARK     IX2144.2 518
   001992      1  199700             GO TO START-WRITE-GF-26.                             IX2144.2 2004
   001993         199800     MOVE    01  TO RECNO.                                        IX2144.2 288
   001994         199900     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2144.2 2335
   001995         200000     MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0.                IX2144.2 480 531
   001996         200100 START-FAIL-GF-26.                                                IX2144.2
   001997         200200     PERFORM  FAIL.                                               IX2144.2 693
   001998         200300     MOVE    001   TO CORRECT-18V0.                               IX2144.2 544
   001999         200400     MOVE "IX-36; IX-6: INVALID KEY PATH TAKEN OR AT END ON READ" IX2144.2
   002000         200500           TO RE-MARK.                                            IX2144.2 518
   002001         200600     GO TO   START-WRITE-GF-26.                                   IX2144.2 2004
   002002         200700 START-DELETE-GF-26.                                              IX2144.2
   002003         200800     PERFORM DE-LETE.                                             IX2144.2 694
   002004         200900 START-WRITE-GF-26.                                               IX2144.2
   002005         201000     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002006         201100 START-INIT-GF-27.                                                IX2144.2
   002007         201200     PERFORM START-INITIALIZE-RECORD.                             IX2144.2 2303
   002008         201300     MOVE "START-TEST-GF-27"  TO PAR-NAME.                        IX2144.2 513
   002009         201400     IF      INIT-FLAG NOT EQUAL ZERO                             IX2144.2 453 IMP
   002010      1  201500             PERFORM START-INIT-ERROR                             IX2144.2 2320
   002011      1  201600             GO TO START-DELETE-GF-27.                            IX2144.2 2051
   002012         201700     MOVE    "UUUUUUUUUU400"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   002013         201800     MOVE    "YYYYYZYYYY400ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   002014         201900     MOVE    "WWWWWWWWWV398ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   002015         202000     MOVE    WRK-FS1-RECKEY   TO IX-REC-KEY-AREA.                 IX2144.2 267 233
   002016         202100     MOVE    WRK-FS1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2144.2 272 244
   002017         202200     MOVE    WRK-FS1-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2144.2 280 257
   002018         202300 START-TEST-GF-27.                                                IX2144.2
   002019         202400*                                                                 IX2144.2
   002020         202500*  START-TEST-GF.09  - THIS TEST USES AN OPERAND IN THE           IX2144.2
   002021         202600*                    KEY PHRASE OF THE START STATEMENT WHICH IS   IX2144.2
   002022         202700*                    A DATA ITEM SUBORDINATE TO THE ALTERNATE KEY IX2144.2
   002023         202800*                    NAME.  THE CONTENTS OF THE DATA ITEM         IX2144.2
   002024         202900*                    (POSITIONS 1 THRU 10 OF THE RECORD KEY) IS   IX2144.2
   002025         203000*                    LOADED WITH "YYYYYZYYYY". THIS KEY VALUE     IX2144.2
   002026         203100*                    IS NOT LESS THAN ANY ALTERNATE KEY VALUE IN  IX2144.2
   002027         203200*                    POSITION 1 THRU 10 EXISTING IN THE FILE      IX2144.2
   002028         203300*                    THEREFORE AN INVALID KEY CONDITION IS        IX2144.2
   002029         203400*                    EXPECTED WHEN THE START STATEMENT IS         IX2144.2
   002030         203500*                    EXECUTED.                                    IX2144.2
   002031         203600*                                                                 IX2144.2
   002032         203700     START   IX-FS1                                               IX2144.2 225
   002033         203800                    KEY IS NOT LESS THAN IX-FS1-ALTKEY1-1-10      IX2144.2 246
   002034         203900                                 INVALID KEY                      IX2144.2
   002035      1  204000                         MOVE  FS1-STATUS TO FILESTATUS (9)       IX2144.2 289 455
   002036      1  204100                     GO TO START-PASS-GF-27.                      IX2144.2 2047
   002037         204200     MOVE    FS1-STATUS TO FILESTATUS (9).                        IX2144.2 289 455
   002038         204300     READ    IX-FS1  AT END                                       IX2144.2 225
   002039      1  204400                     MOVE  "AT END PATH TAKEN ON READ" TO RE-MARK.IX2144.2 518
   002040         204500     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   002041         204600     PERFORM FAIL.                                                IX2144.2 693
   002042         204700     MOVE    XRECORD-KEY (1)  TO COMPUTED-A.                      IX2144.2 501 524
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002043         204800     MOVE     "INVALID KEY" TO CORRECT-A.                         IX2144.2 538
   002044         204900     MOVE "IX-36 INVALID KEY PATH NOT BE TAKEN OR AT END ON READ" IX2144.2
   002045         205000           TO RE-MARK.                                            IX2144.2 518
   002046         205100     GO TO   START-WRITE-GF-27.                                   IX2144.2 2053
   002047         205200 START-PASS-GF-27.                                                IX2144.2
   002048         205300     PERFORM PASS.                                                IX2144.2 692
   002049         205400     MOVE    "INVALID KEY"  TO RE-MARK.                           IX2144.2 518
   002050         205500     GO TO   START-WRITE-GF-27.                                   IX2144.2 2053
   002051         205600 START-DELETE-GF-27.                                              IX2144.2
   002052         205700     PERFORM DE-LETE.                                             IX2144.2 694
   002053         205800 START-WRITE-GF-27.                                               IX2144.2
   002054         205900     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002055         206000     CLOSE   IX-FS1.                                              IX2144.2 225
   002056         206100                                                                  IX2144.2
   002057         206200*                                                                 IX2144.2
   002058         206300*  THIS SERIES OF TESTS CHECKS THE CONTENTS OF THE FILE STATUS    IX2144.2
   002059         206400*  CAPTURED FROM THE TESTS IN START-TEST-GF.                      IX2144.2
   002060         206500*                                                                 IX2144.2
   002061         206600 START-TEST-GF-28.                                                IX2144.2
   002062         206700     MOVE              "FILE STATUS START:00" TO FEATURE.         IX2144.2 509
   002063         206800     MOVE "START-TEST-GF-28" TO PAR-NAME.                         IX2144.2 513
   002064         206900     IF      FILESTATUS (1)  EQUAL TO "**"                        IX2144.2 455
   002065      1  207000             PERFORM DE-LETE                                      IX2144.2 694
   002066      1  207100             MOVE "FROM START-TEST-GF-19"  TO CORRECT-A           IX2144.2 538
   002067      1  207200             GO TO  START-TEST-GF-28A.                            IX2144.2 2080
   002068         207300*                                                                 IX2144.2
   002069         207400*  START-TEST-006.01 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002070         207500*                    RESULTING FROM START-TEST-GF-19.  THE FILE   IX2144.2
   002071         207600*                    STATUS CONTENTS IS EXPECTED TO BE "00".      IX2144.2
   002072         207700*                                                                 IX2144.2
   002073         207800     IF      FILESTATUS (1)  EQUAL TO "00"                        IX2144.2 455
   002074      1  207900             PERFORM PASS                                         IX2144.2 692
   002075         208000     ELSE                                                         IX2144.2
   002076      1  208100         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-19" TO RE-MARKIX2144.2 518
   002077      1  208200             PERFORM  FAIL                                        IX2144.2 693
   002078      1  208300             MOVE  "00"  TO CORRECT-A                             IX2144.2 538
   002079      1  208400             MOVE   FILESTATUS (1)  TO COMPUTED-A.                IX2144.2 455 524
   002080         208500 START-TEST-GF-28A.                                               IX2144.2
   002081         208600     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002082         208700 START-TEST-GF-29.                                                IX2144.2
   002083         208800     MOVE "START-TEST-GF-20" TO PAR-NAME.                         IX2144.2 513
   002084         208900     IF      FILESTATUS (2)  EQUAL TO "**"                        IX2144.2 455
   002085      1  209000             PERFORM DE-LETE                                      IX2144.2 694
   002086      1  209100             MOVE "FROM START-TEST-GF-20"  TO CORRECT-A           IX2144.2 538
   002087      1  209200             GO TO  START-TEST-GF-29A.                            IX2144.2 2099
   002088         209300*                                                                 IX2144.2
   002089         209400*  START-TEST-006.02 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002090         209500*                    RESULTING FROM START-TEST-GF-20.  THE FILE   IX2144.2
   002091         209600*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   002092         209700*                                                                 IX2144.2
   002093         209800     IF      FILESTATUS (2) EQUAL TO "00"                         IX2144.2 455
   002094      1  209900             PERFORM  PASS                                        IX2144.2 692
   002095      1  210000             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002096      1  210100         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-20" TO RE-MARKIX2144.2 518
   002097      1  210200             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   002098      1  210300             MOVE   FILESTATUS (2)  TO COMPUTED-A.                IX2144.2 455 524
   002099         210400 START-TEST-GF-29A.                                               IX2144.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002100         210500     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002101         210600 START-TEST-GF-30.                                                IX2144.2
   002102         210700     MOVE "START-TEST-GF-30" TO PAR-NAME.                         IX2144.2 513
   002103         210800     IF      FILESTATUS (3)  EQUAL TO "**"                        IX2144.2 455
   002104      1  210900             PERFORM DE-LETE                                      IX2144.2 694
   002105      1  211000             MOVE "FROM START-TEST-GF.21"  TO CORRECT-A           IX2144.2 538
   002106      1  211100             GO TO  START-TEST-GF-30A.                            IX2144.2 2118
   002107         211200*                                                                 IX2144.2
   002108         211300*  START-TEST-006.03 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002109         211400*                    RESULTING FROM START-TEST-GF-21.  THE FILE   IX2144.2
   002110         211500*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   002111         211600*                                                                 IX2144.2
   002112         211700     IF      FILESTATUS (3) EQUAL TO "00"                         IX2144.2 455
   002113      1  211800             PERFORM  PASS                                        IX2144.2 692
   002114      1  211900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002115      1  212000         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-21" TO RE-MARKIX2144.2 518
   002116      1  212100             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   002117      1  212200             MOVE   FILESTATUS (3)  TO COMPUTED-A.                IX2144.2 455 524
   002118         212300 START-TEST-GF-30A.                                               IX2144.2
   002119         212400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002120         212500 START-TEST-GF-31.                                                IX2144.2
   002121         212600     MOVE              "FILE STATUS START:23" TO FEATURE.         IX2144.2 509
   002122         212700     MOVE "START-TEST-GF-31" TO PAR-NAME.                         IX2144.2 513
   002123         212800     IF      FILESTATUS (4)  EQUAL TO "**"                        IX2144.2 455
   002124      1  212900             PERFORM DE-LETE                                      IX2144.2 694
   002125      1  213000             MOVE "FROM START-TEST-GF-22"  TO CORRECT-A           IX2144.2 538
   002126      1  213100             GO TO  START-TEST-GF-31A.                            IX2144.2 2138
   002127         213200*                                                                 IX2144.2
   002128         213300*  START-TEST-006.04 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002129         213400*                    RESULTING FROM START-TEST-GF-22.  THE FILE   IX2144.2
   002130         213500*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2144.2
   002131         213600*                                                                 IX2144.2
   002132         213700     IF      FILESTATUS (4)  EQUAL TO "23"                        IX2144.2 455
   002133      1  213800             PERFORM  PASS                                        IX2144.2 692
   002134      1  213900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002135      1  214000         MOVE "FROM START-TEST-GF-04; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   002136      1  214100             MOVE    "23"  TO CORRECT-A                           IX2144.2 538
   002137      1  214200             MOVE   FILESTATUS (4)  TO COMPUTED-A.                IX2144.2 455 524
   002138         214300 START-TEST-GF-31A.                                               IX2144.2
   002139         214400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002140         214500 START-TEST-GF-32.                                                IX2144.2
   002141         214600     MOVE              "FILE STATUS START:00" TO FEATURE.         IX2144.2 509
   002142         214700     MOVE "START-TEST-GF-32" TO PAR-NAME.                         IX2144.2 513
   002143         214800     IF      FILESTATUS (5)  EQUAL TO "**"                        IX2144.2 455
   002144      1  214900             PERFORM DE-LETE                                      IX2144.2 694
   002145      1  215000             MOVE "FROM START-TEST-GF-23"  TO CORRECT-A           IX2144.2 538
   002146      1  215100             GO TO  START-TEST-GF-32A.                            IX2144.2 2158
   002147         215200*                                                                 IX2144.2
   002148         215300*  START-TEST-006.05 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002149         215400*                    RESULTING FROM START-TEST-GF-23.  THE FILE   IX2144.2
   002150         215500*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   002151         215600*                                                                 IX2144.2
   002152         215700     IF      FILESTATUS (5)  EQUAL TO "00"                        IX2144.2 455
   002153      1  215800             PERFORM  PASS                                        IX2144.2 692
   002154      1  215900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002155      1  216000         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-23" TO RE-MARKIX2144.2 518
   002156      1  216100             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002157      1  216200             MOVE   FILESTATUS (5)  TO COMPUTED-A.                IX2144.2 455 524
   002158         216300 START-TEST-GF-32A.                                               IX2144.2
   002159         216400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002160         216500 START-TEST-GF-33.                                                IX2144.2
   002161         216600     MOVE              "FILE STATUS START:00" TO FEATURE.         IX2144.2 509
   002162         216700     MOVE "START-TEST-GF-33" TO PAR-NAME.                         IX2144.2 513
   002163         216800     IF      FILESTATUS (6)  EQUAL TO "**"                        IX2144.2 455
   002164      1  216900             PERFORM DE-LETE                                      IX2144.2 694
   002165      1  217000             MOVE "FROM START-TEST-GF-24"  TO CORRECT-A           IX2144.2 538
   002166      1  217100             GO TO  START-TEST-GF-33A.                            IX2144.2 2178
   002167         217200*                                                                 IX2144.2
   002168         217300*  START-TEST-006.06 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002169         217400*                    RESULTING FROM START-TEST-GF-24.  THE FILE   IX2144.2
   002170         217500*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   002171         217600*                                                                 IX2144.2
   002172         217700     IF      FILESTATUS (6)  EQUAL TO "00"                        IX2144.2 455
   002173      1  217800             PERFORM  PASS                                        IX2144.2 692
   002174      1  217900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002175      1  218000         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-24" TO RE-MARKIX2144.2 518
   002176      1  218100             MOVE   "00"  TO CORRECT-A                            IX2144.2 538
   002177      1  218200             MOVE   FILESTATUS (6)  TO COMPUTED-A.                IX2144.2 455 524
   002178         218300 START-TEST-GF-33A.                                               IX2144.2
   002179         218400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002180         218500 START-TEST-GF-34.                                                IX2144.2
   002181         218600     MOVE              "FILE STATUS START:23" TO FEATURE.         IX2144.2 509
   002182         218700     MOVE "START-TEST-GF-34" TO PAR-NAME.                         IX2144.2 513
   002183         218800     IF      FILESTATUS (7)  EQUAL TO "**"                        IX2144.2 455
   002184      1  218900             PERFORM DE-LETE                                      IX2144.2 694
   002185      1  219000             MOVE "FROM START-TEST-GF-25" TO CORRECT-A            IX2144.2 538
   002186      1  219100             GO TO  START-TEST-GF-34A.                            IX2144.2 2198
   002187         219200*                                                                 IX2144.2
   002188         219300*  START-TEST-006.07 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002189         219400*                    RESULTING FROM START-TEST-GF-25.  THE FILE   IX2144.2
   002190         219500*                    STATUS CONTENTS IS EXPECTED TO BE "23"       IX2144.2
   002191         219600*                                                                 IX2144.2
   002192         219700     IF      FILESTATUS (7)  EQUAL TO "23"                        IX2144.2 455
   002193      1  219800             PERFORM  PASS                                        IX2144.2 692
   002194      1  219900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002195      1  220000         MOVE "FROM START-TEST-GF-25; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   002196      1  220100             MOVE    "23"  TO CORRECT-A                           IX2144.2 538
   002197      1  220200             MOVE   FILESTATUS (7)  TO COMPUTED-A.                IX2144.2 455 524
   002198         220300 START-TEST-GF-34A.                                               IX2144.2
   002199         220400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002200         220500 START-TEST-GF-35.                                                IX2144.2
   002201         220600     MOVE              "FILE STATUS START:00" TO FEATURE.         IX2144.2 509
   002202         220700     MOVE "START-TEST-GF-35" TO PAR-NAME.                         IX2144.2 513
   002203         220800     IF      FILESTATUS (8)  EQUAL TO "**"                        IX2144.2 455
   002204      1  220900             PERFORM DE-LETE                                      IX2144.2 694
   002205      1  221000             MOVE "FROM START-TEST-GF-26" TO CORRECT-A            IX2144.2 538
   002206      1  221100             GO TO  START-TEST-GF-35A.                            IX2144.2 2218
   002207         221200*                                                                 IX2144.2
   002208         221300*  START-TEST-006.08 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002209         221400*                    RESULTING FROM START-TEST-GF-26.  THE FILE   IX2144.2
   002210         221500*                    STATUS CONTENTS IS EXPECTED TO BE "00"       IX2144.2
   002211         221600*                                                                 IX2144.2
   002212         221700     IF      FILESTATUS (8) EQUAL TO "00"                         IX2144.2 455
   002213      1  221800             PERFORM  PASS                                        IX2144.2 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002214      1  221900             ELSE  PERFORM  FAIL                                  IX2144.2 693
   002215      1  222000         MOVE "IX-3; 1.3.4 (1) A;FROM START-TEST-GF-26" TO RE-MARKIX2144.2 518
   002216      1  222100             MOVE    "00"  TO CORRECT-A                           IX2144.2 538
   002217      1  222200             MOVE   FILESTATUS (8)  TO COMPUTED-A.                IX2144.2 455 524
   002218         222300 START-TEST-GF-35A.                                               IX2144.2
   002219         222400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002220         222500 START-TEST-GF-36.                                                IX2144.2
   002221         222600     MOVE              "FILE STATUS START:23" TO FEATURE.         IX2144.2 509
   002222         222700     MOVE "START-TEST-GF-36" TO PAR-NAME.                         IX2144.2 513
   002223         222800     IF      FILESTATUS (9)  EQUAL TO "**"                        IX2144.2 455
   002224      1  222900             PERFORM DE-LETE                                      IX2144.2 694
   002225      1  223000             MOVE "FROM START-TEST-GF-27"  TO CORRECT-A           IX2144.2 538
   002226      1  223100             GO TO  START-TEST-GF-36A.                            IX2144.2 2238
   002227         223200*                                                                 IX2144.2
   002228         223300*  START-TEST-006.09 - THIS TEST CHECKS THE FILE STATUS CONTENTS  IX2144.2
   002229         223400*                    RESULTING FROM START-TEST-GF-27.  THE FILE   IX2144.2
   002230         223500*                    STATUS CONTENTS IS EXPECTED TO BE "23".      IX2144.2
   002231         223600*                                                                 IX2144.2
   002232         223700     IF      FILESTATUS (9)  EQUAL TO "23"                        IX2144.2 455
   002233      1  223800             PERFORM PASS                                         IX2144.2 692
   002234      1  223900     ELSE    PERFORM FAIL                                         IX2144.2 693
   002235      1  224000         MOVE "FROM START-TEST-GF-27; IX-4 1.3.4 (3) C" TO RE-MARKIX2144.2 518
   002236      1  224100             MOVE  "23"  TO CORRECT-A                             IX2144.2 538
   002237      1  224200             MOVE   FILESTATUS (9)  TO COMPUTED-A.                IX2144.2 455 524
   002238         224300 START-TEST-GF-36A.                                               IX2144.2
   002239         224400     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002240         224500                                                                  IX2144.2
   002241         224600                                                                  IX2144.2
   002242         224700                                                                  IX2144.2
   002243         224800 START-INIT-GF-37.                                                IX2144.2
   002244         224900     OPEN  I-O   IX-FS1.                                          IX2144.2 225
   002245         225000     MOVE     "START SERIES" TO FEATURE.                          IX2144.2 509
   002246         225100     MOVE    "START-TEST-GF-37" TO PAR-NAME.                      IX2144.2 513
   002247         225200     MOVE    ZERO TO INVKEY-COUNTER.                              IX2144.2 IMP 292
   002248         225300*                                                                 IX2144.2
   002249         225400*    THIS TEST EXECUTES SEVERAL START STATEMENTS USING DIFFERENT  IX2144.2
   002250         225500*    KEY VALUES.  FOLLOWING EXECUTION OF THE LAST START           IX2144.2
   002251         225600*    STATEMENT THE READ STATEMENT IS EXECUTED.  THE START         IX2144.2
   002252         225700*    STATEMENT SHOULD HAVE POSITION THE RECORD POINTER            IX2144.2
   002253         225800*    SUCH THAT RECORD NUMBER 50 IS MADE AVAILABLE                 IX2144.2
   002254         225900*    TO THE READ STATEMENT.  THE KEY OF REFERENCE                 IX2144.2
   002255         226000*    SHOULD BE ALTERNATE-KEY-2.                                   IX2144.2
   002256         226100*                                                                 IX2144.2
   002257         226200 START-TEST-GF-37.                                                IX2144.2
   002258         226300     MOVE    "FGGGGGGGGG098"  TO FS1-RECKEY-1-13.                 IX2144.2 268
   002259         226400     MOVE    "WWWWWWWXXX366ALTKEY1"  TO FS1-ALTKEY1-1-20.         IX2144.2 273
   002260         226500     MOVE    "RRRRRRRRRR300ALTKEY2"  TO FS1-ALTKEY2-1-20.         IX2144.2 281
   002261         226600     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   002262         226700     MOVE    WRK-FS1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2144.2 272 244
   002263         226800     MOVE    WRK-FS1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2144.2 280 257
   002264         226900     START   IX-FS1                                               IX2144.2 225
   002265         227000                     KEY IS EQUAL TO IX-FS1-ALTKEY2               IX2144.2 258
   002266      1  227100                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2144.2 292
   002267         227200     START   IX-FS1   INVALID KEY  ADD  01  TO INVKEY-COUNTER.    IX2144.2 225 292
   002268         227300     START   IX-FS1                                               IX2144.2 225
   002269         227400                    KEY IS NOT LESS THAN R-ALTKEY1-1-6            IX2144.2 252
   002270      1  227500                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2144.2 292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002271         227600     START   IX-FS1                                               IX2144.2 225
   002272         227700                     KEY IS NOT LESS THAN IX-FS1-ALTKEY2-1-5      IX2144.2 260
   002273      1  227800                       INVALID KEY ADD 1  TO INVKEY-COUNTER.      IX2144.2 292
   002274         227900     READ    IX-FS1  AT END                                       IX2144.2 225
   002275      1  228000                     MOVE  "AT END ON READ"  TO COMPUTED-A        IX2144.2 524
   002276      1  228100                     GO TO  START-FAIL-GF-37.                     IX2144.2 2289
   002277         228200     MOVE    IX-FS1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2144.2 229 471
   002278         228300     IF      XRECORD-NUMBER (1) EQUAL TO 175                      IX2144.2 480
   002279      1  228400             PERFORM  PASS                                        IX2144.2 692
   002280      1  228500             MOVE    "MULTIPLE STARTS BEFORE READ " TO RE-MARK    IX2144.2 518
   002281      1  228600             GO TO  START-WRITE-GF-37.                            IX2144.2 2296
   002282         228700     MOVE    "RRRRRRRRRR050ALTKEY2" TO CORRECT-A.                 IX2144.2 538
   002283         228800     MOVE    ALTERNATE-KEY2 (1) TO WRK-FS1-ALTKEY2.               IX2144.2 505 280
   002284         228900     MOVE    FS1-ALTKEY2-1-20 TO COMPUTED-A.                      IX2144.2 281 524
   002285         229000     MOVE    SPACE TO P-OR-F.                                     IX2144.2 IMP 511
   002286         229100     MOVE    "ALTERNATE RECORD KEY2 VALUES" TO RE-MARK.           IX2144.2 518
   002287         229200     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002288         229300     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2144.2 480 531
   002289         229400 START-FAIL-GF-37.                                                IX2144.2
   002290         229500     PERFORM FAIL.                                                IX2144.2 693
   002291         229600     MOVE    175 TO CORRECT-18V0.                                 IX2144.2 544
   002292         229700     MOVE "WRONG RECORD NUMBER; IX-28 OR IX-36" TO RE-MARK.       IX2144.2 518
   002293         229800     GO TO START-WRITE-GF-37.                                     IX2144.2 2296
   002294         229900 START-DELETE-GF-37.                                              IX2144.2
   002295         230000     PERFORM DE-LETE.                                             IX2144.2 694
   002296         230100 START-WRITE-GF-37.                                               IX2144.2
   002297         230200     PERFORM  PRINT-DETAIL.                                       IX2144.2 696
   002298         230300                                                                  IX2144.2
   002299         230400     CLOSE   IX-FS1.                                              IX2144.2 225
   002300         230500     GO TO  CCVS-EXIT.                                            IX2144.2 2351
   002301         230600                                                                  IX2144.2
   002302         230700                                                                  IX2144.2
   002303         230800 START-INITIALIZE-RECORD.                                         IX2144.2
   002304         230900     MOVE    "**"  TO FS1-STATUS.                                 IX2144.2 289
   002305         231000     MOVE    "GGGGGGGGGG200" TO  FS1-RECKEY-1-13.                 IX2144.2 268
   002306         231100     MOVE    ZERO  TO INIT-FLAG.                                  IX2144.2 IMP 453
   002307         231200     MOVE    9999  TO XRECORD-NUMBER (1).                         IX2144.2 480
   002308         231300     MOVE    SPACE TO IX-FS1R1-F-G-240.                           IX2144.2 IMP 229
   002309         231400     MOVE    WRK-FS1-RECKEY TO IX-REC-KEY-AREA.                   IX2144.2 267 233
   002310         231500     START   IX-FS1                                               IX2144.2 225
   002311         231600                     KEY IS EQUAL TO IX-FS1-KEY                   IX2144.2 234
   002312      1  231700         INVALID KEY MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2144.2 524
   002313      1  231800                     MOVE 01 TO INIT-FLAG.                        IX2144.2 453
   002314         231900     READ    IX-FS1  INTO  FILE-RECORD-INFO (1)                   IX2144.2 225 471
   002315      1  232000                     AT END  MOVE  "AT END ON READ" TO COMPUTED-A IX2144.2 524
   002316      1  232100                     MOVE 01 TO INIT-FLAG.                        IX2144.2 453
   002317         232200     IF      XRECORD-NUMBER (1) NOT EQUAL TO 100                  IX2144.2 480
   002318      1  232300             MOVE 02 TO INIT-FLAG.                                IX2144.2 453
   002319         232400     MOVE    SPACE TO FS1-STATUS.                                 IX2144.2 IMP 289
   002320         232500 START-INIT-ERROR.                                                IX2144.2
   002321         232600     MOVE    "TEST IMPROPERLY INITIALIZED" TO RE-MARK.            IX2144.2 518
   002322         232700     MOVE    "GGGGGGGGGG200" TO CORRECT-A.                        IX2144.2 538
   002323         232800     IF      INIT-FLAG NOT EQUAL 01                               IX2144.2 453
   002324      1  232900             MOVE    XRECORD-KEY (1)  TO WRK-FS1-RECKEY           IX2144.2 501 267
   002325      1  233000             MOVE    FS1-RECKEY-1-13  TO COMPUTED-A.              IX2144.2 268 524
   002326         233100     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002327         233200     MOVE    "**" TO FILESTATUS (REC-CT).                         IX2144.2 455 560
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002328         233300 DISPLAY-RECORD-KEYS.                                             IX2144.2
   002329         233400     MOVE    XRECORD-KEY (1)  TO WRK-FS1-RECKEY.                  IX2144.2 501 267
   002330         233500     MOVE    FS1-RECKEY-1-13  TO COMPUTED-A.                      IX2144.2 268 524
   002331         233600     MOVE    RECKEY-VALUE (RECNO)  TO CORRECT-A.                  IX2144.2 450 288 538
   002332         233700     MOVE    SPACE TO P-OR-F.                                     IX2144.2 IMP 511
   002333         233800     MOVE    "RECORD KEY VALUES" TO RE-MARK.                      IX2144.2 518
   002334         233900     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002335         234000 DISPLAY-ALTERNATE-KEY1.                                          IX2144.2
   002336         234100     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FS1-ALTKEY1.              IX2144.2 503 272
   002337         234200     MOVE    FS1-ALTKEY1-1-20  TO COMPUTED-A.                     IX2144.2 273 524
   002338         234300     MOVE    ALTKEY1-VALUE (RECNO)  TO CORRECT-A.                 IX2144.2 451 288 538
   002339         234400     MOVE    SPACE TO P-OR-F.                                     IX2144.2 IMP 511
   002340         234500     MOVE    "ALTERNATE RECORD KEY1 VALUES"  TO RE-MARK.          IX2144.2 518
   002341         234600     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002342         234700 DISPLAY-ALTERNATE-KEY2.                                          IX2144.2
   002343         234800     MOVE    ALTERNATE-KEY2 (1) TO WRK-FS1-ALTKEY2.               IX2144.2 505 280
   002344         234900     MOVE    FS1-ALTKEY2-1-20  TO COMPUTED-A.                     IX2144.2 281 524
   002345         235000     MOVE    ALTKEY2-VALUE (RECNO)  TO CORRECT-A.                 IX2144.2 452 288 538
   002346         235100     MOVE    SPACE TO P-OR-F.                                     IX2144.2 IMP 511
   002347         235200     MOVE    "ALTERNATE RECORD KEY2 VALUES"  TO RE-MARK.          IX2144.2 518
   002348         235300     PERFORM PRINT-DETAIL.                                        IX2144.2 696
   002349         235400                                                                  IX2144.2
   002350         235500                                                                  IX2144.2
   002351         235600 CCVS-EXIT SECTION.                                               IX2144.2
   002352         235700 CCVS-999999.                                                     IX2144.2
   002353         235800     GO TO CLOSE-FILES.                                           IX2144.2 673
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    45
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      503   ALTERNATE-KEY1 . . . . . . . .  M826 M838 1779 2336
      505   ALTERNATE-KEY2 . . . . . . . .  M827 M839 2283 2343
      295   ALTKEY1-NUM. . . . . . . . . .  M868 874 M882
      451   ALTKEY1-VALUE. . . . . . . . .  823 2338
      296   ALTKEY2-NUM
      452   ALTKEY2-VALUE. . . . . . . . .  824 2345
      569   ANSI-REFERENCE . . . . . . . .  775 782 791
      221   C-ABORT. . . . . . . . . . . .  M654 M677
      215   C-ALL. . . . . . . . . . . . .  M679
      211   C-DATE . . . . . . . . . . . .  M656
      217   C-DELETED. . . . . . . . . . .  M681
      216   C-FAIL . . . . . . . . . . . .  M680
      220   C-INDENT
      218   C-INSPECT. . . . . . . . . . .  M682
      213   C-NO-OF-TESTS. . . . . . . . .  M655
      219   C-NOTE
      214   C-OK . . . . . . . . . . . . .  M678
      212   C-TIME . . . . . . . . . . . .  M657
      548   CCVS-C-1 . . . . . . . . . . .  714 760
      553   CCVS-C-2 . . . . . . . . . . .  715 761
      603   CCVS-E-1 . . . . . . . . . . .  720
      608   CCVS-E-2 . . . . . . . . . . .  729 736 743 748
      611   CCVS-E-2-2 . . . . . . . . . .  M728
      616   CCVS-E-3 . . . . . . . . . . .  749
      625   CCVS-E-4 . . . . . . . . . . .  728
      626   CCVS-E-4-1 . . . . . . . . . .  M726
      628   CCVS-E-4-2 . . . . . . . . . .  M727
      570   CCVS-H-1 . . . . . . . . . . .  709 756
      575   CCVS-H-2A. . . . . . . . . . .  710 757
      584   CCVS-H-2B. . . . . . . . . . .  711 758
      596   CCVS-H-3 . . . . . . . . . . .  712 759
      646   CCVS-PGM-ID. . . . . . . . . .  652 662 662 675
      490   CHARS-OR-RECORDS . . . . . . .  M803
      530   CM-18V0
      524   COMPUTED-A . . . . . . . . . .  525 527 528 529 530 787 790 M958 M962 M1008 M1012 M1057 M1061 M1112 M1153 M1157
                                            M1210 M1214 M1268 M1310 M1314 M1369 M1406 M1426 M1445 M1465 M1485 M1504 M1524
                                            M1544 M1564 M1627 M1631 M1675 M1679 M1724 M1728 M1779 M1823 M1827 M1881 M1885
                                            M1939 M1982 M1986 M2042 M2079 M2098 M2117 M2137 M2157 M2177 M2197 M2217 M2237
                                            M2275 M2284 M2312 M2315 M2325 M2330 M2337 M2344
      525   COMPUTED-N
      523   COMPUTED-X . . . . . . . . . .  M704 772
      527   COMPUTED-0V18
      529   COMPUTED-14V4
      531   COMPUTED-18V0. . . . . . . . .  M848 M888 M894 M971 M1021 M1070 M1166 M1223 M1323 M1640 M1688 M1737 M1836 M1894
                                            M1995 M2288
      528   COMPUTED-4V14
      547   COR-ANSI-REFERENCE . . . . . .  M782 M784
      538   CORRECT-A. . . . . . . . . . .  539 540 541 542 543 788 790 M1113 M1269 M1370 M1393 M1405 M1414 M1425 M1433 M1444
                                            M1453 M1464 M1473 M1484 M1492 M1503 M1512 M1523 M1532 M1543 M1552 M1563 M1780
                                            M1940 M2043 M2066 M2078 M2086 M2097 M2105 M2116 M2125 M2136 M2145 M2156 M2165
                                            M2176 M2185 M2196 M2205 M2216 M2225 M2236 M2282 M2322 M2331 M2338 M2345
      539   CORRECT-N
      537   CORRECT-X. . . . . . . . . . .  M705 774
      540   CORRECT-0V18
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    46
0 Defined   Cross-reference of data names   References

0     542   CORRECT-14V4
      544   CORRECT-18V0 . . . . . . . . .  M847 M889 M895 M974 M1024 M1073 M1169 M1226 M1326 M1643 M1691 M1740 M1839 M1897
                                            M1998 M2291
      541   CORRECT-4V14
      543   CR-18V0
      561   DELETE-COUNTER . . . . . . . .  681 M694 723 739 741
      516   DOTVALUE . . . . . . . . . . .  M699
      567   DUMMY-HOLD . . . . . . . . . .  M753 763
      224   DUMMY-RECORD . . . . . . . . .  M709 M710 M711 M712 M714 M715 M716 M718 M720 M729 M736 M743 M748 M749 753 M754
                                            755 M756 M757 M758 M759 M760 M761 M762 M763 767 M768 M777 M792
      614   ENDER-DESC . . . . . . . . . .  M731 M742 M747
      562   ERROR-COUNTER. . . . . . . . .  680 M693 722 732 735
      566   ERROR-HOLD . . . . . . . . . .  679 M722 M723 M723 M724 727
      612   ERROR-TOTAL. . . . . . . . . .  M733 M735 M740 M741 M745 M746
      290   EXCUT-COUNTER-06V00. . . . . .  M831 M843 845 M866 878 M880 885 888
      509   FEATURE. . . . . . . . . . . .  M810 M865 M902 M1389 M1410 M1449 M1469 M1508 M1528 M1548 M1571 M2062 M2121 M2141
                                            M2161 M2181 M2201 M2221 M2245
      471   FILE-RECORD-INFO . . . . . . .  M670 828 840 M964 M1014 M1063 M1110 M1159 M1216 M1266 M1316 M1367 M1633 M1681
                                            M1730 M1777 M1829 M1887 M1937 M1988 M2040 M2277 M2314
      472   FILE-RECORD-INFO-P1-120
      499   FILE-RECORD-INFO-P121-240
      457   FILE-RECORD-INFO-SKELETON. . .  669
      456   FILE-RECORD-INFORMATION-REC
      455   FILESTATUS . . . . . . . . . .  M957 M960 M1007 M1010 M1056 M1059 M1105 M1107 M1152 M1155 M1209 M1212 M1261 M1263
                                            M1309 M1312 M1362 M1364 1391 1400 1406 1412 1421 1426 1431 1440 1445 1451 1460
                                            1465 1471 1480 1485 1490 1499 1504 1510 1519 1524 1530 1539 1544 1550 1559 1564
                                            M1626 M1629 M1674 M1677 M1723 M1726 M1772 M1774 M1822 M1825 M1880 M1883 M1932
                                            M1934 M1981 M1984 M2035 M2037 2064 2073 2079 2084 2093 2098 2103 2112 2117 2123
                                            2132 2137 2143 2152 2157 2163 2172 2177 2183 2192 2197 2203 2212 2217 2223 2232
                                            2237 M2327
      184   FOR-INX-START-TEST . . . . . .  181
      274   FS1-ALTKEY1-1-10
      273   FS1-ALTKEY1-1-20 . . . . . . .  M823 M944 M989 M1039 M1088 M1132 M1184 M1241 M1288 M1341 M1613 M1658 M1706 M1755
                                            M1799 M1854 M1912 M1959 M2013 M2259 2337
      275   FS1-ALTKEY1-1-5
      277   FS1-ALTKEY1-11-13. . . . . . .  M834 874
      278   FS1-ALTKEY1-14-20
      276   FS1-ALTKEY1-6-10
      282   FS1-ALTKEY2-1-10
      281   FS1-ALTKEY2-1-20 . . . . . . .  M824 M945 M990 M1040 M1089 M1133 M1185 M1242 M1289 M1342 M1614 M1659 M1707 M1756
                                            M1800 M1855 M1913 M1960 M2014 M2260 2284 2344
      283   FS1-ALTKEY2-1-5
      285   FS1-ALTKEY2-11-13. . . . . . .  M835
      286   FS1-ALTKEY2-14-20
      284   FS1-ALTKEY2-6-10
      269   FS1-RECKEY-1-10
      268   FS1-RECKEY-1-13. . . . . . . .  M822 M943 M988 M1038 M1087 M1131 M1183 M1240 M1287 M1340 M1612 M1657 M1705 M1754
                                            M1798 M1853 M1911 M1958 M2012 M2258 M2305 2325 2330
      270   FS1-RECKEY-11-13 . . . . . . .  M833 873 894
      289   FS1-STATUS . . . . . . . . . .  203 957 960 1007 1010 1056 1059 1105 1107 1152 1155 1209 1212 1261 1263 1309
                                            1312 1362 1364 1626 1629 1674 1677 1723 1726 1772 1774 1822 1825 1880 1883 1932
                                            1934 1981 1984 2035 2037 M2304 M2319
      454   HOLD-FILESTATUS-RECORD . . . .  M904 M1572
      640   HYPHEN-LINE. . . . . . . . . .  716 718 762
      606   ID-AGAIN . . . . . . . . . . .  M662
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    47
0 Defined   Cross-reference of data names   References

0     639   INF-ANSI-REFERENCE . . . . . .  M775 M778 M791 M793
      634   INFO-TEXT. . . . . . . . . . .  M776
      453   INIT-FLAG. . . . . . . . . . .  940 985 1035 1084 1128 1180 1237 1284 1337 1609 1654 1702 1751 1795 1850 1908
                                            1955 2009 M2306 M2313 M2316 M2318 2323
      563   INSPECT-COUNTER. . . . . . . .  682 M691 722 744 746
      292   INVKEY-COUNTER . . . . . . . .  M813 M830 M842 845 M2247 M2266 M2267 M2270 M2273
      244   IX-ALT-KEY1-AREA . . . . . . .  872 M947 M992 M1042 M1091 M1135 M1187 M1244 M1291 M1344 M1616 M1661 M1709 M1758
                                            M1802 M1857 M1915 M1962 M2016 M2262
      257   IX-ALT-KEY2-AREA . . . . . . .  M948 M993 M1043 M1092 M1136 M1188 M1245 M1292 M1345 M1617 M1662 M1710 M1759 M1803
                                            M1858 M1916 M1963 M2017 M2263
      225   IX-FS1 . . . . . . . . . . . .  194 799 859 863 870 899 901 955 961 1005 1011 1054 1060 1103 1108 1150 1156 1207
                                            1213 1259 1264 1307 1313 1360 1365 1382 1570 1624 1630 1672 1678 1721 1727 1770
                                            1775 1820 1826 1877 1884 1930 1935 1979 1985 2032 2038 2055 2244 2264 2267 2268
                                            2271 2274 2299 2310 2314
      245   IX-FS1-ALTKEY1 . . . . . . . .  251 201 1625 1673 1722 1771
      246   IX-FS1-ALTKEY1-1-10. . . . . .  2033
      247   IX-FS1-ALTKEY1-1-5 . . . . . .  1878
      249   IX-FS1-ALTKEY1-11-13
      250   IX-FS1-ALTKEY1-14-20
      248   IX-FS1-ALTKEY1-6-10
      258   IX-FS1-ALTKEY2 . . . . . . . .  202 2265
      259   IX-FS1-ALTKEY2-1-10
      260   IX-FS1-ALTKEY2-1-5 . . . . . .  2272
      262   IX-FS1-ALTKEY2-11-13
      263   IX-FS1-ALTKEY2-14-20
      261   IX-FS1-ALTKEY2-6-10
      234   IX-FS1-KEY . . . . . . . . . .  239 200 956 1006 1055 1104 2311
      235   IX-FS1-KEY-1-10
      236   IX-FS1-KEY-1-5 . . . . . . . .  1208
      238   IX-FS1-KEY-11-13
      237   IX-FS1-KEY-6-10
      230   IX-FS1-REC-120
      231   IX-FS1-REC-121-240
      229   IX-FS1R1-F-G-240 . . . . . . .  M828 829 M840 841 964 1014 1063 1110 1159 1216 1266 1316 1367 1633 1681 1730
                                            1777 1829 1887 1937 1988 2040 2277 M2308
      233   IX-REC-KEY-AREA. . . . . . . .  871 M946 M991 M1041 M1090 M1134 M1186 M1243 M1290 M1343 M1615 M1660 M1708 M1757
                                            M1801 M1856 M1914 M1961 M2015 M2261 M2309
      251   IX-REDF-ALTKEY1
      239   IX-REDF-RECKEY
      449   KEY-VALUES
      291   KEYSUB . . . . . . . . . . . .  M812 M821 822 823 824
      484   ODO-NUMBER
      511   P-OR-F . . . . . . . . . . . .  M691 M692 M693 M694 701 M704 M2285 M2332 M2339 M2346
      513   PAR-NAME . . . . . . . . . . .  M706 M811 M864 M903 M984 M1034 M1083 M1127 M1179 M1236 M1283 M1336 M1390 M1411
                                            M1430 M1450 M1470 M1489 M1509 M1529 M1549 M1608 M1653 M1701 M1750 M1794 M1849
                                            M1907 M1954 M2008 M2063 M2083 M2102 M2122 M2142 M2162 M2182 M2202 M2222 M2246
      515   PARDOT-X . . . . . . . . . . .  M698
      564   PASS-COUNTER . . . . . . . . .  678 M692 724 726
      222   PRINT-FILE . . . . . . . . . .  192 661 686
      223   PRINT-REC. . . . . . . . . . .  M700 M781 M783
      252   R-ALTKEY1-1-6. . . . . . . . .  1821 1931 1980 2269
      254   R-ALTKEY1-11-20
      253   R-ALTKEY1-7-10
      240   R-RECKEY-1-7 . . . . . . . . .  1151 1260 1308 1361
      241   R-RECKEY-8-13
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    48
0 Defined   Cross-reference of data names   References

0     207   RAW-DATA . . . . . . . . . . .  187 651 653 660 674 676 685
      210   RAW-DATA-KEY . . . . . . . . .  191 M652 M675
      209   RAW-DATA-SATZ. . . . . . . . .  658 683
      518   RE-MARK. . . . . . . . . . . .  M695 M707 M853 M890 M896 M967 M976 M1017 M1026 M1066 M1075 M1109 M1115 M1119
                                            M1162 M1171 M1219 M1228 M1265 M1271 M1275 M1319 M1328 M1366 M1372 M1376 M1403
                                            M1424 M1443 M1463 M1483 M1502 M1522 M1542 M1562 M1636 M1645 M1684 M1693 M1733
                                            M1742 M1776 M1782 M1786 M1832 M1841 M1890 M1899 M1936 M1942 M1946 M1991 M2000
                                            M2039 M2045 M2049 M2076 M2096 M2115 M2135 M2155 M2175 M2195 M2215 M2235 M2280
                                            M2286 M2292 M2321 M2333 M2340 M2347
      560   REC-CT . . . . . . . . . . . .  697 699 706 2327
      559   REC-SKL-SUB. . . . . . . . . .  M665 M668 670
      294   RECKEY-NUM . . . . . . . . . .  M867 873 M881 895
      450   RECKEY-VALUE . . . . . . . . .  822 2331
      288   RECNO. . . . . . . . . . . . .  M969 M1019 M1068 M1164 M1221 M1321 M1638 M1686 M1735 M1834 M1892 M1993 2331 2338
                                            2345
      568   RECORD-COUNT . . . . . . . . .  M751 752 M764
      297   RECORD-KEY-CONTENT . . . . . .  448
      448   RECORD-KEY-DATA
      494   RECORDS-IN-FILE. . . . . . . .  M809
      293   RECORDS-WRITTEN. . . . . . . .  M846 848 849
      478   REELUNIT-NUMBER
      519   TEST-COMPUTED. . . . . . . . .  781
      534   TEST-CORRECT . . . . . . . . .  783
      587   TEST-ID. . . . . . . . . . . .  M662
      507   TEST-RESULTS . . . . . . . . .  M663 700
      565   TOTAL-ERROR
      482   UPDATE-NUMBER
      272   WRK-FS1-ALTKEY1. . . . . . . .  826 838 M872 947 992 1042 1091 1135 1187 1244 1291 1344 1616 1661 1709 1758 1802
                                            1857 1915 1962 2016 2262 M2336
      280   WRK-FS1-ALTKEY2. . . . . . . .  827 839 948 993 1043 1092 1136 1188 1245 1292 1345 1617 1662 1710 1759 1803 1858
                                            1916 1963 2017 2263 M2283 M2343
      267   WRK-FS1-RECKEY . . . . . . . .  825 837 M871 946 991 1041 1090 1134 1186 1243 1290 1343 1615 1660 1708 1757 1801
                                            1856 1914 1961 2015 2261 2309 M2324 M2329
      492   XBLOCK-SIZE. . . . . . . . . .  M806
      474   XFILE-NAME . . . . . . . . . .  M800
      496   XFILE-ORGANIZATION . . . . . .  M807
      498   XLABEL-TYPE. . . . . . . . . .  M808
      486   XPROGRAM-NAME. . . . . . . . .  M804
      501   XRECORD-KEY. . . . . . . . . .  M825 M837 1112 1268 1369 1939 2042 2324 2329
      488   XRECORD-LENGTH . . . . . . . .  M805
      476   XRECORD-NAME . . . . . . . . .  M801
      480   XRECORD-NUMBER . . . . . . . .  M802 M820 M836 965 971 1015 1021 1064 1070 1160 1166 1217 1223 1317 1323 1634
                                            1640 1682 1688 1731 1737 1830 1836 1888 1894 1989 1995 2278 2288 M2307 2317
      636   XXCOMPUTED . . . . . . . . . .  M790
      638   XXCORRECT. . . . . . . . . . .  M790
      631   XXINFO . . . . . . . . . . . .  777 792
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    49
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

      786   BAIL-OUT . . . . . . . . . . .  P703
      794   BAIL-OUT-EX. . . . . . . . . .  E703 G788
      789   BAIL-OUT-WRITE . . . . . . . .  G787
      769   BLANK-LINE-PRINT
     2351   CCVS-EXIT. . . . . . . . . . .  G2300
      671   CCVS-INIT-EXIT
      667   CCVS-INIT-FILE . . . . . . . .  P666
     2352   CCVS-999999
      649   CCVS1
      795   CCVS1-EXIT . . . . . . . . . .  G672
      673   CLOSE-FILES. . . . . . . . . .  G2353
      713   COLUMN-NAMES-ROUTINE . . . . .  E664
      694   DE-LETE. . . . . . . . . . . .  P856 P979 P1029 P1078 P1122 P1174 P1231 P1278 P1331 P1379 P1392 P1413 P1432 P1452
                                            P1472 P1491 P1511 P1531 P1551 P1648 P1696 P1745 P1789 P1844 P1902 P1949 P2003
                                            P2052 P2065 P2085 P2104 P2124 P2144 P2164 P2184 P2204 P2224 P2295
     2335   DISPLAY-ALTERNATE-KEY1 . . . .  P1639 P1687 P1736 P1835 P1893 P1994
     2342   DISPLAY-ALTERNATE-KEY2
     2328   DISPLAY-RECORD-KEYS. . . . . .  P970 P1020 P1069 P1165 P1222 P1322
      659   END-E-1. . . . . . . . . . . .  G653 G658
      684   END-E-2. . . . . . . . . . . .  G676 G683
      717   END-ROUTINE. . . . . . . . . .  P686
      721   END-ROUTINE-1
      730   END-ROUTINE-12
      738   END-ROUTINE-13 . . . . . . . .  E686
      719   END-RTN-EXIT
      693   FAIL . . . . . . . . . . . . .  P852 P887 P893 P973 P1023 P1072 P1111 P1168 P1225 P1267 P1325 P1368 P1404 P1423
                                            P1442 P1462 P1482 P1501 P1521 P1541 P1561 P1642 P1690 P1739 P1778 P1838 P1896
                                            P1938 P1997 P2041 P2077 P2095 P2114 P2134 P2154 P2174 P2194 P2214 P2234 P2290
      771   FAIL-ROUTINE . . . . . . . . .  P702
      785   FAIL-ROUTINE-EX. . . . . . . .  E702 G779
      780   FAIL-ROUTINE-WRITE . . . . . .  G773 G774
      708   HEAD-ROUTINE . . . . . . . . .  P664
      691   INSPT
      650   OPEN-FILES
      692   PASS . . . . . . . . . . . . .  P850 P886 P966 P1016 P1065 P1118 P1161 P1218 P1274 P1318 P1375 P1401 P1422 P1441
                                            P1461 P1481 P1500 P1520 P1540 P1560 P1635 P1683 P1732 P1785 P1831 P1889 P1945
                                            P1990 P2048 P2074 P2094 P2113 P2133 P2153 P2173 P2193 P2213 P2233 P2279
      696   PRINT-DETAIL . . . . . . . . .  P858 P898 P981 P1031 P1080 P1124 P1176 P1233 P1280 P1333 P1381 P1408 P1428 P1447
                                            P1467 P1487 P1506 P1526 P1546 P1566 P1650 P1698 P1747 P1791 P1846 P1904 P1951
                                            P2005 P2054 P2081 P2100 P2119 P2139 P2159 P2179 P2199 P2219 P2239 P2287 P2297
                                            P2326 P2334 P2341 P2348
      892   READ-FAIL-F1-01. . . . . . . .  P877
      862   READ-INIT-F1-01
      884   READ-TEST-F1-01. . . . . . . .  G870 G879
      869   READ-TEST-F1-01-R1 . . . . . .  G883
      897   READ-WRITE-F1-01 . . . . . . .  G891
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    50
0 Defined   Cross-reference of procedures   References

0     797   SECT-0001-IX214A
      978   START-DELETE-GF-01 . . . . . .  G942
     1028   START-DELETE-GF-02 . . . . . .  G987
     1077   START-DELETE-GF-03 . . . . . .  G1037
     1121   START-DELETE-GF-04 . . . . . .  G1086
     1173   START-DELETE-GF-05 . . . . . .  G1130
     1230   START-DELETE-GF-06 . . . . . .  G1182
     1277   START-DELETE-GF-07 . . . . . .  G1239
     1330   START-DELETE-GF-08 . . . . . .  G1286
     1378   START-DELETE-GF-09 . . . . . .  G1339
     1647   START-DELETE-GF-19 . . . . . .  G1611
     1695   START-DELETE-GF-20 . . . . . .  G1656
     1744   START-DELETE-GF-21 . . . . . .  G1704
     1788   START-DELETE-GF-22 . . . . . .  G1753
     1843   START-DELETE-GF-23 . . . . . .  G1797
     1901   START-DELETE-GF-24 . . . . . .  G1852
     1948   START-DELETE-GF-25 . . . . . .  G1910
     2002   START-DELETE-GF-26 . . . . . .  G1957
     2051   START-DELETE-GF-27 . . . . . .  G2011
     2294   START-DELETE-GF-37
      972   START-FAIL-GF-01 . . . . . . .  G959 G963
     1022   START-FAIL-GF-02 . . . . . . .  G1009 G1013
     1071   START-FAIL-GF-03 . . . . . . .  G1058 G1062
     1167   START-FAIL-GF-05 . . . . . . .  G1154 G1158
     1224   START-FAIL-GF-06 . . . . . . .  G1211 G1215
     1324   START-FAIL-GF-08 . . . . . . .  G1311 G1315
     1641   START-FAIL-GF-19 . . . . . . .  G1628 G1632
     1689   START-FAIL-GF-20 . . . . . . .  G1676 G1680
     1738   START-FAIL-GF-21 . . . . . . .  G1725 G1729
     1837   START-FAIL-GF-23 . . . . . . .  G1824 G1828
     1895   START-FAIL-GF-24 . . . . . . .  G1882 G1886
     1996   START-FAIL-GF-26 . . . . . . .  G1983 G1987
     2289   START-FAIL-GF-37 . . . . . . .  G2276
      900   START-INIT
     2320   START-INIT-ERROR . . . . . . .  P941 P986 P1036 P1085 P1129 P1181 P1238 P1285 P1338 P1610 P1655 P1703 P1752 P1796
                                            P1851 P1909 P1956 P2010
      938   START-INIT-GF-01
      982   START-INIT-GF-02
     1032   START-INIT-GF-03
     1081   START-INIT-GF-04
     1125   START-INIT-GF-05
     1177   START-INIT-GF-06
     1234   START-INIT-GF-07
     1281   START-INIT-GF-08
     1334   START-INIT-GF-09
     1606   START-INIT-GF-19
     1651   START-INIT-GF-20
     1699   START-INIT-GF-21
     1748   START-INIT-GF-22
     1792   START-INIT-GF-23
     1847   START-INIT-GF-24
     1905   START-INIT-GF-25
     1952   START-INIT-GF-26
     2006   START-INIT-GF-27
     2243   START-INIT-GF-37
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    51
0 Defined   Cross-reference of procedures   References

0    2303   START-INITIALIZE-RECORD. . . .  P939 P983 P1033 P1082 P1126 P1178 P1235 P1282 P1335 P1607 P1652 P1700 P1749 P1793
                                            P1848 P1906 P1953 P2007
     1117   START-PASS-GF-04 . . . . . . .  G1106
     1273   START-PASS-GF-07 . . . . . . .  G1262
     1374   START-PASS-GF-09 . . . . . . .  G1363
     1784   START-PASS-GF-22 . . . . . . .  G1773
     1944   START-PASS-GF-25 . . . . . . .  G1933
     2047   START-PASS-GF-27 . . . . . . .  G2036
      949   START-TEST-GF-01
      994   START-TEST-GF-02
     1044   START-TEST-GF-03
     1093   START-TEST-GF-04
     1137   START-TEST-GF-05
     1189   START-TEST-GF-06
     1246   START-TEST-GF-07
     1293   START-TEST-GF-08
     1346   START-TEST-GF-09
     1388   START-TEST-GF-10
     1407   START-TEST-GF-10A. . . . . . .  G1394
     1409   START-TEST-GF-11
     1427   START-TEST-GF-11A. . . . . . .  G1415
     1429   START-TEST-GF-12
     1446   START-TEST-GF-12A. . . . . . .  G1434
     1448   START-TEST-GF-13
     1466   START-TEST-GF-13A. . . . . . .  G1454
     1468   START-TEST-GF-14
     1486   START-TEST-GF-14A. . . . . . .  G1474
     1488   START-TEST-GF-15
     1505   START-TEST-GF-15A. . . . . . .  G1493
     1507   START-TEST-GF-16
     1525   START-TEST-GF-16A. . . . . . .  G1513
     1527   START-TEST-GF-17
     1545   START-TEST-GF-17A. . . . . . .  G1533
     1547   START-TEST-GF-18
     1565   START-TEST-GF-18A. . . . . . .  G1553
     1618   START-TEST-GF-19
     1663   START-TEST-GF-20
     1711   START-TEST-GF-21
     1760   START-TEST-GF-22
     1804   START-TEST-GF-23
     1859   START-TEST-GF-24
     1917   START-TEST-GF-25
     1964   START-TEST-GF-26
     2018   START-TEST-GF-27
     2061   START-TEST-GF-28
     2080   START-TEST-GF-28A. . . . . . .  G2067
     2082   START-TEST-GF-29
     2099   START-TEST-GF-29A. . . . . . .  G2087
     2101   START-TEST-GF-30
     2118   START-TEST-GF-30A. . . . . . .  G2106
     2120   START-TEST-GF-31
     2138   START-TEST-GF-31A. . . . . . .  G2126
     2140   START-TEST-GF-32
     2158   START-TEST-GF-32A. . . . . . .  G2146
     2160   START-TEST-GF-33
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    52
0 Defined   Cross-reference of procedures   References

0    2178   START-TEST-GF-33A. . . . . . .  G2166
     2180   START-TEST-GF-34
     2198   START-TEST-GF-34A. . . . . . .  G2186
     2200   START-TEST-GF-35
     2218   START-TEST-GF-35A. . . . . . .  G2206
     2220   START-TEST-GF-36
     2238   START-TEST-GF-36A. . . . . . .  G2226
     2257   START-TEST-GF-37
      980   START-WRITE-GF-01. . . . . . .  G968 G977
     1030   START-WRITE-GF-02. . . . . . .  G1018 G1027
     1079   START-WRITE-GF-03. . . . . . .  G1067 G1076
     1123   START-WRITE-GF-04. . . . . . .  G1116 G1120
     1175   START-WRITE-GF-05. . . . . . .  G1163 G1172
     1232   START-WRITE-GF-06. . . . . . .  G1220 G1229
     1279   START-WRITE-GF-07. . . . . . .  G1272 G1276
     1332   START-WRITE-GF-08. . . . . . .  G1320 G1329
     1380   START-WRITE-GF-09. . . . . . .  G1373 G1377
     1649   START-WRITE-GF-19. . . . . . .  G1637 G1646
     1697   START-WRITE-GF-20. . . . . . .  G1685 G1694
     1746   START-WRITE-GF-21. . . . . . .  G1734 G1743
     1790   START-WRITE-GF-22. . . . . . .  G1783 G1787
     1845   START-WRITE-GF-23. . . . . . .  G1833 G1842
     1903   START-WRITE-GF-24. . . . . . .  G1891 G1900
     1950   START-WRITE-GF-25. . . . . . .  G1943 G1947
     2004   START-WRITE-GF-26. . . . . . .  G1992 G2001
     2053   START-WRITE-GF-27. . . . . . .  G2046 G2050
     2296   START-WRITE-GF-37. . . . . . .  G2281 G2293
      689   TERMINATE-CALL
      687   TERMINATE-CCVS
      855   WRITE-DELETE-GF-01
      814   WRITE-INIT-GF-01-01
      798   WRITE-INT-GF-01
      750   WRITE-LINE . . . . . . . . . .  P700 P701 P709 P710 P711 P712 P714 P715 P716 P718 P720 P729 P737 P743 P748 P749
                                            P777 P781 P783 P792
      844   WRITE-TEST-GF-01 . . . . . . .  G818
      857   WRITE-TEST-GF-01-END . . . . .  G854
      819   WRITE-TEST-GF-01-R1. . . . . .  P815 P817
      832   WRITE-TEST-GF-01-R2. . . . . .  P816
      766   WRT-LN . . . . . . . . . . . .  P756 P757 P758 P759 P760 P761 P762 P765 P770
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    53
0 Defined   Cross-reference of programs     References

        3   IX214A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX214A    Date 06/04/2022  Time 12:00:22   Page    54
0LineID  Message code  Message text

    197  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

    222  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    225  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX214A:
 *    Source records = 2353
 *    Data Division statements = 163
 *    Procedure Division statements = 1131
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1139
0End of compilation 1,  program IX214A,  highest severity 0.
0Return code 0
