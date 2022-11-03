1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:37   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:37   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2114.2
   000002         000200 PROGRAM-ID.                                                      IX2114.2
   000003         000300     IX211A.                                                      IX2114.2
   000004         000500*                                                              *  IX2114.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2114.2
   000006         000700*                                                              *  IX2114.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2114.2
   000008         000900*                                                              *  IX2114.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2114.2
   000010         001100*                                                              *  IX2114.2
   000011         001300*                                                              *  IX2114.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IX2114.2
   000013         001500*                                                              *  IX2114.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IX2114.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IX2114.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IX2114.2
   000017         001900*                                                              *  IX2114.2
   000018         002100*         "IX211A"                                                IX2114.2
   000019         002300*                                                                 IX2114.2
   000020         002400*    THIS PROGRAM TESTS THE CAPABILITY TO CHANGE (UPDATE) INDEX   IX2114.2
   000021         002500*    KEYS OF RECORDS IN AN INDEXED I-O FILE AND THEN RETRIEVE THE IX2114.2
   000022         002600*    RECORDS FROM THE FILE IN THE PROPER SEQUENCE.  A RECORD      IX2114.2
   000023         002700*    MODIFICATION FOR THE FILE WILL INVOLVE THE UPDATING          IX2114.2
   000024         002800*    OF THE UPDATE-NUMBER FIELD, THE RECORD-KEY OR ALTERNATE-KEY, IX2114.2
   000025         002900*    AND THE ODO-NUMBER FIELD OF THE RECORD.  EACH TIME A GIVEN   IX2114.2
   000026         003000*    RECORD IS MODIFIED THE UPDATE-NUMBER FIELD WILL BE INCREMENT-IX2114.2
   000027         003100*    ED BY ONE.  TO KEEP TRACK OF THOSE RECORDS MODIFIED,         IX2114.2
   000028         003200*    THE ODO-NUMBER FIELD WILL ALWAYS CARRY THE SEQUENTIAL LOC-   IX2114.2
   000029         003300*    ATION OF THE RECORD WITHIN THE FILE WHICH REFLECTS THE LAST  IX2114.2
   000030         003400*    KEY VALUE POSITION BEFORE THE RECORD WAS MODIFIED.  THIS     IX2114.2
   000031         003500*    LOCATION NUMBER WILL BE USED FOR VERIFYING THAT THE SEQUENTI-IX2114.2
   000032         003600*    AL REORDING OF THE RECORD FOR THE FILE WAS PROPER.  ONLY ONE IX2114.2
   000033         003700*    OF THE 3 KEYS OF THE RECORD WILLBE MODIFIED FOR ANY GIVEN    IX2114.2
   000034         003800*    REWIRTE OF THE RECORD.                                       IX2114.2
   000035         003900*    FURTHER A TEST IS MADE TO SEE IF THE POSITION INDICATOR      IX2114.2
   000036         004000*    IS AFFECTED BY EXECUTION OF THE REWRITE STATEMENT.  IT SHOULDIX2114.2
   000037         004100*    NOT (PARAGRAPH 4.6.4 (7), PAGE IX-34).                       IX2114.2
   000038         004200*                                                                 IX2114.2
   000039         004300*            REFERENCE   AMERICAN NATIONAL STANDARD               IX2114.2
   000040         004400*                        PROGRAMMING LANGUAGE COBOL, X3.23-1985.  IX2114.2
   000041         004500*                        SECTION IX, INDEXED I-O, THE REWRITE     IX2114.2
   000042         004600*                        STATEMENT, PARAGRAPHS 4.6.4 (7),(14), ANDIX2114.2
   000043         004700*                                             (15 B)              IX2114.2
   000044         004800*                                                                 IX2114.2
   000045         004900*                                                                 IX2114.2
   000046         005000*    THIS PROGRAM FIRST CREATES AN  INDEXED SEQUENTIAL FILE       IX2114.2
   000047         005100*    CONTAINING TWO ALTERNATE KEYS AND  THE ONE REQUIRED RECORD   IX2114.2
   000048         005200*    KEY FOR THE FILE.  IMMEDIATELY FOLLOWING FILE CREATION THE   IX2114.2
   000049         005300*    FILE IS READ AND THE RECORDS OF THE FILE VERIFIED FOR        IX2114.2
   000050         005400*    ACCURACY.                                                    IX2114.2
   000051         005500*    THE RECORDS IN THE FILE ARE CREATED IN SEQUENTIAL ORDER BY   IX2114.2
   000052         005600*    RECORD KEY VALUE.  FOLLOWING  IS A SAMPLE OF THE DATA        IX2114.2
   000053         005700*    CONTENTS FOR THE RECORD KEY AND TWO ALTERNATE RECORD KEYS IN IX2114.2
   000054         005800*    THE FILE.                                                    IX2114.2
   000055         005900*                                                                 IX2114.2
   000056         006000*   REC-NO  RECORD-KEY      ALTERNATE-KEY-1     ALTERNATE-KEY-2   IX2114.2
   000057         006100*   ------  ----------      ---------------     ---------------   IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200*    001   BBBBBBBBBC002 EEEEEEEEEF000ALTKEY1 WWWWWWWWWV398ALTKEY2IX2114.2
   000059         006300*    002   BBBBBBBBCC004 EEEEEEEEFF004ALTKEY1 WWWWWWWWVV396ALTKEY2IX2114.2
   000060         006400*    003   BBBBBBBCCC006 EEEEEEEFFF006ALTKEY1 WWWWWWWVVV394ALTKEY2IX2114.2
   000061         006500*     .          .                 .                    .         IX2114.2
   000062         006600*     .          .                 .                    .         IX2114.2
   000063         006700*     .          .                 .                    .         IX2114.2
   000064         006800*    010   CCCCCCCCCC020 FFFFFFFFFF020ALTKEY1 VVVVVVVVVV380ALTKEY2IX2114.2
   000065         006900*    011   CCCCCCCCCD022 FFFFFFFFFG022ALTKEY1 VVVVVVVVVV380ALTKEY2IX2114.2
   000066         007000*    012   CCCCCCCCDD024 FFFFFFFFGG024ALTKEY1 VVVVVVVVUU376ALTKEY2IX2114.2
   000067         007100*     .          .                 .                    .         IX2114.2
   000068         007200*     .          .                 .                    .         IX2114.2
   000069         007300*     .          .                 .                    .         IX2114.2
   000070         007400*    200   UUUUUUUUUU400 YYYYYYYYYY400ALTKEY1 DDDDDDDDDD000ALTKEY2IX2114.2
   000071         007500*                                                                 IX2114.2
   000072         007600*     NOTE 1 - ALTERNATE KEY NUMBER 2 CONTAINS DUPLICATE KEYS     IX2114.2
   000073         007700*              EVERY 10TH AND 11TH RECORDS.                       IX2114.2
   000074         007800*                                                                 IX2114.2
   000075         007900*    NOTE 2 - THE FIRST 50 RECORDS AND LAST 25 RECORDS OF THE     IX2114.2
   000076         008000*    FILE FOLLOW THE ABOVE SEQUENTIAL KEY PATTERN.  FOR THE MIDDLEIX2114.2
   000077         008100*    125 RECORDS ONLY THE NUMBER PART OF THE KEYS ARE VARIED      IX2114.2
   000078         008200*    AND VARIED IN THE SEQUENCE SHOWN ABOVE.  THAT IS, RECORD-KEY IX2114.2
   000079         008300*    AND ALTERNATE-KEY-1 ARE INCREMENTED BY 2 AND THE ALTERNATE-  IX2114.2
   000080         008400*    KEY-2 IS DECREMENTED BY 2 EACH TIME A RECORD IS WRITTEN TO   IX2114.2
   000081         008500*    THE FILE.  THE FILE IS DESIGNED TO BE LARGE ENOUGH SO THAT   IX2114.2
   000082         008600*    AN I-O OPERATION IS REQUIRED FOR EACH RECORD ACCESSED FROM   IX2114.2
   000083         008700*    THE FILE.                                                    IX2114.2
   000084         008800*                                                                 IX2114.2
   000085         008900*    FILE CHARACTERISTICS ARE: FILE SIZE            = 200 RECORDS IX2114.2
   000086         009000*                              RECORD SIZE          = 240 CHARS.  IX2114.2
   000087         009100*                              RECORD KEY SIZE      = 13  CHARS.  IX2114.2
   000088         009200*                              ALTERNATE KEY 1 SIZE = 20  CHARS.  IX2114.2
   000089         009300*                              ALTERNATE KEY 2 SIZE = 20  CHARS.  IX2114.2
   000090         009400*                              ACCESS MODE          = DYNAMIC     IX2114.2
   000091         009500*                                                                 IX2114.2
   000092         009600*    A LIST OF COBOL ELEMENTS WITH THE PARAGRAPH NAME IN PARENTH- IX2114.2
   000093         009700*    ESIS THAT TESTS THE ELEMENT AND A SHORT DESCRIPTION OF THE   IX2114.2
   000094         009800*    TEST FOLLOWS.                                                IX2114.2
   000095         009900*                                                                 IX2114.2
   000096         010000*      WRITE --- INVALID KEY --. (INX-TEST-001) - THIS TEST       IX2114.2
   000097         010100*            CREATES A FILE OF 200 RECORDS CONTAINING A RECORD KEYIX2114.2
   000098         010200*            AND 2 ALTERNATE KEYS.                                IX2114.2
   000099         010300*      READ --- AT END ---. (INX-TEST-002) - THIS TEST READS THE  IX2114.2
   000100         010400*            FILE CREATED IN INX-TEST-001 AND VERIFIES THAT THE   IX2114.2
   000101         010500*            FILE WAS CREATED CORRECTLY.                          IX2114.2
   000102         010600*      START --- KEY IS EQUAL TO ALTERNAT-KEY1 ---.  AND          IX2114.2
   000103         010700*      READ --- NEXT AT END ---. (INX-TEST-003.01) - THIS TEST    IX2114.2
   000104         010800*            READS A RECORD AND ESTABLISHES THE ALTERNAT-KEY1 AS  IX2114.2
   000105         010900*            THE KEY OF REFERENCE FOR THE FOLLOWING REWRITE TEST. IX2114.2
   000106         011000*      REWRITE --- INVALID KEY ---. (INX-TEST-003-02) - THIS TEST IX2114.2
   000107         011100*            MODIFIES THE ALTERNATE-KEY1 KEY OF THE RECORD AND    IX2114.2
   000108         011200*            REWRITES THE RECORD                                  IX2114.2
   000109         011300*      READ --- NEXT AT END ---. (INX-TEST-003.03) - ONE RECORD   IX2114.2
   000110         011400*            IS READ SEQUENTIALLY FROM THE FILE.  THE REWRITE     IX2114.2
   000111         011500*            IN PREVIOUS TEST SHOULD NOT HAVE AFFECTED THE RECORD IX2114.2
   000112         011600*            POINTER FOR THE FILE, THUS THE RECORD MADE AVAILABLE IX2114.2
   000113         011700*            SHOULD BE THE NEXT RECORD AS THOUGH THE ALTERNATE KEYIX2114.2
   000114         011800*            HAD NOT BEEN MODIFIED.                               IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011900*      READ --- NEXT AT END ---. (INX-TEST-003.04) - THIS TEST    IX2114.2
   000116         012000*            READS THE NEXT 4 RECORDS SEQUENTIALLY TO SEE IF      IX2114.2
   000117         012100*            THE REWRITE OF THE RECORD CAUSED SEQUENTIAL          IX2114.2
   000118         012200*            REORDING OF THE RECORDS.                             IX2114.2
   000119         012300*                                                                 IX2114.2
   000120         012500 ENVIRONMENT DIVISION.                                            IX2114.2
   000121         012600 CONFIGURATION SECTION.                                           IX2114.2
   000122         012700 SOURCE-COMPUTER.                                                 IX2114.2
   000123         012800     XXXXX082.                                                    IX2114.2
   000124         012900 OBJECT-COMPUTER.                                                 IX2114.2
   000125         013000     XXXXX083.                                                    IX2114.2
   000126         013100 INPUT-OUTPUT SECTION.                                            IX2114.2
   000127         013200 FILE-CONTROL.                                                    IX2114.2
   000128         013300     SELECT RAW-DATA   ASSIGN TO                                  IX2114.2 148
   000129         013400     XXXXX062                                                     IX2114.2
   000130         013500            ORGANIZATION IS INDEXED                               IX2114.2
   000131         013600            ACCESS MODE IS RANDOM                                 IX2114.2
   000132         013700            RECORD KEY IS RAW-DATA-KEY.                           IX2114.2 151
   000133         013800     SELECT PRINT-FILE ASSIGN TO                                  IX2114.2 163
   000134         013900     XXXXX055.                                                    IX2114.2
   000135         014000     SELECT  IX-FD1                                               IX2114.2 166
   000136         014100     ASSIGN TO                                                    IX2114.2
   000137         014200     XXXXX024                                                     IX2114.2
   000138         014300     XXXXX044                                                     IX2114.2

 ==000138==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000139         014400        ACCESS MODE IS DYNAMIC                                    IX2114.2
   000140         014500        ORGANIZATION IS INDEXED                                   IX2114.2
   000141         014600        RECORD KEY IS IX-FD1-KEY                                  IX2114.2 175
   000142         014700        ALTERNATE RECORD KEY IS IX-FD1-ALTKEY1                    IX2114.2 183
   000143         014800        ALTERNATE RECORD KEY IS IX-FD1-ALTKEY2 WITH DUPLICATES    IX2114.2 192
   000144         014900        FILE STATUS IS FD1-STATUS.                                IX2114.2 224
   000145         015000 DATA DIVISION.                                                   IX2114.2
   000146         015100 FILE SECTION.                                                    IX2114.2
   000147         015200                                                                  IX2114.2
   000148         015300 FD  RAW-DATA.                                                    IX2114.2
   000149         015400                                                                  IX2114.2
   000150         015500 01  RAW-DATA-SATZ.                                               IX2114.2
   000151         015600     05  RAW-DATA-KEY        PIC X(6).                            IX2114.2
   000152         015700     05  C-DATE              PIC 9(6).                            IX2114.2
   000153         015800     05  C-TIME              PIC 9(8).                            IX2114.2
   000154         015900     05  C-NO-OF-TESTS       PIC 99.                              IX2114.2
   000155         016000     05  C-OK                PIC 999.                             IX2114.2
   000156         016100     05  C-ALL               PIC 999.                             IX2114.2
   000157         016200     05  C-FAIL              PIC 999.                             IX2114.2
   000158         016300     05  C-DELETED           PIC 999.                             IX2114.2
   000159         016400     05  C-INSPECT           PIC 999.                             IX2114.2
   000160         016500     05  C-NOTE              PIC X(13).                           IX2114.2
   000161         016600     05  C-INDENT            PIC X.                               IX2114.2
   000162         016700     05  C-ABORT             PIC X(8).                            IX2114.2
   000163         016800 FD  PRINT-FILE.                                                  IX2114.2

 ==000163==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000164         016900 01  PRINT-REC PICTURE X(120).                                    IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000165         017000 01  DUMMY-RECORD PICTURE X(120).                                 IX2114.2
   000166         017100 FD  IX-FD1                                                       IX2114.2

 ==000166==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000167         017200     LABEL RECORDS ARE STANDARD                                   IX2114.2
   000168         017300     DATA RECORD IS IX-FD1R1-F-G-240                              IX2114.2 *
   000169         017400     RECORD CONTAINS 240 CHARACTERS.                              IX2114.2
   000170         017500 01  IX-FD1R1-F-G-240.                                            IX2114.2
   000171         017600     05 IX-FD1-REC-120           PICTURE X(120).                  IX2114.2
   000172         017700     05 IX-FD1-REC-121-240.                                       IX2114.2
   000173         017800        10 FILLER                PICTURE X(8).                    IX2114.2
   000174         017900        10 IX-REC-KEY-AREA.                                       IX2114.2
   000175         018000           15 IX-FD1-KEY.                                         IX2114.2
   000176         018100              20 IX-FD1-KEY-1-10.                                 IX2114.2
   000177         018200                 25 IX-FD1-KEY-1-5      PICTURE X(5).             IX2114.2
   000178         018300                 25 IX-FD1-KEY-6-10     PICTURE X(5).             IX2114.2
   000179         018400               20 IX-FD1-KEY-11-13      PICTURE X(3).             IX2114.2
   000180         018500           15 FILLER             PICTURE X(16).                   IX2114.2
   000181         018600        10 FILLER                PICTURE X(9).                    IX2114.2
   000182         018700        10 IX-ALT-KEY1-AREA.                                      IX2114.2
   000183         018800           15 IX-FD1-ALTKEY1.                                     IX2114.2
   000184         018900              20 IX-FD1-ALTKEY1-1-10.                             IX2114.2
   000185         019000                 25 IX-FD1-ALTKEY1-1-5  PICTURE X(5).             IX2114.2
   000186         019100                 25 IX-FD1-ALTKEY1-6-10 PICTURE X(5).             IX2114.2
   000187         019200              20 IX-FD1-ALTKEY1-11-13   PICTURE X(3).             IX2114.2
   000188         019300              20 IX-FD1-ALTKEY1-14-20   PICTURE X(7).             IX2114.2
   000189         019400           15 FILLER             PICTURE X(9).                    IX2114.2
   000190         019500        10 FILLER                PICTURE X(9).                    IX2114.2
   000191         019600        10 IX-ALT-KEY2-AREA.                                      IX2114.2
   000192         019700           15 IX-FD1-ALTKEY2.                                     IX2114.2
   000193         019800              20 IX-FD1-ALTKEY2-1-10.                             IX2114.2
   000194         019900                 25 IX-FD1-ALTKEY2-1-5  PICTURE X(5).             IX2114.2
   000195         020000                 25 IX-FD1-ALTKEY2-6-10 PICTURE X(5).             IX2114.2
   000196         020100              20 IX-FD1-ALTKEY2-11-13   PICTURE X(3).             IX2114.2
   000197         020200              20 IX-FD1-ALTKEY2-14-20   PICTURE X(7).             IX2114.2
   000198         020300           15 FILLER             PICTURE X(9).                    IX2114.2
   000199         020400        10 FILLER                PICTURE X(7).                    IX2114.2
   000200         020500 WORKING-STORAGE SECTION.                                         IX2114.2
   000201         020600 01  WRK-FD1-RECKEY.                                              IX2114.2
   000202         020700     05 FD1-RECKEY-1-13.                                          IX2114.2
   000203         020800        10 FD1-RECKEY-1-10       PICTURE X(10).                   IX2114.2
   000204         020900        10 FD1-RECKEY-11-13      PICTURE 9(3).                    IX2114.2
   000205         021000     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX2114.2 IMP
   000206         021100 01  WRK-FD1-ALTKEY1.                                             IX2114.2
   000207         021200      05 FD1-ALTKEY1-1-20.                                        IX2114.2
   000208         021300       10  FD1-ALTKEY1-1-10.                                      IX2114.2
   000209         021400        15 FD1-ALTKEY1-1-5       PICTURE X(5).                    IX2114.2
   000210         021500        15 FD1-ALTKEY1-6-10      PICTURE X(5).                    IX2114.2
   000211         021600       10 FD1-ALTKEY1-11-13      PICTURE 9(3).                    IX2114.2
   000212         021700       10 FD1-ALTKEY1-14-20      PICTURE X(7).                    IX2114.2
   000213         021800     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX2114.2 IMP
   000214         021900 01  WRK-FD1-ALTKEY2.                                             IX2114.2
   000215         022000     05 FD1-ALTKEY2-1-20.                                         IX2114.2
   000216         022100        10 FD1-ALTKEY2-1-10.                                      IX2114.2
   000217         022200           15 FD1-ALTKEY2-1-5    PICTURE X(5).                    IX2114.2
   000218         022300           15 FD1-ALTKEY2-6-10   PICTURE X(5).                    IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000219         022400        10 FD1-ALTKEY2-11-13     PICTURE 9(3).                    IX2114.2
   000220         022500        10 FD1-ALTKEY2-14-20     PICTURE X(7).                    IX2114.2
   000221         022600     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX2114.2 IMP
   000222         022700 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX2114.2 IMP
   000223         022800 01  ADJUSTED-NUM        PIC X(8) VALUE "NO".                     IX2114.2
   000224         022900 01  FD1-STATUS                  PICTURE XX   VALUE SPACE.        IX2114.2 IMP
   000225         023000 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX2114.2 IMP
   000226         023100 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX2114.2
   000227         023200 01  INVKEY-COUNTER              PICTURE 9(3) COMPUTATIONAL.      IX2114.2
   000228         023300 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX2114.2
   000229         023400 01  RECKEY-NUM                  PICTURE 9(3).                    IX2114.2
   000230         023500 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX2114.2
   000231         023600 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX2114.2
   000232         023700 01  RECORD-KEY-CONTENT.                                          IX2114.2
   000233         023800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000234         023900          "BBBBBBBBBC002EEEEEEEEEF002ALTKEY1WWWWWWWWWV398ALTKEY2".IX2114.2
   000235         024000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000236         024100          "BBBBBBBBCC004EEEEEEEEFF004ALTKEY1WWWWWWWWVV396ALTKEY2".IX2114.2
   000237         024200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000238         024300          "BBBBBBBCCC006EEEEEEEFFF006ALTKEY1WWWWWWWVVV394ALTKEY2".IX2114.2
   000239         024400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000240         024500          "BBBBBBCCCC008EEEEEEFFFF008ALTKEY1WWWWWWVVVV392ALTKEY2".IX2114.2
   000241         024600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000242         024700          "BBBBBCCCCC010EEEEEFFFFF010ALTKEY1WWWWWVVVVV390ALTKEY2".IX2114.2
   000243         024800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000244         024900          "BBBBCCCCCC012EEEEFFFFFF012ALTKEY1WWWWVVVVVV388ALTKEY2".IX2114.2
   000245         025000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000246         025100          "BBBCCCCCCC014EEEFFFFFFF014ALTKEY1WWWVVVVVVV386ALTKEY2".IX2114.2
   000247         025200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000248         025300          "BBCCCCCCCC016EEFFFFFFFF016ALTKEY1WWVVVVVVVV384ALTKEY2".IX2114.2
   000249         025400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000250         025500          "BCCCCCCCCC018EFFFFFFFFF018ALTKEY1WVVVVVVVVV382ALTKEY2".IX2114.2
   000251         025600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000252         025700          "CCCCCCCCCC020FFFFFFFFFF020ALTKEY1VVVVVVVVVV380ALTKEY2".IX2114.2
   000253         025800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000254         025900          "CCCCCCCCCD022FFFFFFFFFG022ALTKEY1VVVVVVVVVV380ALTKEY2".IX2114.2
   000255         026000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000256         026100          "CCCCCCCCDD024FFFFFFFFGG024ALTKEY1VVVVVVVVUU376ALTKEY2".IX2114.2
   000257         026200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000258         026300          "CCCCCCCDDD026FFFFFFFGGG026ALTKEY1VVVVVVVUUU374ALTKEY2".IX2114.2
   000259         026400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000260         026500          "CCCCCCDDDD028FFFFFFGGGG028ALTKEY1VVVVVVUUUU372ALTKEY2".IX2114.2
   000261         026600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000262         026700          "CCCCCDDDDD030FFFFFGGGGG030ALTKEY1VVVVVUUUUU370ALTKEY2".IX2114.2
   000263         026800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000264         026900          "CCCCDDDDDD032FFFFGGGGGG032ALTKEY1VVVVUUUUUU368ALTKEY2".IX2114.2
   000265         027000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000266         027100          "CCCDDDDDDD034FFFGGGGGGG034ALTKEY1VVVUUUUUUU366ALTKEY2".IX2114.2
   000267         027200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000268         027300          "CCDDDDDDDD036FFGGGGGGGG036ALTKEY1VVUUUUUUUU364ALTKEY2".IX2114.2
   000269         027400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000270         027500          "CDDDDDDDDD038FGGGGGGGGG038ALTKEY1VUUUUUUUUU362ALTKEY2".IX2114.2
   000271         027600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000272         027700          "DDDDDDDDDD040GGGGGGGGGG040ALTKEY1UUUUUUUUUU360ALTKEY2".IX2114.2
   000273         027800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000274         027900          "DDDDDDDDDE042GGGGGGGGGH042ALTKEY1UUUUUUUUUU360ALTKEY2".IX2114.2
   000275         028000     05 FILLER PIC X(53) VALUE                                    IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000276         028100          "DDDDDDDDEE044GGGGGGGGHH044ALTKEY1UUUUUUUUTT356ALTKEY2".IX2114.2
   000277         028200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000278         028300          "DDDDDDDEEE046GGGGGGGHHH046ALTKEY1UUUUUUUTTT354ALTKEY2".IX2114.2
   000279         028400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000280         028500          "DDDDDDEEEE048GGGGGGHHHH048ALTKEY1UUUUUUTTTT352ALTKEY2".IX2114.2
   000281         028600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000282         028700          "DDDDDEEEEE050GGGGGHHHHH050ALTKEY1UUUUUTTTTT350ALTKEY2".IX2114.2
   000283         028800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000284         028900          "DDDDEEEEEE052GGGGHHHHHH052ALTKEY1UUUUTTTTTT348ALTKEY2".IX2114.2
   000285         029000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000286         029100          "DDDEEEEEEE054GGGHHHHHHH054ALTKEY1UUUTTTTTTT346ALTKEY2".IX2114.2
   000287         029200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000288         029300          "DDEEEEEEEE056GGHHHHHHHH056ALTKEY1UUTTTTTTTT344ALTKEY2".IX2114.2
   000289         029400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000290         029500          "DEEEEEEEEE058GHHHHHHHHH058ALTKEY1UTTTTTTTTT342ALTKEY2".IX2114.2
   000291         029600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000292         029700          "EEEEEEEEEE060HHHHHHHHHH060ALTKEY1TTTTTTTTTT340ALTKEY2".IX2114.2
   000293         029800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000294         029900          "EEEEEEEEEF062HHHHHHHHHI062ALTKEY1TTTTTTTTTT340ALTKEY2".IX2114.2
   000295         030000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000296         030100          "EEEEEEEEFF064HHHHHHHHII064ALTKEY1TTTTTTTTSS336ALTKEY2".IX2114.2
   000297         030200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000298         030300          "EEEEEEEFFF066HHHHHHHIII066ALTKEY1TTTTTTTSSS334ALTKEY2".IX2114.2
   000299         030400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000300         030500          "EEEEEEFFFF068HHHHHHIIII068ALTKEY1TTTTTTSSSS332ALTKEY2".IX2114.2
   000301         030600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000302         030700          "EEEEEFFFFF070HHHHHIIIII070ALTKEY1TTTTTSSSSS330ALTKEY2".IX2114.2
   000303         030800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000304         030900          "EEEEFFFFFF072HHHHIIIIII072ALTKEY1TTTTSSSSSS328ALTKEY2".IX2114.2
   000305         031000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000306         031100          "EEEFFFFFFF074HHHIIIIIII074ALTKEY1TTTSSSSSSS326ALTKEY2".IX2114.2
   000307         031200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000308         031300          "EEFFFFFFFF076HHIIIIIIII076ALTKEY1TTSSSSSSSS324ALTKEY2".IX2114.2
   000309         031400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000310         031500          "EFFFFFFFFF078HIIIIIIIII078ALTKEY1TSSSSSSSSS322ALTKEY2".IX2114.2
   000311         031600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000312         031700          "FFFFFFFFFF080IIIIIIIIII080ALTKEY1SSSSSSSSSS320ALTKEY2".IX2114.2
   000313         031800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000314         031900          "FFFFFFFFFG082IIIIIIIIIJ082ALTKEY1SSSSSSSSSS320ALTKEY2".IX2114.2
   000315         032000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000316         032100          "FFFFFFFFGG084IIIIIIIIJJ084ALTKEY1SSSSSSSSRR316ALTKEY2".IX2114.2
   000317         032200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000318         032300          "FFFFFFFGGG086IIIIIIIJJJ086ALTKEY1SSSSSSSRRR314ALTKEY2".IX2114.2
   000319         032400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000320         032500          "FFFFFFGGGG088IIIIIIJJJJ088ALTKEY1SSSSSSRRRR312ALTKEY2".IX2114.2
   000321         032600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000322         032700          "FFFFFGGGGG090IIIIIJJJJJ090ALTKEY1SSSSSRRRRR310ALTKEY2".IX2114.2
   000323         032800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000324         032900          "FFFFGGGGGG092IIIIJJJJJJ092ALTKEY1SSSSRRRRRR308ALTKEY2".IX2114.2
   000325         033000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000326         033100          "FFFGGGGGGG094IIIJJJJJJJ094ALTKEY1SSSRRRRRRR306ALTKEY2".IX2114.2
   000327         033200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000328         033300          "FFGGGGGGGG096IIJJJJJJJJ096ALTKEY1SSRRRRRRRR304ALTKEY2".IX2114.2
   000329         033400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000330         033500          "FGGGGGGGGG098IJJJJJJJJJ098ALTKEY1SRRRRRRRRR302ALTKEY2".IX2114.2
   000331         033600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000332         033700          "GGGGGGGGGG100JJJJJJJJJJ100ALTKEY1RRRRRRRRRR300ALTKEY2".IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000333         033800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000334         033900          "RRRRSSSSSS352VVVVWWWWWW352ALTKEY1GGGGFFFFFF048ALTKEY2".IX2114.2
   000335         034000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000336         034100          "RRRSSSSSSS354VVVWWWWWWW354ALTKEY1GGGFFFFFFF046ALTKEY2".IX2114.2
   000337         034200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000338         034300          "RRSSSSSSSS356VVWWWWWWWW356ALTKEY1GGFFFFFFFF044ALTKEY2".IX2114.2
   000339         034400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000340         034500          "RSSSSSSSSS358VWWWWWWWWW358ALTKEY1GFFFFFFFFF042ALTKEY2".IX2114.2
   000341         034600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000342         034700          "SSSSSSSSSS360WWWWWWWWWW360ALTKEY1FFFFFFFFFF040ALTKEY2".IX2114.2
   000343         034800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000344         034900          "SSSSSSSSST362WWWWWWWWWX362ALTKEY1FFFFFFFFFF040ALTKEY2".IX2114.2
   000345         035000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000346         035100          "SSSSSSSSTT364WWWWWWWWXX364ALTKEY1FFFFFFFFEE036ALTKEY2".IX2114.2
   000347         035200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000348         035300          "SSSSSSSTTT366WWWWWWWXXX366ALTKEY1FFFFFFFEEE034ALTKEY2".IX2114.2
   000349         035400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000350         035500          "SSSSSSTTTT368WWWWWWXXXX368ALTKEY1FFFFFFEEEE032ALTKEY2".IX2114.2
   000351         035600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000352         035700          "SSSSSTTTTT370WWWWWXXXXX370ALTKEY1FFFFFEEEEE030ALTKEY2".IX2114.2
   000353         035800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000354         035900          "SSSSTTTTTT372WWWWXXXXXX372ALTKEY1FFFFEEEEEE028ALTKEY2".IX2114.2
   000355         036000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000356         036100          "SSSTTTTTTT374WWWXXXXXXX374ALTKEY1FFFEEEEEEE026ALTKEY2".IX2114.2
   000357         036200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000358         036300          "SSTTTTTTTT376WWXXXXXXXX376ALTKEY1FFEEEEEEEE024ALTKEY2".IX2114.2
   000359         036400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000360         036500          "STTTTTTTTT378WXXXXXXXXX378ALTKEY1FEEEEEEEEE022ALTKEY2".IX2114.2
   000361         036600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000362         036700          "TTTTTTTTTT380XXXXXXXXXX380ALTKEY1EEEEEEEEEE020ALTKEY2".IX2114.2
   000363         036800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000364         036900          "TTTTTTTTTU382XXXXXXXXXY382ALTKEY1EEEEEEEEEE020ALTKEY2".IX2114.2
   000365         037000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000366         037100          "TTTTTTTTUU384XXXXXXXXYY384ALTKEY1EEEEEEEEDD016ALTKEY2".IX2114.2
   000367         037200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000368         037300          "TTTTTTTUUU386XXXXXXXYYY386ALTKEY1EEEEEEEDDD014ALTKEY2".IX2114.2
   000369         037400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000370         037500          "TTTTTTUUUU388XXXXXXYYYY388ALTKEY1EEEEEEDDDD012ALTKEY2".IX2114.2
   000371         037600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000372         037700          "TTTTTUUUUU390XXXXXYYYYY390ALTKEY1EEEEEDDDDD010ALTKEY2".IX2114.2
   000373         037800     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000374         037900          "TTTTUUUUUU392XXXXYYYYYY392ALTKEY1EEEEDDDDDD008ALTKEY2".IX2114.2
   000375         038000     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000376         038100          "TTTUUUUUUU394XXXYYYYYYY394ALTKEY1EEEDDDDDDD006ALTKEY2".IX2114.2
   000377         038200     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000378         038300          "TTUUUUUUUU396XXYYYYYYYY396ALTKEY1EEDDDDDDDD004ALTKEY2".IX2114.2
   000379         038400     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000380         038500          "TUUUUUUUUU398XYYYYYYYYY398ALTKEY1EDDDDDDDDD002ALTKEY2".IX2114.2
   000381         038600     05 FILLER PIC X(53) VALUE                                    IX2114.2
   000382         038700          "UUUUUUUUUU400YYYYYYYYYY400ALTKEY1DDDDDDDDDD000ALTKEY2".IX2114.2
   000383         038800 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX2114.2 232
   000384         038900     05 KEY-VALUES                  OCCURS 75  TIMES.             IX2114.2
   000385         039000       10 RECKEY-VALUE           PICTURE X(13).                   IX2114.2
   000386         039100       10 ALTKEY1-VALUE          PICTURE X(20).                   IX2114.2
   000387         039200       10 ALTKEY2-VALUE          PICTURE X(20).                   IX2114.2
   000388         039300 01  INIT-FLAG                   PICTURE 9.                       IX2114.2
   000389         039400 01  HOLD-FILESTATUS-RECORD.                                      IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000390         039500     05 FILESTATUS               PICTURE XX  OCCURS 10 TIMES.     IX2114.2
   000391         039600 01  FILE-RECORD-INFORMATION-REC.                                 IX2114.2
   000392         039700     03 FILE-RECORD-INFO-SKELETON.                                IX2114.2
   000393         039800        05 FILLER                 PICTURE X(48)       VALUE       IX2114.2
   000394         039900             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2114.2
   000395         040000        05 FILLER                 PICTURE X(46)       VALUE       IX2114.2
   000396         040100             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2114.2
   000397         040200        05 FILLER                 PICTURE X(26)       VALUE       IX2114.2
   000398         040300             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2114.2
   000399         040400        05 FILLER                 PICTURE X(37)       VALUE       IX2114.2
   000400         040500             ",RECKEY=                             ".             IX2114.2
   000401         040600        05 FILLER                 PICTURE X(38)       VALUE       IX2114.2
   000402         040700             ",ALTKEY1=                             ".            IX2114.2
   000403         040800        05 FILLER                 PICTURE X(38)       VALUE       IX2114.2
   000404         040900             ",ALTKEY2=                             ".            IX2114.2
   000405         041000        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2114.2 IMP
   000406         041100     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2114.2
   000407         041200        05 FILE-RECORD-INFO-P1-120.                               IX2114.2
   000408         041300           07 FILLER              PIC X(5).                       IX2114.2
   000409         041400           07 XFILE-NAME           PIC X(6).                      IX2114.2
   000410         041500           07 FILLER              PIC X(8).                       IX2114.2
   000411         041600           07 XRECORD-NAME         PIC X(6).                      IX2114.2
   000412         041700           07 FILLER              PIC X(1).                       IX2114.2
   000413         041800           07 REELUNIT-NUMBER     PIC 9(1).                       IX2114.2
   000414         041900           07 FILLER              PIC X(7).                       IX2114.2
   000415         042000           07 XRECORD-NUMBER       PIC 9(6).                      IX2114.2
   000416         042100           07 FILLER              PIC X(6).                       IX2114.2
   000417         042200           07 UPDATE-NUMBER       PIC 9(2).                       IX2114.2
   000418         042300           07 FILLER              PIC X(5).                       IX2114.2
   000419         042400           07 ODO-NUMBER          PIC 9(4).                       IX2114.2
   000420         042500           07 FILLER              PIC X(5).                       IX2114.2
   000421         042600           07 XPROGRAM-NAME        PIC X(5).                      IX2114.2
   000422         042700           07 FILLER              PIC X(7).                       IX2114.2
   000423         042800           07 XRECORD-LENGTH       PIC 9(6).                      IX2114.2
   000424         042900           07 FILLER              PIC X(7).                       IX2114.2
   000425         043000           07 CHARS-OR-RECORDS    PIC X(2).                       IX2114.2
   000426         043100           07 FILLER              PIC X(1).                       IX2114.2
   000427         043200           07 XBLOCK-SIZE          PIC 9(4).                      IX2114.2
   000428         043300           07 FILLER              PIC X(6).                       IX2114.2
   000429         043400           07 RECORDS-IN-FILE     PIC 9(6).                       IX2114.2
   000430         043500           07 FILLER              PIC X(5).                       IX2114.2
   000431         043600           07 XFILE-ORGANIZATION   PIC X(2).                      IX2114.2
   000432         043700           07 FILLER              PIC X(6).                       IX2114.2
   000433         043800           07 XLABEL-TYPE          PIC X(1).                      IX2114.2
   000434         043900        05 FILE-RECORD-INFO-P121-240.                             IX2114.2
   000435         044000           07 FILLER              PIC X(8).                       IX2114.2
   000436         044100           07 XRECORD-KEY          PIC X(29).                     IX2114.2
   000437         044200           07 FILLER              PIC X(9).                       IX2114.2
   000438         044300           07 ALTERNATE-KEY1      PIC X(29).                      IX2114.2
   000439         044400           07 FILLER              PIC X(9).                       IX2114.2
   000440         044500           07 ALTERNATE-KEY2      PIC X(29).                      IX2114.2
   000441         044600           07 FILLER              PIC X(7).                       IX2114.2
   000442         044700 01  TEST-RESULTS.                                                IX2114.2
   000443         044800     02 FILLER                   PIC X      VALUE SPACE.          IX2114.2 IMP
   000444         044900     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2114.2 IMP
   000445         045000     02 FILLER                   PIC X      VALUE SPACE.          IX2114.2 IMP
   000446         045100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000447         045200     02 FILLER                   PIC X      VALUE SPACE.          IX2114.2 IMP
   000448         045300     02  PAR-NAME.                                                IX2114.2
   000449         045400       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2114.2 IMP
   000450         045500       03  PARDOT-X              PIC X      VALUE SPACE.          IX2114.2 IMP
   000451         045600       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2114.2 IMP
   000452         045700     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2114.2 IMP
   000453         045800     02 RE-MARK                  PIC X(61).                       IX2114.2
   000454         045900 01  TEST-COMPUTED.                                               IX2114.2
   000455         046000     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2114.2 IMP
   000456         046100     02 FILLER                   PIC X(17)  VALUE                 IX2114.2
   000457         046200            "       COMPUTED=".                                   IX2114.2
   000458         046300     02 COMPUTED-X.                                               IX2114.2
   000459         046400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2114.2 IMP
   000460         046500     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2114.2 459
   000461         046600                                 PIC -9(9).9(9).                  IX2114.2
   000462         046700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2114.2 459
   000463         046800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2114.2 459
   000464         046900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2114.2 459
   000465         047000     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2114.2 459
   000466         047100         04 COMPUTED-18V0                    PIC -9(18).          IX2114.2
   000467         047200         04 FILLER                           PIC X.               IX2114.2
   000468         047300     03 FILLER PIC X(50) VALUE SPACE.                             IX2114.2 IMP
   000469         047400 01  TEST-CORRECT.                                                IX2114.2
   000470         047500     02 FILLER PIC X(30) VALUE SPACE.                             IX2114.2 IMP
   000471         047600     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2114.2
   000472         047700     02 CORRECT-X.                                                IX2114.2
   000473         047800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2114.2 IMP
   000474         047900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2114.2 473
   000475         048000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2114.2 473
   000476         048100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2114.2 473
   000477         048200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2114.2 473
   000478         048300     03      CR-18V0 REDEFINES CORRECT-A.                         IX2114.2 473
   000479         048400         04 CORRECT-18V0                     PIC -9(18).          IX2114.2
   000480         048500         04 FILLER                           PIC X.               IX2114.2
   000481         048600     03 FILLER PIC X(2) VALUE SPACE.                              IX2114.2 IMP
   000482         048700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2114.2 IMP
   000483         048800 01  CCVS-C-1.                                                    IX2114.2
   000484         048900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2114.2
   000485         049000-    "SS  PARAGRAPH-NAME                                          IX2114.2
   000486         049100-    "       REMARKS".                                            IX2114.2
   000487         049200     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2114.2 IMP
   000488         049300 01  CCVS-C-2.                                                    IX2114.2
   000489         049400     02 FILLER                     PIC X        VALUE SPACE.      IX2114.2 IMP
   000490         049500     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2114.2
   000491         049600     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2114.2 IMP
   000492         049700     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2114.2
   000493         049800     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2114.2 IMP
   000494         049900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2114.2 IMP
   000495         050000 01  REC-CT                        PIC 99       VALUE ZERO.       IX2114.2 IMP
   000496         050100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2114.2 IMP
   000497         050200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2114.2 IMP
   000498         050300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2114.2 IMP
   000499         050400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2114.2 IMP
   000500         050500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2114.2 IMP
   000501         050600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2114.2 IMP
   000502         050700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2114.2 IMP
   000503         050800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2114.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000504         050900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2114.2 IMP
   000505         051000 01  CCVS-H-1.                                                    IX2114.2
   000506         051100     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2114.2 IMP
   000507         051200     02  FILLER                    PIC X(42)    VALUE             IX2114.2
   000508         051300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2114.2
   000509         051400     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2114.2 IMP
   000510         051500 01  CCVS-H-2A.                                                   IX2114.2
   000511         051600   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2114.2 IMP
   000512         051700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2114.2
   000513         051800   02  FILLER                        PIC XXXX   VALUE             IX2114.2
   000514         051900     "4.2 ".                                                      IX2114.2
   000515         052000   02  FILLER                        PIC X(28)  VALUE             IX2114.2
   000516         052100            " COPY - NOT FOR DISTRIBUTION".                       IX2114.2
   000517         052200   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2114.2 IMP
   000518         052300                                                                  IX2114.2
   000519         052400 01  CCVS-H-2B.                                                   IX2114.2
   000520         052500   02  FILLER                        PIC X(15)  VALUE             IX2114.2
   000521         052600            "TEST RESULT OF ".                                    IX2114.2
   000522         052700   02  TEST-ID                       PIC X(9).                    IX2114.2
   000523         052800   02  FILLER                        PIC X(4)   VALUE             IX2114.2
   000524         052900            " IN ".                                               IX2114.2
   000525         053000   02  FILLER                        PIC X(12)  VALUE             IX2114.2
   000526         053100     " HIGH       ".                                              IX2114.2
   000527         053200   02  FILLER                        PIC X(22)  VALUE             IX2114.2
   000528         053300            " LEVEL VALIDATION FOR ".                             IX2114.2
   000529         053400   02  FILLER                        PIC X(58)  VALUE             IX2114.2
   000530         053500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2114.2
   000531         053600 01  CCVS-H-3.                                                    IX2114.2
   000532         053700     02  FILLER                      PIC X(34)  VALUE             IX2114.2
   000533         053800            " FOR OFFICIAL USE ONLY    ".                         IX2114.2
   000534         053900     02  FILLER                      PIC X(58)  VALUE             IX2114.2
   000535         054000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2114.2
   000536         054100     02  FILLER                      PIC X(28)  VALUE             IX2114.2
   000537         054200            "  COPYRIGHT   1985 ".                                IX2114.2
   000538         054300 01  CCVS-E-1.                                                    IX2114.2
   000539         054400     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2114.2 IMP
   000540         054500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2114.2
   000541         054600     02 ID-AGAIN                     PIC X(9).                    IX2114.2
   000542         054700     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2114.2 IMP
   000543         054800 01  CCVS-E-2.                                                    IX2114.2
   000544         054900     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2114.2 IMP
   000545         055000     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2114.2 IMP
   000546         055100     02 CCVS-E-2-2.                                               IX2114.2
   000547         055200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2114.2 IMP
   000548         055300         03 FILLER                   PIC X      VALUE SPACE.      IX2114.2 IMP
   000549         055400         03 ENDER-DESC               PIC X(44)  VALUE             IX2114.2
   000550         055500            "ERRORS ENCOUNTERED".                                 IX2114.2
   000551         055600 01  CCVS-E-3.                                                    IX2114.2
   000552         055700     02  FILLER                      PIC X(22)  VALUE             IX2114.2
   000553         055800            " FOR OFFICIAL USE ONLY".                             IX2114.2
   000554         055900     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2114.2 IMP
   000555         056000     02  FILLER                      PIC X(58)  VALUE             IX2114.2
   000556         056100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2114.2
   000557         056200     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2114.2 IMP
   000558         056300     02 FILLER                       PIC X(15)  VALUE             IX2114.2
   000559         056400             " COPYRIGHT 1985".                                   IX2114.2
   000560         056500 01  CCVS-E-4.                                                    IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000561         056600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2114.2 IMP
   000562         056700     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2114.2
   000563         056800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2114.2 IMP
   000564         056900     02 FILLER                       PIC X(40)  VALUE             IX2114.2
   000565         057000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2114.2
   000566         057100 01  XXINFO.                                                      IX2114.2
   000567         057200     02 FILLER                       PIC X(19)  VALUE             IX2114.2
   000568         057300            "*** INFORMATION ***".                                IX2114.2
   000569         057400     02 INFO-TEXT.                                                IX2114.2
   000570         057500       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2114.2 IMP
   000571         057600       04 XXCOMPUTED                 PIC X(20).                   IX2114.2
   000572         057700       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2114.2 IMP
   000573         057800       04 XXCORRECT                  PIC X(20).                   IX2114.2
   000574         057900     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2114.2
   000575         058000 01  HYPHEN-LINE.                                                 IX2114.2
   000576         058100     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2114.2 IMP
   000577         058200     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2114.2
   000578         058300-    "*****************************************".                 IX2114.2
   000579         058400     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2114.2
   000580         058500-    "******************************".                            IX2114.2
   000581         058600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2114.2
   000582         058700     "IX211A".                                                    IX2114.2
   000583         058800 PROCEDURE DIVISION.                                              IX2114.2
   000584         058900 CCVS1 SECTION.                                                   IX2114.2
   000585         059000 OPEN-FILES.                                                      IX2114.2
   000586         059100     OPEN I-O RAW-DATA.                                           IX2114.2 148
   000587         059200     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2114.2 581 151
   000588         059300     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2114.2 148 594
   000589         059400     MOVE "ABORTED " TO C-ABORT.                                  IX2114.2 162
   000590         059500     ADD 1 TO C-NO-OF-TESTS.                                      IX2114.2 154
   000591         059600     ACCEPT C-DATE  FROM DATE.                                    IX2114.2 152
   000592         059700     ACCEPT C-TIME  FROM TIME.                                    IX2114.2 153
   000593         059800     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2114.2 150 594
   000594         059900 END-E-1.                                                         IX2114.2
   000595         060000     CLOSE RAW-DATA.                                              IX2114.2 148
   000596         060100     OPEN    OUTPUT PRINT-FILE.                                   IX2114.2 163
   000597         060200     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2114.2 581 522 581 541
   000598         060300     MOVE    SPACE TO TEST-RESULTS.                               IX2114.2 IMP 442
   000599         060400     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2114.2 643 648
   000600         060500     MOVE    ZERO TO REC-SKL-SUB.                                 IX2114.2 IMP 494
   000601         060600     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2114.2 602
   000602         060700 CCVS-INIT-FILE.                                                  IX2114.2
   000603         060800     ADD     1 TO REC-SKL-SUB.                                    IX2114.2 494
   000604         060900     MOVE    FILE-RECORD-INFO-SKELETON                            IX2114.2 392
   000605         061000          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2114.2 406 494
   000606         061100 CCVS-INIT-EXIT.                                                  IX2114.2
   000607         061200     GO TO CCVS1-EXIT.                                            IX2114.2 730
   000608         061300 CLOSE-FILES.                                                     IX2114.2
   000609         061400     OPEN I-O RAW-DATA.                                           IX2114.2 148
   000610         061500     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2114.2 581 151
   000611         061600     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2114.2 148 619
   000612         061700     MOVE "OK.     " TO C-ABORT.                                  IX2114.2 162
   000613         061800     MOVE PASS-COUNTER TO C-OK.                                   IX2114.2 499 155
   000614         061900     MOVE ERROR-HOLD   TO C-ALL.                                  IX2114.2 501 156
   000615         062000     MOVE ERROR-COUNTER TO C-FAIL.                                IX2114.2 497 157
   000616         062100     MOVE DELETE-COUNTER TO C-DELETED.                            IX2114.2 496 158
   000617         062200     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2114.2 498 159
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000618         062300     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2114.2 150 619
   000619         062400 END-E-2.                                                         IX2114.2
   000620         062500     CLOSE RAW-DATA.                                              IX2114.2 148
   000621         062600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2114.2 652 673 163
   000622         062700 TERMINATE-CCVS.                                                  IX2114.2
   000623         062800     EXIT PROGRAM.                                                IX2114.2
   000624         062900 TERMINATE-CALL.                                                  IX2114.2
   000625         063000     STOP     RUN.                                                IX2114.2
   000626         063100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2114.2 446 498
   000627         063200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2114.2 446 499
   000628         063300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2114.2 446 497
   000629         063400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2114.2 446 496
   000630         063500     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2114.2 453
   000631         063600 PRINT-DETAIL.                                                    IX2114.2
   000632         063700     IF REC-CT NOT EQUAL TO ZERO                                  IX2114.2 495 IMP
   000633      1  063800             MOVE "." TO PARDOT-X                                 IX2114.2 450
   000634      1  063900             MOVE REC-CT TO DOTVALUE.                             IX2114.2 495 451
   000635         064000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2114.2 442 164 685
   000636         064100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2114.2 446 685
   000637      1  064200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2114.2 706 720
   000638      1  064300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2114.2 721 729
   000639         064400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2114.2 IMP 446 IMP 458
   000640         064500     MOVE SPACE TO CORRECT-X.                                     IX2114.2 IMP 472
   000641         064600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2114.2 495 IMP IMP 448
   000642         064700     MOVE     SPACE TO RE-MARK.                                   IX2114.2 IMP 453
   000643         064800 HEAD-ROUTINE.                                                    IX2114.2
   000644         064900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2114.2 505 165 685
   000645         065000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2114.2 510 165 685
   000646         065100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2114.2 519 165 685
   000647         065200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2114.2 531 165 685
   000648         065300 COLUMN-NAMES-ROUTINE.                                            IX2114.2
   000649         065400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2114.2 483 165 685
   000650         065500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2114.2 488 165 685
   000651         065600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2114.2 575 165 685
   000652         065700 END-ROUTINE.                                                     IX2114.2
   000653         065800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2114.2 575 165 685
   000654         065900 END-RTN-EXIT.                                                    IX2114.2
   000655         066000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2114.2 538 165 685
   000656         066100 END-ROUTINE-1.                                                   IX2114.2
   000657         066200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2114.2 497 501 498
   000658         066300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2114.2 501 496 501
   000659         066400      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2114.2 499 501
   000660         066500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2114.2
   000661         066600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2114.2 499 561
   000662         066700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2114.2 501 563
   000663         066800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2114.2 560 546
   000664         066900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2114.2 543 165 685
   000665         067000  END-ROUTINE-12.                                                 IX2114.2
   000666         067100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2114.2 549
   000667         067200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2114.2 497 IMP
   000668      1  067300         MOVE "NO " TO ERROR-TOTAL                                IX2114.2 547
   000669         067400         ELSE                                                     IX2114.2
   000670      1  067500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2114.2 497 547
   000671         067600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2114.2 543 165
   000672         067700     PERFORM WRITE-LINE.                                          IX2114.2 685
   000673         067800 END-ROUTINE-13.                                                  IX2114.2
   000674         067900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2114.2 496 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000675      1  068000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2114.2 547
   000676      1  068100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2114.2 496 547
   000677         068200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2114.2 549
   000678         068300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2114.2 543 165 685
   000679         068400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2114.2 498 IMP
   000680      1  068500          MOVE "NO " TO ERROR-TOTAL                               IX2114.2 547
   000681      1  068600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2114.2 498 547
   000682         068700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2114.2 549
   000683         068800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2114.2 543 165 685
   000684         068900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2114.2 551 165 685
   000685         069000 WRITE-LINE.                                                      IX2114.2
   000686         069100     ADD 1 TO RECORD-COUNT.                                       IX2114.2 503
   000687         069200     IF RECORD-COUNT GREATER 42                                   IX2114.2 503
   000688      1  069300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2114.2 165 502
   000689      1  069400         MOVE SPACE TO DUMMY-RECORD                               IX2114.2 IMP 165
   000690      1  069500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2114.2 165
   000691      1  069600         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2114.2 505 165 701
   000692      1  069700         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2114.2 510 165 701
   000693      1  069800         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2114.2 519 165 701
   000694      1  069900         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2114.2 531 165 701
   000695      1  070000         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2114.2 483 165 701
   000696      1  070100         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2114.2 488 165 701
   000697      1  070200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2114.2 575 165 701
   000698      1  070300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2114.2 502 165
   000699      1  070400         MOVE ZERO TO RECORD-COUNT.                               IX2114.2 IMP 503
   000700         070500     PERFORM WRT-LN.                                              IX2114.2 701
   000701         070600 WRT-LN.                                                          IX2114.2
   000702         070700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2114.2 165
   000703         070800     MOVE SPACE TO DUMMY-RECORD.                                  IX2114.2 IMP 165
   000704         070900 BLANK-LINE-PRINT.                                                IX2114.2
   000705         071000     PERFORM WRT-LN.                                              IX2114.2 701
   000706         071100 FAIL-ROUTINE.                                                    IX2114.2
   000707         071200     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2114.2 458 IMP
   000708      1  071300            GO TO   FAIL-ROUTINE-WRITE.                           IX2114.2 715
   000709         071400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2114.2 472 IMP 715
   000710         071500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2114.2 504 574
   000711         071600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2114.2 569
   000712         071700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2114.2 566 165 685
   000713         071800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2114.2 IMP 574
   000714         071900     GO TO  FAIL-ROUTINE-EX.                                      IX2114.2 720
   000715         072000 FAIL-ROUTINE-WRITE.                                              IX2114.2
   000716         072100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2114.2 454 164 685
   000717         072200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2114.2 504 482
   000718         072300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2114.2 469 164 685
   000719         072400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2114.2 IMP 482
   000720         072500 FAIL-ROUTINE-EX. EXIT.                                           IX2114.2
   000721         072600 BAIL-OUT.                                                        IX2114.2
   000722         072700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2114.2 459 IMP 724
   000723         072800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2114.2 473 IMP 729
   000724         072900 BAIL-OUT-WRITE.                                                  IX2114.2
   000725         073000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2114.2 473 573 459 571
   000726         073100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2114.2 504 574
   000727         073200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2114.2 566 165 685
   000728         073300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2114.2 IMP 574
   000729         073400 BAIL-OUT-EX. EXIT.                                               IX2114.2
   000730         073500 CCVS1-EXIT.                                                      IX2114.2
   000731         073600     EXIT.                                                        IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000732         073700 SECT-0001-IX211A SECTION.                                        IX2114.2
   000733         073800 WRITE-INT-GF-01.                                                 IX2114.2
   000734         073900     OPEN    OUTPUT IX-FD1.                                       IX2114.2 166
   000735         074000     MOVE    "IX-FD1" TO XFILE-NAME           (1).                IX2114.2 409
   000736         074100     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2114.2 411
   000737         074200     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2114.2 IMP 415
   000738         074300     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2114.2 425
   000739         074400     MOVE    CCVS-PGM-ID TO  XPROGRAM-NAME       (1).             IX2114.2 581 421
   000740         074500     MOVE    240      TO  XRECORD-LENGTH      (1).                IX2114.2 423
   000741         074600     MOVE    001      TO  XBLOCK-SIZE         (1).                IX2114.2 427
   000742         074700     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2114.2 431
   000743         074800     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2114.2 433
   000744         074900     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2114.2 429
   000745         075000     MOVE    "CREATE-FILE-FD1" TO FEATURE.                        IX2114.2 444
   000746         075100     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2114.2 448
   000747         075200     MOVE    ZERO TO KEYSUB.                                      IX2114.2 IMP 226
   000748         075300     MOVE    ZERO TO INVKEY-COUNTER.                              IX2114.2 IMP 227
   000749         075400 WRITE-INIT-GF-01-01.                                             IX2114.2
   000750         075500     PERFORM WRITE-TEST-GF-01-1  50 TIMES.                        IX2114.2 754
   000751         075600     PERFORM WRITE-TEST-GF-01-2  125 TIMES.                       IX2114.2 767
   000752         075700     PERFORM WRITE-TEST-GF-01-1  25 TIMES.                        IX2114.2 754
   000753         075800     GO TO   WRITE-TEST-GF-01.                                    IX2114.2 779
   000754         075900 WRITE-TEST-GF-01-1.                                              IX2114.2
   000755         076000     ADD     001  TO XRECORD-NUMBER (1).                          IX2114.2 415
   000756         076100     ADD     001  TO  KEYSUB.                                     IX2114.2 226
   000757         076200     MOVE    RECKEY-VALUE (KEYSUB) TO FD1-RECKEY-1-13.            IX2114.2 385 226 202
   000758         076300     MOVE    ALTKEY1-VALUE (KEYSUB) TO FD1-ALTKEY1-1-20.          IX2114.2 386 226 207
   000759         076400     MOVE    ALTKEY2-VALUE (KEYSUB) TO FD1-ALTKEY2-1-20.          IX2114.2 387 226 215
   000760         076500     MOVE    WRK-FD1-RECKEY   TO    XRECORD-KEY (1).              IX2114.2 201 436
   000761         076600     MOVE    WRK-FD1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2114.2 206 438
   000762         076700     MOVE    WRK-FD1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2114.2 214 440
   000763         076800     MOVE    FILE-RECORD-INFO (1)  TO IX-FD1R1-F-G-240.           IX2114.2 406 170
   000764         076900     WRITE   IX-FD1R1-F-G-240                                     IX2114.2 170
   000765      1  077000                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2114.2 227
   000766         077100     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2114.2 225
   000767         077200 WRITE-TEST-GF-01-2.                                              IX2114.2
   000768         077300     ADD     002  TO FD1-RECKEY-11-13.                            IX2114.2 204
   000769         077400     ADD     002 TO FD1-ALTKEY1-11-13.                            IX2114.2 211
   000770         077500     SUBTRACT  002 FROM FD1-ALTKEY2-11-13.                        IX2114.2 219
   000771         077600     ADD     001  TO XRECORD-NUMBER (1).                          IX2114.2 415
   000772         077700     MOVE    WRK-FD1-RECKEY   TO    XRECORD-KEY (1).              IX2114.2 201 436
   000773         077800     MOVE    WRK-FD1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2114.2 206 438
   000774         077900     MOVE    WRK-FD1-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2114.2 214 440
   000775         078000     MOVE    FILE-RECORD-INFO (1) TO IX-FD1R1-F-G-240.            IX2114.2 406 170
   000776         078100     WRITE   IX-FD1R1-F-G-240                                     IX2114.2 170
   000777      1  078200                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2114.2 227
   000778         078300     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2114.2 225
   000779         078400 WRITE-TEST-GF-01.                                                IX2114.2
   000780         078500     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2114.2 227 225
   000781         078600             GIVING RECORDS-WRITTEN.                              IX2114.2 228
   000782         078700     MOVE    200  TO CORRECT-18V0.                                IX2114.2 479
   000783         078800     MOVE    RECORDS-WRITTEN TO COMPUTED-18V0.                    IX2114.2 228 466
   000784         078900     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2114.2 228
   000785      1  079000             PERFORM  PASS                                        IX2114.2 627
   000786         079100             ELSE                                                 IX2114.2
   000787      1  079200             PERFORM FAIL.                                        IX2114.2 628
   000788         079300     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2114.2 453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000789         079400     GO TO   WRITE-TEST-GF-01-END.                                IX2114.2 792
   000790         079500 WRITE-DELETE-GF-01.                                              IX2114.2
   000791         079600     PERFORM DE-LETE.                                             IX2114.2 629
   000792         079700 WRITE-TEST-GF-01-END.                                            IX2114.2
   000793         079800     PERFORM  PRINT-DETAIL.                                       IX2114.2 631
   000794         079900     CLOSE   IX-FD1.                                              IX2114.2 166
   000795         080000 READ-INIT-F1-01.                                                 IX2114.2
   000796         080100     OPEN    INPUT  IX-FD1.                                       IX2114.2 166
   000797         080200     MOVE    "READ-TEST-F1-01" TO PAR-NAME.                       IX2114.2 448
   000798         080300     MOVE    "READ FILE IX-FD1" TO FEATURE.                       IX2114.2 444
   000799         080400     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2114.2 IMP 225
   000800         080500     MOVE    02   TO RECKEY-NUM.                                  IX2114.2 229
   000801         080600     MOVE    002 TO ALTKEY1-NUM.                                  IX2114.2 230
   000802         080700 READ-TEST-F1-01-1.                                               IX2114.2
   000803         080800     READ     IX-FD1 NEXT                                         IX2114.2 166
   000804      1  080900             AT END GO TO READ-TEST-F1-01.                        IX2114.2 818
   000805         081000     MOVE    IX-REC-KEY-AREA TO WRK-FD1-RECKEY.                   IX2114.2 174 201
   000806         081100     MOVE    IX-ALT-KEY1-AREA TO WRK-FD1-ALTKEY1.                 IX2114.2 182 206
   000807         081200     IF      FD1-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2114.2 204 229
   000808         081300             AND FD1-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2114.2 211 230
   000809      1  081400             NEXT SENTENCE                                        IX2114.2
   000810         081500             ELSE                                                 IX2114.2
   000811      1  081600             PERFORM  READ-FAIL-F1-01.                            IX2114.2 826
   000812         081700     IF      EXCUT-COUNTER-06V00 GREATER THAN 200                 IX2114.2 225
   000813      1  081800             GO TO READ-TEST-F1-01.                               IX2114.2 818
   000814         081900     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2114.2 225
   000815         082000     ADD     002  TO RECKEY-NUM                                   IX2114.2 229
   000816         082100     ADD     002  TO ALTKEY1-NUM.                                 IX2114.2 230
   000817         082200     GO TO   READ-TEST-F1-01-1.                                   IX2114.2 802
   000818         082300 READ-TEST-F1-01.                                                 IX2114.2
   000819         082400     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2114.2 225
   000820      1  082500             PERFORM PASS ELSE                                    IX2114.2 627
   000821      1  082600             PERFORM FAIL.                                        IX2114.2 628
   000822         082700     MOVE    EXCUT-COUNTER-06V00 TO  COMPUTED-18V0.               IX2114.2 225 466
   000823         082800     MOVE    200  TO  CORRECT-18V0.                               IX2114.2 479
   000824         082900     MOVE    "RECORDS IN FILE" TO RE-MARK.                        IX2114.2 453
   000825         083000     GO TO   READ-EXIT-F1-01.                                     IX2114.2 832
   000826         083100 READ-FAIL-F1-01.                                                 IX2114.2
   000827         083200     PERFORM FAIL.                                                IX2114.2 628
   000828         083300     MOVE    FD1-RECKEY-11-13  TO COMPUTED-18V0.                  IX2114.2 204 466
   000829         083400     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2114.2 229 479
   000830         083500     MOVE "NUM EMBEDDED IN RECKEY; IX-28 READ; IX-41 WRITE"       IX2114.2
   000831         083600              TO RE-MARK.                                         IX2114.2 453
   000832         083700 READ-EXIT-F1-01.                                                 IX2114.2
   000833         083800     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   000834         083900     CLOSE   IX-FD1.                                              IX2114.2 166
   000835         084000 READ-INIT-F1-02.                                                 IX2114.2
   000836         084100     OPEN I-O  IX-FD1.                                            IX2114.2 166
   000837         084200     MOVE "START & READ NEXT   " TO FEATURE.                      IX2114.2 444
   000838         084300     MOVE "READ-TEST-F1-02     " TO PAR-NAME.                     IX2114.2 448
   000839         084400     MOVE    "SSSSSSSSTT364"  TO FD1-RECKEY-1-13.                 IX2114.2 202
   000840         084500     MOVE    "WWWWWWWWXX364ALTKEY1"  TO FD1-ALTKEY1-1-20.         IX2114.2 207
   000841         084600     MOVE    "FFFFFFFFEE036ALTKEY2"  TO FD1-ALTKEY2-1-20.         IX2114.2 215
   000842         084700     MOVE    WRK-FD1-RECKEY TO IX-REC-KEY-AREA.                   IX2114.2 201 174
   000843         084800     MOVE    WRK-FD1-ALTKEY1 TO IX-ALT-KEY1-AREA.                 IX2114.2 206 182
   000844         084900     MOVE    WRK-FD1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2114.2 214 191
   000845         085000 READ-TEST-F1-02.                                                 IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000846         085100*                                                                 IX2114.2
   000847         085200*  READ-TEST-F1-02 - THIS TEST READS A RECORD AND CHECKS THE      IX2114.2
   000848         085300*                    RECORD MADE AVAILABLE.  THE PURPOSE IS TO    IX2114.2
   000849         085400*                    ESTABLISH IX-FD1-ALTKEY1 AS THE KEY OF REF-  IX2114.2
   000850         085500*                    ERENCE AND TO MAKE A RECORD AVAILABLE        IX2114.2
   000851         085600*                    FOR TESTING THE REWRITE STATEMENT IN THE     IX2114.2
   000852         085700*                    NEXT TEST.         RECORD 182 (ALTERNATE KEY IX2114.2
   000853         085800*                    "WWWWWWWWXX364ALTKEY1") IS EXPECTED TO BE    IX2114.2
   000854         085900*                    RETRIEVED.                                   IX2114.2
   000855         086000*                                                                 IX2114.2
   000856         086100     START   IX-FD1                                               IX2114.2 166
   000857         086200                    KEY IS EQUAL TO IX-FD1-ALTKEY1                IX2114.2 183
   000858      1  086300          INVALID KEY MOVE "INVALID KEY ON START" TO COMPUTED-A   IX2114.2 459
   000859      1  086400                     GO TO READ-FAIL-F1-02.                       IX2114.2 867
   000860         086500     READ    IX-FD1  NEXT  AT END                                 IX2114.2 166
   000861      1  086600             MOVE  "AT END ON READ"  TO COMPUTED-A                IX2114.2 459
   000862      1  086700             GO TO  READ-FAIL-F1-02.                              IX2114.2 867
   000863         086800     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2114.2 170 406
   000864         086900     IF      XRECORD-NUMBER (1) EQUAL TO 182                      IX2114.2 415
   000865      1  087000             PERFORM   PASS                                       IX2114.2 627
   000866      1  087100             GO TO   READ-WRITE-F1-02.                            IX2114.2 871
   000867         087200 READ-FAIL-F1-02.                                                 IX2114.2
   000868         087300     PERFORM FAIL.                                                IX2114.2 628
   000869         087400     MOVE    "RECORD 182 RETRIEVED"  TO CORRECT-A.                IX2114.2 473
   000870         087500     MOVE "SEQUENTIAL READ; IX-28 4.5.2"  TO RE-MARK.             IX2114.2 453
   000871         087600 READ-WRITE-F1-02.                                                IX2114.2
   000872         087700     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   000873         087800 RWRT-TEST-GF-01.                                                 IX2114.2
   000874         087900     MOVE "REWRITE             " TO FEATURE.                      IX2114.2 444
   000875         088000     MOVE "RWRT-TEST-GF-01     " TO PAR-NAME.                     IX2114.2 448
   000876         088100*                                                                 IX2114.2
   000877         088200*  RWRT-TEST-GF-01 - THE TEST MODIFIES THE CONTENTS OF ALTERNATE- IX2114.2
   000878         088300*                    KEY1 OF THE RECORD RETRIEVED BY THE TEST     IX2114.2
   000879         088400*                    BEFORE AND REWRITES THE RECORD.THE NEW ALTER-IX2114.2
   000880         088500*                    NATE KEY VALUE IS "WWWWWWXXXX369ALTKEY1"     IX2114.2
   000881         088600*                    WHICH BECOMES SEQUENTIAL RECORD NUMBER  184. IX2114.2
   000882         088700*                    THE NEW KEY FOR THE FILE HAS A KEY VALUE     IX2114.2
   000883         088800*                    SEQUENTIALLY GREATER THAN THE RECORD VALUE   IX2114.2
   000884         088900*                    RETRIEVED FROM RECORD. THE SEQUENTIAL RECORD IX2114.2
   000885         089000*                    RETRIEVED BEFORE THE REWRITE WAS NUMBER      IX2114.2
   000886         089100*                    182.  THE CURRENT RECORD POINTER FOR THE FILEIX2114.2
   000887         089200*                    IS NOT EXPECTED TO BE MODIFIED BY            IX2114.2
   000888         089300*                    EXECUTION OF THE REWRITE.                    IX2114.2
   000889         089400*                                                                 IX2114.2
   000890         089500     MOVE    182  TO ODO-NUMBER (1).                              IX2114.2 419
   000891         089600     ADD     01  TO UPDATE-NUMBER (1).                            IX2114.2 417
   000892         089700     MOVE    "WWWWWWXXXX369ALTKEY1"  TO FD1-ALTKEY1-1-20.         IX2114.2 207
   000893         089800     MOVE    WRK-FD1-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2114.2 206 438
   000894         089900     MOVE    FILE-RECORD-INFO (1) TO IX-FD1R1-F-G-240.            IX2114.2 406 170
   000895         090000     REWRITE IX-FD1R1-F-G-240  INVALID KEY                        IX2114.2 170
   000896      1  090100                     MOVE   "INVALID KEY REWRITE" TO COMPUTED-A   IX2114.2 459
   000897      1  090200                     GO TO   RWRT-FAIL-GF-01.                     IX2114.2 900
   000898         090300     PERFORM PASS.                                                IX2114.2 627
   000899         090400     GO TO   RWRT-WRITE-GF-01.                                    IX2114.2 903
   000900         090500 RWRT-FAIL-GF-01.                                                 IX2114.2
   000901         090600     PERFORM FAIL.                                                IX2114.2 628
   000902         090700     MOVE "IX-33 4.6.2       "  TO RE-MARK.                       IX2114.2 453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000903         090800 RWRT-WRITE-GF-01.                                                IX2114.2
   000904         090900     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   000905         091000 READ-INIT-F1-03.                                                 IX2114.2
   000906         091100     MOVE "READ NEXT AT END    " TO FEATURE.                      IX2114.2 444
   000907         091200     MOVE "READ-TEST-F1-03     " TO PAR-NAME.                     IX2114.2 448
   000908         091300 READ-TEST-F1-03.                                                 IX2114.2
   000909         091400*                                                                 IX2114.2
   000910         091500*  READ-TEST-F1-03 - THIS TEST PERFORMS A SEQUENTIAL READ AND     IX2114.2
   000911         091600*                    CHECKS THE RECORD MADE AVAILABLE.  THE KEY OFIX2114.2
   000912         091700*                    REFERENCE IS EXPECTED TO BE THAT ESTABLISHED IX2114.2
   000913         091800*                    BEFORE.              THE LOGICAL RECORD      IX2114.2
   000914         091900*                    RETRIEVED IS EXPECTED TO BE THAT RECORD THAT IX2114.2
   000915         092000*                    WOULD HAVE BEEN RETRIEVED HAD THE ALTERNATE  IX2114.2
   000916         092100*                    KEY NOT BEEN CHANGE BY THE REWRITE IN        IX2114.2
   000917         092200*                    RWRT-TEST-GF-01.                             IX2114.2
   000918         092300*                                                                 IX2114.2
   000919         092400     READ    IX-FD1  NEXT  AT END                                 IX2114.2 166
   000920      1  092500                     MOVE   "AT END ON READ"  TO COMPUTED-A       IX2114.2 459
   000921      1  092600             GO TO   READ-FAIL-F1-03.                             IX2114.2 929
   000922         092700     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2114.2 170 406
   000923         092800     IF      XRECORD-NUMBER (1) EQUAL TO 183                      IX2114.2 415
   000924      1  092900             PERFORM  PASS                                        IX2114.2 627
   000925      1  093000             GO TO READ-WRITE-F1-03.                              IX2114.2 933
   000926         093100     MOVE    58  TO RECNO.                                        IX2114.2 222
   000927         093200     PERFORM DISPLAY-ALTERNATE-KEY1.                              IX2114.2 1102
   000928         093300     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2114.2 415 466
   000929         093400 READ-FAIL-F1-03.                                                 IX2114.2
   000930         093500      PERFORM FAIL.                                               IX2114.2 628
   000931         093600     MOVE    183  TO CORRECT-18V0.                                IX2114.2 479
   000932         093700     MOVE "RECORD NUMBER; IX-28"  TO RE-MARK.                     IX2114.2 453
   000933         093800 READ-WRITE-F1-03.                                                IX2114.2
   000934         093900     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   000935         094000 READ-INIT-F1-04.                                                 IX2114.2
   000936         094100     MOVE "READ NEXT 4 RECS    " TO FEATURE.                      IX2114.2 444
   000937         094200     MOVE "READ-TEST-F1-04     " TO PAR-NAME.                     IX2114.2 448
   000938         094300     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2114.2 IMP 225
   000939         094400     MOVE    183  TO RECKEY-NUM.                                  IX2114.2 229
   000940         094500 READ-TEST-F1-04.                                                 IX2114.2
   000941         094600*                                                                 IX2114.2
   000942         094700*  READ-TEST-F1-04 - THE TEST SEQUENTIALLY READS THE NEXT 4 REC-  IX2114.2
   000943         094800*                    ORDS AND CHECKS THE RECORD NUMBER FIELD OF   IX2114.2
   000944         094900*                    EACH RECORD RETRIEVED.  THE CONTENTS OF      IX2114.2
   000945         095000*                    THE RECORD NUMBER FIELD IS EXPECTED TO BE    IX2114.2
   000946         095100*                    184, 182, 185 AND 186 (ALTERNATE KEY VALUES  IX2114.2
   000947         095200*                    WWWWWWXXXX368ALTKEY1 THROUGH WWWXXXXXXX372   IX2114.2
   000948         095300*                    ALTKEY1 RESPECTIVELY).  THE RECORD IN WHICH  IX2114.2
   000949         095400*                    THE ALTERNATE KEY VALUE WAS CHANGED TO       IX2114.2
   000950         095500*                    WWWWWWXXXX369ALTKEY1 (SEQUENTIAL RECORD 184  IX2114.2
   000951         095600*                    AFTER THE REORDING OCCURS I.E, AS A RESULT OFIX2114.2
   000952         095700*                    CHANGING THE ALTERNATE KEY VALUE IN          IX2114.2
   000953         095800*                    RWRT-TEST-GF-01) SHOULD BE MADE AVAILABLE.   IX2114.2
   000954         095900*                                                                 IX2114.2
   000955         096000     READ    IX-FD1  NEXT  AT END                                 IX2114.2 166
   000956      1  096100                     MOVE  "AT END ON READ"  TO COMPUTED-A        IX2114.2 459
   000957      1  096200                     MOVE   "SUCCESSFUL READ"  TO CORRECT-A       IX2114.2 473
   000958      1  096300                     GO TO   READ-FAIL-F1-04.                     IX2114.2 974
   000959         096400     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2114.2 170 406
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000960         096500     IF      EXCUT-COUNTER-06V00  EQUAL TO  1                     IX2114.2 225
   000961      1  096600             MOVE  182 TO RECKEY-NUM    ELSE                      IX2114.2 229
   000962      1  096700             ADD     001  TO RECKEY-NUM.                          IX2114.2 229
   000963         096800     IF      XRECORD-NUMBER (1)  NOT EQUAL TO RECKEY-NUM          IX2114.2 415 229
   000964      1  096900             MOVE    XRECORD-NUMBER (1)  TO COMPUTED-18V0         IX2114.2 415 466
   000965      1  097000             MOVE    RECKEY-NUM TO CORRECT-18V0                   IX2114.2 229 479
   000966      1  097100             GO TO   READ-FAIL-F1-04.                             IX2114.2 974
   000967         097200     IF      EXCUT-COUNTER-06V00  EQUAL TO  1                     IX2114.2 225
   000968      1  097300             MOVE  184  TO RECKEY-NUM.                            IX2114.2 229
   000969         097400     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2114.2 225
   000970         097500     IF      EXCUT-COUNTER-06V00  NOT LESS THAN 4                 IX2114.2 225
   000971      1  097600             PERFORM  PASS                                        IX2114.2 627
   000972      1  097700             GO TO READ-WRITE-F1-04.                              IX2114.2 977
   000973         097800     GO TO READ-TEST-F1-04.                                       IX2114.2 940
   000974         097900 READ-FAIL-F1-04.                                                 IX2114.2
   000975         098000     PERFORM  FAIL.                                               IX2114.2 628
   000976         098100     MOVE "IX-28, IX-32" TO RE-MARK.                              IX2114.2 453
   000977         098200 READ-WRITE-F1-04.                                                IX2114.2
   000978         098300     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   000979         098400     CLOSE   IX-FD1.                                              IX2114.2 166
   000980         098500                                                                  IX2114.2
   000981         098600                                                                  IX2114.2
   000982         098700 READ-INIT-F1-004.                                                IX2114.2
   000983         098800     OPEN    INPUT IX-FD1.                                        IX2114.2 166
   000984         098900     MOVE    "READ UPDATED ALTKEY"  TO FEATURE.                   IX2114.2 444
   000985         099000     MOVE    "READ-TEST-F1-004" TO PAR-NAME.                      IX2114.2 448
   000986         099100     MOVE    "SSSSSSSSSS360"  TO FD1-RECKEY-1-13.                 IX2114.2 202
   000987         099200     MOVE    "WWWWWWWWWW360ALTKEY1"  TO FD1-ALTKEY1-1-20.         IX2114.2 207
   000988         099300     MOVE    "FFFFFFFFFF040ALTKEY2"  TO FD1-ALTKEY2-1-20.         IX2114.2 215
   000989         099400     MOVE    WRK-FD1-RECKEY TO IX-REC-KEY-AREA.                   IX2114.2 201 174
   000990         099500     MOVE    WRK-FD1-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2114.2 206 182
   000991         099600     MOVE    WRK-FD1-ALTKEY2 TO IX-ALT-KEY2-AREA.                 IX2114.2 214 191
   000992         099700     MOVE    180  TO RECKEY-NUM.                                  IX2114.2 229
   000993         099800     START   IX-FD1                                               IX2114.2 166
   000994         099900                    KEY IS EQUAL TO IX-FD1-ALTKEY1                IX2114.2 183
   000995      1  100000       INVALID KEY   MOVE  "INVALID KEY ON START"  TO COMPUTED-A  IX2114.2 459
   000996      1  100100             GO TO READ-FAIL-004.                                 IX2114.2 1071
   000997         100200     MOVE    179  TO RECKEY-NUM.                                  IX2114.2 229
   000998         100300     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2114.2 IMP 225
   000999         100400     MOVE   4     TO REC-CT.                                      IX2114.2 495
   001000         100500 READ-TEST-F1.                                                    IX2114.2
   001001         100600     ADD 1 TO REC-CT.                                             IX2114.2 495
   001002         100700     MOVE "READ  UPDATED RECS  " TO FEATURE.                      IX2114.2 444
   001003         100800     MOVE "READ-TEST-F1-       " TO PAR-NAME.                     IX2114.2 448
   001004         100900*                                                                 IX2114.2
   001005         101000*READ-TEST-F1-04 - THIS TEST READS THAT SEGMENT OF THE FILE       IX2114.2
   001006         101100*                  UPDATED IN THE FIRST 4 TESTS AND CHECKS THE NEWIX2114.2
   001007         101200*                  SEQUENTIAL ORDER OF THE RECORDS. THE SEQUENTIALIX2114.2
   001008         101300*                  RETRIEVAL OF THE RECORDS FROM THE FILE IS      IX2114.2
   001009         101400*                  EXPECTED TO REFLECT THE UPDATED KEY SEQUENCE.  IX2114.2
   001010         101500*                                       THE START STATEMENT       IX2114.2
   001011         101600*                  EXTABLISHES ALTERNATE KEY1  AS THE KEY OF REF- IX2114.2
   001012         101700*                  ERENCE AND CURRENT RECORD POINTER TO POINT TO  IX2114.2
   001013         101800*                  RELATIVE  RECORD NUMBER 180 (ALTERNATE-KEY1    IX2114.2
   001014         101900*                  VALUE WWWWWWWWWW360ALTKEY1   BEFORE THE FILE   IX2114.2
   001015         102000*                  READING BEGINS.                                IX2114.2
   001016         102100*                                                                 IX2114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001017         102200     ADD     001  TO RECKEY-NUM.                                  IX2114.2 229
   001018         102300     READ    IX-FD1 NEXT  AT END                                  IX2114.2 166
   001019      1  102400             MOVE  "AT END ON READ"  TO COMPUTED-A                IX2114.2 459
   001020      1  102500             GO TO READ-FAIL-004.                                 IX2114.2 1071
   001021         102600     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2114.2 170 406
   001022         102700     IF      RECKEY-NUM EQUAL TO 182                              IX2114.2 229
   001023      1  102800             MOVE  "YES"  TO ADJUSTED-NUM                         IX2114.2 223
   001024      1  102900             ADD  001  TO RECKEY-NUM.                             IX2114.2 229
   001025         103000*                                                                 IX2114.2
   001026         103100*    THE ABOVE IF STATEMENT ADJUSTS THE RECKEY-NUM TO ACCOUNT     IX2114.2
   001027         103200*    FOR THE VOID LEFT IN THE NUMBERING SEQUENCE WHEN THE RECORD  IX2114.2
   001028         103300*    WAS REWRITTEN WITH A NEW ALTERNATE KEY.  THE RELATIVE        IX2114.2
   001029         103400*    RETREIVAL POSITION OF THE RECORD IN THE FILE SHOULD HAVE     IX2114.2
   001030         103500*    CHANGED FROM 182  TO 184.                                    IX2114.2
   001031         103600*                                                                 IX2114.2
   001032         103700     IF      RECKEY-NUM EQUAL TO 185                              IX2114.2 229
   001033         103800             AND  ADJUSTED-NUM EQUAL TO "YES"                     IX2114.2 223
   001034      1  103900             MOVE  "NO" TO ADJUSTED-NUM                           IX2114.2 223
   001035      1  104000             SUBTRACT  001  FROM RECKEY-NUM                       IX2114.2 229
   001036         104100*                                                                 IX2114.2
   001037         104200*     THE SUBTRACT STATEMENT IS TO READJUST RECKEY-NUM  FOR       IX2114.2
   001038         104300*    INSERTED     RECORD CAUSED BY UPDATE OF ALTERNATE KEY IN     IX2114.2
   001039         104400*    THE RECORD.  THE SEQUENTIAL RETRIEVAL POSITION OF UPDATED    IX2114.2
   001040         104500*    RECORD SHOULD BE POSITION NUMBER 184.                        IX2114.2
   001041         104600*                                                                 IX2114.2
   001042      1  104700             PERFORM  READ-TEST-004-1                             IX2114.2 1054
   001043      1  104800             ADD   001  TO EXCUT-COUNTER-06V00                    IX2114.2 225
   001044      1  104900             GO TO READ-TEST-F1.                                  IX2114.2 1000
   001045         105000     IF      XRECORD-NUMBER (1)  EQUAL TO RECKEY-NUM              IX2114.2 415 229
   001046      1  105100             PERFORM  READ-PASS-004                               IX2114.2 1068
   001047         105200             ELSE                                                 IX2114.2
   001048      1  105300             MOVE  XRECORD-NUMBER (1)  TO COMPUTED-18V0           IX2114.2 415 466
   001049      1  105400             PERFORM  READ-FAIL-004.                              IX2114.2 1071
   001050         105500     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2114.2 225
   001051         105600     IF      EXCUT-COUNTER-06V00  LESS THAN 11                    IX2114.2 225
   001052      1  105700             GO TO READ-TEST-F1.                                  IX2114.2 1000
   001053         105800     GO TO   READ-END-004.                                        IX2114.2 1076
   001054         105900 READ-TEST-004-1.                                                 IX2114.2
   001055         106000     IF      XRECORD-NUMBER (1)  EQUAL TO 182                     IX2114.2 415
   001056      1  106100             PERFORM  READ-PASS-004                               IX2114.2 1068
   001057         106200             ELSE                                                 IX2114.2
   001058      1  106300             MOVE  "WWWWWWXXXX369ALTKEY1"  TO CORRECT-A           IX2114.2 473
   001059      1  106400             MOVE  ALTERNATE-KEY1 (1) TO WRK-FD1-ALTKEY1          IX2114.2 438 206
   001060      1  106500             MOVE  FD1-ALTKEY1-1-20  TO COMPUTED-A                IX2114.2 207 459
   001061      1  106600             MOVE  SPACE TO P-OR-F                                IX2114.2 IMP 446
   001062      1  106700           MOVE   "ALTERNATE RECORD KEY1 VALUES; IX-33" TO RE-MARKIX2114.2 453
   001063      1  106800             PERFORM  PRINT-DETAIL                                IX2114.2 631
   001064      1  106900             MOVE   XRECORD-NUMBER (1)  TO COMPUTED-18V0          IX2114.2 415 466
   001065      1  107000             MOVE  182 TO CORRECT-18V0                            IX2114.2 479
   001066      1  107100             PERFORM FAIL                                         IX2114.2 628
   001067      1  107200             PERFORM  PRINT-DETAIL.                               IX2114.2 631
   001068         107300 READ-PASS-004.                                                   IX2114.2
   001069         107400     PERFORM PASS                                                 IX2114.2 627
   001070         107500     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   001071         107600 READ-FAIL-004.                                                   IX2114.2
   001072         107700     PERFORM FAIL.                                                IX2114.2 628
   001073         107800     MOVE    RECKEY-NUM TO CORRECT-18V0.                          IX2114.2 229 479
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001074         107900     MOVE    "RECORD NUMBER; IX-28, IX-33 "  TO RE-MARK.          IX2114.2 453
   001075         108000     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   001076         108100 READ-END-004.                                                    IX2114.2
   001077         108200     CLOSE   IX-FD1.                                              IX2114.2 166
   001078         108300                                                                  IX2114.2
   001079         108400     GO TO CCVS-EXIT.                                             IX2114.2 1118
   001080         108500                                                                  IX2114.2
   001081         108600                                                                  IX2114.2
   001082         108700 INX-INITIALIZE-RECORD.                                           IX2114.2
   001083         108800     MOVE    "GGGGGGGGGG200" TO  FD1-RECKEY-1-13.                 IX2114.2 202
   001084         108900     MOVE    ZERO  TO INIT-FLAG.                                  IX2114.2 IMP 388
   001085         109000     MOVE    9999  TO XRECORD-NUMBER (1).                         IX2114.2 415
   001086         109100     MOVE    SPACE TO IX-FD1R1-F-G-240.                           IX2114.2 IMP 170
   001087         109200     MOVE    WRK-FD1-RECKEY TO IX-REC-KEY-AREA.                   IX2114.2 201 174
   001088         109300     START   IX-FD1                                               IX2114.2 166
   001089         109400                     KEY IS EQUAL TO IX-FD1-KEY                   IX2114.2 175
   001090      1  109500          INVALID KEY MOVE   1  TO INIT-FLAG.                     IX2114.2 388
   001091         109600     READ    IX-FD1 NEXT INTO FILE-RECORD-INFO (1)                IX2114.2 166 406
   001092      1  109700                     AT END  MOVE  1 TO INIT-FLAG.                IX2114.2 388
   001093         109800     IF      XRECORD-NUMBER (1) NOT EQUAL TO 100                  IX2114.2 415
   001094      1  109900             MOVE 1 TO INIT-FLAG.                                 IX2114.2 388
   001095         110000 DISPLAY-RECORD-KEYS.                                             IX2114.2
   001096         110100     MOVE    XRECORD-KEY (1)  TO WRK-FD1-RECKEY.                  IX2114.2 436 201
   001097         110200     MOVE    FD1-RECKEY-1-13  TO COMPUTED-A.                      IX2114.2 202 459
   001098         110300     MOVE    RECKEY-VALUE (RECNO)  TO CORRECT-A.                  IX2114.2 385 222 473
   001099         110400     MOVE    SPACE TO P-OR-F.                                     IX2114.2 IMP 446
   001100         110500     MOVE    "RECORD KEY VALUES" TO RE-MARK.                      IX2114.2 453
   001101         110600     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   001102         110700 DISPLAY-ALTERNATE-KEY1.                                          IX2114.2
   001103         110800     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FD1-ALTKEY1.              IX2114.2 438 206
   001104         110900     MOVE    FD1-ALTKEY1-1-20  TO COMPUTED-A.                     IX2114.2 207 459
   001105         111000     MOVE    ALTKEY1-VALUE (RECNO)  TO CORRECT-A.                 IX2114.2 386 222 473
   001106         111100     MOVE    SPACE TO P-OR-F.                                     IX2114.2 IMP 446
   001107         111200     MOVE    "ALTERNATE RECORD KEY1 VALUES"  TO RE-MARK.          IX2114.2 453
   001108         111300     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   001109         111400 DISPLAY-ALTERNATE-KEY2.                                          IX2114.2
   001110         111500     MOVE    ALTERNATE-KEY2 (1) TO WRK-FD1-ALTKEY2.               IX2114.2 440 214
   001111         111600     MOVE    FD1-ALTKEY2-1-20  TO COMPUTED-A.                     IX2114.2 215 459
   001112         111700     MOVE    ALTKEY2-VALUE (RECNO)  TO CORRECT-A.                 IX2114.2 387 222 473
   001113         111800     MOVE    SPACE TO P-OR-F.                                     IX2114.2 IMP 446
   001114         111900     MOVE    "ALTERNATE RECORD KEY2 VALUES"  TO RE-MARK.          IX2114.2 453
   001115         112000     PERFORM PRINT-DETAIL.                                        IX2114.2 631
   001116         112100                                                                  IX2114.2
   001117         112200                                                                  IX2114.2
   001118         112300 CCVS-EXIT SECTION.                                               IX2114.2
   001119         112400 CCVS-999999.                                                     IX2114.2
   001120         112500     GO TO CLOSE-FILES.                                           IX2114.2 608
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    23
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      223   ADJUSTED-NUM . . . . . . . . .  M1023 1033 M1034
      438   ALTERNATE-KEY1 . . . . . . . .  M761 M773 M893 1059 1103
      440   ALTERNATE-KEY2 . . . . . . . .  M762 M774 1110
      230   ALTKEY1-NUM. . . . . . . . . .  M801 808 M816
      386   ALTKEY1-VALUE. . . . . . . . .  758 1105
      231   ALTKEY2-NUM
      387   ALTKEY2-VALUE. . . . . . . . .  759 1112
      504   ANSI-REFERENCE . . . . . . . .  710 717 726
      162   C-ABORT. . . . . . . . . . . .  M589 M612
      156   C-ALL. . . . . . . . . . . . .  M614
      152   C-DATE . . . . . . . . . . . .  M591
      158   C-DELETED. . . . . . . . . . .  M616
      157   C-FAIL . . . . . . . . . . . .  M615
      161   C-INDENT
      159   C-INSPECT. . . . . . . . . . .  M617
      154   C-NO-OF-TESTS. . . . . . . . .  M590
      160   C-NOTE
      155   C-OK . . . . . . . . . . . . .  M613
      153   C-TIME . . . . . . . . . . . .  M592
      483   CCVS-C-1 . . . . . . . . . . .  649 695
      488   CCVS-C-2 . . . . . . . . . . .  650 696
      538   CCVS-E-1 . . . . . . . . . . .  655
      543   CCVS-E-2 . . . . . . . . . . .  664 671 678 683
      546   CCVS-E-2-2 . . . . . . . . . .  M663
      551   CCVS-E-3 . . . . . . . . . . .  684
      560   CCVS-E-4 . . . . . . . . . . .  663
      561   CCVS-E-4-1 . . . . . . . . . .  M661
      563   CCVS-E-4-2 . . . . . . . . . .  M662
      505   CCVS-H-1 . . . . . . . . . . .  644 691
      510   CCVS-H-2A. . . . . . . . . . .  645 692
      519   CCVS-H-2B. . . . . . . . . . .  646 693
      531   CCVS-H-3 . . . . . . . . . . .  647 694
      581   CCVS-PGM-ID. . . . . . . . . .  587 597 597 610 739
      425   CHARS-OR-RECORDS . . . . . . .  M738
      465   CM-18V0
      459   COMPUTED-A . . . . . . . . . .  460 462 463 464 465 722 725 M858 M861 M896 M920 M956 M995 M1019 M1060 M1097 M1104
                                            M1111
      460   COMPUTED-N
      458   COMPUTED-X . . . . . . . . . .  M639 707
      462   COMPUTED-0V18
      464   COMPUTED-14V4
      466   COMPUTED-18V0. . . . . . . . .  M783 M822 M828 M928 M964 M1048 M1064
      463   COMPUTED-4V14
      482   COR-ANSI-REFERENCE . . . . . .  M717 M719
      473   CORRECT-A. . . . . . . . . . .  474 475 476 477 478 723 725 M869 M957 M1058 M1098 M1105 M1112
      474   CORRECT-N
      472   CORRECT-X. . . . . . . . . . .  M640 709
      475   CORRECT-0V18
      477   CORRECT-14V4
      479   CORRECT-18V0 . . . . . . . . .  M782 M823 M829 M931 M965 M1065 M1073
      476   CORRECT-4V14
      478   CR-18V0
      496   DELETE-COUNTER . . . . . . . .  616 M629 658 674 676
      451   DOTVALUE . . . . . . . . . . .  M634
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    24
0 Defined   Cross-reference of data names   References

0     502   DUMMY-HOLD . . . . . . . . . .  M688 698
      165   DUMMY-RECORD . . . . . . . . .  M644 M645 M646 M647 M649 M650 M651 M653 M655 M664 M671 M678 M683 M684 688 M689
                                            690 M691 M692 M693 M694 M695 M696 M697 M698 702 M703 M712 M727
      549   ENDER-DESC . . . . . . . . . .  M666 M677 M682
      497   ERROR-COUNTER. . . . . . . . .  615 M628 657 667 670
      501   ERROR-HOLD . . . . . . . . . .  614 M657 M658 M658 M659 662
      547   ERROR-TOTAL. . . . . . . . . .  M668 M670 M675 M676 M680 M681
      225   EXCUT-COUNTER-06V00. . . . . .  M766 M778 780 M799 812 M814 819 822 M938 960 967 M969 970 M998 M1043 M1050 1051
      208   FD1-ALTKEY1-1-10
      207   FD1-ALTKEY1-1-20 . . . . . . .  M758 M840 M892 M987 1060 1104
      209   FD1-ALTKEY1-1-5
      211   FD1-ALTKEY1-11-13. . . . . . .  M769 808
      212   FD1-ALTKEY1-14-20
      210   FD1-ALTKEY1-6-10
      216   FD1-ALTKEY2-1-10
      215   FD1-ALTKEY2-1-20 . . . . . . .  M759 M841 M988 1111
      217   FD1-ALTKEY2-1-5
      219   FD1-ALTKEY2-11-13. . . . . . .  M770
      220   FD1-ALTKEY2-14-20
      218   FD1-ALTKEY2-6-10
      203   FD1-RECKEY-1-10
      202   FD1-RECKEY-1-13. . . . . . . .  M757 M839 M986 M1083 1097
      204   FD1-RECKEY-11-13 . . . . . . .  M768 807 828
      224   FD1-STATUS . . . . . . . . . .  144
      444   FEATURE. . . . . . . . . . . .  M745 M798 M837 M874 M906 M936 M984 M1002
      406   FILE-RECORD-INFO . . . . . . .  M605 763 775 M863 894 M922 M959 M1021 M1091
      407   FILE-RECORD-INFO-P1-120
      434   FILE-RECORD-INFO-P121-240
      392   FILE-RECORD-INFO-SKELETON. . .  604
      391   FILE-RECORD-INFORMATION-REC
      390   FILESTATUS
      389   HOLD-FILESTATUS-RECORD
      575   HYPHEN-LINE. . . . . . . . . .  651 653 697
      541   ID-AGAIN . . . . . . . . . . .  M597
      574   INF-ANSI-REFERENCE . . . . . .  M710 M713 M726 M728
      569   INFO-TEXT. . . . . . . . . . .  M711
      388   INIT-FLAG. . . . . . . . . . .  M1084 M1090 M1092 M1094
      498   INSPECT-COUNTER. . . . . . . .  617 M626 657 679 681
      227   INVKEY-COUNTER . . . . . . . .  M748 M765 M777 780
      182   IX-ALT-KEY1-AREA . . . . . . .  806 M843 M990
      191   IX-ALT-KEY2-AREA . . . . . . .  M844 M991
      166   IX-FD1 . . . . . . . . . . . .  135 734 794 796 803 834 836 856 860 919 955 979 983 993 1018 1077 1088 1091
      183   IX-FD1-ALTKEY1 . . . . . . . .  142 857 994
      184   IX-FD1-ALTKEY1-1-10
      185   IX-FD1-ALTKEY1-1-5
      187   IX-FD1-ALTKEY1-11-13
      188   IX-FD1-ALTKEY1-14-20
      186   IX-FD1-ALTKEY1-6-10
      192   IX-FD1-ALTKEY2 . . . . . . . .  143
      193   IX-FD1-ALTKEY2-1-10
      194   IX-FD1-ALTKEY2-1-5
      196   IX-FD1-ALTKEY2-11-13
      197   IX-FD1-ALTKEY2-14-20
      195   IX-FD1-ALTKEY2-6-10
      175   IX-FD1-KEY . . . . . . . . . .  141 1089
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    25
0 Defined   Cross-reference of data names   References

0     176   IX-FD1-KEY-1-10
      177   IX-FD1-KEY-1-5
      179   IX-FD1-KEY-11-13
      178   IX-FD1-KEY-6-10
      171   IX-FD1-REC-120
      172   IX-FD1-REC-121-240
      170   IX-FD1R1-F-G-240 . . . . . . .  M763 764 M775 776 863 M894 895 922 959 1021 M1086
      174   IX-REC-KEY-AREA. . . . . . . .  805 M842 M989 M1087
      384   KEY-VALUES
      226   KEYSUB . . . . . . . . . . . .  M747 M756 757 758 759
      419   ODO-NUMBER . . . . . . . . . .  M890
      446   P-OR-F . . . . . . . . . . . .  M626 M627 M628 M629 636 M639 M1061 M1099 M1106 M1113
      448   PAR-NAME . . . . . . . . . . .  M641 M746 M797 M838 M875 M907 M937 M985 M1003
      450   PARDOT-X . . . . . . . . . . .  M633
      499   PASS-COUNTER . . . . . . . . .  613 M627 659 661
      163   PRINT-FILE . . . . . . . . . .  133 596 621
      164   PRINT-REC. . . . . . . . . . .  M635 M716 M718
      148   RAW-DATA . . . . . . . . . . .  128 586 588 595 609 611 620
      151   RAW-DATA-KEY . . . . . . . . .  132 M587 M610
      150   RAW-DATA-SATZ. . . . . . . . .  593 618
      453   RE-MARK. . . . . . . . . . . .  M630 M642 M788 M824 M831 M870 M902 M932 M976 M1062 M1074 M1100 M1107 M1114
      495   REC-CT . . . . . . . . . . . .  632 634 641 M999 M1001
      494   REC-SKL-SUB. . . . . . . . . .  M600 M603 605
      229   RECKEY-NUM . . . . . . . . . .  M800 807 M815 829 M939 M961 M962 963 965 M968 M992 M997 M1017 1022 M1024 1032
                                            M1035 1045 1073
      385   RECKEY-VALUE . . . . . . . . .  757 1098
      222   RECNO. . . . . . . . . . . . .  M926 1098 1105 1112
      503   RECORD-COUNT . . . . . . . . .  M686 687 M699
      232   RECORD-KEY-CONTENT . . . . . .  383
      383   RECORD-KEY-DATA
      429   RECORDS-IN-FILE. . . . . . . .  M744
      228   RECORDS-WRITTEN. . . . . . . .  M781 783 784
      413   REELUNIT-NUMBER
      454   TEST-COMPUTED. . . . . . . . .  716
      469   TEST-CORRECT . . . . . . . . .  718
      522   TEST-ID. . . . . . . . . . . .  M597
      442   TEST-RESULTS . . . . . . . . .  M598 635
      500   TOTAL-ERROR
      417   UPDATE-NUMBER. . . . . . . . .  M891
      206   WRK-FD1-ALTKEY1. . . . . . . .  761 773 M806 843 893 990 M1059 M1103
      214   WRK-FD1-ALTKEY2. . . . . . . .  762 774 844 991 M1110
      201   WRK-FD1-RECKEY . . . . . . . .  760 772 M805 842 989 1087 M1096
      427   XBLOCK-SIZE. . . . . . . . . .  M741
      409   XFILE-NAME . . . . . . . . . .  M735
      431   XFILE-ORGANIZATION . . . . . .  M742
      433   XLABEL-TYPE. . . . . . . . . .  M743
      421   XPROGRAM-NAME. . . . . . . . .  M739
      436   XRECORD-KEY. . . . . . . . . .  M760 M772 1096
      423   XRECORD-LENGTH . . . . . . . .  M740
      411   XRECORD-NAME . . . . . . . . .  M736
      415   XRECORD-NUMBER . . . . . . . .  M737 M755 M771 864 923 928 963 964 1045 1048 1055 1064 M1085 1093
      571   XXCOMPUTED . . . . . . . . . .  M725
      573   XXCORRECT. . . . . . . . . . .  M725
      566   XXINFO . . . . . . . . . . . .  712 727
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    26
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

      721   BAIL-OUT . . . . . . . . . . .  P638
      729   BAIL-OUT-EX. . . . . . . . . .  E638 G723
      724   BAIL-OUT-WRITE . . . . . . . .  G722
      704   BLANK-LINE-PRINT
     1118   CCVS-EXIT. . . . . . . . . . .  G1079
      606   CCVS-INIT-EXIT
      602   CCVS-INIT-FILE . . . . . . . .  P601
     1119   CCVS-999999
      584   CCVS1
      730   CCVS1-EXIT . . . . . . . . . .  G607
      608   CLOSE-FILES. . . . . . . . . .  G1120
      648   COLUMN-NAMES-ROUTINE . . . . .  E599
      629   DE-LETE. . . . . . . . . . . .  P791
     1102   DISPLAY-ALTERNATE-KEY1 . . . .  P927
     1109   DISPLAY-ALTERNATE-KEY2
     1095   DISPLAY-RECORD-KEYS
      594   END-E-1. . . . . . . . . . . .  G588 G593
      619   END-E-2. . . . . . . . . . . .  G611 G618
      652   END-ROUTINE. . . . . . . . . .  P621
      656   END-ROUTINE-1
      665   END-ROUTINE-12
      673   END-ROUTINE-13 . . . . . . . .  E621
      654   END-RTN-EXIT
      628   FAIL . . . . . . . . . . . . .  P787 P821 P827 P868 P901 P930 P975 P1066 P1072
      706   FAIL-ROUTINE . . . . . . . . .  P637
      720   FAIL-ROUTINE-EX. . . . . . . .  E637 G714
      715   FAIL-ROUTINE-WRITE . . . . . .  G708 G709
      643   HEAD-ROUTINE . . . . . . . . .  P599
      626   INSPT
     1082   INX-INITIALIZE-RECORD
      585   OPEN-FILES
      627   PASS . . . . . . . . . . . . .  P785 P820 P865 P898 P924 P971 P1069
      631   PRINT-DETAIL . . . . . . . . .  P793 P833 P872 P904 P934 P978 P1063 P1067 P1070 P1075 P1101 P1108 P1115
     1076   READ-END-004 . . . . . . . . .  G1053
      832   READ-EXIT-F1-01. . . . . . . .  G825
      826   READ-FAIL-F1-01. . . . . . . .  P811
      867   READ-FAIL-F1-02. . . . . . . .  G859 G862
      929   READ-FAIL-F1-03. . . . . . . .  G921
      974   READ-FAIL-F1-04. . . . . . . .  G958 G966
     1071   READ-FAIL-004. . . . . . . . .  G996 G1020 P1049
      982   READ-INIT-F1-004
      795   READ-INIT-F1-01
      835   READ-INIT-F1-02
      905   READ-INIT-F1-03
      935   READ-INIT-F1-04
     1068   READ-PASS-004. . . . . . . . .  P1046 P1056
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    27
0 Defined   Cross-reference of procedures   References

0    1000   READ-TEST-F1 . . . . . . . . .  G1044 G1052
      818   READ-TEST-F1-01. . . . . . . .  G804 G813
      802   READ-TEST-F1-01-1. . . . . . .  G817
      845   READ-TEST-F1-02
      908   READ-TEST-F1-03
      940   READ-TEST-F1-04. . . . . . . .  G973
     1054   READ-TEST-004-1. . . . . . . .  P1042
      871   READ-WRITE-F1-02 . . . . . . .  G866
      933   READ-WRITE-F1-03 . . . . . . .  G925
      977   READ-WRITE-F1-04 . . . . . . .  G972
      900   RWRT-FAIL-GF-01. . . . . . . .  G897
      873   RWRT-TEST-GF-01
      903   RWRT-WRITE-GF-01 . . . . . . .  G899
      732   SECT-0001-IX211A
      624   TERMINATE-CALL
      622   TERMINATE-CCVS
      790   WRITE-DELETE-GF-01
      749   WRITE-INIT-GF-01-01
      733   WRITE-INT-GF-01
      685   WRITE-LINE . . . . . . . . . .  P635 P636 P644 P645 P646 P647 P649 P650 P651 P653 P655 P664 P672 P678 P683 P684
                                            P712 P716 P718 P727
      779   WRITE-TEST-GF-01 . . . . . . .  G753
      792   WRITE-TEST-GF-01-END . . . . .  G789
      754   WRITE-TEST-GF-01-1 . . . . . .  P750 P752
      767   WRITE-TEST-GF-01-2 . . . . . .  P751
      701   WRT-LN . . . . . . . . . . . .  P691 P692 P693 P694 P695 P696 P697 P700 P705
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    28
0 Defined   Cross-reference of programs     References

        3   IX211A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX211A    Date 06/04/2022  Time 12:00:37   Page    29
0LineID  Message code  Message text

    138  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

    163  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    166  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           3
-* Statistics for COBOL program IX211A:
 *    Source records = 1120
 *    Data Division statements = 157
 *    Procedure Division statements = 419
 *    Generated COBOL statements = 0
 *    Program complexity factor = 427
0End of compilation 1,  program IX211A,  highest severity 0.
0Return code 0
