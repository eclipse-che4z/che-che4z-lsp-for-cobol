1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:10   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:10   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX2154.2
   000002         000200 PROGRAM-ID.                                                      IX2154.2
   000003         000300     IX215A.                                                      IX2154.2
   000004         000500*                                                              *  IX2154.2
   000005         000600*    VALIDATION FOR:-                                          *  IX2154.2
   000006         000700*                                                              *  IX2154.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2154.2
   000008         000900*                                                              *  IX2154.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2154.2
   000010         001100*                                                              *  IX2154.2
   000011         001300*    THE PURPOSE OF THIS PROGRAM IS TO TEST THE ABILITY TO        IX2154.2
   000012         001400*    DESCRIBE THE PRIME RECORD KEY AND THE ALTERNATE RECORD KEYS  IX2154.2
   000013         001500*    IN A REDEFINES CLAUSES AND TO TEST THE USE OF QUALIFICATION  IX2154.2
   000014         001600*    OF THE RECORD KEYS.  THE PROGRAM IS BROKEN INTO THREE SEC-   IX2154.2
   000015         001700*    TIONS.  THE FIRST SECTION TESTS THE ABILITY TO USE A         IX2154.2
   000016         001800*    REDEFINED DATA ITEM OR A DATA ITEM SUBORDINATE TO IT CON-    IX2154.2
   000017         001900*    TAINING THE LEFTMOST CHARACTER POSTIONS OF THE REDEFINED DATAIX2154.2
   000018         002000*    ITEM IN THE KEY PHRASE OF THE START STATEMENT.  THE SECOND   IX2154.2
   000019         002100*    SECTION TESTS THE ABILITY TO USE A RECORD KEY WHICH IS NESTEDIX2154.2
   000020         002200*    IN REDEFINES OR A DATA ITEM SUBORDINATE TO IT THAT CONTAINS  IX2154.2
   000021         002300*    THE LEFTMOST CHARACTER POSITIONS OF A REDEFINED DATA ITEM    IX2154.2
   000022         002400*    WHICH IS NESTED IN REDEFINES IN THE KEY PHRASE OF THE START  IX2154.2
   000023         002500*    STATEMENT.  THE THIRD SECTION TESTS THE USE OF QUALIFICATION IX2154.2
   000024         002600*    OF THE RECORD KEYS.  DIFFERENT KEY VALUES ARE USED FOR       IX2154.2
   000025         002700*    TESTING.  IF A KEY VALUE IS PROVIDED WHICH MATCHES A RECORD  IX2154.2
   000026         002800*    IN THE FILE THE EXECUTION OF A START STATEMENT FOLLOWED BY A IX2154.2
   000027         002900*    READ NEXT STATEMENT IS EXPECTED TO MADE AVAILABLE THE RECORD.IX2154.2
   000028         003000*    IF A KEY VALUE IS PROVIDED WHICH DOES NOT MATCH ANY RECORD INIX2154.2
   000029         003100*    THE FILE THEN THE INVALID KEY PATH IS EXPECTED TO BE TAKEN.  IX2154.2
   000030         003200*                                                                 IX2154.2
   000031         003300*       REFERENCE    AMERICAN NATIONAL STANDARD                   IX2154.2
   000032         003400*                    PROGRAMMING LANGUAGE COBOL, X3.23-1985.      IX2154.2
   000033         003500*                    SECTION IX, INDEX I-O, THE START             IX2154.2
   000034         003600*                    STATEMENT.  PARAGRAPHS 4.7.3 (2), (3), (4);  IX2154.2
   000035         003700*                                           4.7.4 (1), (4), (5),  IX2154.2
   000036         003800*                                           (10)   AND            IX2154.2
   000037         003900*                    THE REDEFINES CLAUSE PAGE VI-39 5.10.4 (1),  IX2154.2
   000038         004000*                                                          (2).   IX2154.2
   000039         004100*                                                                 IX2154.2
   000040         004200*    BEFORE EACH TEST THE RECORD KEY IS LOAD WITH A KEY VALUE     IX2154.2
   000041         004300*    WHICH MAY OR MAY NOT BE A VALID KEY FOR THE FILE.  ALSO      IX2154.2
   000042         004400*    BEFORE EACH STEP IN A TEST AN INITIALIZATION PROCEDURE MAY ORIX2154.2
   000043         004500*    MAY NOT BE PERFORMED WHICH MAKES AVAILABLE RECORD NUMBER 200.IX2154.2
   000044         004600*    IF DURING THIS PROCEDURE AN INVALID KEY OCCURS THE TEST IS   IX2154.2
   000045         004700*    DELETED.                                                     IX2154.2
   000046         004800*                                                                 IX2154.2
   000047         004900*    BEFORE EACH SECTION A INDEXED FILE IS CREATED CONTAINING TWO IX2154.2
   000048         005000*    ALTERNATE KEY AND THE ONE REQUIRED RECORD KEY FOR THE FILE.  IX2154.2
   000049         005100*    IMMEDIATELY FOLLOWING FILE CREATION THE FILE IS READ AND THE IX2154.2
   000050         005200*    RECORDS OF THE FILE VERIFIED FOR ACCURACY.  NEXT THE TESTS   IX2154.2
   000051         005300*    ARE EXECUTED USING THE READ, DELETE, REWRITE, and START      IX2154.2
   000052         005400*    STATEMENTS.                                                  IX2154.2
   000053         005500*                                                                 IX2154.2
   000054         005600*    THE RECORDS IN THE FILE ARE CREATED IN SEQUENTIAL ORDER BY   IX2154.2
   000055         005700*    RECORD KEY VALUE.  FOLLOWING IS A SAMPLE OF THE DATA CONTENTSIX2154.2
   000056         005800*    FOR THE RECORD KEY AND TWO ALTERNATE RECORD KEYS IN THE FILE.IX2154.2
   000057         005900*                                                                 IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000*  REC-NO RECORD-KEY     ALTERNATE-KEY-1      ALTERNATE-KEY-2     IX2154.2
   000059         006100*  ------ ----------     ---------------      ---------------     IX2154.2
   000060         006200*  001   BBBBBBBBBC002  EEEEEEEEEF002ALTKEY1  WWWWWWWWWV398ALTKEY2IX2154.2
   000061         006300*  002   BBBBBBBBCC004  EEEEEEEEFF004ALTKEY1  WWWWWWWWVV396ALTKEY2IX2154.2
   000062         006400*  003   BBBBBBBCCC006  EEEEEEEFFF006ALTKEY1  WWWWWWWVVV394ALTKEY2IX2154.2
   000063         006500*   .          .                  .                     .         IX2154.2
   000064         006600*   .          .                  .                     .         IX2154.2
   000065         006700*   .          .                  .                     .         IX2154.2
   000066         006800*  010   CCCCCCCCCC020  FFFFFFFFFF020ALTKEY1  VVVVVVVVVV380ALTKEY2IX2154.2
   000067         006900*  011   CCCCCCCCCD022  FFFFFFFFFG022ALTKEY1  VVVVVVVVVV380ALTKEY2IX2154.2
   000068         007000*  012   CCCCCCCCDD024  FFFFFFFFGG024ALTKEY1  VVVVVVVVUU376ALTKEY2IX2154.2
   000069         007100*   .          .                  .                     .         IX2154.2
   000070         007200*   .          .                  .                     .         IX2154.2
   000071         007300*   .          .                  .                     .         IX2154.2
   000072         007400*  200   UUUUUUUUUU400  YYYYYYYYYY400ALTKEY1   DDDDDDDDDD000ALTKEYIX2154.2
   000073         007500*                                                                 IX2154.2
   000074         007600*   NOTE 1 - ALTERNATE-KEY-2 CONTAINS DUPLICATE KEYS EVERY 10TH   IX2154.2
   000075         007700*            AND 11TH RECORDS.                                    IX2154.2
   000076         007800*                                                                 IX2154.2
   000077         007900*   NOTE 2 - THE FIRST 50 RECORDS AND LAST 25 RECORDS OF THE FILE IX2154.2
   000078         008000*            FOLLOW THE ABOVE SEQUENTIAL KEY PATTERN.  FOR THE    IX2154.2
   000079         008100*            MIDDEL 125 RECORDS ONLY THE NUMBER PART OF THE KEYS  IX2154.2
   000080         008200*            ARE VARIED AND VARIED IN THE SEQUENCE SHOWN ABOVE.   IX2154.2
   000081         008300*            THAT IS, RECORD KEY AND ALTERNATE-KEY-1 ARE          IX2154.2
   000082         008400*            INCREMENTED BY 2 ANDT THE ALTERNATE KEY-2 IS         IX2154.2
   000083         008500*            DECREMENTED BY 2 EACH TIME A RECORD IS WRITTEN TO THEIX2154.2
   000084         008600*            FILE.  THE FILE IS DESIGNED TO BE LARGE ENOUGH SO    IX2154.2
   000085         008700*            THAT AN I-O OPERATION IS REQUIRED FOR EACH RECORD    IX2154.2
   000086         008800*            ACCESSED FROM THE FILE.                              IX2154.2
   000087         008900*                                                                 IX2154.2
   000088         009000*   X-CARD'S WHICH MUST BE REPLACED WITH IMPLEMENTOR-NAMES' IN    IX2154.2
   000089         009100*   THIS PROGRAM ARE:                                             IX2154.2
   000090         009200*                                                                 IX2154.2
   000091         009300*            X-24      IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR   IX2154.2
   000092         009400*                        INDEXED FILE-1.                          IX2154.2
   000093         009500*            X-25      IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR   IX2154.2
   000094         009600*                        INDEXED FILE-2.                          IX2154.2
   000095         009700*            X-26      IMPLEMENTOR-NAME IN ASSIGN TO CLAUSE FOR   IX2154.2
   000096         009800*                        INDEXED FILE-3.                          IX2154.2
   000097         009900*            X-44      SYSTEM-NAME IN ASSIGN TO CLAUSE FOR INDEXEDIX2154.2
   000098         010000*                        FILE-1 IF NEEDED.                        IX2154.2
   000099         010100*            X-45      SYSTEM-NAME IN ASSIGN TO CLAUSE FOR INDEXEDIX2154.2
   000100         010200*                        FILE-2 IF NEEDED.                        IX2154.2
   000101         010300*            X-46      SYSTEM-NAME IN ASSIGN TO CLAUSE FOR INDEXEDIX2154.2
   000102         010400*                        FILE-3 IF NEEDED.                        IX2154.2
   000103         010500*            X-55      SYSTEM PRINTER.                            IX2154.2
   000104         010600*            X-62   FOR RAW-DATA                                  IX2154.2
   000105         010700*            X-82      SOURCE-COMPUTER.                           IX2154.2
   000106         010800*            X-83      OBJECT-COMPUTER.                           IX2154.2
   000107         010900*                                                                 IX2154.2
   000108         011100*                                                                 IX2154.2
   000109         011200 ENVIRONMENT DIVISION.                                            IX2154.2
   000110         011300 CONFIGURATION SECTION.                                           IX2154.2
   000111         011400 SOURCE-COMPUTER.                                                 IX2154.2
   000112         011500     XXXXX082.                                                    IX2154.2
   000113         011600 OBJECT-COMPUTER.                                                 IX2154.2
   000114         011700     XXXXX083                                                     IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011800          PROGRAM COLLATING SEQUENCE IS FOR-INX-START-TEST.       IX2154.2 118
   000116         011900 SPECIAL-NAMES.                                                   IX2154.2
   000117         012000     ALPHABET                                                     IX2154.2
   000118         012100     FOR-INX-START-TEST IS "WVUTSRJIHGFEDCB".                     IX2154.2
   000119         012200 INPUT-OUTPUT SECTION.                                            IX2154.2
   000120         012300 FILE-CONTROL.                                                    IX2154.2
   000121         012400     SELECT RAW-DATA   ASSIGN TO                                  IX2154.2 163
   000122         012500     XXXXX062                                                     IX2154.2
   000123         012600            ORGANIZATION IS INDEXED                               IX2154.2
   000124         012700            ACCESS MODE IS RANDOM                                 IX2154.2
   000125         012800            RECORD KEY IS RAW-DATA-KEY.                           IX2154.2 166
   000126         012900     SELECT PRINT-FILE ASSIGN TO                                  IX2154.2 178
   000127         013000     XXXXX055.                                                    IX2154.2
   000128         013100     SELECT  IX-FD1                                               IX2154.2 181
   000129         013200     ASSIGN TO                                                    IX2154.2
   000130         013300     XXXXX024                                                     IX2154.2
   000131         013400     XXXXX044                                                     IX2154.2

 ==000131==> IGYDS1298-I Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX044" was treated as comments.

   000132         013500        ACCESS MODE IS DYNAMIC                                    IX2154.2
   000133         013600        RECORD KEY IS IX-FD1-KEY                                  IX2154.2 190
   000134         013700        ALTERNATE RECORD KEY IS IX-FD1-ALTKEY1                    IX2154.2 204
   000135         013800        ALTERNATE RECORD KEY IS IX-FD1-ALTKEY2 WITH DUPLICATES    IX2154.2 220
   000136         013900        ORGANIZATION IS INDEXED.                                  IX2154.2
   000137         014000     SELECT  IX-FD2                                               IX2154.2 234
   000138         014100     ASSIGN TO                                                    IX2154.2
   000139         014200     XXXXX025                                                     IX2154.2
   000140         014300     XXXXX045                                                     IX2154.2

 ==000140==> IGYDS1298-I Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX045" was treated as comments.

   000141         014400        ACCESS MODE IS DYNAMIC                                    IX2154.2
   000142         014500        ORGANIZATION IS INDEXED                                   IX2154.2
   000143         014600        RECORD KEY IS IX-FD2-KEY                                  IX2154.2 249
   000144         014700        ALTERNATE RECORD KEY IS IX-FD2-ALTKEY1                    IX2154.2 265
   000145         014800        ALTERNATE RECORD KEY IS IX-FD2-ALTKEY2 WITH DUPLICATES    IX2154.2 275
   000146         014900                .                                                 IX2154.2
   000147         015000     SELECT  IX-FD3                                               IX2154.2 289
   000148         015100     ASSIGN TO                                                    IX2154.2
   000149         015200     XXXXX026                                                     IX2154.2
   000150         015300     XXXXX046                                                     IX2154.2

 ==000150==> IGYDS1298-I Assignment-name "XXXXX046" was specified in the "ASSIGN" clause, but was
                         not the first assignment-name.  "XXXXX046" was treated as comments.

   000151         015400        ACCESS MODE IS DYNAMIC                                    IX2154.2
   000152         015500        ORGANIZATION IS INDEXED                                   IX2154.2
   000153         015600        RECORD KEY IS IX-FD3-KEY IN IX-FD3-RECKEY-AREA            IX2154.2 300 299
   000154         015700        ALTERNATE RECORD KEY IS IX-FD3-KEY OF                     IX2154.2 303
   000155         015800         IX-FD3-ALTKEY1-AREA                                      IX2154.2 302
   000156         015900        ALTERNATE RECORD KEY IS IX-FD3-KEY                        IX2154.2 306
   000157         016000         IN IX-FD3-ALTKEY2-AREA                                   IX2154.2 305
   000158         016100        WITH DUPLICATES                                           IX2154.2
   000159         016200              .                                                   IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000160         016300 DATA DIVISION.                                                   IX2154.2
   000161         016400 FILE SECTION.                                                    IX2154.2
   000162         016500                                                                  IX2154.2
   000163         016600 FD  RAW-DATA.                                                    IX2154.2
   000164         016700                                                                  IX2154.2
   000165         016800 01  RAW-DATA-SATZ.                                               IX2154.2
   000166         016900     05  RAW-DATA-KEY        PIC X(6).                            IX2154.2
   000167         017000     05  C-DATE              PIC 9(6).                            IX2154.2
   000168         017100     05  C-TIME              PIC 9(8).                            IX2154.2
   000169         017200     05  C-NO-OF-TESTS       PIC 99.                              IX2154.2
   000170         017300     05  C-OK                PIC 999.                             IX2154.2
   000171         017400     05  C-ALL               PIC 999.                             IX2154.2
   000172         017500     05  C-FAIL              PIC 999.                             IX2154.2
   000173         017600     05  C-DELETED           PIC 999.                             IX2154.2
   000174         017700     05  C-INSPECT           PIC 999.                             IX2154.2
   000175         017800     05  C-NOTE              PIC X(13).                           IX2154.2
   000176         017900     05  C-INDENT            PIC X.                               IX2154.2
   000177         018000     05  C-ABORT             PIC X(8).                            IX2154.2
   000178         018100 FD  PRINT-FILE.                                                  IX2154.2

 ==000178==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000179         018200 01  PRINT-REC PICTURE X(120).                                    IX2154.2
   000180         018300 01  DUMMY-RECORD PICTURE X(120).                                 IX2154.2
   000181         018400 FD  IX-FD1                                                       IX2154.2

 ==000181==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

   000182         018500     LABEL RECORDS ARE STANDARD                                   IX2154.2
   000183         018600     DATA RECORD IS IX-FD1R1-F-G-240                              IX2154.2 *
   000184         018700     RECORD CONTAINS 240 CHARACTERS.                              IX2154.2
   000185         018800 01  IX-FD1R1-F-G-240.                                            IX2154.2
   000186         018900     05 IX-FD1-REC-120           PICTURE X(120).                  IX2154.2
   000187         019000     05 IX-FD1-REC-121-240.                                       IX2154.2
   000188         019100        10 FILLER                PICTURE X(8).                    IX2154.2
   000189         019200        10 IX-REC-KEY-AREA.                                       IX2154.2
   000190         019300           15 IX-FD1-KEY.                                         IX2154.2
   000191         019400              20 IX-FD1-KEY-1-10.                                 IX2154.2
   000192         019500                 25 IX-FD1-KEY-1-5      PICTURE X(5).             IX2154.2
   000193         019600                 25 IX-FD1-KEY-6-10     PICTURE X(5).             IX2154.2
   000194         019700               20 IX-FD1-KEY-11-13      PICTURE X(3).             IX2154.2
   000195         019800           15 IX-REDF-RECKEY REDEFINES IX-FD1-KEY.                IX2154.2 190
   000196         019900              20 R-RECKEY-1-7    PICTURE X(7).                    IX2154.2
   000197         020000              20 R-REDF-RECKEY-1-7 REDEFINES R-RECKEY-1-7.        IX2154.2 196
   000198         020100                 25 R-RECKEY-1-5        PICTURE X(5).             IX2154.2
   000199         020200                 25 R-RECKEY-6-7        PICTURE XX.               IX2154.2
   000200         020300              20 R-RECKEY-8-13   PICTURE X(6).                    IX2154.2
   000201         020400           15 FILLER             PICTURE X(16).                   IX2154.2
   000202         020500        10 FILLER                PICTURE X(9).                    IX2154.2
   000203         020600        10 IX-ALT-KEY1-AREA.                                      IX2154.2
   000204         020700           15 IX-FD1-ALTKEY1.                                     IX2154.2
   000205         020800              20 IX-FDW-ALTKEY1-1-10.                             IX2154.2
   000206         020900                 25 IX-FDW-ALTKEY1-1-5  PICTURE X(5).             IX2154.2
   000207         021000                 25 IX-FDW-ALTKEY1-6-10 PICTURE X(5).             IX2154.2
   000208         021100              20 IX-FDW-ALTKEY1-11-13   PICTURE X(3).             IX2154.2
   000209         021200              20 IX-FDW-ALTKEY1-14-20   PICTURE X(7).             IX2154.2
   000210         021300           15 IX-REDF-ALTKEY1 REDEFINES IX-FD1-ALTKEY1.           IX2154.2 204
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000211         021400              20 R-ALTKEY1-1-6   PICTURE X(6).                    IX2154.2
   000212         021500              20 R-REDF-ALTKEY1-1-6 REDEFINES R-ALTKEY1-1-6.      IX2154.2 211
   000213         021600                 25 R-ALTKEY1-1-4       PICTURE X(4).             IX2154.2
   000214         021700                 25 R-ALTKEY1-5-6       PICTURE XX.               IX2154.2
   000215         021800              20 R-ALTKEY1-7-10  PICTURE X(4).                    IX2154.2
   000216         021900              20 R-ALTKEY1-11-20 PICTURE X(10).                   IX2154.2
   000217         022000           15 FILLER             PICTURE X(9).                    IX2154.2
   000218         022100        10 FILLER                PICTURE X(9).                    IX2154.2
   000219         022200        10 IX-ALT-KEY2-AREA.                                      IX2154.2
   000220         022300           15 IX-FD1-ALTKEY2.                                     IX2154.2
   000221         022400              20 IX-FDW-ALTKEY2-1-10.                             IX2154.2
   000222         022500                 25 IX-FDW-ALTKEY2-1-5  PICTURE X(5).             IX2154.2
   000223         022600                 25 IX-FDW-ALTKEY2-6-10 PICTURE X(5).             IX2154.2
   000224         022700              20 IX-FDW-ALTKEY2-11-13   PICTURE X(3).             IX2154.2
   000225         022800              20 IX-FDW-ALTKEY2-14-20   PICTURE X(7).             IX2154.2
   000226         022900           15 IX-REDF-ALTKEY2 REDEFINES IX-FD1-ALTKEY2.           IX2154.2 220
   000227         023000              20 R-ALTKEY2-1-3          PICTURE XXX.              IX2154.2
   000228         023100              20 R-REDF-ALTKEY2-1-3 REDEFINES R-ALTKEY2-1-3.      IX2154.2 227
   000229         023200                 25 R-ALTKEY2-1-2       PICTURE XX.               IX2154.2
   000230         023300                 25 R-ALTKEY2-3-3       PICTURE X.                IX2154.2
   000231         023400              20 R-ALTKEY2-4-20         PICTURE X(17).            IX2154.2
   000232         023500           15 FILLER             PICTURE X(9).                    IX2154.2
   000233         023600        10 FILLER                PICTURE X(7).                    IX2154.2
   000234         023700 FD  IX-FD2                                                       IX2154.2

 ==000234==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000234==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000235         023800     LABEL RECORDS ARE STANDARD                                   IX2154.2
   000236         023900     DATA RECORD IS IX-FD2R1-F-G-241                              IX2154.2 *
   000237         024000     BLOCK CONTAINS 4 RECORDS                                     IX2154.2
   000238         024100     RECORD CONTAINS 241 CHARACTERS.                              IX2154.2
   000239         024200 01  IX-FD2R1-F-G-241.                                            IX2154.2
   000240         024300   03 IX-FD2-REC-241.                                             IX2154.2
   000241         024400     05 IX-FD2-REC-120           PICTURE X(120).                  IX2154.2
   000242         024500     05 IX-FD2-REC-121-241.                                       IX2154.2
   000243         024600        10 IX-FD2-RECKEY-AREA    PICTURE X(37).                   IX2154.2
   000244         024700        10 IX-FD2-RECKEY-AREA2 REDEFINES IX-FD2-RECKEY-AREA.      IX2154.2 243
   000245         024800           15 IX-FD2-RECKEY-AREA2-1  PICTURE X(23).               IX2154.2
   000246         024900           15 IX-FD2-RECKEY-AREA2-2  PICTURE X(14).               IX2154.2
   000247         025000        10 IX-FD2-RECKEY-AREA3 REDEFINES IX-FD2-RECKEY-AREA.      IX2154.2 243
   000248         025100           15 FILLER             PICTURE X(8).                    IX2154.2
   000249         025200           15 IX-FD2-KEY         PICTURE X(13).                   IX2154.2
   000250         025300           15 FILLER             PICTURE X(16).                   IX2154.2
   000251         025400        10 IX-FD2-RECKEY-AREA4 REDEFINES IX-FD2-RECKEY-AREA.      IX2154.2 243
   000252         025500           15 FILLER             PICTURE X(8).                    IX2154.2
   000253         025600           15 IX-FD2-RECKEY-REDF PICTURE X(13).                   IX2154.2
   000254         025700           15 IX-FD2-RECKEY-REDF2 REDEFINES IX-FD2-RECKEY-REDF.   IX2154.2 253
   000255         025800              20 IX-FD2-RECKEY-1-6  PICTURE X(6).                 IX2154.2
   000256         025900              20 IX-FD2-RECKEY-7-13  PICTURE X(7).                IX2154.2
   000257         026000           15 FILLER             PICTURE X(16).                   IX2154.2
   000258         026100        10 FILLER                PICTURE X(9).                    IX2154.2
   000259         026200        10 IX-FD2-ALTKEY1-AREA   PICTURE X(29).                   IX2154.2
   000260         026300        10 IX-FD2-ALTKEY1-AREA2 REDEFINES IX-FD2-ALTKEY1-AREA.    IX2154.2 259
   000261         026400           15 IX-FD2-ALTKEY1-1-6  PICTURE X(6).                   IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000262         026500           15 IX-FD2-ALTKEY1-7-20  PICTURE X(14).                 IX2154.2
   000263         026600           15 FILLER             PICTURE X(9).                    IX2154.2
   000264         026700        10 IX-FD2-ALTKEY1-AREA3 REDEFINES IX-FD2-ALTKEY1-AREA.    IX2154.2 259
   000265         026800           15 IX-FD2-ALTKEY1.                                     IX2154.2
   000266         026900              20 IX-FD2-ALTKEY1-10  PICTURE X(10).                IX2154.2
   000267         027000              20 IX-FD2-ALTKEY1-11-20  PICTURE X(10).             IX2154.2
   000268         027100           15 IX-FD2-REDF-ALTKEY1 REDEFINES IX-FD2-ALTKEY1.       IX2154.2 265
   000269         027200              20 IX-FD2-ALTKEY1-1-5   PICTURE X(5).               IX2154.2
   000270         027300              20 IX-FD2-ALTKEY1-6-20  PICTURE X(15).              IX2154.2
   000271         027400           15 FILLER             PICTURE X(9).                    IX2154.2
   000272         027500        10 FILLER                PICTURE X(9).                    IX2154.2
   000273         027600        10 IX-FD2-ALTKEY2-AREA   PICTURE X(29).                   IX2154.2
   000274         027700        10 IX-FD2-ALTKEY2-AREA2 REDEFINES IX-FD2-ALTKEY2-AREA.    IX2154.2 273
   000275         027800           15 IX-FD2-ALTKEY2     PICTURE X(20).                   IX2154.2
   000276         027900           15 FILLER             PICTURE X(9).                    IX2154.2
   000277         028000        10 IX-FD2-ALTKEY2-AREA3 REDEFINES IX-FD2-ALTKEY2-AREA.    IX2154.2 273
   000278         028100           15 IX-FD2-ALTKEY2-1-6  PICTURE X(6).                   IX2154.2
   000279         028200           15 IX-FD2-REDF-ALTKEY2-1-6                             IX2154.2
   000280         028300              REDEFINES IX-FD2-ALTKEY2-1-6.                       IX2154.2 278
   000281         028400              20 IX-FD2-ALTKEY2-1-3  PICTURE XXX.                 IX2154.2
   000282         028500              20 IX-FD2-ALTKEY2-4-6  PICTURE XXX.                 IX2154.2
   000283         028600           15 IX-FD2-ALTKEY2-7-20  PICTURE X(14).                 IX2154.2
   000284         028700           15 FILLER             PICTURE X(9).                    IX2154.2
   000285         028800        10 FILLER                PICTURE X(8).                    IX2154.2
   000286         028900    03  IX-FD2-REC-241-240 REDEFINES IX-FD2-REC-241.              IX2154.2 240
   000287         029000       05 IX-FD2-REC-240   PIC X(240).                            IX2154.2
   000288         029100       05 FILLER           PIC X.                                 IX2154.2
   000289         029200 FD  IX-FD3                                                       IX2154.2

 ==000289==> IGYGR1213-I The "LABEL" clause was processed as comments for this file definition.

 ==000289==> IGYGR1261-I The "BLOCK CONTAINS" clause was processed as comments for this file
                         definition.

   000290         029300     LABEL RECORDS ARE STANDARD                                   IX2154.2
   000291         029400     DATA RECORD IS IX-FD3R1-F-G-242                              IX2154.2 *
   000292         029500     RECORD CONTAINS 242 CHARACTERS                               IX2154.2
   000293         029600     BLOCK CONTAINS 1694 CHARACTERS.                              IX2154.2
   000294         029700 01  IX-FD3R1-F-G-242.                                            IX2154.2
   000295         029800   03 IX-FD3-REC-242.                                             IX2154.2
   000296         029900     05 IX-FD3-REC-120           PICTURE X(120).                  IX2154.2
   000297         030000     05 IX-FD3-REC-121-242.                                       IX2154.2
   000298         030100        10 FILLER                PICTURE X(8).                    IX2154.2
   000299         030200        10 IX-FD3-RECKEY-AREA.                                    IX2154.2
   000300         030300           15 IX-FD3-KEY         PICTURE X(13).                   IX2154.2
   000301         030400        10 FILLER                PICTURE X(25).                   IX2154.2
   000302         030500        10 IX-FD3-ALTKEY1-AREA.                                   IX2154.2
   000303         030600           15 IX-FD3-KEY         PICTURE X(20).                   IX2154.2
   000304         030700        10 FILLER                PICTURE X(18).                   IX2154.2
   000305         030800        10 IX-FD3-ALTKEY2-AREA.                                   IX2154.2
   000306         030900           15 IX-FD3-KEY         PICTURE X(20).                   IX2154.2
   000307         031000        10 FILLER                PICTURE X(18).                   IX2154.2
   000308         031100     03  IX-FD3-REC-240 REDEFINES IX-FD3-REC-242.                 IX2154.2 295
   000309         031200       05  IX-FD3-240            PICTURE X(240).                  IX2154.2
   000310         031300       05  FILLER                PICTURE XX.                      IX2154.2
   000311         031400                                                                  IX2154.2
   000312         031500                                                                  IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000313         031600 WORKING-STORAGE SECTION.                                         IX2154.2
   000314         031700 01  WRK-FDW-RECKEY.                                              IX2154.2
   000315         031800     05 FDW-RECKEY-1-13.                                          IX2154.2
   000316         031900        10 FDW-RECKEY-1-10       PICTURE X(10).                   IX2154.2
   000317         032000        10 FDW-RECKEY-11-13      PICTURE 9(3).                    IX2154.2
   000318         032100     05 FILLER                   PICTURE X(16)  VALUE SPACE.      IX2154.2 IMP
   000319         032200 01  WRK-FDW-ALTKEY1.                                             IX2154.2
   000320         032300      05 FDW-ALTKEY1-1-20.                                        IX2154.2
   000321         032400       10  FDW-ALTKEY1-1-10.                                      IX2154.2
   000322         032500        15 FDW-ALTKEY1-1-5       PICTURE X(5).                    IX2154.2
   000323         032600        15 FDW-ALTKEY1-6-10      PICTURE X(5).                    IX2154.2
   000324         032700       10 FDW-ALTKEY1-11-13      PICTURE 9(3).                    IX2154.2
   000325         032800       10 FDW-ALTKEY1-14-20      PICTURE X(7).                    IX2154.2
   000326         032900     05 FILLER                   PICTURE X(9)  VALUE SPACE.       IX2154.2 IMP
   000327         033000 01  WRK-FDW-ALTKEY2.                                             IX2154.2
   000328         033100     05 FDW-ALTKEY2-1-20.                                         IX2154.2
   000329         033200        10 FDW-ALTKEY2-1-10.                                      IX2154.2
   000330         033300           15 FDW-ALTKEY2-1-5    PICTURE X(5).                    IX2154.2
   000331         033400           15 FDW-ALTKEY2-6-10   PICTURE X(5).                    IX2154.2
   000332         033500        10 FDW-ALTKEY2-11-13     PICTURE 9(3).                    IX2154.2
   000333         033600        10 FDW-ALTKEY2-14-20     PICTURE X(7).                    IX2154.2
   000334         033700     05 FILLER                   PICTURE X(9) VALUE SPACE.        IX2154.2 IMP
   000335         033800 01  RECNO                       PICTURE 9(5)  VALUE ZERO.        IX2154.2 IMP
   000336         033900 01  EXCUT-COUNTER-06V00         PICTURE 9(6) VALUE ZERO.         IX2154.2 IMP
   000337         034000 01  KEYSUB                      PICTURE 9(3) COMPUTATIONAL.      IX2154.2
   000338         034100 01  INVKEY-COUNTER              PICTURE 9(3) COMPUTATIONAL.      IX2154.2
   000339         034200 01  RECORDS-WRITTEN             PICTURE 9(3).                    IX2154.2
   000340         034300 01  RECKEY-NUM                  PICTURE 9(3).                    IX2154.2
   000341         034400 01  ALTKEY1-NUM                 PICTURE 9(3).                    IX2154.2
   000342         034500 01  ALTKEY2-NUM                 PICTURE 9(3).                    IX2154.2
   000343         034600 01  FAIL-SW                     PICTURE 9 VALUE ZERO.            IX2154.2 IMP
   000344         034700 01  RECORD-KEY-CONTENT.                                          IX2154.2
   000345         034800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000346         034900          "BBBBBBBBBC002EEEEEEEEEF002ALTKEY1WWWWWWWWWV398ALTKEY2".IX2154.2
   000347         035000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000348         035100          "BBBBBBBBCC004EEEEEEEEFF004ALTKEY1WWWWWWWWVV396ALTKEY2".IX2154.2
   000349         035200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000350         035300          "BBBBBBBCCC006EEEEEEEFFF006ALTKEY1WWWWWWWVVV394ALTKEY2".IX2154.2
   000351         035400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000352         035500          "BBBBBBCCCC008EEEEEEFFFF008ALTKEY1WWWWWWVVVV392ALTKEY2".IX2154.2
   000353         035600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000354         035700          "BBBBBCCCCC010EEEEEFFFFF010ALTKEY1WWWWWVVVVV390ALTKEY2".IX2154.2
   000355         035800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000356         035900          "BBBBCCCCCC012EEEEFFFFFF012ALTKEY1WWWWVVVVVV388ALTKEY2".IX2154.2
   000357         036000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000358         036100          "BBBCCCCCCC014EEEFFFFFFF014ALTKEY1WWWVVVVVVV386ALTKEY2".IX2154.2
   000359         036200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000360         036300          "BBCCCCCCCC016EEFFFFFFFF016ALTKEY1WWVVVVVVVV384ALTKEY2".IX2154.2
   000361         036400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000362         036500          "BCCCCCCCCC018EFFFFFFFFF018ALTKEY1WVVVVVVVVV382ALTKEY2".IX2154.2
   000363         036600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000364         036700          "CCCCCCCCCC020FFFFFFFFFF020ALTKEY1VVVVVVVVVV380ALTKEY2".IX2154.2
   000365         036800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000366         036900          "CCCCCCCCCD022FFFFFFFFFG022ALTKEY1VVVVVVVVVV380ALTKEY2".IX2154.2
   000367         037000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000368         037100          "CCCCCCCCDD024FFFFFFFFGG024ALTKEY1VVVVVVVVUU376ALTKEY2".IX2154.2
   000369         037200     05 FILLER PIC X(53) VALUE                                    IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000370         037300          "CCCCCCCDDD026FFFFFFFGGG026ALTKEY1VVVVVVVUUU374ALTKEY2".IX2154.2
   000371         037400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000372         037500          "CCCCCCDDDD028FFFFFFGGGG028ALTKEY1VVVVVVUUUU372ALTKEY2".IX2154.2
   000373         037600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000374         037700          "CCCCCDDDDD030FFFFFGGGGG030ALTKEY1VVVVVUUUUU370ALTKEY2".IX2154.2
   000375         037800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000376         037900          "CCCCDDDDDD032FFFFGGGGGG032ALTKEY1VVVVUUUUUU368ALTKEY2".IX2154.2
   000377         038000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000378         038100          "CCCDDDDDDD034FFFGGGGGGG034ALTKEY1VVVUUUUUUU366ALTKEY2".IX2154.2
   000379         038200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000380         038300          "CCDDDDDDDD036FFGGGGGGGG036ALTKEY1VVUUUUUUUU364ALTKEY2".IX2154.2
   000381         038400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000382         038500          "CDDDDDDDDD038FGGGGGGGGG038ALTKEY1VUUUUUUUUU362ALTKEY2".IX2154.2
   000383         038600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000384         038700          "DDDDDDDDDD040GGGGGGGGGG040ALTKEY1UUUUUUUUUU360ALTKEY2".IX2154.2
   000385         038800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000386         038900          "DDDDDDDDDE042GGGGGGGGGH042ALTKEY1UUUUUUUUUU360ALTKEY2".IX2154.2
   000387         039000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000388         039100          "DDDDDDDDEE044GGGGGGGGHH044ALTKEY1UUUUUUUUTT356ALTKEY2".IX2154.2
   000389         039200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000390         039300          "DDDDDDDEEE046GGGGGGGHHH046ALTKEY1UUUUUUUTTT354ALTKEY2".IX2154.2
   000391         039400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000392         039500          "DDDDDDEEEE048GGGGGGHHHH048ALTKEY1UUUUUUTTTT352ALTKEY2".IX2154.2
   000393         039600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000394         039700          "DDDDDEEEEE050GGGGGHHHHH050ALTKEY1UUUUUTTTTT350ALTKEY2".IX2154.2
   000395         039800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000396         039900          "DDDDEEEEEE052GGGGHHHHHH052ALTKEY1UUUUTTTTTT348ALTKEY2".IX2154.2
   000397         040000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000398         040100          "DDDEEEEEEE054GGGHHHHHHH054ALTKEY1UUUTTTTTTT346ALTKEY2".IX2154.2
   000399         040200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000400         040300          "DDEEEEEEEE056GGHHHHHHHH056ALTKEY1UUTTTTTTTT344ALTKEY2".IX2154.2
   000401         040400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000402         040500          "DEEEEEEEEE058GHHHHHHHHH058ALTKEY1UTTTTTTTTT342ALTKEY2".IX2154.2
   000403         040600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000404         040700          "EEEEEEEEEE060HHHHHHHHHH060ALTKEY1TTTTTTTTTT340ALTKEY2".IX2154.2
   000405         040800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000406         040900          "EEEEEEEEEF062HHHHHHHHHI062ALTKEY1TTTTTTTTTT340ALTKEY2".IX2154.2
   000407         041000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000408         041100          "EEEEEEEEFF064HHHHHHHHII064ALTKEY1TTTTTTTTSS336ALTKEY2".IX2154.2
   000409         041200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000410         041300          "EEEEEEEFFF066HHHHHHHIII066ALTKEY1TTTTTTTSSS334ALTKEY2".IX2154.2
   000411         041400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000412         041500          "EEEEEEFFFF068HHHHHHIIII068ALTKEY1TTTTTTSSSS332ALTKEY2".IX2154.2
   000413         041600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000414         041700          "EEEEEFFFFF070HHHHHIIIII070ALTKEY1TTTTTSSSSS330ALTKEY2".IX2154.2
   000415         041800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000416         041900          "EEEEFFFFFF072HHHHIIIIII072ALTKEY1TTTTSSSSSS328ALTKEY2".IX2154.2
   000417         042000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000418         042100          "EEEFFFFFFF074HHHIIIIIII074ALTKEY1TTTSSSSSSS326ALTKEY2".IX2154.2
   000419         042200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000420         042300          "EEFFFFFFFF076HHIIIIIIII076ALTKEY1TTSSSSSSSS324ALTKEY2".IX2154.2
   000421         042400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000422         042500          "EFFFFFFFFF078HIIIIIIIII078ALTKEY1TSSSSSSSSS322ALTKEY2".IX2154.2
   000423         042600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000424         042700          "FFFFFFFFFF080IIIIIIIIII080ALTKEY1SSSSSSSSSS320ALTKEY2".IX2154.2
   000425         042800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000426         042900          "FFFFFFFFFG082IIIIIIIIIJ082ALTKEY1SSSSSSSSSS320ALTKEY2".IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000427         043000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000428         043100          "FFFFFFFFGG084IIIIIIIIJJ084ALTKEY1SSSSSSSSRR316ALTKEY2".IX2154.2
   000429         043200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000430         043300          "FFFFFFFGGG086IIIIIIIJJJ086ALTKEY1SSSSSSSRRR314ALTKEY2".IX2154.2
   000431         043400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000432         043500          "FFFFFFGGGG088IIIIIIJJJJ088ALTKEY1SSSSSSRRRR312ALTKEY2".IX2154.2
   000433         043600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000434         043700          "FFFFFGGGGG090IIIIIJJJJJ090ALTKEY1SSSSSRRRRR310ALTKEY2".IX2154.2
   000435         043800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000436         043900          "FFFFGGGGGG092IIIIJJJJJJ092ALTKEY1SSSSRRRRRR308ALTKEY2".IX2154.2
   000437         044000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000438         044100          "FFFGGGGGGG094IIIJJJJJJJ094ALTKEY1SSSRRRRRRR306ALTKEY2".IX2154.2
   000439         044200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000440         044300          "FFGGGGGGGG096IIJJJJJJJJ096ALTKEY1SSRRRRRRRR304ALTKEY2".IX2154.2
   000441         044400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000442         044500          "FGGGGGGGGG098IJJJJJJJJJ098ALTKEY1SRRRRRRRRR302ALTKEY2".IX2154.2
   000443         044600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000444         044700          "GGGGGGGGGG100JJJJJJJJJJ100ALTKEY1RRRRRRRRRR300ALTKEY2".IX2154.2
   000445         044800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000446         044900          "RRRRSSSSSS352VVVVWWWWWW352ALTKEY1GGGGFFFFFF048ALTKEY2".IX2154.2
   000447         045000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000448         045100          "RRRSSSSSSS354VVVWWWWWWW354ALTKEY1GGGFFFFFFF046ALTKEY2".IX2154.2
   000449         045200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000450         045300          "RRSSSSSSSS356VVWWWWWWWW356ALTKEY1GGFFFFFFFF044ALTKEY2".IX2154.2
   000451         045400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000452         045500          "RSSSSSSSSS358VWWWWWWWWW358ALTKEY1GFFFFFFFFF042ALTKEY2".IX2154.2
   000453         045600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000454         045700          "SSSSSSSSSS360WWWWWWWWWW360ALTKEY1FFFFFFFFFF040ALTKEY2".IX2154.2
   000455         045800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000456         045900          "SSSSSSSSST362WWWWWWWWWX362ALTKEY1FFFFFFFFFF040ALTKEY2".IX2154.2
   000457         046000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000458         046100          "SSSSSSSSTT364WWWWWWWWXX364ALTKEY1FFFFFFFFEE036ALTKEY2".IX2154.2
   000459         046200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000460         046300          "SSSSSSSTTT366WWWWWWWXXX366ALTKEY1FFFFFFFEEE034ALTKEY2".IX2154.2
   000461         046400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000462         046500          "SSSSSSTTTT368WWWWWWXXXX368ALTKEY1FFFFFFEEEE032ALTKEY2".IX2154.2
   000463         046600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000464         046700          "SSSSSTTTTT370WWWWWXXXXX370ALTKEY1FFFFFEEEEE030ALTKEY2".IX2154.2
   000465         046800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000466         046900          "SSSSTTTTTT372WWWWXXXXXX372ALTKEY1FFFFEEEEEE028ALTKEY2".IX2154.2
   000467         047000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000468         047100          "SSSTTTTTTT374WWWXXXXXXX374ALTKEY1FFFEEEEEEE026ALTKEY2".IX2154.2
   000469         047200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000470         047300          "SSTTTTTTTT376WWXXXXXXXX376ALTKEY1FFEEEEEEEE024ALTKEY2".IX2154.2
   000471         047400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000472         047500          "STTTTTTTTT378WXXXXXXXXX378ALTKEY1FEEEEEEEEE022ALTKEY2".IX2154.2
   000473         047600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000474         047700          "TTTTTTTTTT380XXXXXXXXXX380ALTKEY1EEEEEEEEEE020ALTKEY2".IX2154.2
   000475         047800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000476         047900          "TTTTTTTTTU382XXXXXXXXXY382ALTKEY1EEEEEEEEEE020ALTKEY2".IX2154.2
   000477         048000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000478         048100          "TTTTTTTTUU384XXXXXXXXYY384ALTKEY1EEEEEEEEDD016ALTKEY2".IX2154.2
   000479         048200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000480         048300          "TTTTTTTUUU386XXXXXXXYYY386ALTKEY1EEEEEEEDDD014ALTKEY2".IX2154.2
   000481         048400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000482         048500          "TTTTTTUUUU388XXXXXXYYYY388ALTKEY1EEEEEEDDDD012ALTKEY2".IX2154.2
   000483         048600     05 FILLER PIC X(53) VALUE                                    IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000484         048700          "TTTTTUUUUU390XXXXXYYYYY390ALTKEY1EEEEEDDDDD010ALTKEY2".IX2154.2
   000485         048800     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000486         048900          "TTTTUUUUUU392XXXXYYYYYY392ALTKEY1EEEEDDDDDD008ALTKEY2".IX2154.2
   000487         049000     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000488         049100          "TTTUUUUUUU394XXXYYYYYYY394ALTKEY1EEEDDDDDDD006ALTKEY2".IX2154.2
   000489         049200     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000490         049300          "TTUUUUUUUU396XXYYYYYYYY396ALTKEY1EEDDDDDDDD004ALTKEY2".IX2154.2
   000491         049400     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000492         049500          "TUUUUUUUUU398XYYYYYYYYY398ALTKEY1EDDDDDDDDD002ALTKEY2".IX2154.2
   000493         049600     05 FILLER PIC X(53) VALUE                                    IX2154.2
   000494         049700          "UUUUUUUUUU400YYYYYYYYYY400ALTKEY1DDDDDDDDDD000ALTKEY2".IX2154.2
   000495         049800 01  RECORD-KEY-DATA   REDEFINES  RECORD-KEY-CONTENT.             IX2154.2 344
   000496         049900     05 KEY-VALUES                  OCCURS 75  TIMES.             IX2154.2
   000497         050000       10 RECKEY-VALUE           PICTURE X(13).                   IX2154.2
   000498         050100       10 ALTKEY1-VALUE          PICTURE X(20).                   IX2154.2
   000499         050200       10 ALTKEY2-VALUE          PICTURE X(20).                   IX2154.2
   000500         050300 01  INIT-FLAG                   PICTURE 9.                       IX2154.2
   000501         050400 01  FILE-RECORD-INFORMATION-REC.                                 IX2154.2
   000502         050500     03 FILE-RECORD-INFO-SKELETON.                                IX2154.2
   000503         050600        05 FILLER                 PICTURE X(48)       VALUE       IX2154.2
   000504         050700             "FILE=      ,RECORD=      /0,RECNO=000000,UPDT=00".  IX2154.2
   000505         050800        05 FILLER                 PICTURE X(46)       VALUE       IX2154.2
   000506         050900             ",ODO=0000,PGM=     ,LRECL=000000,BLKSIZ  =0000".    IX2154.2
   000507         051000        05 FILLER                 PICTURE X(26)       VALUE       IX2154.2
   000508         051100             ",LFIL=000000,ORG=  ,LBLR= ".                        IX2154.2
   000509         051200        05 FILLER                 PICTURE X(37)       VALUE       IX2154.2
   000510         051300             ",RECKEY=                             ".             IX2154.2
   000511         051400        05 FILLER                 PICTURE X(38)       VALUE       IX2154.2
   000512         051500             ",ALTKEY1=                             ".            IX2154.2
   000513         051600        05 FILLER                 PICTURE X(38)       VALUE       IX2154.2
   000514         051700             ",ALTKEY2=                             ".            IX2154.2
   000515         051800        05 FILLER                 PICTURE X(7)        VALUE SPACE.IX2154.2 IMP
   000516         051900     03 FILE-RECORD-INFO          OCCURS  10  TIMES.              IX2154.2
   000517         052000        05 FILE-RECORD-INFO-P1-120.                               IX2154.2
   000518         052100           07 FILLER              PIC X(5).                       IX2154.2
   000519         052200           07 XFILE-NAME           PIC X(6).                      IX2154.2
   000520         052300           07 FILLER              PIC X(8).                       IX2154.2
   000521         052400           07 XRECORD-NAME         PIC X(6).                      IX2154.2
   000522         052500           07 FILLER              PIC X(1).                       IX2154.2
   000523         052600           07 REELUNIT-NUMBER     PIC 9(1).                       IX2154.2
   000524         052700           07 FILLER              PIC X(7).                       IX2154.2
   000525         052800           07 XRECORD-NUMBER       PIC 9(6).                      IX2154.2
   000526         052900           07 FILLER              PIC X(6).                       IX2154.2
   000527         053000           07 UPDATE-NUMBER       PIC 9(2).                       IX2154.2
   000528         053100           07 FILLER              PIC X(5).                       IX2154.2
   000529         053200           07 ODO-NUMBER          PIC 9(4).                       IX2154.2
   000530         053300           07 FILLER              PIC X(5).                       IX2154.2
   000531         053400           07 XPROGRAM-NAME        PIC X(5).                      IX2154.2
   000532         053500           07 FILLER              PIC X(7).                       IX2154.2
   000533         053600           07 XRECORD-LENGTH       PIC 9(6).                      IX2154.2
   000534         053700           07 FILLER              PIC X(7).                       IX2154.2
   000535         053800           07 CHARS-OR-RECORDS    PIC X(2).                       IX2154.2
   000536         053900           07 FILLER              PIC X(1).                       IX2154.2
   000537         054000           07 XBLOCK-SIZE          PIC 9(4).                      IX2154.2
   000538         054100           07 FILLER              PIC X(6).                       IX2154.2
   000539         054200           07 RECORDS-IN-FILE     PIC 9(6).                       IX2154.2
   000540         054300           07 FILLER              PIC X(5).                       IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000541         054400           07 XFILE-ORGANIZATION   PIC X(2).                      IX2154.2
   000542         054500           07 FILLER              PIC X(6).                       IX2154.2
   000543         054600           07 XLABEL-TYPE          PIC X(1).                      IX2154.2
   000544         054700        05 FILE-RECORD-INFO-P121-240.                             IX2154.2
   000545         054800           07 FILLER              PIC X(8).                       IX2154.2
   000546         054900           07 XRECORD-KEY          PIC X(29).                     IX2154.2
   000547         055000           07 FILLER              PIC X(9).                       IX2154.2
   000548         055100           07 ALTERNATE-KEY1      PIC X(29).                      IX2154.2
   000549         055200           07 FILLER              PIC X(9).                       IX2154.2
   000550         055300           07 ALTERNATE-KEY2      PIC X(29).                      IX2154.2
   000551         055400           07 FILLER              PIC X(7).                       IX2154.2
   000552         055500 01  TEST-RESULTS.                                                IX2154.2
   000553         055600     02 FILLER                   PIC X      VALUE SPACE.          IX2154.2 IMP
   000554         055700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IX2154.2 IMP
   000555         055800     02 FILLER                   PIC X      VALUE SPACE.          IX2154.2 IMP
   000556         055900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IX2154.2 IMP
   000557         056000     02 FILLER                   PIC X      VALUE SPACE.          IX2154.2 IMP
   000558         056100     02  PAR-NAME.                                                IX2154.2
   000559         056200       03 FILLER                 PIC X(19)  VALUE SPACE.          IX2154.2 IMP
   000560         056300       03  PARDOT-X              PIC X      VALUE SPACE.          IX2154.2 IMP
   000561         056400       03 DOTVALUE               PIC 99     VALUE ZERO.           IX2154.2 IMP
   000562         056500     02 FILLER                   PIC X(8)   VALUE SPACE.          IX2154.2 IMP
   000563         056600     02 RE-MARK                  PIC X(61).                       IX2154.2
   000564         056700 01  TEST-COMPUTED.                                               IX2154.2
   000565         056800     02 FILLER                   PIC X(30)  VALUE SPACE.          IX2154.2 IMP
   000566         056900     02 FILLER                   PIC X(17)  VALUE                 IX2154.2
   000567         057000            "       COMPUTED=".                                   IX2154.2
   000568         057100     02 COMPUTED-X.                                               IX2154.2
   000569         057200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IX2154.2 IMP
   000570         057300     03 COMPUTED-N               REDEFINES COMPUTED-A             IX2154.2 569
   000571         057400                                 PIC -9(9).9(9).                  IX2154.2
   000572         057500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IX2154.2 569
   000573         057600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IX2154.2 569
   000574         057700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IX2154.2 569
   000575         057800     03       CM-18V0 REDEFINES COMPUTED-A.                       IX2154.2 569
   000576         057900         04 COMPUTED-18V0                    PIC -9(18).          IX2154.2
   000577         058000         04 FILLER                           PIC X.               IX2154.2
   000578         058100     03 FILLER PIC X(50) VALUE SPACE.                             IX2154.2 IMP
   000579         058200 01  TEST-CORRECT.                                                IX2154.2
   000580         058300     02 FILLER PIC X(30) VALUE SPACE.                             IX2154.2 IMP
   000581         058400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IX2154.2
   000582         058500     02 CORRECT-X.                                                IX2154.2
   000583         058600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IX2154.2 IMP
   000584         058700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IX2154.2 583
   000585         058800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IX2154.2 583
   000586         058900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IX2154.2 583
   000587         059000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IX2154.2 583
   000588         059100     03      CR-18V0 REDEFINES CORRECT-A.                         IX2154.2 583
   000589         059200         04 CORRECT-18V0                     PIC -9(18).          IX2154.2
   000590         059300         04 FILLER                           PIC X.               IX2154.2
   000591         059400     03 FILLER PIC X(2) VALUE SPACE.                              IX2154.2 IMP
   000592         059500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IX2154.2 IMP
   000593         059600 01  CCVS-C-1.                                                    IX2154.2
   000594         059700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIX2154.2
   000595         059800-    "SS  PARAGRAPH-NAME                                          IX2154.2
   000596         059900-    "       REMARKS".                                            IX2154.2
   000597         060000     02 FILLER                     PIC X(20)    VALUE SPACE.      IX2154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000598         060100 01  CCVS-C-2.                                                    IX2154.2
   000599         060200     02 FILLER                     PIC X        VALUE SPACE.      IX2154.2 IMP
   000600         060300     02 FILLER                     PIC X(6)     VALUE "TESTED".   IX2154.2
   000601         060400     02 FILLER                     PIC X(15)    VALUE SPACE.      IX2154.2 IMP
   000602         060500     02 FILLER                     PIC X(4)     VALUE "FAIL".     IX2154.2
   000603         060600     02 FILLER                     PIC X(94)    VALUE SPACE.      IX2154.2 IMP
   000604         060700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IX2154.2 IMP
   000605         060800 01  REC-CT                        PIC 99       VALUE ZERO.       IX2154.2 IMP
   000606         060900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IX2154.2 IMP
   000607         061000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IX2154.2 IMP
   000608         061100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IX2154.2 IMP
   000609         061200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IX2154.2 IMP
   000610         061300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IX2154.2 IMP
   000611         061400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IX2154.2 IMP
   000612         061500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IX2154.2 IMP
   000613         061600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IX2154.2 IMP
   000614         061700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IX2154.2 IMP
   000615         061800 01  CCVS-H-1.                                                    IX2154.2
   000616         061900     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2154.2 IMP
   000617         062000     02  FILLER                    PIC X(42)    VALUE             IX2154.2
   000618         062100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IX2154.2
   000619         062200     02  FILLER                    PIC X(39)    VALUE SPACES.     IX2154.2 IMP
   000620         062300 01  CCVS-H-2A.                                                   IX2154.2
   000621         062400   02  FILLER                        PIC X(40)  VALUE SPACE.      IX2154.2 IMP
   000622         062500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IX2154.2
   000623         062600   02  FILLER                        PIC XXXX   VALUE             IX2154.2
   000624         062700     "4.2 ".                                                      IX2154.2
   000625         062800   02  FILLER                        PIC X(28)  VALUE             IX2154.2
   000626         062900            " COPY - NOT FOR DISTRIBUTION".                       IX2154.2
   000627         063000   02  FILLER                        PIC X(41)  VALUE SPACE.      IX2154.2 IMP
   000628         063100                                                                  IX2154.2
   000629         063200 01  CCVS-H-2B.                                                   IX2154.2
   000630         063300   02  FILLER                        PIC X(15)  VALUE             IX2154.2
   000631         063400            "TEST RESULT OF ".                                    IX2154.2
   000632         063500   02  TEST-ID                       PIC X(9).                    IX2154.2
   000633         063600   02  FILLER                        PIC X(4)   VALUE             IX2154.2
   000634         063700            " IN ".                                               IX2154.2
   000635         063800   02  FILLER                        PIC X(12)  VALUE             IX2154.2
   000636         063900     " HIGH       ".                                              IX2154.2
   000637         064000   02  FILLER                        PIC X(22)  VALUE             IX2154.2
   000638         064100            " LEVEL VALIDATION FOR ".                             IX2154.2
   000639         064200   02  FILLER                        PIC X(58)  VALUE             IX2154.2
   000640         064300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2154.2
   000641         064400 01  CCVS-H-3.                                                    IX2154.2
   000642         064500     02  FILLER                      PIC X(34)  VALUE             IX2154.2
   000643         064600            " FOR OFFICIAL USE ONLY    ".                         IX2154.2
   000644         064700     02  FILLER                      PIC X(58)  VALUE             IX2154.2
   000645         064800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IX2154.2
   000646         064900     02  FILLER                      PIC X(28)  VALUE             IX2154.2
   000647         065000            "  COPYRIGHT   1985 ".                                IX2154.2
   000648         065100 01  CCVS-E-1.                                                    IX2154.2
   000649         065200     02 FILLER                       PIC X(52)  VALUE SPACE.      IX2154.2 IMP
   000650         065300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IX2154.2
   000651         065400     02 ID-AGAIN                     PIC X(9).                    IX2154.2
   000652         065500     02 FILLER                       PIC X(45)  VALUE SPACES.     IX2154.2 IMP
   000653         065600 01  CCVS-E-2.                                                    IX2154.2
   000654         065700     02  FILLER                      PIC X(31)  VALUE SPACE.      IX2154.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000655         065800     02  FILLER                      PIC X(21)  VALUE SPACE.      IX2154.2 IMP
   000656         065900     02 CCVS-E-2-2.                                               IX2154.2
   000657         066000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IX2154.2 IMP
   000658         066100         03 FILLER                   PIC X      VALUE SPACE.      IX2154.2 IMP
   000659         066200         03 ENDER-DESC               PIC X(44)  VALUE             IX2154.2
   000660         066300            "ERRORS ENCOUNTERED".                                 IX2154.2
   000661         066400 01  CCVS-E-3.                                                    IX2154.2
   000662         066500     02  FILLER                      PIC X(22)  VALUE             IX2154.2
   000663         066600            " FOR OFFICIAL USE ONLY".                             IX2154.2
   000664         066700     02  FILLER                      PIC X(12)  VALUE SPACE.      IX2154.2 IMP
   000665         066800     02  FILLER                      PIC X(58)  VALUE             IX2154.2
   000666         066900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IX2154.2
   000667         067000     02  FILLER                      PIC X(13)  VALUE SPACE.      IX2154.2 IMP
   000668         067100     02 FILLER                       PIC X(15)  VALUE             IX2154.2
   000669         067200             " COPYRIGHT 1985".                                   IX2154.2
   000670         067300 01  CCVS-E-4.                                                    IX2154.2
   000671         067400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IX2154.2 IMP
   000672         067500     02 FILLER                       PIC X(4)   VALUE " OF ".     IX2154.2
   000673         067600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IX2154.2 IMP
   000674         067700     02 FILLER                       PIC X(40)  VALUE             IX2154.2
   000675         067800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IX2154.2
   000676         067900 01  XXINFO.                                                      IX2154.2
   000677         068000     02 FILLER                       PIC X(19)  VALUE             IX2154.2
   000678         068100            "*** INFORMATION ***".                                IX2154.2
   000679         068200     02 INFO-TEXT.                                                IX2154.2
   000680         068300       04 FILLER                     PIC X(8)   VALUE SPACE.      IX2154.2 IMP
   000681         068400       04 XXCOMPUTED                 PIC X(20).                   IX2154.2
   000682         068500       04 FILLER                     PIC X(5)   VALUE SPACE.      IX2154.2 IMP
   000683         068600       04 XXCORRECT                  PIC X(20).                   IX2154.2
   000684         068700     02 INF-ANSI-REFERENCE           PIC X(48).                   IX2154.2
   000685         068800 01  HYPHEN-LINE.                                                 IX2154.2
   000686         068900     02 FILLER  PIC IS X VALUE IS SPACE.                          IX2154.2 IMP
   000687         069000     02 FILLER  PIC IS X(65)    VALUE IS "************************IX2154.2
   000688         069100-    "*****************************************".                 IX2154.2
   000689         069200     02 FILLER  PIC IS X(54)    VALUE IS "************************IX2154.2
   000690         069300-    "******************************".                            IX2154.2
   000691         069400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IX2154.2
   000692         069500     "IX215A".                                                    IX2154.2
   000693         069600 PROCEDURE DIVISION.                                              IX2154.2
   000694         069700 CCVS1 SECTION.                                                   IX2154.2
   000695         069800 OPEN-FILES.                                                      IX2154.2
   000696         069900     OPEN I-O RAW-DATA.                                           IX2154.2 163
   000697         070000     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2154.2 691 166
   000698         070100     READ RAW-DATA INVALID KEY GO TO END-E-1.                     IX2154.2 163 704
   000699         070200     MOVE "ABORTED " TO C-ABORT.                                  IX2154.2 177
   000700         070300     ADD 1 TO C-NO-OF-TESTS.                                      IX2154.2 169
   000701         070400     ACCEPT C-DATE  FROM DATE.                                    IX2154.2 167
   000702         070500     ACCEPT C-TIME  FROM TIME.                                    IX2154.2 168
   000703         070600     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-1.             IX2154.2 165 704
   000704         070700 END-E-1.                                                         IX2154.2
   000705         070800     CLOSE RAW-DATA.                                              IX2154.2 163
   000706         070900     OPEN    OUTPUT PRINT-FILE.                                   IX2154.2 178
   000707         071000     MOVE  CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.  IX2154.2 691 632 691 651
   000708         071100     MOVE    SPACE TO TEST-RESULTS.                               IX2154.2 IMP 552
   000709         071200     PERFORM HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.              IX2154.2 753 758
   000710         071300     MOVE    ZERO TO REC-SKL-SUB.                                 IX2154.2 IMP 604
   000711         071400     PERFORM CCVS-INIT-FILE 9 TIMES.                              IX2154.2 712
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000712         071500 CCVS-INIT-FILE.                                                  IX2154.2
   000713         071600     ADD     1 TO REC-SKL-SUB.                                    IX2154.2 604
   000714         071700     MOVE    FILE-RECORD-INFO-SKELETON                            IX2154.2 502
   000715         071800          TO FILE-RECORD-INFO (REC-SKL-SUB).                      IX2154.2 516 604
   000716         071900 CCVS-INIT-EXIT.                                                  IX2154.2
   000717         072000     GO TO CCVS1-EXIT.                                            IX2154.2 840
   000718         072100 CLOSE-FILES.                                                     IX2154.2
   000719         072200     OPEN I-O RAW-DATA.                                           IX2154.2 163
   000720         072300     MOVE CCVS-PGM-ID TO RAW-DATA-KEY.                            IX2154.2 691 166
   000721         072400     READ RAW-DATA INVALID KEY GO TO END-E-2.                     IX2154.2 163 729
   000722         072500     MOVE "OK.     " TO C-ABORT.                                  IX2154.2 177
   000723         072600     MOVE PASS-COUNTER TO C-OK.                                   IX2154.2 609 170
   000724         072700     MOVE ERROR-HOLD   TO C-ALL.                                  IX2154.2 611 171
   000725         072800     MOVE ERROR-COUNTER TO C-FAIL.                                IX2154.2 607 172
   000726         072900     MOVE DELETE-COUNTER TO C-DELETED.                            IX2154.2 606 173
   000727         073000     MOVE INSPECT-COUNTER TO C-INSPECT.                           IX2154.2 608 174
   000728         073100     REWRITE RAW-DATA-SATZ INVALID KEY GO TO END-E-2.             IX2154.2 165 729
   000729         073200 END-E-2.                                                         IX2154.2
   000730         073300     CLOSE RAW-DATA.                                              IX2154.2 163
   000731         073400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IX2154.2 762 783 178
   000732         073500 TERMINATE-CCVS.                                                  IX2154.2
   000733         073600     EXIT PROGRAM.                                                IX2154.2
   000734         073700 TERMINATE-CALL.                                                  IX2154.2
   000735         073800     STOP     RUN.                                                IX2154.2
   000736         073900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IX2154.2 556 608
   000737         074000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IX2154.2 556 609
   000738         074100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IX2154.2 556 607
   000739         074200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IX2154.2 556 606
   000740         074300     MOVE "****TEST DELETED****" TO RE-MARK.                      IX2154.2 563
   000741         074400 PRINT-DETAIL.                                                    IX2154.2
   000742         074500     IF REC-CT NOT EQUAL TO ZERO                                  IX2154.2 605 IMP
   000743      1  074600             MOVE "." TO PARDOT-X                                 IX2154.2 560
   000744      1  074700             MOVE REC-CT TO DOTVALUE.                             IX2154.2 605 561
   000745         074800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IX2154.2 552 179 795
   000746         074900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IX2154.2 556 795
   000747      1  075000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IX2154.2 816 830
   000748      1  075100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IX2154.2 831 839
   000749         075200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IX2154.2 IMP 556 IMP 568
   000750         075300     MOVE SPACE TO CORRECT-X.                                     IX2154.2 IMP 582
   000751         075400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IX2154.2 605 IMP IMP 558
   000752         075500     MOVE     SPACE TO RE-MARK.                                   IX2154.2 IMP 563
   000753         075600 HEAD-ROUTINE.                                                    IX2154.2
   000754         075700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2154.2 615 180 795
   000755         075800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IX2154.2 620 180 795
   000756         075900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2154.2 629 180 795
   000757         076000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IX2154.2 641 180 795
   000758         076100 COLUMN-NAMES-ROUTINE.                                            IX2154.2
   000759         076200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2154.2 593 180 795
   000760         076300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2154.2 598 180 795
   000761         076400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IX2154.2 685 180 795
   000762         076500 END-ROUTINE.                                                     IX2154.2
   000763         076600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IX2154.2 685 180 795
   000764         076700 END-RTN-EXIT.                                                    IX2154.2
   000765         076800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2154.2 648 180 795
   000766         076900 END-ROUTINE-1.                                                   IX2154.2
   000767         077000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IX2154.2 607 611 608
   000768         077100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IX2154.2 611 606 611
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000769         077200      ADD PASS-COUNTER TO ERROR-HOLD.                             IX2154.2 609 611
   000770         077300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   IX2154.2
   000771         077400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IX2154.2 609 671
   000772         077500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IX2154.2 611 673
   000773         077600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IX2154.2 670 656
   000774         077700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IX2154.2 653 180 795
   000775         077800  END-ROUTINE-12.                                                 IX2154.2
   000776         077900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IX2154.2 659
   000777         078000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IX2154.2 607 IMP
   000778      1  078100         MOVE "NO " TO ERROR-TOTAL                                IX2154.2 657
   000779         078200         ELSE                                                     IX2154.2
   000780      1  078300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IX2154.2 607 657
   000781         078400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IX2154.2 653 180
   000782         078500     PERFORM WRITE-LINE.                                          IX2154.2 795
   000783         078600 END-ROUTINE-13.                                                  IX2154.2
   000784         078700     IF DELETE-COUNTER IS EQUAL TO ZERO                           IX2154.2 606 IMP
   000785      1  078800         MOVE "NO " TO ERROR-TOTAL  ELSE                          IX2154.2 657
   000786      1  078900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IX2154.2 606 657
   000787         079000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IX2154.2 659
   000788         079100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2154.2 653 180 795
   000789         079200      IF   INSPECT-COUNTER EQUAL TO ZERO                          IX2154.2 608 IMP
   000790      1  079300          MOVE "NO " TO ERROR-TOTAL                               IX2154.2 657
   000791      1  079400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IX2154.2 608 657
   000792         079500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IX2154.2 659
   000793         079600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IX2154.2 653 180 795
   000794         079700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IX2154.2 661 180 795
   000795         079800 WRITE-LINE.                                                      IX2154.2
   000796         079900     ADD 1 TO RECORD-COUNT.                                       IX2154.2 613
   000797         080000     IF RECORD-COUNT GREATER 42                                   IX2154.2 613
   000798      1  080100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IX2154.2 180 612
   000799      1  080200         MOVE SPACE TO DUMMY-RECORD                               IX2154.2 IMP 180
   000800      1  080300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IX2154.2 180
   000801      1  080400         MOVE CCVS-H-1  TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2154.2 615 180 811
   000802      1  080500         MOVE CCVS-H-2A TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES    IX2154.2 620 180 811
   000803      1  080600         MOVE CCVS-H-2B TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2154.2 629 180 811
   000804      1  080700         MOVE CCVS-H-3  TO DUMMY-RECORD PERFORM WRT-LN 3 TIMES    IX2154.2 641 180 811
   000805      1  080800         MOVE CCVS-C-1  TO DUMMY-RECORD PERFORM WRT-LN            IX2154.2 593 180 811
   000806      1  080900         MOVE CCVS-C-2  TO DUMMY-RECORD PERFORM WRT-LN            IX2154.2 598 180 811
   000807      1  081000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IX2154.2 685 180 811
   000808      1  081100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IX2154.2 612 180
   000809      1  081200         MOVE ZERO TO RECORD-COUNT.                               IX2154.2 IMP 613
   000810         081300     PERFORM WRT-LN.                                              IX2154.2 811
   000811         081400 WRT-LN.                                                          IX2154.2
   000812         081500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IX2154.2 180
   000813         081600     MOVE SPACE TO DUMMY-RECORD.                                  IX2154.2 IMP 180
   000814         081700 BLANK-LINE-PRINT.                                                IX2154.2
   000815         081800     PERFORM WRT-LN.                                              IX2154.2 811
   000816         081900 FAIL-ROUTINE.                                                    IX2154.2
   000817         082000     IF     COMPUTED-X NOT EQUAL TO SPACE                         IX2154.2 568 IMP
   000818      1  082100            GO TO   FAIL-ROUTINE-WRITE.                           IX2154.2 825
   000819         082200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IX2154.2 582 IMP 825
   000820         082300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2154.2 614 684
   000821         082400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IX2154.2 679
   000822         082500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2154.2 676 180 795
   000823         082600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2154.2 IMP 684
   000824         082700     GO TO  FAIL-ROUTINE-EX.                                      IX2154.2 830
   000825         082800 FAIL-ROUTINE-WRITE.                                              IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000826         082900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         IX2154.2 564 179 795
   000827         083000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 IX2154.2 614 592
   000828         083100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. IX2154.2 579 179 795
   000829         083200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IX2154.2 IMP 592
   000830         083300 FAIL-ROUTINE-EX. EXIT.                                           IX2154.2
   000831         083400 BAIL-OUT.                                                        IX2154.2
   000832         083500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IX2154.2 569 IMP 834
   000833         083600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IX2154.2 583 IMP 839
   000834         083700 BAIL-OUT-WRITE.                                                  IX2154.2
   000835         083800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  IX2154.2 583 683 569 681
   000836         083900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IX2154.2 614 684
   000837         084000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IX2154.2 676 180 795
   000838         084100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IX2154.2 IMP 684
   000839         084200 BAIL-OUT-EX. EXIT.                                               IX2154.2
   000840         084300 CCVS1-EXIT.                                                      IX2154.2
   000841         084400     EXIT.                                                        IX2154.2
   000842         084500 SECT-0001-IX215A SECTION.                                        IX2154.2
   000843         084600 WRITE-INT-GF-01.                                                 IX2154.2
   000844         084700     OPEN    OUTPUT IX-FD1.                                       IX2154.2 181
   000845         084800     MOVE    "IX-FD1" TO XFILE-NAME           (1).                IX2154.2 519
   000846         084900     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2154.2 521
   000847         085000     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2154.2 IMP 525
   000848         085100     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2154.2 535
   000849         085200     MOVE "IX215"     TO  XPROGRAM-NAME       (1).                IX2154.2 531
   000850         085300     MOVE    240      TO  XRECORD-LENGTH      (1).                IX2154.2 533
   000851         085400     MOVE    001      TO  XBLOCK-SIZE         (1).                IX2154.2 537
   000852         085500     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2154.2 541
   000853         085600     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2154.2 543
   000854         085700     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2154.2 539
   000855         085800     MOVE    "CREATE-FILE-FD1" TO FEATURE.                        IX2154.2 554
   000856         085900     MOVE    "WRITE-TEST-GF-01" TO PAR-NAME.                      IX2154.2 558
   000857         086000     MOVE    ZERO TO KEYSUB.                                      IX2154.2 IMP 337
   000858         086100     MOVE    ZERO TO INVKEY-COUNTER.                              IX2154.2 IMP 338
   000859         086200 WRITE-INIT-GF-01-01.                                             IX2154.2
   000860         086300     PERFORM WRITE-TEST-GF-01-R1 50 TIMES.                        IX2154.2 864
   000861         086400     PERFORM WRITE-TEST-GF-01-R2 125 TIMES.                       IX2154.2 877
   000862         086500     PERFORM WRITE-TEST-GF-01-R1 25 TIMES.                        IX2154.2 864
   000863         086600     GO TO   WRITE-TEST-GF-01.                                    IX2154.2 889
   000864         086700 WRITE-TEST-GF-01-R1.                                             IX2154.2
   000865         086800     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   000866         086900     ADD     001  TO  KEYSUB.                                     IX2154.2 337
   000867         087000     MOVE    RECKEY-VALUE (KEYSUB) TO FDW-RECKEY-1-13.            IX2154.2 497 337 315
   000868         087100     MOVE    ALTKEY1-VALUE (KEYSUB) TO FDW-ALTKEY1-1-20.          IX2154.2 498 337 320
   000869         087200     MOVE    ALTKEY2-VALUE (KEYSUB) TO FDW-ALTKEY2-1-20.          IX2154.2 499 337 328
   000870         087300     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
   000871         087400     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   000872         087500     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   000873         087600     MOVE    FILE-RECORD-INFO (1)  TO IX-FD1R1-F-G-240.           IX2154.2 516 185
   000874         087700     WRITE   IX-FD1R1-F-G-240                                     IX2154.2 185
   000875      1  087800                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   000876         087900     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2154.2 336
   000877         088000 WRITE-TEST-GF-01-R2.                                             IX2154.2
   000878         088100     ADD     002  TO FDW-RECKEY-11-13.                            IX2154.2 317
   000879         088200     ADD     002 TO FDW-ALTKEY1-11-13.                            IX2154.2 324
   000880         088300     SUBTRACT  002 FROM FDW-ALTKEY2-11-13.                        IX2154.2 332
   000881         088400     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   000882         088500     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000883         088600     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   000884         088700     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   000885         088800     MOVE    FILE-RECORD-INFO (1) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   000886         088900     WRITE   IX-FD1R1-F-G-240                                     IX2154.2 185
   000887      1  089000                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   000888         089100     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2154.2 336
   000889         089200 WRITE-TEST-GF-01.                                                IX2154.2
   000890         089300     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2154.2 338 336
   000891         089400             GIVING RECORDS-WRITTEN.                              IX2154.2 339
   000892         089500     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2154.2 339
   000893      1  089600             PERFORM  PASS                                        IX2154.2 737
   000894      1  089700             MOVE "FILE IX-FD1 CREATED (200 RECORDS)" TO RE-MARK  IX2154.2 563
   000895      1  089800     ELSE    PERFORM FAIL                                         IX2154.2 738
   000896      1  089900             MOVE                                                 IX2154.2
   000897      1  090000       "IX-41;WRONG NUMBER OF RECORDS WRITTEN (MAY ALREADY EXIST)"IX2154.2
   000898      1  090100            TO  RE-MARK                                           IX2154.2 563
   000899      1  090200             MOVE RECORDS-WRITTEN TO COMPUTED-18V0.               IX2154.2 339 576
   000900         090300     GO TO   WRITE-TEST-GF-01-END.                                IX2154.2 903
   000901         090400 WRITE-DELETE-GF-01.                                              IX2154.2
   000902         090500     PERFORM DE-LETE.                                             IX2154.2 739
   000903         090600 WRITE-TEST-GF-01-END.                                            IX2154.2
   000904         090700     PERFORM  PRINT-DETAIL.                                       IX2154.2 741
   000905         090800     CLOSE   IX-FD1.                                              IX2154.2 181
   000906         090900 READ-INIT-F1-01.                                                 IX2154.2
   000907         091000     OPEN    INPUT  IX-FD1.                                       IX2154.2 181
   000908         091100     MOVE    "READ-TEST-F1-01" TO PAR-NAME.                       IX2154.2 558
   000909         091200     MOVE    "READ FILE IX-FD1" TO FEATURE.                       IX2154.2 554
   000910         091300     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2154.2 IMP 336
   000911         091400     MOVE    02   TO RECKEY-NUM.                                  IX2154.2 340
   000912         091500     MOVE    002 TO ALTKEY1-NUM.                                  IX2154.2 341
   000913         091600 READ-TEST-F1-01-R1.                                              IX2154.2
   000914         091700     READ    IX-FD1 NEXT RECORD AT END  GO TO READ-TEST-F1-01.    IX2154.2 181 928
   000915         091800     MOVE    IX-REC-KEY-AREA TO WRK-FDW-RECKEY.                   IX2154.2 189 314
   000916         091900     MOVE    IX-ALT-KEY1-AREA TO WRK-FDW-ALTKEY1.                 IX2154.2 203 319
   000917         092000     IF      FDW-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2154.2 317 340
   000918         092100             AND FDW-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2154.2 324 341
   000919      1  092200             NEXT SENTENCE                                        IX2154.2
   000920         092300             ELSE                                                 IX2154.2
   000921      1  092400             PERFORM  READ-FAIL-F1-01.                            IX2154.2 939
   000922         092500     IF      EXCUT-COUNTER-06V00 NOT LESS THAN 200                IX2154.2 336
   000923      1  092600             GO TO READ-TEST-F1-01.                               IX2154.2 928
   000924         092700     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2154.2 336
   000925         092800     ADD     002  TO RECKEY-NUM                                   IX2154.2 340
   000926         092900     ADD     002  TO ALTKEY1-NUM.                                 IX2154.2 341
   000927         093000     GO TO   READ-TEST-F1-01-R1.                                  IX2154.2 913
   000928         093100 READ-TEST-F1-01.                                                 IX2154.2
   000929         093200     IF      FAIL-SW EQUAL TO 1 GO TO READ-EXIT-F1-01.            IX2154.2 343 945
   000930         093300     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2154.2 336
   000931      1  093400             PERFORM PASS                                         IX2154.2 737
   000932      1  093500             MOVE "200 RECORDS VERIFIED" TO RE-MARK               IX2154.2 563
   000933      1  093600     ELSE    PERFORM FAIL                                         IX2154.2 738
   000934      1  093700     MOVE "INCORRECT NUMBER OF RECORDS; IX-41 OR IX-28" TO RE-MARKIX2154.2 563
   000935      1  093800             MOVE 200 TO CORRECT-18V0                             IX2154.2 589
   000936      1  093900             MOVE EXCUT-COUNTER-06V00 TO COMPUTED-18V0.           IX2154.2 336 576
   000937         094000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   000938         094100     GO TO   READ-EXIT-F1-01.                                     IX2154.2 945
   000939         094200 READ-FAIL-F1-01.                                                 IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000940         094300     MOVE 1 TO FAIL-SW.                                           IX2154.2 343
   000941         094400     PERFORM FAIL.                                                IX2154.2 738
   000942         094500     MOVE    FDW-RECKEY-11-13  TO COMPUTED-18V0.                  IX2154.2 317 576
   000943         094600     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2154.2 340 589
   000944         094700     MOVE "READ-FAIL-F1-01; IX-41 OR IX-28" TO RE-MARK.           IX2154.2 563
   000945         094800 READ-EXIT-F1-01.                                                 IX2154.2
   000946         094900     CLOSE   IX-FD1.                                              IX2154.2 181
   000947         095000 START-INIT.                                                      IX2154.2
   000948         095100     OPEN    I-O  IX-FD1.                                         IX2154.2 181
   000949         095200     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   000950         095300     MOVE    "START-TEST-GF-01" TO PAR-NAME.                      IX2154.2 558
   000951         095400     MOVE    "START REDF REC-KEY" TO FEATURE.                     IX2154.2 554
   000952         095500     MOVE    "BBBBBBBBBC002" TO FDW-RECKEY-1-13.                  IX2154.2 315
   000953         095600     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   000954         095700 START-TEST-GF-01.                                                IX2154.2
   000955         095800     DELETE  IX-FD1 INVALID KEY                                   IX2154.2 181
   000956      1  095900             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   000957      1  096000             GO TO START-FAIL-GF-01.                              IX2154.2 974
   000958         096100     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   000959         096200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   000960      1  096300             GO TO START-DELETE-GF-01.                            IX2154.2 979
   000961         096400     MOVE    "BBBBBBBBBC002" TO FDW-RECKEY-1-13.                  IX2154.2 315
   000962         096500     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   000963         096600     START   IX-FD1                                               IX2154.2 181
   000964         096700                    KEY IS EQUAL TO IX-REDF-RECKEY                IX2154.2 195
   000965      1  096800          INVALID KEY    PERFORM PASS                             IX2154.2 737
   000966      1  096900             MOVE "OK.; INVALID KEY ON START OF DELETED RECORD"   IX2154.2
   000967      1  097000                  TO RE-MARK                                      IX2154.2 563
   000968      1  097100             GO TO START-WRITE-GF-01.                             IX2154.2 981
   000969         097200     READ    IX-FD1 NEXT RECORD  AT END                           IX2154.2 181
   000970      1  097300             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   000971      1  097400             GO TO START-FAIL-GF-01.                              IX2154.2 974
   000972         097500     MOVE    IX-FD1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2154.2 185 516
   000973         097600     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   000974         097700 START-FAIL-GF-01.                                                IX2154.2
   000975         097800     PERFORM FAIL.                                                IX2154.2 738
   000976         097900     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   000977         098000     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK. IX2154.2 563
   000978         098100     GO TO   START-WRITE-GF-01.                                   IX2154.2 981
   000979         098200 START-DELETE-GF-01.                                              IX2154.2
   000980         098300     PERFORM DE-LETE.                                             IX2154.2 739
   000981         098400 START-WRITE-GF-01.                                               IX2154.2
   000982         098500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   000983         098600 START-INIT-GF-02.                                                IX2154.2
   000984         098700     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   000985         098800     MOVE "START-TEST-GF-02" TO PAR-NAME.                         IX2154.2 558
   000986         098900     MOVE    "FGGGGGGGGG098" TO FDW-RECKEY-1-13.                  IX2154.2 315
   000987         099000     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   000988         099100 START-TEST-GF-02.                                                IX2154.2
   000989         099200     DELETE  IX-FD1 INVALID KEY                                   IX2154.2 181
   000990      1  099300             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   000991      1  099400             GO TO START-FAIL-GF-02.                              IX2154.2 1008
   000992         099500     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   000993         099600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   000994      1  099700             GO TO START-DELETE-GF-02.                            IX2154.2 1013
   000995         099800     MOVE    "FGGGGGGAAA002" TO FDW-RECKEY-1-13.                  IX2154.2 315
   000996         099900     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000997         100000     START   IX-FD1                                               IX2154.2 181
   000998         100100                    KEY IS EQUAL TO R-RECKEY-1-7                  IX2154.2 196
   000999      1  100200          INVALID KEY    PERFORM PASS                             IX2154.2 737
   001000      1  100300             MOVE "OK.; INVALID KEY ON START OF DELETED RECORD"   IX2154.2
   001001      1  100400                  TO RE-MARK                                      IX2154.2 563
   001002      1  100500             GO TO START-WRITE-GF-02.                             IX2154.2 1015
   001003         100600     READ    IX-FD1 NEXT RECORD  AT END                           IX2154.2 181
   001004      1  100700             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001005      1  100800             GO TO START-FAIL-GF-02.                              IX2154.2 1008
   001006         100900     MOVE    IX-FD1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2154.2 185 516
   001007         101000     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   001008         101100 START-FAIL-GF-02.                                                IX2154.2
   001009         101200     PERFORM FAIL.                                                IX2154.2 738
   001010         101300     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   001011         101400     MOVE "IX-28 OR IX-36; WRONG RECORD NUMBER FOUND" TO RE-MARK. IX2154.2 563
   001012         101500     GO TO   START-WRITE-GF-02.                                   IX2154.2 1015
   001013         101600 START-DELETE-GF-02.                                              IX2154.2
   001014         101700     PERFORM DE-LETE.                                             IX2154.2 739
   001015         101800 START-WRITE-GF-02.                                               IX2154.2
   001016         101900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001017         102000 START-INIT-GF-03.                                                IX2154.2
   001018         102100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001019         102200     MOVE "START-TEST-GF-03" TO PAR-NAME.                         IX2154.2 558
   001020         102300     MOVE    "UUUUUUUUUU400" TO FDW-RECKEY-1-13.                  IX2154.2 315
   001021         102400     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   001022         102500 START-TEST-GF-03.                                                IX2154.2
   001023         102600     DELETE  IX-FD1 INVALID KEY                                   IX2154.2 181
   001024      1  102700             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   001025      1  102800             GO TO START-FAIL-GF-03.                              IX2154.2 1042
   001026         102900     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001027         103000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001028      1  103100             GO TO START-DELETE-GF-03.                            IX2154.2 1047
   001029         103200     MOVE    "UUUUURRRRR000" TO FDW-RECKEY-1-13.                  IX2154.2 315
   001030         103300     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   001031         103400     START   IX-FD1                                               IX2154.2 181
   001032         103500                    KEY IS EQUAL TO R-RECKEY-1-5                  IX2154.2 198
   001033      1  103600          INVALID KEY    PERFORM PASS                             IX2154.2 737
   001034      1  103700             MOVE "OK.; INVALID KEY ON START OF DELETED RECORD"   IX2154.2
   001035      1  103800                  TO RE-MARK                                      IX2154.2 563
   001036      1  103900             GO TO START-WRITE-GF-03.                             IX2154.2 1049
   001037         104000     READ    IX-FD1 NEXT RECORD  AT END                           IX2154.2 181
   001038      1  104100             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001039      1  104200             GO TO START-FAIL-GF-03.                              IX2154.2 1042
   001040         104300     MOVE    IX-FD1R1-F-G-240  TO  FILE-RECORD-INFO (1).          IX2154.2 185 516
   001041         104400     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   001042         104500 START-FAIL-GF-03.                                                IX2154.2
   001043         104600     PERFORM FAIL.                                                IX2154.2 738
   001044         104700     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   001045         104800     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK. IX2154.2 563
   001046         104900     GO TO   START-WRITE-GF-03.                                   IX2154.2 1049
   001047         105000 START-DELETE-GF-03.                                              IX2154.2
   001048         105100     PERFORM DE-LETE.                                             IX2154.2 739
   001049         105200 START-WRITE-GF-03.                                               IX2154.2
   001050         105300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001051         105400 START-INIT-GF-04.                                                IX2154.2
   001052         105500     MOVE    "START REDF ALT-KEY-1" TO FEATURE.                   IX2154.2 554
   001053         105600     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001054         105700     MOVE "START-TEST-GF-04" TO PAR-NAME.                         IX2154.2 558
   001055         105800     MOVE    "TUUUUUUUUU398"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001056         105900     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001057         106000 START-TEST-GF-04.                                                IX2154.2
   001058         106100     READ    IX-FD1                                               IX2154.2 181
   001059         106200                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001060         106300         INVALID KEY                                              IX2154.2
   001061      1  106400     MOVE "ERROR IX-28 F2; INVALID KEY PATH TAKEN ON INITIAL READ"IX2154.2
   001062      1  106500                   TO RE-MARK                                     IX2154.2 563
   001063      1  106600             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001064      1  106700             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001065         106800     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001066         106900     IF      XRECORD-NUMBER (3) NOT EQUAL TO 199                  IX2154.2 525
   001067      1  107000     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK  IX2154.2 563
   001068      1  107100             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001069      1  107200             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001070         107300     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001071         107400     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001072      1  107500             GO TO START-DELETE-GF-04.                            IX2154.2 1114
   001073         107600     MOVE    "EEEEEEEEEE000ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001074         107700     MOVE    "WWWWWWWWWW400ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001075         107800     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001076         107900     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001077      1  108000             MOVE "ERROR IX-33; INVALID KEY PATH TAKEN ON REWRITE"IX2154.2
   001078      1  108100                    TO RE-MARK                                    IX2154.2 563
   001079      1  108200             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001080      1  108300             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001081         108400     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001082         108500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001083      1  108600             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001084         108700     MOVE    "EEEEEEEEEE000ALTKEY1"  TO FDW-ALTKEY1-1-20.         IX2154.2 320
   001085         108800     MOVE    WRK-FDW-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2154.2 319 203
   001086         108900     START   IX-FD1                                               IX2154.2 181
   001087         109000                    KEY IS EQUAL TO IX-REDF-ALTKEY1               IX2154.2 210
   001088         109100          INVALID KEY                                             IX2154.2
   001089      1  109200             MOVE "ERROR IX-36; INVALID KEY PATH TAKEN ON START"  IX2154.2
   001090      1  109300             TO RE-MARK                                           IX2154.2 563
   001091      1  109400             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001092      1  109500             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001093         109600     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001094      1  109700            MOVE "IX-28 F1; AT END ON READ AFTER START" TO RE-MARKIX2154.2 563
   001095      1  109800             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001096      1  109900             GO TO START-FAIL-GF-04.                              IX2154.2 1109
   001097         110000     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001098         110100     IF      XRECORD-NUMBER (1) EQUAL TO 199                      IX2154.2 525
   001099      1  110200             PERFORM PASS                                         IX2154.2 737
   001100      1  110300             GO TO START-WRITE-GF-04.                             IX2154.2 1116
   001101         110400     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001102         110500     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001103         110600     MOVE    "EEEEEEEEEE000ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   001104         110700     MOVE "IX-28 F1; INCORRECT ALTERNATE RECORD KEY1"  TO RE-MARK.IX2154.2 563
   001105         110800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001106         110900     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   001107         111000             TO RE-MARK.                                          IX2154.2 563
   001108         111100     MOVE XRECORD-NUMBER (1) TO COMPUTED-18V0.                    IX2154.2 525 576
   001109         111200 START-FAIL-GF-04.                                                IX2154.2
   001110         111300     MOVE "START-TEST-GF-04" TO PAR-NAME.                         IX2154.2 558
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001111         111400     PERFORM FAIL.                                                IX2154.2 738
   001112         111500     MOVE    199  TO CORRECT-18V0.                                IX2154.2 589
   001113         111600     GO TO   START-WRITE-GF-04.                                   IX2154.2 1116
   001114         111700 START-DELETE-GF-04.                                              IX2154.2
   001115         111800     PERFORM DE-LETE.                                             IX2154.2 739
   001116         111900 START-WRITE-GF-04.                                               IX2154.2
   001117         112000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001118         112100 START-INIT-GF-05.                                                IX2154.2
   001119         112200     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001120         112300     MOVE "START-TEST-GF-05" TO PAR-NAME.                         IX2154.2 558
   001121         112400     MOVE    "BCCCCCCCCC018"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001122         112500     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001123         112600 START-TEST-GF-05.                                                IX2154.2
   001124         112700     READ    IX-FD1                                               IX2154.2 181
   001125         112800                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001126         112900         INVALID KEY                                              IX2154.2
   001127      1  113000             MOVE "ERROR IX-33; INVALID KEY PATH TAKEN ON READ"   IX2154.2
   001128      1  113100                    TO RE-MARK                                    IX2154.2 563
   001129      1  113200             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001130      1  113300             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001131         113400     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001132         113500     IF      XRECORD-NUMBER (3) NOT EQUAL TO 9                    IX2154.2 525
   001133      1  113600             MOVE 9 TO RECNO                                      IX2154.2 335
   001134      1  113700             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001135      1  113800     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK  IX2154.2 563
   001136      1  113900             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001137      1  114000             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001138         114100     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001139         114200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001140      1  114300             GO TO START-DELETE-GF-05.                            IX2154.2 1180
   001141         114400     MOVE    "AAAAAAAAAA400ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001142         114500     MOVE    "ZZZZZZZZZZ002ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001143         114600     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001144         114700     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001145      1  114800      MOVE "IX-33;  INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001146      1  114900             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001147      1  115000             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001148         115100     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001149         115200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001150      1  115300             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001151         115400     MOVE    "AAAAAANNNN200ALTKEY1"  TO FDW-ALTKEY1-1-20.         IX2154.2 320
   001152         115500     MOVE    WRK-FDW-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2154.2 319 203
   001153         115600     START   IX-FD1                                               IX2154.2 181
   001154         115700                    KEY IS EQUAL TO R-ALTKEY1-1-6                 IX2154.2 211
   001155         115800          INVALID KEY                                             IX2154.2
   001156      1  115900      MOVE "IX-36; INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001157      1  116000             TO RE-MARK                                           IX2154.2 563
   001158      1  116100             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001159      1  116200             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001160         116300     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001161      1  116400      MOVE "IX-28 F1; AT END ON READ AFTER START" TO RE-MARK      IX2154.2 563
   001162      1  116500             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001163      1  116600             GO TO START-FAIL-GF-05.                              IX2154.2 1176
   001164         116700     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001165         116800     IF      XRECORD-NUMBER (1) EQUAL TO 9                        IX2154.2 525
   001166      1  116900             PERFORM PASS                                         IX2154.2 737
   001167      1  117000             GO TO START-WRITE-GF-05.                             IX2154.2 1182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001168         117100     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001169         117200     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001170         117300     MOVE    "AAAAAAAAAA400ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   001171         117400     MOVE    "INCORRECT ALTERNATE RECORD KEY1"  TO RE-MARK.       IX2154.2 563
   001172         117500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001173         117600     MOVE "IX-28 F1;WRONG RECORD NUMB FOUND READ ALTERN. REC KEY1"IX2154.2
   001174         117700             TO RE-MARK.                                          IX2154.2 563
   001175         117800     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001176         117900 START-FAIL-GF-05.                                                IX2154.2
   001177         118000     PERFORM FAIL.                                                IX2154.2 738
   001178         118100     MOVE    9  TO CORRECT-18V0.                                  IX2154.2 589
   001179         118200     GO TO   START-WRITE-GF-05.                                   IX2154.2 1182
   001180         118300 START-DELETE-GF-05.                                              IX2154.2
   001181         118400     PERFORM DE-LETE.                                             IX2154.2 739
   001182         118500 START-WRITE-GF-05.                                               IX2154.2
   001183         118600     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001184         118700 START-INIT-GF-06.                                                IX2154.2
   001185         118800     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001186         118900     MOVE "START-TEST-GF-06" TO PAR-NAME.                         IX2154.2 558
   001187         119000     MOVE    "GGGGGGGGGG100"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001188         119100     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001189         119200 START-TEST-GF-06.                                                IX2154.2
   001190         119300     READ    IX-FD1                                               IX2154.2 181
   001191         119400                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001192         119500         INVALID KEY                                              IX2154.2
   001193      1  119600             MOVE "ERROR IX-28; INVALID KEY PATH TAKEN ON READ"   IX2154.2
   001194      1  119700                    TO RE-MARK                                    IX2154.2 563
   001195      1  119800             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001196         119900     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001197         120000     IF      XRECORD-NUMBER (3) NOT EQUAL TO 50                   IX2154.2 525
   001198      1  120100             MOVE 50 TO RECNO                                     IX2154.2 335
   001199      1  120200             MOVE  "WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001200      1  120300             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001201      1  120400             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001202         120500     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001203         120600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001204      1  120700             GO TO START-DELETE-GF-06.                            IX2154.2 1247
   001205         120800     MOVE    "AAGGGGGGGG100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001206         120900     MOVE    "GGGGGGGGGG100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001207         121000     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001208         121100     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001209      1  121200             MOVE "ERROR IX-33; INVALID KEY PATH TAKEN ON REWRITE"IX2154.2
   001210      1  121300                    TO RE-MARK                                    IX2154.2 563
   001211      1  121400             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001212      1  121500             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001213         121600                                                                  IX2154.2
   001214         121700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001215      1  121800             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001216         121900     MOVE    "AAGGZZZZZZ100ALTKEY1"  TO FDW-ALTKEY1-1-20.         IX2154.2 320
   001217         122000     MOVE    WRK-FDW-ALTKEY1  TO IX-ALT-KEY1-AREA.                IX2154.2 319 203
   001218         122100     START   IX-FD1                                               IX2154.2 181
   001219         122200                    KEY IS EQUAL TO R-ALTKEY1-1-4                 IX2154.2 213
   001220         122300          INVALID KEY                                             IX2154.2
   001221      1  122400             MOVE "ERROR IX-36; INVALID KEY PATH TAKEN ON START"  IX2154.2
   001222      1  122500                    TO RE-MARK                                    IX2154.2 563
   001223      1  122600             MOVE "INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001224      1  122700             TO RE-MARK                                           IX2154.2 563
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001225      1  122800             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001226      1  122900             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001227         123000     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001228      1  123100           MOVE "IX-28 F1; AT END ON READ AFTER START" TO RE-MARK IX2154.2 563
   001229      1  123200             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001230      1  123300             GO TO START-FAIL-GF-06.                              IX2154.2 1243
   001231         123400     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001232         123500     IF      XRECORD-NUMBER (1) EQUAL TO 50                       IX2154.2 525
   001233      1  123600             PERFORM PASS                                         IX2154.2 737
   001234      1  123700             GO TO START-WRITE-GF-06.                             IX2154.2 1249
   001235         123800     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001236         123900     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001237         124000     MOVE    "AAGGGGGGGG100ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   001238         124100     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   001239         124200     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001240         124300     MOVE "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"  IX2154.2
   001241         124400             TO RE-MARK.                                          IX2154.2 563
   001242         124500     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001243         124600 START-FAIL-GF-06.                                                IX2154.2
   001244         124700     PERFORM FAIL.                                                IX2154.2 738
   001245         124800     MOVE    50  TO CORRECT-18V0.                                 IX2154.2 589
   001246         124900     GO TO   START-WRITE-GF-06.                                   IX2154.2 1249
   001247         125000 START-DELETE-GF-06.                                              IX2154.2
   001248         125100     PERFORM DE-LETE.                                             IX2154.2 739
   001249         125200 START-WRITE-GF-06.                                               IX2154.2
   001250         125300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001251         125400 START-INIT-GF-07.                                                IX2154.2
   001252         125500     MOVE    "START REDF ALT-KEY-2" TO FEATURE.                   IX2154.2 554
   001253         125600     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001254         125700     MOVE "START-TEST-GF-07" TO PAR-NAME.                         IX2154.2 558
   001255         125800     MOVE    "DDDDDEEEEE050"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001256         125900     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001257         126000 START-TEST-GF-07.                                                IX2154.2
   001258         126100     READ    IX-FD1                                               IX2154.2 181
   001259         126200                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001260         126300         INVALID KEY                                              IX2154.2
   001261      1  126400      MOVE "IX-28 F2; INVALID KEY PATH TAKEN ON INITIAL READ"     IX2154.2
   001262      1  126500                   TO RE-MARK                                     IX2154.2 563
   001263      1  126600             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001264      1  126700             GO TO START-FAIL-GF-07.                              IX2154.2 1310
   001265         126800     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001266         126900     IF      XRECORD-NUMBER (3) NOT EQUAL TO 25                   IX2154.2 525
   001267      1  127000             MOVE 25 TO RECNO                                     IX2154.2 335
   001268      1  127100             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001269      1  127200     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001270      1  127300             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001271      1  127400             GO TO START-FAIL-GF-07.                              IX2154.2 1310
   001272         127500     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001273         127600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001274      1  127700             GO TO START-DELETE-GF-07.                            IX2154.2 1314
   001275         127800     MOVE    "BCBCBCBCBC200ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001276         127900     MOVE    "CBCBCBCBCB100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001277         128000     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001278         128100     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001279      1  128200     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001280      1  128300             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001281      1  128400             GO TO START-FAIL-GF-07.                              IX2154.2 1310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001282         128500     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001283         128600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001284      1  128700             GO TO START-FAIL-GF-07.                              IX2154.2 1310
   001285         128800     MOVE    "CBCBCBCBCB100ALTKEY2"  TO FDW-ALTKEY2-1-20.         IX2154.2 328
   001286         128900     MOVE    WRK-FDW-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2154.2 327 219
   001287         129000     START   IX-FD1                                               IX2154.2 181
   001288         129100                    KEY IS EQUAL TO IX-REDF-ALTKEY2               IX2154.2 226
   001289         129200          INVALID KEY                                             IX2154.2
   001290      1  129300     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001291      1  129400             TO RE-MARK                                           IX2154.2 563
   001292      1  129500             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001293      1  129600             GO TO START-FAIL-GF-07.                              IX2154.2 1310
   001294         129700     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001295      1  129800      MOVE "IX-28; F1 AT END ON READ AFTER START" TO RE-MARK      IX2154.2 563
   001296      1  129900             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001297      1  130000             GO TO START-FAIL-GF-07.                              IX2154.2 1310
   001298         130100     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001299         130200     IF      XRECORD-NUMBER (1) EQUAL TO 25                       IX2154.2 525
   001300      1  130300             PERFORM PASS                                         IX2154.2 737
   001301      1  130400             GO TO START-WRITE-GF-07.                             IX2154.2 1316
   001302         130500     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   001303         130600     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   001304         130700     MOVE    "CBCBCBCBCB100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   001305         130800     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   001306         130900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001307         131000     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   001308         131100             TO RE-MARK.                                          IX2154.2 563
   001309         131200     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001310         131300 START-FAIL-GF-07.                                                IX2154.2
   001311         131400     PERFORM FAIL.                                                IX2154.2 738
   001312         131500     MOVE    25  TO CORRECT-18V0.                                 IX2154.2 589
   001313         131600     GO TO   START-WRITE-GF-07.                                   IX2154.2 1316
   001314         131700 START-DELETE-GF-07.                                              IX2154.2
   001315         131800     PERFORM DE-LETE.                                             IX2154.2 739
   001316         131900 START-WRITE-GF-07.                                               IX2154.2
   001317         132000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001318         132100 START-INIT-GF-08.                                                IX2154.2
   001319         132200     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001320         132300     MOVE "START-TEST-GF-08" TO PAR-NAME.                         IX2154.2 558
   001321         132400     MOVE    "RRRRSSSSSS352"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001322         132500     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001323         132600 START-TEST-GF-08.                                                IX2154.2
   001324         132700     READ    IX-FD1                                               IX2154.2 181
   001325         132800                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001326         132900         INVALID KEY                                              IX2154.2
   001327      1  133000      MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"      IX2154.2
   001328      1  133100          TO RE-MARK                                              IX2154.2 563
   001329      1  133200             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001330      1  133300             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001331         133400     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001332         133500     IF      XRECORD-NUMBER (3) NOT EQUAL TO 176                  IX2154.2 525
   001333      1  133600             MOVE 51 TO RECNO                                     IX2154.2 335
   001334      1  133700             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001335      1  133800     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001336      1  133900             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001337      1  134000             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001338         134100     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001339         134200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001340      1  134300             GO TO START-DELETE-GF-08.                            IX2154.2 1380
   001341         134400     MOVE    "DCDCDCDCDC100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001342         134500     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001343         134600     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001344         134700     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001345      1  134800     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001346      1  134900             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001347      1  135000             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001348         135100     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001349         135200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001350      1  135300             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001351         135400     MOVE    "DCDAAAAAAA250ALTKEY2"  TO FDW-ALTKEY2-1-20.         IX2154.2 328
   001352         135500     MOVE    WRK-FDW-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2154.2 327 219
   001353         135600     START   IX-FD1                                               IX2154.2 181
   001354         135700                    KEY IS EQUAL TO R-ALTKEY2-1-3                 IX2154.2 227
   001355         135800          INVALID KEY                                             IX2154.2
   001356      1  135900     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001357      1  136000             TO RE-MARK                                           IX2154.2 563
   001358      1  136100             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001359      1  136200             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001360         136300     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001361      1  136400     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001362      1  136500             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001363      1  136600             GO TO START-FAIL-GF-08.                              IX2154.2 1376
   001364         136700     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001365         136800     IF      XRECORD-NUMBER (1) EQUAL TO 176                      IX2154.2 525
   001366      1  136900             PERFORM PASS                                         IX2154.2 737
   001367      1  137000             GO TO START-WRITE-GF-08.                             IX2154.2 1382
   001368         137100     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   001369         137200     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   001370         137300     MOVE    "DCDCDCDCDC100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   001371         137400     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   001372         137500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001373         137600     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   001374         137700             TO RE-MARK.                                          IX2154.2 563
   001375         137800     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001376         137900 START-FAIL-GF-08.                                                IX2154.2
   001377         138000     PERFORM FAIL.                                                IX2154.2 738
   001378         138100     MOVE    176  TO CORRECT-18V0.                                IX2154.2 589
   001379         138200     GO TO   START-WRITE-GF-08.                                   IX2154.2 1382
   001380         138300 START-DELETE-GF-08.                                              IX2154.2
   001381         138400     PERFORM DE-LETE.                                             IX2154.2 739
   001382         138500 START-WRITE-GF-08.                                               IX2154.2
   001383         138600     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001384         138700 START-INIT-GF-09.                                                IX2154.2
   001385         138800     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001386         138900     MOVE "START-TEST-GF-09" TO PAR-NAME.                         IX2154.2 558
   001387         139000     MOVE    "BBBBBBCCCC008"  TO FDW-RECKEY-1-13.                 IX2154.2 315
   001388         139100     MOVE    WRK-FDW-RECKEY   TO IX-REC-KEY-AREA.                 IX2154.2 314 189
   001389         139200 START-TEST-GF-09.                                                IX2154.2
   001390         139300     READ    IX-FD1                                               IX2154.2 181
   001391         139400                     KEY IS IX-FD1-KEY                            IX2154.2 190
   001392         139500         INVALID KEY                                              IX2154.2
   001393      1  139600     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001394      1  139700                   TO RE-MARK                                     IX2154.2 563
   001395      1  139800             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001396      1  139900             MOVE 4 TO CORRECT-18V0                               IX2154.2 589
   001397      1  140000             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001398         140100     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (3).            IX2154.2 185 516
   001399         140200     IF      XRECORD-NUMBER (3) NOT EQUAL TO 4                    IX2154.2 525
   001400      1  140300             MOVE 4 TO RECNO                                      IX2154.2 335
   001401      1  140400             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001402      1  140500     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001403      1  140600             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001404      1  140700             MOVE 4 TO CORRECT-18V0                               IX2154.2 589
   001405      1  140800             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001406         140900     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001407         141000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001408      1  141100             GO TO START-DELETE-GF-09.                            IX2154.2 1471
   001409         141200     MOVE    "CDCDCDCDCD100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001410         141300     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001411         141400     MOVE    FILE-RECORD-INFO (3) TO IX-FD1R1-F-G-240.            IX2154.2 516 185
   001412         141500     REWRITE IX-FD1R1-F-G-240 INVALID KEY                         IX2154.2 185
   001413      1  141600     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001414      1  141700             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001415      1  141800             MOVE 4 TO CORRECT-18V0                               IX2154.2 589
   001416      1  141900             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001417         142000     PERFORM START-INIT-FD1 THRU START-INIT-FD1-EXIT.             IX2154.2 2722 2744
   001418         142100     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001419      1  142200             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001420         142300     MOVE    "DCZZZZZZZZ400ALTKEY2"  TO FDW-ALTKEY2-1-20.         IX2154.2 328
   001421         142400     MOVE    WRK-FDW-ALTKEY2  TO IX-ALT-KEY2-AREA.                IX2154.2 327 219
   001422         142500     START   IX-FD1                                               IX2154.2 181
   001423         142600                    KEY IS EQUAL TO R-ALTKEY2-1-2                 IX2154.2 229
   001424         142700          INVALID KEY                                             IX2154.2
   001425      1  142800     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001426      1  142900             TO RE-MARK                                           IX2154.2 563
   001427      1  143000             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001428      1  143100             MOVE 176 TO CORRECT-18V0                             IX2154.2 589
   001429      1  143200             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001430         143300     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001431      1  143400     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001432      1  143500             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001433      1  143600             MOVE 176 TO CORRECT-18V0                             IX2154.2 589
   001434      1  143700             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001435         143800     MOVE    IX-FD1R1-F-G-240  TO FILE-RECORD-INFO (1).           IX2154.2 185 516
   001436         143900     IF      XRECORD-NUMBER (1) NOT EQUAL TO 176                  IX2154.2 525
   001437      1  144000             MOVE ALTERNATE-KEY2 (1) TO WRK-FDW-ALTKEY2           IX2154.2 550 327
   001438      1  144100             MOVE FDW-ALTKEY2-1-20 TO COMPUTED-A                  IX2154.2 328 569
   001439      1  144200             MOVE "DCDCDCDCDC100" TO CORRECT-A                    IX2154.2 583
   001440      1  144300     MOVE                                                         IX2154.2
   001441      1  144400     "IX-28 OR IX-36; INCORR KEY FOUND ON FIRST READ DUPL KEYS"   IX2154.2
   001442      1  144500             TO RE-MARK                                           IX2154.2 563
   001443      1  144600             PERFORM PRINT-DETAIL                                 IX2154.2 741
   001444      1  144700     MOVE "WRONG RECORD NUMBER FOUND ON FIRST READ DUPLICATE KEYS"IX2154.2
   001445      1  144800             TO RE-MARK                                           IX2154.2 563
   001446      1  144900             MOVE XRECORD-NUMBER (1) TO COMPUTED-18V0             IX2154.2 525 576
   001447      1  145000             MOVE 176 TO CORRECT-18V0                             IX2154.2 589
   001448      1  145100             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001449         145200     READ    IX-FD1 NEXT RECORD AT END                            IX2154.2 181
   001450      1  145300     MOVE "IX-28;F1 AT END ON READ AFTER FIRST READ" TO RE-MARK   IX2154.2 563
   001451      1  145400             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001452      1  145500             MOVE 4 TO CORRECT-18V0                               IX2154.2 589
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001453      1  145600             GO TO START-FAIL-GF-09.                              IX2154.2 1468
   001454         145700     MOVE    IX-FD1R1-F-G-240 TO FILE-RECORD-INFO (1).            IX2154.2 185 516
   001455         145800     IF      XRECORD-NUMBER (1) EQUAL TO 4                        IX2154.2 525
   001456      1  145900             PERFORM PASS                                         IX2154.2 737
   001457      1  146000             PERFORM PRINT-DETAIL                                 IX2154.2 741
   001458      1  146100             GO TO START-WRITE-GF-09.                             IX2154.2 1473
   001459         146200     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   001460         146300     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001461         146400     MOVE    "DCDCDCDCDC100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   001462         146500     MOVE                                                         IX2154.2
   001463         146600     "IX-28OR IX-36; INCORR KEY FOUND ON SECOND READ DUPL.  KEYS" IX2154.2
   001464         146700             TO RE-MARK.                                          IX2154.2 563
   001465         146800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001466         146900     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001467         147000     MOVE    4 TO CORRECT-18V0.                                   IX2154.2 589
   001468         147100 START-FAIL-GF-09.                                                IX2154.2
   001469         147200     PERFORM FAIL.                                                IX2154.2 738
   001470         147300     GO TO   START-WRITE-GF-09.                                   IX2154.2 1473
   001471         147400 START-DELETE-GF-09.                                              IX2154.2
   001472         147500     PERFORM DE-LETE.                                             IX2154.2 739
   001473         147600 START-WRITE-GF-09.                                               IX2154.2
   001474         147700     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001475         147800 START-TERM-003.                                                  IX2154.2
   001476         147900     CLOSE   IX-FD1.                                              IX2154.2 181
   001477         148000 WRITE-INT-GF-02.                                                 IX2154.2
   001478         148100     OPEN    OUTPUT IX-FD2.                                       IX2154.2 234
   001479         148200     MOVE    "IX-FD2" TO XFILE-NAME           (1).                IX2154.2 519
   001480         148300     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2154.2 521
   001481         148400     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2154.2 IMP 525
   001482         148500     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2154.2 535
   001483         148600     MOVE "IX215"     TO  XPROGRAM-NAME       (1).                IX2154.2 531
   001484         148700     MOVE    241      TO  XRECORD-LENGTH      (1).                IX2154.2 533
   001485         148800     MOVE    004      TO  XBLOCK-SIZE         (1).                IX2154.2 537
   001486         148900     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2154.2 541
   001487         149000     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2154.2 543
   001488         149100     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2154.2 539
   001489         149200     MOVE    "CREATE-FILE-FD2" TO FEATURE.                        IX2154.2 554
   001490         149300     MOVE    "WRITE-TEST-GF-02" TO PAR-NAME.                      IX2154.2 558
   001491         149400     MOVE    ZERO TO KEYSUB.                                      IX2154.2 IMP 337
   001492         149500     MOVE    ZERO TO INVKEY-COUNTER.                              IX2154.2 IMP 338
   001493         149600     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2154.2 IMP 336
   001494         149700 WRITE-INIT-GF-02-01.                                             IX2154.2
   001495         149800     PERFORM WRITE-TEST-GF-02-R1 50 TIMES.                        IX2154.2 1499
   001496         149900     PERFORM WRITE-TEST-GF-02-R2 125 TIMES.                       IX2154.2 1512
   001497         150000     PERFORM WRITE-TEST-GF-02-R1 25 TIMES.                        IX2154.2 1499
   001498         150100     GO TO   WRITE-TEST-GF-02.                                    IX2154.2 1524
   001499         150200 WRITE-TEST-GF-02-R1.                                             IX2154.2
   001500         150300     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   001501         150400     ADD     001  TO  KEYSUB.                                     IX2154.2 337
   001502         150500     MOVE    RECKEY-VALUE (KEYSUB) TO FDW-RECKEY-1-13.            IX2154.2 497 337 315
   001503         150600     MOVE    ALTKEY1-VALUE (KEYSUB) TO FDW-ALTKEY1-1-20.          IX2154.2 498 337 320
   001504         150700     MOVE    ALTKEY2-VALUE (KEYSUB) TO FDW-ALTKEY2-1-20.          IX2154.2 499 337 328
   001505         150800     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
   001506         150900     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   001507         151000     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   001508         151100     MOVE    FILE-RECORD-INFO (1)  TO IX-FD2R1-F-G-241.           IX2154.2 516 239
   001509         151200     WRITE   IX-FD2R1-F-G-241                                     IX2154.2 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001510      1  151300                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   001511         151400     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2154.2 336
   001512         151500 WRITE-TEST-GF-02-R2.                                             IX2154.2
   001513         151600     ADD     002  TO FDW-RECKEY-11-13.                            IX2154.2 317
   001514         151700     ADD     002 TO FDW-ALTKEY1-11-13.                            IX2154.2 324
   001515         151800     SUBTRACT  002 FROM FDW-ALTKEY2-11-13.                        IX2154.2 332
   001516         151900     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   001517         152000     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
   001518         152100     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   001519         152200     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   001520         152300     MOVE    FILE-RECORD-INFO (1) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001521         152400     WRITE   IX-FD2R1-F-G-241                                     IX2154.2 239
   001522      1  152500                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   001523         152600     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2154.2 336
   001524         152700 WRITE-TEST-GF-02.                                                IX2154.2
   001525         152800     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2154.2 338 336
   001526         152900             GIVING RECORDS-WRITTEN.                              IX2154.2 339
   001527         153000     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2154.2 339
   001528      1  153100             PERFORM  PASS                                        IX2154.2 737
   001529      1  153200             MOVE "FILE IX-FD2 CREATED (200 RECORDS)" TO RE-MARK  IX2154.2 563
   001530      1  153300     ELSE    PERFORM FAIL                                         IX2154.2 738
   001531      1  153400             MOVE                                          "IX-41;IX2154.2
   001532      1  153500-       "WRONG NUMBER OF RECORDS WRITTEN (MAY ALREADY EXIST)"     IX2154.2
   001533      1  153600             TO RE-MARK                                           IX2154.2 563
   001534      1  153700             MOVE 200 TO CORRECT-18V0                             IX2154.2 589
   001535      1  153800             MOVE RECORDS-WRITTEN TO COMPUTED-18V0.               IX2154.2 339 576
   001536         153900     GO TO   WRITE-TEST-GF-02-END.                                IX2154.2 1539
   001537         154000 WRITE-DELETE-GF-02.                                              IX2154.2
   001538         154100     PERFORM DE-LETE.                                             IX2154.2 739
   001539         154200 WRITE-TEST-GF-02-END.                                            IX2154.2
   001540         154300     PERFORM  PRINT-DETAIL.                                       IX2154.2 741
   001541         154400     CLOSE   IX-FD2.                                              IX2154.2 234
   001542         154500 READ-INIT-F1-02.                                                 IX2154.2
   001543         154600     OPEN    INPUT  IX-FD2.                                       IX2154.2 234
   001544         154700     MOVE    "READ-TEST-F1-02" TO PAR-NAME.                       IX2154.2 558
   001545         154800     MOVE    "READ FILE IX-FD2" TO FEATURE.                       IX2154.2 554
   001546         154900     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2154.2 IMP 336
   001547         155000     MOVE    02   TO RECKEY-NUM.                                  IX2154.2 340
   001548         155100     MOVE    002 TO ALTKEY1-NUM.                                  IX2154.2 341
   001549         155200 READ-TEST-F1-02-R1.                                              IX2154.2
   001550         155300     READ    IX-FD2 NEXT RECORD AT END  GO TO READ-TEST-F1-02.    IX2154.2 234 1564
   001551         155400     MOVE    IX-FD2-KEY TO FDW-RECKEY-1-13.                       IX2154.2 249 315
   001552         155500     MOVE    IX-FD2-ALTKEY1 TO FDW-ALTKEY1-1-20.                  IX2154.2 265 320
   001553         155600     IF      FDW-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2154.2 317 340
   001554         155700             AND FDW-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2154.2 324 341
   001555      1  155800             NEXT SENTENCE                                        IX2154.2
   001556         155900             ELSE                                                 IX2154.2
   001557      1  156000             PERFORM  READ-FAIL-F1-02.                            IX2154.2 1576
   001558         156100     IF      EXCUT-COUNTER-06V00 NOT LESS THAN 200                IX2154.2 336
   001559      1  156200             GO TO READ-TEST-F1-02.                               IX2154.2 1564
   001560         156300     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2154.2 336
   001561         156400     ADD     002  TO RECKEY-NUM                                   IX2154.2 340
   001562         156500     ADD     002  TO ALTKEY1-NUM.                                 IX2154.2 341
   001563         156600     GO TO   READ-TEST-F1-02-R1.                                  IX2154.2 1549
   001564         156700 READ-TEST-F1-02.                                                 IX2154.2
   001565         156800     IF      FAIL-SW EQUAL TO 1 GO TO READ-EXIT-F1-02.            IX2154.2 343 1583
   001566         156900     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2154.2 336
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001567      1  157000             PERFORM PASS                                         IX2154.2 737
   001568      1  157100             MOVE "200 RECORDS VERIFIED" TO RE-MARK               IX2154.2 563
   001569      1  157200     ELSE    PERFORM FAIL                                         IX2154.2 738
   001570      1  157300             MOVE                                                 IX2154.2
   001571      1  157400          "INCORRECT NUMBER OF RECORDS; IX-28 OR IX-41" TO RE-MARKIX2154.2 563
   001572      1  157500             MOVE 200 TO CORRECT-18V0                             IX2154.2 589
   001573      1  157600             MOVE EXCUT-COUNTER-06V00 TO COMPUTED-18V0.           IX2154.2 336 576
   001574         157700     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001575         157800     GO TO   READ-EXIT-F1-02.                                     IX2154.2 1583
   001576         157900 READ-FAIL-F1-02.                                                 IX2154.2
   001577         158000     MOVE 1 TO FAIL-SW.                                           IX2154.2 343
   001578         158100     PERFORM FAIL.                                                IX2154.2 738
   001579         158200     MOVE    FDW-RECKEY-11-13  TO COMPUTED-18V0.                  IX2154.2 317 576
   001580         158300     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2154.2 340 589
   001581         158400     MOVE "NUM EMBEDDED IN RECKEY; IX-28 OR IX-41"  TO RE-MARK.   IX2154.2 563
   001582         158500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001583         158600 READ-EXIT-F1-02.                                                 IX2154.2
   001584         158700     CLOSE   IX-FD2.                                              IX2154.2 234
   001585         158800 START-INIT-GF-10.                                                IX2154.2
   001586         158900     OPEN    I-O  IX-FD2.                                         IX2154.2 234
   001587         159000     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001588         159100     MOVE "START-TEST-GF-10" TO PAR-NAME.                         IX2154.2 558
   001589         159200     MOVE    "START REDF REC-KEY" TO FEATURE.                     IX2154.2 554
   001590         159300     MOVE    "TTTTUUUUUU392" TO IX-FD2-KEY.                       IX2154.2 249
   001591         159400 START-TEST-GF-10.                                                IX2154.2
   001592         159500     DELETE  IX-FD2 INVALID KEY                                   IX2154.2 234
   001593      1  159600             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   001594      1  159700             GO TO START-FAIL-GF-10.                              IX2154.2 1607
   001595         159800     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001596         159900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001597      1  160000             GO TO START-DELETE-GF-10.                            IX2154.2 1612
   001598         160100     MOVE    "TTTTUUUUUU392" TO IX-FD2-KEY.                       IX2154.2 249
   001599         160200     START   IX-FD2 KEY IS EQUAL TO IX-FD2-KEY                    IX2154.2 234 249
   001600      1  160300             INVALID KEY  PERFORM PASS                            IX2154.2 737
   001601      1  160400             GO TO START-WRITE-GF-10.                             IX2154.2 1614
   001602         160500     READ    IX-FD2 NEXT RECORD  AT END                           IX2154.2 234
   001603      1  160600             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001604      1  160700             GO TO START-FAIL-GF-10.                              IX2154.2 1607
   001605         160800     MOVE    IX-FD2-REC-240    TO  FILE-RECORD-INFO (1).          IX2154.2 287 516
   001606         160900     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   001607         161000 START-FAIL-GF-10.                                                IX2154.2
   001608         161100     PERFORM FAIL.                                                IX2154.2 738
   001609         161200     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   001610         161300     MOVE "IX-36; WRONG RECORD NUMBER FOUND" TO RE-MARK.          IX2154.2 563
   001611         161400     GO TO   START-WRITE-GF-10.                                   IX2154.2 1614
   001612         161500 START-DELETE-GF-10.                                              IX2154.2
   001613         161600     PERFORM DE-LETE.                                             IX2154.2 739
   001614         161700 START-WRITE-GF-10.                                               IX2154.2
   001615         161800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001616         161900 START-INIT-GF-11.                                                IX2154.2
   001617         162000     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001618         162100     MOVE "START-TEST-GF-11" TO PAR-NAME.                         IX2154.2 558
   001619         162200     MOVE    "FFFFFGGGGG090" TO IX-FD2-KEY.                       IX2154.2 249
   001620         162300 START-TEST-GF-11.                                                IX2154.2
   001621         162400     DELETE  IX-FD2 INVALID KEY                                   IX2154.2 234
   001622      1  162500             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   001623      1  162600             GO TO START-FAIL-GF-11.                              IX2154.2 1638
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001624         162700     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001625         162800     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001626      1  162900             GO TO START-DELETE-GF-11.                            IX2154.2 1643
   001627         163000     MOVE    "FFFFFGGGGG090" TO IX-FD2-KEY.                       IX2154.2 249
   001628         163100     START   IX-FD2 KEY IS EQUAL TO IX-FD2-RECKEY-REDF            IX2154.2 234 253
   001629      1  163200             INVALID KEY  PERFORM PASS                            IX2154.2 737
   001630      1  163300     MOVE "OK.;    INVALID KEY ON START OF DELETED RECORD"        IX2154.2
   001631      1  163400                  TO RE-MARK                                      IX2154.2 563
   001632      1  163500             GO TO START-WRITE-GF-11.                             IX2154.2 1645
   001633         163600     READ    IX-FD2 NEXT RECORD  AT END                           IX2154.2 234
   001634      1  163700             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001635      1  163800             GO TO START-FAIL-GF-11.                              IX2154.2 1638
   001636         163900     MOVE    IX-FD2-REC-240    TO  FILE-RECORD-INFO (1).          IX2154.2 287 516
   001637         164000     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   001638         164100 START-FAIL-GF-11.                                                IX2154.2
   001639         164200     PERFORM FAIL.                                                IX2154.2 738
   001640         164300     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   001641         164400     MOVE "IX-28 OR IX-36; WRONG RECORD NUMBER FOUND" TO RE-MARK. IX2154.2 563
   001642         164500     GO TO   START-WRITE-GF-11.                                   IX2154.2 1645
   001643         164600 START-DELETE-GF-11.                                              IX2154.2
   001644         164700     PERFORM DE-LETE.                                             IX2154.2 739
   001645         164800 START-WRITE-GF-11.                                               IX2154.2
   001646         164900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001647         165000 START-INIT-GF-12.                                                IX2154.2
   001648         165100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001649         165200     MOVE "START-TEST-GF-12" TO PAR-NAME.                         IX2154.2 558
   001650         165300     MOVE    "BBBBCCCCCC012" TO IX-FD2-KEY.                       IX2154.2 249
   001651         165400 START-TEST-GF-12.                                                IX2154.2
   001652         165500     DELETE  IX-FD2 INVALID KEY                                   IX2154.2 234
   001653      1  165600             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   001654      1  165700             GO TO START-FAIL-GF-12.                              IX2154.2 1670
   001655         165800     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001656         165900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001657      1  166000             GO TO START-DELETE-GF-12.                            IX2154.2 1675
   001658         166100     MOVE    "BBBBCCDDDD015" TO IX-FD2-KEY.                       IX2154.2 249
   001659         166200     START   IX-FD2                                               IX2154.2 234
   001660         166300                    KEY IS EQUAL TO IX-FD2-RECKEY-1-6             IX2154.2 255
   001661      1  166400          INVALID KEY    PERFORM PASS                             IX2154.2 737
   001662      1  166500             MOVE "OK.; INVALID KEY ON START OF DELETED RECORD"   IX2154.2
   001663      1  166600                  TO RE-MARK                                      IX2154.2 563
   001664      1  166700             GO TO START-WRITE-GF-12.                             IX2154.2 1677
   001665         166800     READ    IX-FD2 NEXT RECORD  AT END                           IX2154.2 234
   001666      1  166900             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001667      1  167000             GO TO START-FAIL-GF-12.                              IX2154.2 1670
   001668         167100     MOVE    IX-FD2-REC-240    TO  FILE-RECORD-INFO (1).          IX2154.2 287 516
   001669         167200     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   001670         167300 START-FAIL-GF-12.                                                IX2154.2
   001671         167400     PERFORM FAIL.                                                IX2154.2 738
   001672         167500     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   001673         167600     MOVE    "WRONG RECORD NUMBER FOUND" TO RE-MARK.              IX2154.2 563
   001674         167700     GO TO   START-WRITE-GF-12.                                   IX2154.2 1677
   001675         167800 START-DELETE-GF-12.                                              IX2154.2
   001676         167900     PERFORM DE-LETE.                                             IX2154.2 739
   001677         168000 START-WRITE-GF-12.                                               IX2154.2
   001678         168100     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001679         168200 START-INIT-GF-13.                                                IX2154.2
   001680         168300     MOVE    "START REDF ALT-KEY-1" TO FEATURE.                   IX2154.2 554
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001681         168400     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001682         168500     MOVE "START-TEST-GF-13" TO PAR-NAME.                         IX2154.2 558
   001683         168600     MOVE    "RSSSSSSSSS358"  TO IX-FD2-KEY.                      IX2154.2 249
   001684         168700 START-TEST-GF-13.                                                IX2154.2
   001685         168800     READ    IX-FD2                                               IX2154.2 234
   001686         168900                     KEY IS IX-FD2-KEY                            IX2154.2 249
   001687         169000         INVALID KEY                                              IX2154.2
   001688      1  169100     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001689      1  169200                   TO RE-MARK                                     IX2154.2 563
   001690      1  169300             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001691      1  169400             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001692         169500     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   001693         169600     IF      XRECORD-NUMBER (3) NOT EQUAL TO 179                  IX2154.2 525
   001694      1  169700             MOVE 54 TO RECNO                                     IX2154.2 335
   001695      1  169800             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001696      1  169900             MOVE  "WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001697      1  170000             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001698      1  170100             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001699         170200     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001700         170300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001701      1  170400             GO TO START-DELETE-GF-13.                            IX2154.2 1740
   001702         170500     MOVE    "EEEEEEEEEE000ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001703         170600     MOVE    "WWWWWWWWWW400ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001704         170700     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001705         170800     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   001706      1  170900     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001707      1  171000             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001708      1  171100             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001709         171200     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001710         171300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001711      1  171400             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001712         171500     MOVE    "EEEEEEEEEE000ALTKEY1"  TO IX-FD2-ALTKEY1.           IX2154.2 265
   001713         171600     START   IX-FD2                                               IX2154.2 234
   001714         171700                    KEY IS EQUAL TO IX-FD2-ALTKEY1                IX2154.2 265
   001715         171800          INVALID KEY                                             IX2154.2
   001716      1  171900     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001717      1  172000             TO RE-MARK                                           IX2154.2 563
   001718      1  172100             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001719      1  172200             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001720         172300     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   001721      1  172400     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001722      1  172500             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001723      1  172600             GO TO START-FAIL-GF-13.                              IX2154.2 1736
   001724         172700     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   001725         172800     IF      XRECORD-NUMBER (1) EQUAL TO 179                      IX2154.2 525
   001726      1  172900             PERFORM PASS                                         IX2154.2 737
   001727      1  173000             GO TO START-WRITE-GF-13.                             IX2154.2 1742
   001728         173100     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001729         173200     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001730         173300     MOVE    "EEEEEEEEEE000ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   001731         173400     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   001732         173500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001733         173600     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   001734         173700             TO RE-MARK.                                          IX2154.2 563
   001735         173800     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001736         173900 START-FAIL-GF-13.                                                IX2154.2
   001737         174000     PERFORM FAIL.                                                IX2154.2 738
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001738         174100     MOVE    179  TO CORRECT-18V0.                                IX2154.2 589
   001739         174200     GO TO   START-WRITE-GF-13.                                   IX2154.2 1742
   001740         174300 START-DELETE-GF-13.                                              IX2154.2
   001741         174400     PERFORM DE-LETE.                                             IX2154.2 739
   001742         174500 START-WRITE-GF-13.                                               IX2154.2
   001743         174600     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001744         174700 START-INIT-GF-14.                                                IX2154.2
   001745         174800     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001746         174900     MOVE "START-TEST-GF-14" TO PAR-NAME.                         IX2154.2 558
   001747         175000     MOVE    "TTUUUUUUUU396"  TO IX-FD2-KEY.                      IX2154.2 249
   001748         175100 START-TEST-GF-14.                                                IX2154.2
   001749         175200     READ    IX-FD2                                               IX2154.2 234
   001750         175300                     KEY IS IX-FD2-KEY                            IX2154.2 249
   001751         175400         INVALID KEY                                              IX2154.2
   001752      1  175500     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001753      1  175600                   TO RE-MARK                                     IX2154.2 563
   001754      1  175700             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001755      1  175800             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001756         175900     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   001757         176000     IF      XRECORD-NUMBER (3) NOT EQUAL TO 198                  IX2154.2 525
   001758      1  176100             MOVE 73 TO RECNO                                     IX2154.2 335
   001759      1  176200             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001760      1  176300     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001761      1  176400             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001762      1  176500             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001763         176600     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001764         176700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001765      1  176800             GO TO START-DELETE-GF-14.                            IX2154.2 1804
   001766         176900     MOVE    "AAAAAAAAAA400ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001767         177000     MOVE    "ZZZZZZZZZZ002ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001768         177100     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001769         177200     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   001770      1  177300     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001771      1  177400             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001772      1  177500             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001773         177600     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001774         177700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001775      1  177800             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001776         177900     MOVE    "AAAAAAAAAA400ALTKEY1"  TO IX-FD2-ALTKEY1.           IX2154.2 265
   001777         178000     START   IX-FD2                                               IX2154.2 234
   001778         178100                    KEY IS EQUAL TO IX-FD2-REDF-ALTKEY1           IX2154.2 268
   001779         178200             INVALID KEY                                          IX2154.2
   001780      1  178300     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001781      1  178400             TO RE-MARK                                           IX2154.2 563
   001782      1  178500             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001783      1  178600             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001784         178700     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   001785      1  178800     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001786      1  178900             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001787      1  179000             GO TO START-FAIL-GF-14.                              IX2154.2 1800
   001788         179100     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   001789         179200     IF      XRECORD-NUMBER (1) EQUAL TO 198                      IX2154.2 525
   001790      1  179300             PERFORM PASS                                         IX2154.2 737
   001791      1  179400             GO TO START-WRITE-GF-14.                             IX2154.2 1806
   001792         179500     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001793         179600     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001794         179700     MOVE    "AAAAAAAAAA400ALTKEY1"  TO CORRECT-A.                IX2154.2 583
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001795         179800     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   001796         179900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001797         180000     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   001798         180100             TO RE-MARK.                                          IX2154.2 563
   001799         180200     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001800         180300 START-FAIL-GF-14.                                                IX2154.2
   001801         180400     PERFORM FAIL.                                                IX2154.2 738
   001802         180500     MOVE    198  TO CORRECT-18V0.                                IX2154.2 589
   001803         180600     GO TO   START-WRITE-GF-14.                                   IX2154.2 1806
   001804         180700 START-DELETE-GF-14.                                              IX2154.2
   001805         180800     PERFORM DE-LETE.                                             IX2154.2 739
   001806         180900 START-WRITE-GF-14.                                               IX2154.2
   001807         181000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001808         181100 START-INIT-GF-15.                                                IX2154.2
   001809         181200     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001810         181300     MOVE "START-TEST-GF-15" TO PAR-NAME.                         IX2154.2 558
   001811         181400     MOVE    "BBBBBBBBBC002"  TO IX-FD2-KEY.                      IX2154.2 249
   001812         181500 START-TEST-GF-15.                                                IX2154.2
   001813         181600     READ    IX-FD2                                               IX2154.2 234
   001814         181700                     KEY IS IX-FD2-KEY                            IX2154.2 249
   001815         181800         INVALID KEY                                              IX2154.2
   001816      1  181900     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001817      1  182000                   TO RE-MARK                                     IX2154.2 563
   001818      1  182100             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001819      1  182200             GO TO START-FAIL-GF-15.                              IX2154.2 1864
   001820         182300     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   001821         182400     IF      XRECORD-NUMBER (3) NOT EQUAL TO 1                    IX2154.2 525
   001822      1  182500             MOVE 1 TO RECNO                                      IX2154.2 335
   001823      1  182600             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001824      1  182700     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001825      1  182800             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001826      1  182900             GO TO START-FAIL-GF-15.                              IX2154.2 1864
   001827         183000     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001828         183100     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001829      1  183200             GO TO START-DELETE-GF-15.                            IX2154.2 1868
   001830         183300     MOVE    "AAGGGGGGGG100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001831         183400     MOVE    "GGGGGGGGGG100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001832         183500     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001833         183600     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   001834      1  183700     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001835      1  183800             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001836      1  183900             GO TO START-FAIL-GF-15.                              IX2154.2 1864
   001837         184000     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001838         184100     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001839      1  184200             GO TO START-FAIL-GF-15.                              IX2154.2 1864
   001840         184300     MOVE    "AAGGGZZZZZ100ALTKEY1"  TO IX-FD2-ALTKEY1.           IX2154.2 265
   001841         184400     START   IX-FD2                                               IX2154.2 234
   001842         184500                    KEY IS EQUAL TO IX-FD2-ALTKEY1-1-5            IX2154.2 269
   001843         184600             INVALID KEY                                          IX2154.2
   001844      1  184700     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001845      1  184800             TO RE-MARK                                           IX2154.2 563
   001846      1  184900             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001847      1  185000             GO TO START-FAIL-GF-15.                              IX2154.2 1864
   001848         185100     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   001849      1  185200     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001850      1  185300             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001851      1  185400             GO TO START-FAIL-GF-15.                              IX2154.2 1864
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001852         185500     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   001853         185600     IF      XRECORD-NUMBER (1) EQUAL TO 1                        IX2154.2 525
   001854      1  185700             PERFORM PASS                                         IX2154.2 737
   001855      1  185800             GO TO START-WRITE-GF-15.                             IX2154.2 1870
   001856         185900     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   001857         186000     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   001858         186100     MOVE    "AAGGGGGGGG100ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   001859         186200     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   001860         186300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001861         186400     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   001862         186500             TO RE-MARK.                                          IX2154.2 563
   001863         186600     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001864         186700 START-FAIL-GF-15.                                                IX2154.2
   001865         186800     PERFORM FAIL.                                                IX2154.2 738
   001866         186900     MOVE    1  TO CORRECT-18V0.                                  IX2154.2 589
   001867         187000     GO TO   START-WRITE-GF-15.                                   IX2154.2 1870
   001868         187100 START-DELETE-GF-15.                                              IX2154.2
   001869         187200     PERFORM DE-LETE.                                             IX2154.2 739
   001870         187300 START-WRITE-GF-15.                                               IX2154.2
   001871         187400     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001872         187500 START-INIT-GF-16.                                                IX2154.2
   001873         187600     MOVE    "START REDF ALT-KEY-2" TO FEATURE.                   IX2154.2 554
   001874         187700     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001875         187800     MOVE "START-TEST-GF-16" TO PAR-NAME.                         IX2154.2 558
   001876         187900     MOVE    "SSSSSTTTTT370"  TO IX-FD2-KEY.                      IX2154.2 249
   001877         188000 START-TEST-GF-16.                                                IX2154.2
   001878         188100     READ    IX-FD2                                               IX2154.2 234
   001879         188200                     KEY IS IX-FD2-KEY                            IX2154.2 249
   001880         188300         INVALID KEY                                              IX2154.2
   001881      1  188400     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001882      1  188500                   TO RE-MARK                                     IX2154.2 563
   001883      1  188600             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001884      1  188700             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001885         188800     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   001886         188900     IF      XRECORD-NUMBER (3) NOT EQUAL TO 185                  IX2154.2 525
   001887      1  189000             MOVE 60 TO RECNO                                     IX2154.2 335
   001888      1  189100             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001889      1  189200     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001890      1  189300             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001891      1  189400             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001892         189500     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001893         189600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001894      1  189700             GO TO START-DELETE-GF-16.                            IX2154.2 1933
   001895         189800     MOVE    "BCBCBCBCBC200ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001896         189900     MOVE    "CBCBCBCBCB100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001897         190000     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001898         190100     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   001899      1  190200     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001900      1  190300             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001901      1  190400             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001902         190500     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001903         190600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001904      1  190700             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001905         190800     MOVE    "CBCBCBCBCB100ALTKEY2"  TO IX-FD2-ALTKEY2.           IX2154.2 275
   001906         190900     START   IX-FD2                                               IX2154.2 234
   001907         191000                    KEY IS EQUAL TO IX-FD2-ALTKEY2                IX2154.2 275
   001908         191100          INVALID KEY                                             IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001909      1  191200     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001910      1  191300             TO RE-MARK                                           IX2154.2 563
   001911      1  191400             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001912      1  191500             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001913         191600     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   001914      1  191700     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001915      1  191800             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001916      1  191900             GO TO START-FAIL-GF-16.                              IX2154.2 1929
   001917         192000     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   001918         192100     IF      XRECORD-NUMBER (1) EQUAL TO 185                      IX2154.2 525
   001919      1  192200             PERFORM PASS                                         IX2154.2 737
   001920      1  192300             GO TO START-WRITE-GF-16.                             IX2154.2 1935
   001921         192400     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   001922         192500     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   001923         192600     MOVE    "CBCBCBCBCB100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   001924         192700     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   001925         192800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001926         192900     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   001927         193000             TO RE-MARK.                                          IX2154.2 563
   001928         193100     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001929         193200 START-FAIL-GF-16.                                                IX2154.2
   001930         193300     PERFORM FAIL.                                                IX2154.2 738
   001931         193400     MOVE    185  TO CORRECT-18V0.                                IX2154.2 589
   001932         193500     GO TO   START-WRITE-GF-16.                                   IX2154.2 1935
   001933         193600 START-DELETE-GF-16.                                              IX2154.2
   001934         193700     PERFORM DE-LETE.                                             IX2154.2 739
   001935         193800 START-WRITE-GF-16.                                               IX2154.2
   001936         193900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001937         194000 START-INIT-GF-17.                                                IX2154.2
   001938         194100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   001939         194200     MOVE "START-TEST-GF-17" TO PAR-NAME.                         IX2154.2 558
   001940         194300     MOVE    "FFFFFFFFFG082"  TO IX-FD2-KEY.                      IX2154.2 249
   001941         194400 START-TEST-GF-17.                                                IX2154.2
   001942         194500     READ    IX-FD2                                               IX2154.2 234
   001943         194600                     KEY IS IX-FD2-KEY                            IX2154.2 249
   001944         194700         INVALID KEY                                              IX2154.2
   001945      1  194800     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   001946      1  194900                   TO RE-MARK                                     IX2154.2 563
   001947      1  195000             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   001948      1  195100             GO TO START-FAIL-GF-17.                              IX2154.2 1993
   001949         195200     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   001950         195300     IF      XRECORD-NUMBER (3) NOT EQUAL TO 41                   IX2154.2 525
   001951      1  195400             MOVE 41 TO RECNO                                     IX2154.2 335
   001952      1  195500             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   001953      1  195600     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   001954      1  195700             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   001955      1  195800             GO TO START-FAIL-GF-17.                              IX2154.2 1993
   001956         195900     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001957         196000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001958      1  196100             GO TO START-DELETE-GF-17.                            IX2154.2 1997
   001959         196200     MOVE    "DCDCDCDCDC100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   001960         196300     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   001961         196400     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   001962         196500     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   001963      1  196600     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   001964      1  196700             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   001965      1  196800             GO TO START-FAIL-GF-17.                              IX2154.2 1993
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001966         196900     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   001967         197000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   001968      1  197100             GO TO START-FAIL-GF-17.                              IX2154.2 1993
   001969         197200     MOVE    "DCDCDCZZZZ999ALTKEY2"  TO IX-FD2-ALTKEY2.           IX2154.2 275
   001970         197300     START   IX-FD2                                               IX2154.2 234
   001971         197400                    KEY IS EQUAL TO IX-FD2-ALTKEY2-1-6            IX2154.2 278
   001972         197500          INVALID KEY                                             IX2154.2
   001973      1  197600     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   001974      1  197700             TO RE-MARK                                           IX2154.2 563
   001975      1  197800             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   001976      1  197900             GO TO START-FAIL-GF-17.                              IX2154.2 1993
   001977         198000     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   001978      1  198100     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   001979      1  198200             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   001980      1  198300             GO TO START-FAIL-GF-17.                              IX2154.2 1993
   001981         198400     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   001982         198500     IF      XRECORD-NUMBER (1) EQUAL TO 41                       IX2154.2 525
   001983      1  198600             PERFORM PASS                                         IX2154.2 737
   001984      1  198700             GO TO START-WRITE-GF-17.                             IX2154.2 1999
   001985         198800     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   001986         198900     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   001987         199000     MOVE    "DCDCDCDCDC100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   001988         199100     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   001989         199200     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   001990         199300     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   001991         199400             TO RE-MARK.                                          IX2154.2 563
   001992         199500     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   001993         199600 START-FAIL-GF-17.                                                IX2154.2
   001994         199700     PERFORM FAIL.                                                IX2154.2 738
   001995         199800     MOVE    41  TO CORRECT-18V0.                                 IX2154.2 589
   001996         199900     GO TO   START-WRITE-GF-17.                                   IX2154.2 1999
   001997         200000 START-DELETE-GF-17.                                              IX2154.2
   001998         200100     PERFORM DE-LETE.                                             IX2154.2 739
   001999         200200 START-WRITE-GF-17.                                               IX2154.2
   002000         200300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002001         200400 START-INIT-GF-18.                                                IX2154.2
   002002         200500     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002003         200600     MOVE "START-TEST-GF-18" TO PAR-NAME.                         IX2154.2 558
   002004         200700     MOVE    "TTTTTTTTUU384"  TO IX-FD2-KEY.                      IX2154.2 249
   002005         200800 START-TEST-GF-18.                                                IX2154.2
   002006         200900     READ    IX-FD2                                               IX2154.2 234
   002007         201000                     KEY IS IX-FD2-KEY                            IX2154.2 249
   002008         201100         INVALID KEY                                              IX2154.2
   002009      1  201200     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002010      1  201300                   TO RE-MARK                                     IX2154.2 563
   002011      1  201400             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002012      1  201500             MOVE 192 TO CORRECT-18V0                             IX2154.2 589
   002013      1  201600             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002014         201700     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (3).            IX2154.2 287 516
   002015         201800     IF      XRECORD-NUMBER (3) NOT EQUAL TO 192                  IX2154.2 525
   002016      1  201900             MOVE 67 TO RECNO                                     IX2154.2 335
   002017      1  202000             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002018      1  202100     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002019      1  202200             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002020      1  202300             MOVE 192 TO CORRECT-18V0                             IX2154.2 589
   002021      1  202400             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002022         202500     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002023         202600     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002024      1  202700             GO TO START-DELETE-GF-18.                            IX2154.2 2087
   002025         202800     MOVE    "CDCDCDCDCD100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002026         202900     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002027         203000     MOVE    FILE-RECORD-INFO (3) TO IX-FD2R1-F-G-241.            IX2154.2 516 239
   002028         203100     REWRITE IX-FD2R1-F-G-241 INVALID KEY                         IX2154.2 239
   002029      1  203200     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002030      1  203300             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002031      1  203400             MOVE 192 TO CORRECT-18V0                             IX2154.2 589
   002032      1  203500             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002033         203600     PERFORM START-INIT-FD2 THRU START-INIT-FD2-EXIT.             IX2154.2 2746 2767
   002034         203700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002035      1  203800             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002036         203900     MOVE    "DCDZZZZZZZ400ALTKEY2"  TO IX-FD2-ALTKEY2.           IX2154.2 275
   002037         204000     START   IX-FD2                                               IX2154.2 234
   002038         204100                    KEY IS EQUAL TO IX-FD2-ALTKEY2-1-3            IX2154.2 281
   002039         204200             INVALID KEY                                          IX2154.2
   002040      1  204300     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002041      1  204400             TO RE-MARK                                           IX2154.2 563
   002042      1  204500             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002043      1  204600             MOVE 41 TO CORRECT-18V0                              IX2154.2 589
   002044      1  204700             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002045         204800     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   002046      1  204900     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002047      1  205000             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002048      1  205100             MOVE 41 TO CORRECT-18V0                              IX2154.2 589
   002049      1  205200             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002050         205300     MOVE    IX-FD2-REC-240    TO FILE-RECORD-INFO (1).           IX2154.2 287 516
   002051         205400     IF      XRECORD-NUMBER (1) NOT EQUAL TO 41                   IX2154.2 525
   002052      1  205500             MOVE ALTERNATE-KEY2 (1) TO WRK-FDW-ALTKEY2           IX2154.2 550 327
   002053      1  205600             MOVE FDW-ALTKEY2-1-20 TO COMPUTED-A                  IX2154.2 328 569
   002054      1  205700             MOVE "DCDCDCDCDC100" TO CORRECT-A                    IX2154.2 583
   002055      1  205800     MOVE                                                         IX2154.2
   002056      1  205900     "IX-28/36; INCORRECT  KEY FOUND ON FIRST READ DUPLICATE KEYS"IX2154.2
   002057      1  206000             TO RE-MARK                                           IX2154.2 563
   002058      1  206100             PERFORM PRINT-DETAIL                                 IX2154.2 741
   002059      1  206200     MOVE "WRONG RECORD NUMBER FOUND ON FIRST READ DUPLICATE KEYS"IX2154.2
   002060      1  206300             TO RE-MARK                                           IX2154.2 563
   002061      1  206400             MOVE XRECORD-NUMBER (1) TO COMPUTED-18V0             IX2154.2 525 576
   002062      1  206500             MOVE 41 TO CORRECT-18V0                              IX2154.2 589
   002063      1  206600             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002064         206700     READ    IX-FD2 NEXT RECORD AT END                            IX2154.2 234
   002065      1  206800     MOVE "IX-28;F1 AT END ON READ AFTER FIRST READ" TO RE-MARK   IX2154.2 563
   002066      1  206900             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002067      1  207000             MOVE 192 TO CORRECT-18V0                             IX2154.2 589
   002068      1  207100             GO TO START-FAIL-GF-18.                              IX2154.2 2084
   002069         207200     MOVE    IX-FD2-REC-240   TO FILE-RECORD-INFO (1).            IX2154.2 287 516
   002070         207300     IF      XRECORD-NUMBER (1) EQUAL TO 192                      IX2154.2 525
   002071      1  207400             PERFORM PASS                                         IX2154.2 737
   002072      1  207500             GO TO START-WRITE-GF-18.                             IX2154.2 2089
   002073         207600     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   002074         207700     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   002075         207800     MOVE    "DCDCDCDCDC100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   002076         207900     MOVE                                                         IX2154.2
   002077         208000     "IX-28/-36INCORRECT KEY FOUND ON SECOND READ DUPLICATE KEYS" IX2154.2
   002078         208100             TO RE-MARK.                                          IX2154.2 563
   002079         208200     PERFORM PRINT-DETAIL.                                        IX2154.2 741
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002080         208300     MOVE "WRONG REC NUMBER FOUND ON SECOND READ DUPLICATE KEYS"  IX2154.2
   002081         208400             TO RE-MARK.                                          IX2154.2 563
   002082         208500     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002083         208600     MOVE    192 TO CORRECT-18V0.                                 IX2154.2 589
   002084         208700 START-FAIL-GF-18.                                                IX2154.2
   002085         208800     PERFORM FAIL.                                                IX2154.2 738
   002086         208900     GO TO   START-WRITE-GF-18.                                   IX2154.2 2089
   002087         209000 START-DELETE-GF-18.                                              IX2154.2
   002088         209100     PERFORM DE-LETE.                                             IX2154.2 739
   002089         209200 START-WRITE-GF-18.                                               IX2154.2
   002090         209300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002091         209400 WRITE-WRITE-03.                                                  IX2154.2
   002092         209500     CLOSE   IX-FD2.                                              IX2154.2 234
   002093         209600 WRITE-INT-GF-03.                                                 IX2154.2
   002094         209700     OPEN    OUTPUT IX-FD3.                                       IX2154.2 289
   002095         209800     MOVE    "IX-FD3" TO XFILE-NAME           (1).                IX2154.2 519
   002096         209900     MOVE    "R1-F-G" TO  XRECORD-NAME        (1).                IX2154.2 521
   002097         210000     MOVE    ZERO     TO  XRECORD-NUMBER      (1).                IX2154.2 IMP 525
   002098         210100     MOVE    "RC"     TO  CHARS-OR-RECORDS    (1).                IX2154.2 535
   002099         210200     MOVE "IX215"     TO  XPROGRAM-NAME       (1).                IX2154.2 531
   002100         210300     MOVE    242      TO  XRECORD-LENGTH      (1).                IX2154.2 533
   002101         210400     MOVE    007      TO  XBLOCK-SIZE         (1).                IX2154.2 537
   002102         210500     MOVE    "IX"     TO  XFILE-ORGANIZATION  (1).                IX2154.2 541
   002103         210600     MOVE    "S"      TO  XLABEL-TYPE         (1).                IX2154.2 543
   002104         210700     MOVE    200      TO  RECORDS-IN-FILE     (1).                IX2154.2 539
   002105         210800     MOVE    "CREATE-FILE-FD3" TO FEATURE.                        IX2154.2 554
   002106         210900     MOVE    "WRITE-TEST-GF-03" TO PAR-NAME.                      IX2154.2 558
   002107         211000     MOVE    ZERO TO KEYSUB.                                      IX2154.2 IMP 337
   002108         211100     MOVE    ZERO TO INVKEY-COUNTER.                              IX2154.2 IMP 338
   002109         211200     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2154.2 IMP 336
   002110         211300 WRITE-INIT-GF-03.                                                IX2154.2
   002111         211400     PERFORM WRITE-TEST-GF-03R1  50 TIMES.                        IX2154.2 2115
   002112         211500     PERFORM WRITE-TEST-GF-03R2  125 TIMES.                       IX2154.2 2128
   002113         211600     PERFORM WRITE-TEST-GF-03R1  25 TIMES.                        IX2154.2 2115
   002114         211700     GO TO   WRITE-TEST-GF-03.                                    IX2154.2 2140
   002115         211800 WRITE-TEST-GF-03R1.                                              IX2154.2
   002116         211900     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   002117         212000     ADD     001  TO  KEYSUB.                                     IX2154.2 337
   002118         212100     MOVE    RECKEY-VALUE (KEYSUB) TO FDW-RECKEY-1-13.            IX2154.2 497 337 315
   002119         212200     MOVE    ALTKEY1-VALUE (KEYSUB) TO FDW-ALTKEY1-1-20.          IX2154.2 498 337 320
   002120         212300     MOVE    ALTKEY2-VALUE (KEYSUB) TO FDW-ALTKEY2-1-20.          IX2154.2 499 337 328
   002121         212400     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
   002122         212500     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   002123         212600     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   002124         212700     MOVE    FILE-RECORD-INFO (1)  TO IX-FD3R1-F-G-242.           IX2154.2 516 294
   002125         212800     WRITE   IX-FD3R1-F-G-242                                     IX2154.2 294
   002126      1  212900                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   002127         213000     ADD     001 TO  EXCUT-COUNTER-06V00.                         IX2154.2 336
   002128         213100 WRITE-TEST-GF-03R2.                                              IX2154.2
   002129         213200     ADD     002  TO FDW-RECKEY-11-13.                            IX2154.2 317
   002130         213300     ADD     002 TO FDW-ALTKEY1-11-13.                            IX2154.2 324
   002131         213400     SUBTRACT  002 FROM FDW-ALTKEY2-11-13.                        IX2154.2 332
   002132         213500     ADD     001  TO XRECORD-NUMBER (1).                          IX2154.2 525
   002133         213600     MOVE    WRK-FDW-RECKEY   TO    XRECORD-KEY (1).              IX2154.2 314 546
   002134         213700     MOVE    WRK-FDW-ALTKEY1  TO ALTERNATE-KEY1 (1).              IX2154.2 319 548
   002135         213800     MOVE    WRK-FDW-ALTKEY2  TO ALTERNATE-KEY2 (1).              IX2154.2 327 550
   002136         213900     MOVE    FILE-RECORD-INFO (1) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002137         214000     WRITE   IX-FD3R1-F-G-242                                     IX2154.2 294
   002138      1  214100                        INVALID KEY ADD 001 TO INVKEY-COUNTER.    IX2154.2 338
   002139         214200     ADD     001 TO EXCUT-COUNTER-06V00.                          IX2154.2 336
   002140         214300 WRITE-TEST-GF-03.                                                IX2154.2
   002141         214400     SUBTRACT INVKEY-COUNTER FROM EXCUT-COUNTER-06V00             IX2154.2 338 336
   002142         214500             GIVING RECORDS-WRITTEN.                              IX2154.2 339
   002143         214600     IF      RECORDS-WRITTEN EQUAL TO 200                         IX2154.2 339
   002144      1  214700             PERFORM  PASS                                        IX2154.2 737
   002145      1  214800             MOVE "FILE IX-FD3 CREATED (200 RECORDS)" TO RE-MARK  IX2154.2 563
   002146      1  214900     ELSE    PERFORM FAIL                                         IX2154.2 738
   002147      1  215000             MOVE                                          "IX-41;IX2154.2
   002148      1  215100-       "WRONG NUMBER OF RECORDS WRITTEN (MAY ALREADY EXIST)"     IX2154.2
   002149      1  215200             TO RE-MARK                                           IX2154.2 563
   002150      1  215300             MOVE 200 TO CORRECT-18V0                             IX2154.2 589
   002151      1  215400             MOVE RECORDS-WRITTEN TO COMPUTED-18V0.               IX2154.2 339 576
   002152         215500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002153         215600     GO TO   WRITE-TEST-GF-03-END.                                IX2154.2 2157
   002154         215700 WRITE-DELETE-GF-03.                                              IX2154.2
   002155         215800     PERFORM DE-LETE.                                             IX2154.2 739
   002156         215900     PERFORM  PRINT-DETAIL.                                       IX2154.2 741
   002157         216000 WRITE-TEST-GF-03-END.                                            IX2154.2
   002158         216100     CLOSE   IX-FD3.                                              IX2154.2 289
   002159         216200 READ-INIT-F1-O3.                                                 IX2154.2
   002160         216300     OPEN    INPUT  IX-FD3.                                       IX2154.2 289
   002161         216400     MOVE    "READ-TEST-F1-O3" TO PAR-NAME.                       IX2154.2 558
   002162         216500     MOVE    "READ FILE IX-FD3" TO FEATURE.                       IX2154.2 554
   002163         216600     MOVE    ZERO TO EXCUT-COUNTER-06V00.                         IX2154.2 IMP 336
   002164         216700     MOVE    02   TO RECKEY-NUM.                                  IX2154.2 340
   002165         216800     MOVE    002 TO ALTKEY1-NUM.                                  IX2154.2 341
   002166         216900 READ-TEST-F1-O3-R1.                                              IX2154.2
   002167         217000     READ    IX-FD3 NEXT RECORD AT END  GO TO READ-TEST-F1-O3.    IX2154.2 289 2181
   002168         217100     MOVE    IX-FD3-RECKEY-AREA TO FDW-RECKEY-1-13.               IX2154.2 299 315
   002169         217200     MOVE    IX-FD3-ALTKEY1-AREA TO FDW-ALTKEY1-1-20.             IX2154.2 302 320
   002170         217300     IF      FDW-RECKEY-11-13 EQUAL TO RECKEY-NUM                 IX2154.2 317 340
   002171         217400             AND FDW-ALTKEY1-11-13 EQUAL TO ALTKEY1-NUM           IX2154.2 324 341
   002172      1  217500             NEXT SENTENCE                                        IX2154.2
   002173         217600             ELSE                                                 IX2154.2
   002174      1  217700             PERFORM  READ-FAIL-F1-O3.                            IX2154.2 2193
   002175         217800     IF      EXCUT-COUNTER-06V00 NOT LESS THAN 200                IX2154.2 336
   002176      1  217900             GO TO READ-TEST-F1-O3.                               IX2154.2 2181
   002177         218000     ADD     001  TO EXCUT-COUNTER-06V00.                         IX2154.2 336
   002178         218100     ADD     002  TO RECKEY-NUM                                   IX2154.2 340
   002179         218200     ADD     002  TO ALTKEY1-NUM.                                 IX2154.2 341
   002180         218300     GO TO   READ-TEST-F1-O3-R1.                                  IX2154.2 2166
   002181         218400 READ-TEST-F1-O3.                                                 IX2154.2
   002182         218500     IF      FAIL-SW EQUAL TO 1 GO TO READ-EXIT-F1-O3.            IX2154.2 343 2201
   002183         218600     IF      EXCUT-COUNTER-06V00 EQUAL TO 200                     IX2154.2 336
   002184      1  218700             PERFORM PASS                                         IX2154.2 737
   002185      1  218800             MOVE "200 RECORDS VERIFIED" TO RE-MARK               IX2154.2 563
   002186      1  218900     ELSE    PERFORM FAIL                                         IX2154.2 738
   002187      1  219000             MOVE                                                 IX2154.2
   002188      1  219100          "IX-28 OR IX-41; INCORRECT NUMBER OF RECORDS" TO RE-MARKIX2154.2 563
   002189      1  219200             MOVE 200 TO CORRECT-18V0                             IX2154.2 589
   002190      1  219300             MOVE EXCUT-COUNTER-06V00 TO COMPUTED-18V0.           IX2154.2 336 576
   002191         219400     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002192         219500     GO TO   READ-EXIT-F1-O3.                                     IX2154.2 2201
   002193         219600 READ-FAIL-F1-O3.                                                 IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002194         219700     MOVE 1 TO FAIL-SW.                                           IX2154.2 343
   002195         219800     PERFORM FAIL.                                                IX2154.2 738
   002196         219900     MOVE    FDW-RECKEY-11-13  TO COMPUTED-18V0.                  IX2154.2 317 576
   002197         220000     MOVE    RECKEY-NUM  TO CORRECT-18V0.                         IX2154.2 340 589
   002198         220100     ADD     01 TO REC-CT.                                        IX2154.2 605
   002199         220200     MOVE    "NUM EMBEDDED IN RECKEY"  TO RE-MARK.                IX2154.2 563
   002200         220300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002201         220400 READ-EXIT-F1-O3.                                                 IX2154.2
   002202         220500     CLOSE   IX-FD3.                                              IX2154.2 289
   002203         220600 START-INIT-GF-19.                                                IX2154.2
   002204         220700     OPEN    I-O  IX-FD3.                                         IX2154.2 289
   002205         220800     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002206         220900     MOVE "START-TEST-GF-19" TO PAR-NAME.                         IX2154.2 558
   002207         221000     MOVE    "START QUAL REC-KEY" TO FEATURE.                     IX2154.2 554
   002208         221100     MOVE    "FFGGGGGGGG096" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002209         221200 START-TEST-GF-19.                                                IX2154.2
   002210         221300     DELETE  IX-FD3 INVALID KEY                                   IX2154.2 289
   002211      1  221400     MOVE "IX-21; INVALID KEY "         TO COMPUTED-A             IX2154.2 569
   002212      1  221500             GO TO START-FAIL-GF-19.                              IX2154.2 2227
   002213         221600     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002214         221700     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002215      1  221800             GO TO START-DELETE-GF-19.                            IX2154.2 2232
   002216         221900     MOVE    "FFGGGGGGGG096" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002217         222000     START IX-FD3 KEY IS EQUAL TO IX-FD3-KEY IN IX-FD3-RECKEY-AREAIX2154.2 289 300 299
   002218      1  222100             INVALID KEY  PERFORM PASS                            IX2154.2 737
   002219      1  222200     MOVE "OK.;    INVALID KEY ON START OF DELETED RECORD"        IX2154.2
   002220      1  222300                  TO RE-MARK                                      IX2154.2 563
   002221      1  222400             GO TO START-WRITE-GF-19.                             IX2154.2 2234
   002222         222500     READ    IX-FD3 NEXT RECORD  AT END                           IX2154.2 289
   002223      1  222600             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002224      1  222700             GO TO START-FAIL-GF-19.                              IX2154.2 2227
   002225         222800     MOVE    IX-FD3-240        TO  FILE-RECORD-INFO (1).          IX2154.2 309 516
   002226         222900     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   002227         223000 START-FAIL-GF-19.                                                IX2154.2
   002228         223100     PERFORM FAIL.                                                IX2154.2 738
   002229         223200     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   002230         223300     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK. IX2154.2 563
   002231         223400     GO TO   START-WRITE-GF-19.                                   IX2154.2 2234
   002232         223500 START-DELETE-GF-19.                                              IX2154.2
   002233         223600     PERFORM DE-LETE.                                             IX2154.2 739
   002234         223700 START-WRITE-GF-19.                                               IX2154.2
   002235         223800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002236         223900 START-INIT-GF-20.                                                IX2154.2
   002237         224000     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002238         224100     MOVE "START-TEST-GF-20" TO PAR-NAME.                         IX2154.2 558
   002239         224200     MOVE    "CCCCCCCCCC020" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002240         224300 START-TEST-GF-20.                                                IX2154.2
   002241         224400     DELETE  IX-FD3 INVALID KEY                                   IX2154.2 289
   002242      1  224500             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   002243      1  224600             GO TO START-FAIL-GF-20.                              IX2154.2 2259
   002244         224700     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002245         224800     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002246      1  224900             GO TO START-DELETE-GF-20.                            IX2154.2 2264
   002247         225000     MOVE    "CCCCCCCCCC020" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002248         225100     START   IX-FD3 KEY IS EQUAL TO IX-FD3-KEY                    IX2154.2 289 300
   002249         225200             OF IX-FD3-RECKEY-AREA                                IX2154.2 299
   002250      1  225300             INVALID KEY  PERFORM PASS                            IX2154.2 737
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002251      1  225400      MOVE "OK.;   INVALID KEY ON START OF DELETED RECORD"        IX2154.2
   002252      1  225500                  TO RE-MARK                                      IX2154.2 563
   002253      1  225600             GO TO START-WRITE-GF-20.                             IX2154.2 2266
   002254         225700     READ    IX-FD3 NEXT RECORD  AT END                           IX2154.2 289
   002255      1  225800             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002256      1  225900             GO TO START-FAIL-GF-20.                              IX2154.2 2259
   002257         226000     MOVE    IX-FD3-240        TO  FILE-RECORD-INFO (1).          IX2154.2 309 516
   002258         226100     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   002259         226200 START-FAIL-GF-20.                                                IX2154.2
   002260         226300     PERFORM FAIL.                                                IX2154.2 738
   002261         226400     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   002262         226500     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK. IX2154.2 563
   002263         226600     GO TO   START-WRITE-GF-20.                                   IX2154.2 2266
   002264         226700 START-DELETE-GF-20.                                              IX2154.2
   002265         226800     PERFORM DE-LETE.                                             IX2154.2 739
   002266         226900 START-WRITE-GF-20.                                               IX2154.2
   002267         227000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002268         227100 START-INIT-GF-21.                                                IX2154.2
   002269         227200     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002270         227300     MOVE "START-TEST-GF-21" TO PAR-NAME.                         IX2154.2 558
   002271         227400     MOVE    "SSSSSSSSST362" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002272         227500 START-TEST-GF-21.                                                IX2154.2
   002273         227600     DELETE  IX-FD3 INVALID KEY                                   IX2154.2 289
   002274      1  227700             MOVE  "INVALID KEY (DELETE)" TO COMPUTED-A           IX2154.2 569
   002275      1  227800             GO TO START-FAIL-GF-21.                              IX2154.2 2292
   002276         227900     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002277         228000     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002278      1  228100             GO TO START-DELETE-GF-21.                            IX2154.2 2297
   002279         228200     MOVE    "SSSSSSSSST362" TO IX-FD3-RECKEY-AREA.               IX2154.2 299
   002280         228300     START   IX-FD3 KEY IS EQUAL TO                               IX2154.2 289
   002281         228400             IX-FD3-KEY IN                                        IX2154.2 300
   002282         228500             IX-FD3-RECKEY-AREA                                   IX2154.2 299
   002283      1  228600             INVALID KEY  PERFORM PASS                            IX2154.2 737
   002284      1  228700     MOVE "OK.;    INVALID KEY ON START OF DELETED RECORD"        IX2154.2
   002285      1  228800                  TO RE-MARK                                      IX2154.2 563
   002286      1  228900             GO TO START-WRITE-GF-21.                             IX2154.2 2299
   002287         229000     READ    IX-FD3 NEXT RECORD  AT END                           IX2154.2 289
   002288      1  229100             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002289      1  229200             GO TO START-FAIL-GF-21.                              IX2154.2 2292
   002290         229300     MOVE    IX-FD3-240        TO  FILE-RECORD-INFO (1).          IX2154.2 309 516
   002291         229400     MOVE     XRECORD-NUMBER (1)  TO COMPUTED-18V0.               IX2154.2 525 576
   002292         229500 START-FAIL-GF-21.                                                IX2154.2
   002293         229600     PERFORM FAIL.                                                IX2154.2 738
   002294         229700     MOVE    "INVALID KEY ON START" TO CORRECT-A.                 IX2154.2 583
   002295         229800     MOVE "WRONG RECORD NUMBER FOUND; IX-28 OR IX-36" TO RE-MARK. IX2154.2 563
   002296         229900     GO TO   START-WRITE-GF-21.                                   IX2154.2 2299
   002297         230000 START-DELETE-GF-21.                                              IX2154.2
   002298         230100     PERFORM DE-LETE.                                             IX2154.2 739
   002299         230200 START-WRITE-GF-21.                                               IX2154.2
   002300         230300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002301         230400 START-INIT-GF-22.                                                IX2154.2
   002302         230500     MOVE    "START QUAL ALT-KEY-1" TO FEATURE.                   IX2154.2 554
   002303         230600     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002304         230700     MOVE "START-TEST-GF-22" TO PAR-NAME.                         IX2154.2 558
   002305         230800     MOVE    "EEEEEEEEFF064"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002306         230900 START-TEST-GF-22.                                                IX2154.2
   002307         231000     READ    IX-FD3                                               IX2154.2 289
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002308      1  231100             INVALID KEY  PERFORM FAIL                            IX2154.2 738
   002309      1  231200     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002310      1  231300                   TO RE-MARK                                     IX2154.2 563
   002311      1  231400             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002312      1  231500             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002313         231600     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002314         231700     IF      XRECORD-NUMBER (3) NOT EQUAL TO 32                   IX2154.2 525
   002315      1  231800             MOVE 32 TO RECNO                                     IX2154.2 335
   002316      1  231900             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002317      1  232000     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002318      1  232100             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002319      1  232200             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002320         232300     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002321         232400     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002322      1  232500             GO TO START-DELETE-GF-22.                            IX2154.2 2363
   002323         232600     MOVE    "EEEEEEEEEE000ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002324         232700     MOVE    "WWWWWWWWWW400ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002325         232800     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002326         232900     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002327      1  233000     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002328      1  233100             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002329      1  233200             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002330         233300     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002331         233400     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002332      1  233500             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002333         233600     MOVE    "EEEEEEEEEE000ALTKEY1"  TO IX-FD3-ALTKEY1-AREA.      IX2154.2 302
   002334         233700     START   IX-FD3                                               IX2154.2 289
   002335         233800             KEY IS EQUAL TO IX-FD3-KEY OF                        IX2154.2 303
   002336         233900             IX-FD3-ALTKEY1-AREA                                  IX2154.2 302
   002337         234000             INVALID KEY                                          IX2154.2
   002338      1  234100     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002339      1  234200             TO RE-MARK                                           IX2154.2 563
   002340      1  234300             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002341      1  234400             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002342         234500     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002343      1  234600     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002344      1  234700             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002345      1  234800             GO TO START-FAIL-GF-22.                              IX2154.2 2359
   002346         234900     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002347         235000     IF      XRECORD-NUMBER (1) EQUAL TO 32                       IX2154.2 525
   002348      1  235100             PERFORM PASS                                         IX2154.2 737
   002349      1  235200             GO TO START-WRITE-GF-22.                             IX2154.2 2365
   002350         235300     PERFORM FAIL.                                                IX2154.2 738
   002351         235400     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   002352         235500     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   002353         235600     MOVE    "EEEEEEEEEE000ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   002354         235700     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   002355         235800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002356         235900     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   002357         236000             TO RE-MARK.                                          IX2154.2 563
   002358         236100     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002359         236200 START-FAIL-GF-22.                                                IX2154.2
   002360         236300     PERFORM FAIL.                                                IX2154.2 738
   002361         236400     MOVE    32  TO CORRECT-18V0.                                 IX2154.2 589
   002362         236500     GO TO   START-WRITE-GF-22.                                   IX2154.2 2365
   002363         236600 START-DELETE-GF-22.                                              IX2154.2
   002364         236700     PERFORM DE-LETE.                                             IX2154.2 739
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002365         236800 START-WRITE-GF-22.                                               IX2154.2
   002366         236900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002367         237000 START-INIT-GF-23.                                                IX2154.2
   002368         237100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002369         237200     MOVE "START-TEST-GF-23" TO PAR-NAME.                         IX2154.2 558
   002370         237300     MOVE    "BBBBBBBCCC006"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002371         237400 START-TEST-GF-23.                                                IX2154.2
   002372         237500     READ    IX-FD3                                               IX2154.2 289
   002373         237600             INVALID KEY                                          IX2154.2
   002374      1  237700     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002375      1  237800                   TO RE-MARK                                     IX2154.2 563
   002376      1  237900             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002377      1  238000             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002378         238100     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002379         238200     IF      XRECORD-NUMBER (3) NOT EQUAL TO 3                    IX2154.2 525
   002380      1  238300             MOVE 3 TO RECNO                                      IX2154.2 335
   002381      1  238400             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002382      1  238500     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002383      1  238600             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002384      1  238700             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002385         238800     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002386         238900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002387      1  239000             GO TO START-DELETE-GF-23.                            IX2154.2 2428
   002388         239100     MOVE    "AAAAAAAAAA400ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002389         239200     MOVE    "ZZZZZZZZZZ002ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002390         239300     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002391         239400     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002392      1  239500     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002393      1  239600             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002394      1  239700             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002395         239800     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002396         239900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002397      1  240000             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002398         240100     MOVE    "AAAAAAAAAA400ALTKEY1"  TO IX-FD3-ALTKEY1-AREA.      IX2154.2 302
   002399         240200     START   IX-FD3                                               IX2154.2 289
   002400         240300                    KEY IS EQUAL TO                               IX2154.2
   002401         240400             IX-FD3-KEY                                           IX2154.2 303
   002402         240500             IN IX-FD3-ALTKEY1-AREA                               IX2154.2 302
   002403         240600             INVALID KEY                                          IX2154.2
   002404      1  240700     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002405      1  240800             TO RE-MARK                                           IX2154.2 563
   002406      1  240900             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002407      1  241000             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002408         241100     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002409      1  241200     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002410      1  241300             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002411      1  241400             GO TO START-FAIL-GF-23.                              IX2154.2 2424
   002412         241500     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002413         241600     IF      XRECORD-NUMBER (1) EQUAL TO 3                        IX2154.2 525
   002414      1  241700             PERFORM PASS                                         IX2154.2 737
   002415      1  241800             GO TO START-WRITE-GF-23.                             IX2154.2 2430
   002416         241900     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   002417         242000     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   002418         242100     MOVE    "AAAAAAAAAA400ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   002419         242200     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   002420         242300     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002421         242400     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002422         242500             TO RE-MARK.                                          IX2154.2 563
   002423         242600     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002424         242700 START-FAIL-GF-23.                                                IX2154.2
   002425         242800     PERFORM FAIL.                                                IX2154.2 738
   002426         242900     MOVE 3 TO CORRECT-18V0.                                      IX2154.2 589
   002427         243000     GO TO   START-WRITE-GF-23.                                   IX2154.2 2430
   002428         243100 START-DELETE-GF-23.                                              IX2154.2
   002429         243200     PERFORM DE-LETE.                                             IX2154.2 739
   002430         243300 START-WRITE-GF-23.                                               IX2154.2
   002431         243400     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002432         243500 START-INIT-GF-24.                                                IX2154.2
   002433         243600     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002434         243700     MOVE "START-TEST-GF-24" TO PAR-NAME.                         IX2154.2 558
   002435         243800     MOVE    "SSSSSSSSSS360"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002436         243900 START-TEST-GF-24.                                                IX2154.2
   002437         244000     READ    IX-FD3                                               IX2154.2 289
   002438         244100             INVALID KEY                                          IX2154.2
   002439      1  244200     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002440      1  244300                   TO RE-MARK                                     IX2154.2 563
   002441      1  244400             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002442      1  244500             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002443         244600     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002444         244700     IF      XRECORD-NUMBER (3) NOT EQUAL TO 180                  IX2154.2 525
   002445      1  244800             MOVE 55 TO RECNO                                     IX2154.2 335
   002446      1  244900             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002447      1  245000     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002448      1  245100             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002449      1  245200             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002450         245300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002451      1  245400             GO TO START-DELETE-GF-24.                            IX2154.2 2492
   002452         245500     MOVE    "AAGGGGGGGG100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002453         245600     MOVE    "GGGGGGGGGG100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002454         245700     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002455         245800     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002456      1  245900     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002457      1  246000             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002458      1  246100             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002459         246200     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002460         246300     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002461      1  246400             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002462         246500     MOVE    "AAGGGGGGGG100ALTKEY1"  TO IX-FD3-ALTKEY1-AREA.      IX2154.2 302
   002463         246600     START   IX-FD3                                               IX2154.2 289
   002464         246700             KEY IS EQUAL TO                                      IX2154.2
   002465         246800             IX-FD3-KEY                                           IX2154.2 303
   002466         246900             OF IX-FD3-ALTKEY1-AREA                               IX2154.2 302
   002467      1  247000             INVALID KEY  PERFORM FAIL                            IX2154.2 738
   002468      1  247100     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002469      1  247200             TO RE-MARK                                           IX2154.2 563
   002470      1  247300             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002471      1  247400             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002472         247500     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002473      1  247600     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002474      1  247700             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002475      1  247800             GO TO START-FAIL-GF-24.                              IX2154.2 2488
   002476         247900     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002477         248000     IF      XRECORD-NUMBER (1) EQUAL TO 180                      IX2154.2 525
   002478      1  248100             PERFORM PASS                                         IX2154.2 737
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002479      1  248200             GO TO START-WRITE-GF-24.                             IX2154.2 2494
   002480         248300     MOVE    ALTERNATE-KEY1 (1)  TO WRK-FDW-ALTKEY1.              IX2154.2 548 319
   002481         248400     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   002482         248500     MOVE    "AAGGGGGGGG100ALTKEY1"  TO CORRECT-A.                IX2154.2 583
   002483         248600     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY1" TO RE-MARK. IX2154.2 563
   002484         248700     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002485         248800     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY1"IX2154.2
   002486         248900             TO RE-MARK.                                          IX2154.2 563
   002487         249000     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002488         249100 START-FAIL-GF-24.                                                IX2154.2
   002489         249200     PERFORM FAIL.                                                IX2154.2 738
   002490         249300     MOVE    180  TO CORRECT-18V0.                                IX2154.2 589
   002491         249400     GO TO   START-WRITE-GF-24.                                   IX2154.2 2494
   002492         249500 START-DELETE-GF-24.                                              IX2154.2
   002493         249600     PERFORM DE-LETE.                                             IX2154.2 739
   002494         249700 START-WRITE-GF-24.                                               IX2154.2
   002495         249800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002496         249900 START-INIT-GF-25.                                                IX2154.2
   002497         250000     MOVE    "START QUAL ALT-KEY-2" TO FEATURE.                   IX2154.2 554
   002498         250100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002499         250200     MOVE "START-TEST-GF-25" TO PAR-NAME.                         IX2154.2 558
   002500         250300     MOVE    "CCCCCDDDDD030"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002501         250400 START-TEST-GF-25.                                                IX2154.2
   002502         250500     READ    IX-FD3                                               IX2154.2 289
   002503         250600             INVALID KEY                                          IX2154.2
   002504      1  250700     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002505      1  250800                   TO RE-MARK                                     IX2154.2 563
   002506      1  250900             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002507      1  251000             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002508         251100     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002509         251200     IF      XRECORD-NUMBER (3) NOT EQUAL TO 15                   IX2154.2 525
   002510      1  251300             MOVE 15 TO RECNO                                     IX2154.2 335
   002511      1  251400             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002512      1  251500     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002513      1  251600             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002514      1  251700             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002515         251800     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002516         251900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002517      1  252000             GO TO START-DELETE-GF-25.                            IX2154.2 2559
   002518         252100     MOVE    "BCBCBCBCBC200ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002519         252200     MOVE    "CBCBCBCBCB100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002520         252300     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002521         252400     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002522      1  252500      MOVE "IX-33;  INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002523      1  252600             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002524      1  252700             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002525         252800     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002526         252900     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002527      1  253000             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002528         253100     MOVE    "CBCBCBCBCB100ALTKEY2"  TO IX-FD3-ALTKEY2-AREA.      IX2154.2 305
   002529         253200     START   IX-FD3                                               IX2154.2 289
   002530         253300                    KEY IS EQUAL TO                               IX2154.2
   002531         253400             IX-FD3-KEY                                           IX2154.2 306
   002532         253500             IN                                                   IX2154.2
   002533         253600             IX-FD3-ALTKEY2-AREA                                  IX2154.2 305
   002534         253700             INVALID KEY                                          IX2154.2
   002535      1  253800     MOVE "IX-36;  INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002536      1  253900             TO RE-MARK                                           IX2154.2 563
   002537      1  254000             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002538      1  254100             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002539         254200     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002540      1  254300     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002541      1  254400             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002542      1  254500             GO TO START-FAIL-GF-25.                              IX2154.2 2555
   002543         254600     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002544         254700     IF      XRECORD-NUMBER (1) EQUAL TO 15                       IX2154.2 525
   002545      1  254800             PERFORM PASS                                         IX2154.2 737
   002546      1  254900             GO TO START-WRITE-GF-25.                             IX2154.2 2561
   002547         255000     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   002548         255100     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   002549         255200     MOVE    "CBCBCBCBCB100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   002550         255300     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   002551         255400     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002552         255500     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   002553         255600             TO RE-MARK.                                          IX2154.2 563
   002554         255700     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002555         255800 START-FAIL-GF-25.                                                IX2154.2
   002556         255900     PERFORM FAIL.                                                IX2154.2 738
   002557         256000     MOVE    15  TO CORRECT-18V0.                                 IX2154.2 589
   002558         256100     GO TO   START-WRITE-GF-25.                                   IX2154.2 2561
   002559         256200 START-DELETE-GF-25.                                              IX2154.2
   002560         256300     PERFORM DE-LETE.                                             IX2154.2 739
   002561         256400 START-WRITE-GF-25.                                               IX2154.2
   002562         256500     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002563         256600 START-INIT-GF-26.                                                IX2154.2
   002564         256700     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002565         256800     MOVE "START-TEST-GF-26" TO PAR-NAME.                         IX2154.2 558
   002566         256900     MOVE    "TTTTTTTTTT380"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002567         257000 START-TEST-GF-26.                                                IX2154.2
   002568         257100     READ    IX-FD3                                               IX2154.2 289
   002569         257200             INVALID KEY                                          IX2154.2
   002570      1  257300     MOVE "IX-28;F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002571      1  257400                   TO RE-MARK                                     IX2154.2 563
   002572      1  257500             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002573      1  257600             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002574         257700     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002575         257800     IF      XRECORD-NUMBER (3) NOT EQUAL TO 190                  IX2154.2 525
   002576      1  257900             MOVE 65 TO RECNO                                     IX2154.2 335
   002577      1  258000             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002578      1  258100     MOVE "IX-28;F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002579      1  258200             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002580      1  258300             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002581         258400     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002582         258500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002583      1  258600             GO TO START-DELETE-GF-26.                            IX2154.2 2623
   002584         258700     MOVE    "DCDCDCDCDC100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002585         258800     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002586         258900     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002587         259000     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002588      1  259100      MOVE "IX-33;  INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002589      1  259200             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002590      1  259300             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002591         259400     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002592         259500     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002593      1  259600             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002594         259700     MOVE    "DCDCDCDCDC100ALTKEY2"  TO IX-FD3-ALTKEY2-AREA.      IX2154.2 305
   002595         259800     START   IX-FD3                                               IX2154.2 289
   002596         259900             KEY IS EQUAL TO                                      IX2154.2
   002597         260000             IX-FD3-KEY OF IX-FD3-ALTKEY2-AREA                    IX2154.2 306 305
   002598         260100             INVALID KEY                                          IX2154.2
   002599      1  260200      MOVE "IX-36; INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002600      1  260300             TO RE-MARK                                           IX2154.2 563
   002601      1  260400             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002602      1  260500             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002603         260600     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002604      1  260700     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002605      1  260800             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002606      1  260900             GO TO START-FAIL-GF-26.                              IX2154.2 2619
   002607         261000     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002608         261100     IF      XRECORD-NUMBER (1) EQUAL TO 190                      IX2154.2 525
   002609      1  261200             PERFORM PASS                                         IX2154.2 737
   002610      1  261300             GO TO START-WRITE-GF-26.                             IX2154.2 2625
   002611         261400     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   002612         261500     MOVE    FDW-ALTKEY2-1-20  TO COMPUTED-A.                     IX2154.2 328 569
   002613         261600     MOVE    "DCDCDCDCDC100ALTKEY2"  TO CORRECT-A.                IX2154.2 583
   002614         261700     MOVE "IX-28 OR IX-36; INCORR ALTERN RECORD KEY2" TO RE-MARK. IX2154.2 563
   002615         261800     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002616         261900     MOVE   "WRONG RECORD NUMBER FOUND ON READ ALTERNATE REC KEY2"IX2154.2
   002617         262000             TO RE-MARK.                                          IX2154.2 563
   002618         262100     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002619         262200 START-FAIL-GF-26.                                                IX2154.2
   002620         262300     PERFORM FAIL.                                                IX2154.2 738
   002621         262400     MOVE    190  TO CORRECT-18V0.                                IX2154.2 589
   002622         262500     GO TO   START-WRITE-GF-26.                                   IX2154.2 2625
   002623         262600 START-DELETE-GF-26.                                              IX2154.2
   002624         262700     PERFORM DE-LETE.                                             IX2154.2 739
   002625         262800 START-WRITE-GF-26.                                               IX2154.2
   002626         262900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002627         263000 START-INIT-GF-27.                                                IX2154.2
   002628         263100     MOVE "----------" TO DUMMY-RECORD. PERFORM BLANK-LINE-PRINT. IX2154.2 180 814
   002629         263200     MOVE "START-TEST-GF-27" TO PAR-NAME.                         IX2154.2 558
   002630         263300     MOVE    "CCCCCCCCDD024"  TO IX-FD3-RECKEY-AREA.              IX2154.2 299
   002631         263400 START-TEST-GF-27.                                                IX2154.2
   002632         263500     READ    IX-FD3                                               IX2154.2 289
   002633         263600             INVALID KEY                                          IX2154.2
   002634      1  263700     MOVE "IX-28,F2 INVALID KEY PATH TAKEN ON INITIAL READ"       IX2154.2
   002635      1  263800                   TO RE-MARK                                     IX2154.2 563
   002636      1  263900             MOVE  "INVALID KEY ON READ" TO COMPUTED-A            IX2154.2 569
   002637      1  264000             MOVE 12 TO CORRECT-18V0                              IX2154.2 589
   002638      1  264100             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002639         264200     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (3).            IX2154.2 309 516
   002640         264300     IF      XRECORD-NUMBER (3) NOT EQUAL TO 12                   IX2154.2 525
   002641      1  264400             MOVE 12 TO RECNO                                     IX2154.2 335
   002642      1  264500             PERFORM DISPLAY-RECORD-KEYS                          IX2154.2 2792
   002643      1  264600     MOVE "IX-28,F2 WRONG RECORD FOUND ON INITIAL READ" TO RE-MARKIX2154.2 563
   002644      1  264700             MOVE  XRECORD-NUMBER (3) TO COMPUTED-18V0            IX2154.2 525 576
   002645      1  264800             MOVE 4 TO CORRECT-18V0                               IX2154.2 589
   002646      1  264900             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002647         265000     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002648         265100     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002649      1  265200             GO TO START-DELETE-GF-27.                            IX2154.2 2714
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    50
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002650         265300     MOVE    "CDCDCDCDCD100ALTKEY1" TO ALTERNATE-KEY1 (3).        IX2154.2 548
   002651         265400     MOVE    "DCDCDCDCDC100ALTKEY2" TO ALTERNATE-KEY2 (3).        IX2154.2 550
   002652         265500     MOVE    FILE-RECORD-INFO (3) TO IX-FD3R1-F-G-242.            IX2154.2 516 294
   002653         265600     REWRITE IX-FD3R1-F-G-242 INVALID KEY                         IX2154.2 294
   002654      1  265700     MOVE "IX-33;   INVALID KEY PATH TAKEN ON REWRITE" TO RE-MARK IX2154.2 563
   002655      1  265800             MOVE  "INVALID KEY; REWRITE" TO COMPUTED-A           IX2154.2 569
   002656      1  265900             MOVE 12 TO CORRECT-18V0                              IX2154.2 589
   002657      1  266000             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002658         266100     PERFORM START-INIT-FD3 THRU START-INIT-FD3-EXIT.             IX2154.2 2769 2790
   002659         266200     IF      INIT-FLAG NOT EQUAL ZERO                             IX2154.2 500 IMP
   002660      1  266300             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002661         266400     MOVE    "DCDCDCDCDC100ALTKEY2"  TO IX-FD3-ALTKEY2-AREA.      IX2154.2 305
   002662         266500     START   IX-FD3                                               IX2154.2 289
   002663         266600                    KEY IS EQUAL TO IX-FD3-KEY                    IX2154.2 306
   002664         266700             IN                                                   IX2154.2
   002665         266800             IX-FD3-ALTKEY2-AREA                                  IX2154.2 305
   002666         266900             INVALID KEY                                          IX2154.2
   002667      1  267000      MOVE "IX-36; INVALID KEY ON START OF REWRITTEN RECORD"      IX2154.2
   002668      1  267100             TO RE-MARK                                           IX2154.2 563
   002669      1  267200             MOVE  "INVALID KEY ON START" TO COMPUTED-A           IX2154.2 569
   002670      1  267300             MOVE 190 TO CORRECT-18V0                             IX2154.2 589
   002671      1  267400             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002672         267500     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002673      1  267600     MOVE "IX-28;F1 AT END ON READ AFTER START" TO RE-MARK        IX2154.2 563
   002674      1  267700             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002675      1  267800             MOVE 190 TO CORRECT-18V0                             IX2154.2 589
   002676      1  267900             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002677         268000     MOVE    IX-FD3-240        TO FILE-RECORD-INFO (1).           IX2154.2 309 516
   002678         268100     IF      XRECORD-NUMBER (1) NOT EQUAL TO 190                  IX2154.2 525
   002679      1  268200             MOVE ALTERNATE-KEY2 (1) TO WRK-FDW-ALTKEY2           IX2154.2 550 327
   002680      1  268300             MOVE FDW-ALTKEY2-1-20 TO COMPUTED-A                  IX2154.2 328 569
   002681      1  268400             MOVE "DCDCDCDCDC100" TO CORRECT-A                    IX2154.2 583
   002682      1  268500     MOVE                                                         IX2154.2
   002683      1  268600     "IX-28 OR IX-36; INCORR KEY FOUND ON FIRST READ DUPL KEYS"   IX2154.2
   002684      1  268700             TO RE-MARK                                           IX2154.2 563
   002685      1  268800             PERFORM PRINT-DETAIL                                 IX2154.2 741
   002686      1  268900     MOVE "WRONG RECORD NUMBER FOUND ON FIRST READ DUPLICATE KEYS"IX2154.2
   002687      1  269000             TO RE-MARK                                           IX2154.2 563
   002688      1  269100             MOVE XRECORD-NUMBER (1) TO COMPUTED-18V0             IX2154.2 525 576
   002689      1  269200             MOVE 190 TO CORRECT-18V0                             IX2154.2 589
   002690      1  269300             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002691         269400     READ    IX-FD3 NEXT RECORD AT END                            IX2154.2 289
   002692      1  269500     MOVE "IX-28;F1 AT END ON READ AFTER FIRST READ" TO RE-MARK   IX2154.2 563
   002693      1  269600             MOVE "AT END ON READ" TO COMPUTED-A                  IX2154.2 569
   002694      1  269700             MOVE 12 TO CORRECT-18V0                              IX2154.2 589
   002695      1  269800             GO TO START-FAIL-GF-27.                              IX2154.2 2711
   002696         269900     MOVE    IX-FD3-240       TO FILE-RECORD-INFO (1).            IX2154.2 309 516
   002697         270000     IF      XRECORD-NUMBER (1) EQUAL TO 12                       IX2154.2 525
   002698      1  270100             PERFORM PASS                                         IX2154.2 737
   002699      1  270200             GO TO START-WRITE-GF-27.                             IX2154.2 2716
   002700         270300     PERFORM FAIL.                                                IX2154.2 738
   002701         270400     MOVE    ALTERNATE-KEY2 (1)  TO WRK-FDW-ALTKEY2.              IX2154.2 550 327
   002702         270500     MOVE    FDW-ALTKEY1-1-20  TO COMPUTED-A.                     IX2154.2 320 569
   002703         270600     MOVE                                                         IX2154.2
   002704         270700     "IX-28 OR IX-36; INCORR KEY FOUND ON SECOND READ DUPL KEYS"  IX2154.2
   002705         270800             TO RE-MARK.                                          IX2154.2 563
   002706         270900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    51
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002707         271000     MOVE "WRONG REC NUMBER FOUND ON SECOND READ DUPLICATE KEYS"  IX2154.2
   002708         271100             TO RE-MARK.                                          IX2154.2 563
   002709         271200     MOVE    XRECORD-NUMBER (1) TO COMPUTED-18V0.                 IX2154.2 525 576
   002710         271300     MOVE    12 TO CORRECT-18V0.                                  IX2154.2 589
   002711         271400 START-FAIL-GF-27.                                                IX2154.2
   002712         271500     PERFORM FAIL.                                                IX2154.2 738
   002713         271600     GO TO   START-WRITE-GF-27.                                   IX2154.2 2716
   002714         271700 START-DELETE-GF-27.                                              IX2154.2
   002715         271800     PERFORM DE-LETE.                                             IX2154.2 739
   002716         271900 START-WRITE-GF-27.                                               IX2154.2
   002717         272000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002718         272100 START-TERM-GF.                                                   IX2154.2
   002719         272200     CLOSE   IX-FD3.                                              IX2154.2 289
   002720         272300 START-TEST-FINISH.                                               IX2154.2
   002721         272400     GO TO   START-TEST-COMPLETE.                                 IX2154.2 2798
   002722         272500 START-INIT-FD1.                                                  IX2154.2
   002723         272600     MOVE    SPACE  TO FILE-RECORD-INFO (1).                      IX2154.2 IMP 516
   002724         272700     MOVE    ZERO  TO INIT-FLAG.                                  IX2154.2 IMP 500
   002725         272800     MOVE    9999  TO XRECORD-NUMBER (2).                         IX2154.2 525
   002726         272900     MOVE    SPACE TO IX-FD1R1-F-G-240.                           IX2154.2 IMP 185
   002727         273000     MOVE    "GGGGGGGGGG200" TO  FDW-RECKEY-1-13.                 IX2154.2 315
   002728         273100     MOVE    WRK-FDW-RECKEY TO IX-REC-KEY-AREA.                   IX2154.2 314 189
   002729         273200     START   IX-FD1  KEY IS EQUAL TO IX-FD1-KEY INVALID KEY       IX2154.2 181 190
   002730      1  273300                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2154.2 569
   002731      1  273400                     GO TO START-INIT-FD1-ERROR.                  IX2154.2 2739
   002732         273500     READ    IX-FD1 NEXT RECORD INTO  FILE-RECORD-INFO (2)        IX2154.2 181 516
   002733      1  273600                     AT END  MOVE  "AT END ON READ" TO COMPUTED-A IX2154.2 569
   002734      1  273700                     GO TO START-INIT-FD1-ERROR.                  IX2154.2 2739
   002735         273800     IF      XRECORD-NUMBER (2) EQUAL TO 100                      IX2154.2 525
   002736      1  273900             GO TO START-INIT-FD1-EXIT.                           IX2154.2 2744
   002737         274000     MOVE    XRECORD-KEY (2)  TO WRK-FDW-RECKEY.                  IX2154.2 546 314
   002738         274100     MOVE    FDW-RECKEY-1-13  TO COMPUTED-A.                      IX2154.2 315 569
   002739         274200 START-INIT-FD1-ERROR.                                            IX2154.2
   002740         274300     MOVE     1 TO INIT-FLAG.                                     IX2154.2 500
   002741         274400     MOVE    "TEST IMPROPERLY INITIALIZED" TO RE-MARK.            IX2154.2 563
   002742         274500     MOVE    "GGGGGGGGGG200" TO CORRECT-A.                        IX2154.2 583
   002743         274600     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002744         274700 START-INIT-FD1-EXIT.                                             IX2154.2
   002745         274800     EXIT.                                                        IX2154.2
   002746         274900 START-INIT-FD2.                                                  IX2154.2
   002747         275000     MOVE    SPACE  TO FILE-RECORD-INFO (1).                      IX2154.2 IMP 516
   002748         275100     MOVE    ZERO  TO INIT-FLAG.                                  IX2154.2 IMP 500
   002749         275200     MOVE    9999  TO XRECORD-NUMBER (2).                         IX2154.2 525
   002750         275300     MOVE    SPACE TO IX-FD2R1-F-G-241.                           IX2154.2 IMP 239
   002751         275400     MOVE    "GGGGGGGGGG200" TO  IX-FD2-KEY.                      IX2154.2 249
   002752         275500     START   IX-FD2  KEY IS EQUAL TO IX-FD2-KEY INVALID KEY       IX2154.2 234 249
   002753      1  275600                     MOVE  "INVALID KEY ON START" TO COMPUTED-A   IX2154.2 569
   002754      1  275700                     GO TO START-INIT-FD2-ERROR.                  IX2154.2 2762
   002755         275800     READ    IX-FD2 NEXT RECORD INTO  FILE-RECORD-INFO (2)        IX2154.2 234 516
   002756      1  275900                     AT END  MOVE  "AT END ON READ" TO COMPUTED-A IX2154.2 569
   002757      1  276000                     GO TO START-INIT-FD2-ERROR.                  IX2154.2 2762
   002758         276100     IF      XRECORD-NUMBER (2) EQUAL TO 100                      IX2154.2 525
   002759      1  276200             GO TO START-INIT-FD2-EXIT.                           IX2154.2 2767
   002760         276300     MOVE    XRECORD-KEY (2)  TO WRK-FDW-RECKEY.                  IX2154.2 546 314
   002761         276400     MOVE    FDW-RECKEY-1-13  TO COMPUTED-A.                      IX2154.2 315 569
   002762         276500 START-INIT-FD2-ERROR.                                            IX2154.2
   002763         276600     MOVE     1 TO INIT-FLAG.                                     IX2154.2 500
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    52
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002764         276700     MOVE    "TEST IMPROPERLY INITIALIZED" TO RE-MARK.            IX2154.2 563
   002765         276800     MOVE    "GGGGGGGGGG200" TO CORRECT-A.                        IX2154.2 583
   002766         276900     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002767         277000 START-INIT-FD2-EXIT.                                             IX2154.2
   002768         277100     EXIT.                                                        IX2154.2
   002769         277200 START-INIT-FD3.                                                  IX2154.2
   002770         277300     MOVE    SPACE  TO FILE-RECORD-INFO (1).                      IX2154.2 IMP 516
   002771         277400     MOVE    ZERO  TO INIT-FLAG.                                  IX2154.2 IMP 500
   002772         277500     MOVE    9999  TO XRECORD-NUMBER (2).                         IX2154.2 525
   002773         277600     MOVE    SPACE TO IX-FD3R1-F-G-242.                           IX2154.2 IMP 294
   002774         277700     MOVE    "GGGGGGGGGG200" TO  IX-FD3-RECKEY-AREA.              IX2154.2 299
   002775         277800     START   IX-FD3                                               IX2154.2 289
   002776      1  277900           INVALID KEY  MOVE  "INVALID KEY ON START" TO COMPUTED-AIX2154.2 569
   002777      1  278000                     GO TO START-INIT-FD3-ERROR.                  IX2154.2 2785
   002778         278100     READ    IX-FD3 NEXT RECORD INTO FILE-RECORD-INFO (2)         IX2154.2 289 516
   002779      1  278200                     AT END  MOVE  "AT END ON READ" TO COMPUTED-A IX2154.2 569
   002780      1  278300                     GO TO START-INIT-FD3-ERROR.                  IX2154.2 2785
   002781         278400     IF      XRECORD-NUMBER (2) EQUAL TO 100                      IX2154.2 525
   002782      1  278500             GO TO START-INIT-FD3-EXIT.                           IX2154.2 2790
   002783         278600     MOVE    XRECORD-KEY (2)  TO WRK-FDW-RECKEY.                  IX2154.2 546 314
   002784         278700     MOVE    FDW-RECKEY-1-13  TO COMPUTED-A.                      IX2154.2 315 569
   002785         278800 START-INIT-FD3-ERROR.                                            IX2154.2
   002786         278900     MOVE     1 TO INIT-FLAG.                                     IX2154.2 500
   002787         279000     MOVE    "TEST IMPROPERLY INITIALIZED" TO RE-MARK.            IX2154.2 563
   002788         279100     MOVE    "GGGGGGGGGG200" TO CORRECT-A.                        IX2154.2 583
   002789         279200     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002790         279300 START-INIT-FD3-EXIT.                                             IX2154.2
   002791         279400     EXIT.                                                        IX2154.2
   002792         279500 DISPLAY-RECORD-KEYS.                                             IX2154.2
   002793         279600     MOVE    XRECORD-KEY (3)  TO WRK-FDW-RECKEY.                  IX2154.2 546 314
   002794         279700     MOVE    FDW-RECKEY-1-13  TO COMPUTED-A.                      IX2154.2 315 569
   002795         279800     MOVE    RECKEY-VALUE (RECNO)  TO CORRECT-A.                  IX2154.2 497 335 583
   002796         279900     MOVE    "RECORD KEY VALUES" TO RE-MARK.                      IX2154.2 563
   002797         280000     PERFORM PRINT-DETAIL.                                        IX2154.2 741
   002798         280100 START-TEST-COMPLETE.                                             IX2154.2
   002799         280200     EXIT.                                                        IX2154.2
   002800         280300 CCVS-EXIT SECTION.                                               IX2154.2
   002801         280400 CCVS-999999.                                                     IX2154.2
   002802         280500     GO TO CLOSE-FILES.                                           IX2154.2 718
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    53
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      548   ALTERNATE-KEY1 . . . . . . . .  M871 M883 M1073 1101 M1141 1168 M1205 1235 M1275 M1341 M1409 M1506 M1518 M1702
                                            1728 M1766 1792 M1830 1856 M1895 M1959 M2025 M2122 M2134 M2323 2351 M2388 2416
                                            M2452 2480 M2518 M2584 M2650
      550   ALTERNATE-KEY2 . . . . . . . .  M872 M884 M1074 M1142 M1206 M1276 1302 M1342 1368 M1410 1437 1459 M1507 M1519
                                            M1703 M1767 M1831 M1896 1921 M1960 1985 M2026 2052 2073 M2123 M2135 M2324 M2389
                                            M2453 M2519 2547 M2585 2611 M2651 2679 2701
      341   ALTKEY1-NUM. . . . . . . . . .  M912 918 M926 M1548 1554 M1562 M2165 2171 M2179
      498   ALTKEY1-VALUE. . . . . . . . .  868 1503 2119
      342   ALTKEY2-NUM
      499   ALTKEY2-VALUE. . . . . . . . .  869 1504 2120
      614   ANSI-REFERENCE . . . . . . . .  820 827 836
      177   C-ABORT. . . . . . . . . . . .  M699 M722
      171   C-ALL. . . . . . . . . . . . .  M724
      167   C-DATE . . . . . . . . . . . .  M701
      173   C-DELETED. . . . . . . . . . .  M726
      172   C-FAIL . . . . . . . . . . . .  M725
      176   C-INDENT
      174   C-INSPECT. . . . . . . . . . .  M727
      169   C-NO-OF-TESTS. . . . . . . . .  M700
      175   C-NOTE
      170   C-OK . . . . . . . . . . . . .  M723
      168   C-TIME . . . . . . . . . . . .  M702
      593   CCVS-C-1 . . . . . . . . . . .  759 805
      598   CCVS-C-2 . . . . . . . . . . .  760 806
      648   CCVS-E-1 . . . . . . . . . . .  765
      653   CCVS-E-2 . . . . . . . . . . .  774 781 788 793
      656   CCVS-E-2-2 . . . . . . . . . .  M773
      661   CCVS-E-3 . . . . . . . . . . .  794
      670   CCVS-E-4 . . . . . . . . . . .  773
      671   CCVS-E-4-1 . . . . . . . . . .  M771
      673   CCVS-E-4-2 . . . . . . . . . .  M772
      615   CCVS-H-1 . . . . . . . . . . .  754 801
      620   CCVS-H-2A. . . . . . . . . . .  755 802
      629   CCVS-H-2B. . . . . . . . . . .  756 803
      641   CCVS-H-3 . . . . . . . . . . .  757 804
      691   CCVS-PGM-ID. . . . . . . . . .  697 707 707 720
      535   CHARS-OR-RECORDS . . . . . . .  M848 M1482 M2098
      575   CM-18V0
      569   COMPUTED-A . . . . . . . . . .  570 572 573 574 575 832 835 M956 M970 M990 M1004 M1024 M1038 M1063 M1079 M1091
                                            M1095 M1102 M1129 M1146 M1158 M1162 M1169 M1211 M1225 M1229 M1236 M1263 M1280
                                            M1292 M1296 M1303 M1329 M1346 M1358 M1362 M1369 M1395 M1414 M1427 M1432 M1438
                                            M1451 M1460 M1593 M1603 M1622 M1634 M1653 M1666 M1690 M1707 M1718 M1722 M1729
                                            M1754 M1771 M1782 M1786 M1793 M1818 M1835 M1846 M1850 M1857 M1883 M1900 M1911
                                            M1915 M1922 M1947 M1964 M1975 M1979 M1986 M2011 M2030 M2042 M2047 M2053 M2066
                                            M2074 M2211 M2223 M2242 M2255 M2274 M2288 M2311 M2328 M2340 M2344 M2352 M2376
                                            M2393 M2406 M2410 M2417 M2441 M2457 M2470 M2474 M2481 M2506 M2523 M2537 M2541
                                            M2548 M2572 M2589 M2601 M2605 M2612 M2636 M2655 M2669 M2674 M2680 M2693 M2702
                                            M2730 M2733 M2738 M2753 M2756 M2761 M2776 M2779 M2784 M2794
      570   COMPUTED-N
      568   COMPUTED-X . . . . . . . . . .  M749 817
      572   COMPUTED-0V18
      574   COMPUTED-14V4
      576   COMPUTED-18V0. . . . . . . . .  M899 M936 M942 M973 M1007 M1041 M1068 M1108 M1136 M1175 M1200 M1242 M1270 M1309
                                            M1336 M1375 M1403 M1446 M1466 M1535 M1573 M1579 M1606 M1637 M1669 M1697 M1735
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    54
0 Defined   Cross-reference of data names   References

0                                           M1761 M1799 M1825 M1863 M1890 M1928 M1954 M1992 M2019 M2061 M2082 M2151 M2190
                                            M2196 M2226 M2258 M2291 M2318 M2358 M2383 M2423 M2448 M2487 M2513 M2554 M2579
                                            M2618 M2644 M2688 M2709
      573   COMPUTED-4V14
      592   COR-ANSI-REFERENCE . . . . . .  M827 M829
      583   CORRECT-A. . . . . . . . . . .  584 585 586 587 588 833 835 M976 M1010 M1044 M1103 M1170 M1237 M1304 M1370 M1439
                                            M1461 M1609 M1640 M1672 M1730 M1794 M1858 M1923 M1987 M2054 M2075 M2229 M2261
                                            M2294 M2353 M2418 M2482 M2549 M2613 M2681 M2742 M2765 M2788 M2795
      584   CORRECT-N
      582   CORRECT-X. . . . . . . . . . .  M750 819
      585   CORRECT-0V18
      587   CORRECT-14V4
      589   CORRECT-18V0 . . . . . . . . .  M935 M943 M1112 M1178 M1245 M1312 M1378 M1396 M1404 M1415 M1428 M1433 M1447 M1452
                                            M1467 M1534 M1572 M1580 M1738 M1802 M1866 M1931 M1995 M2012 M2020 M2031 M2043
                                            M2048 M2062 M2067 M2083 M2150 M2189 M2197 M2361 M2426 M2490 M2557 M2621 M2637
                                            M2645 M2656 M2670 M2675 M2689 M2694 M2710
      586   CORRECT-4V14
      588   CR-18V0
      606   DELETE-COUNTER . . . . . . . .  726 M739 768 784 786
      561   DOTVALUE . . . . . . . . . . .  M744
      612   DUMMY-HOLD . . . . . . . . . .  M798 808
      180   DUMMY-RECORD . . . . . . . . .  M754 M755 M756 M757 M759 M760 M761 M763 M765 M774 M781 M788 M793 M794 798 M799
                                            800 M801 M802 M803 M804 M805 M806 M807 M808 812 M813 M822 M837 M949 M984 M1018
                                            M1053 M1119 M1185 M1253 M1319 M1385 M1587 M1617 M1648 M1681 M1745 M1809 M1874
                                            M1938 M2002 M2205 M2237 M2269 M2303 M2368 M2433 M2498 M2564 M2628
      659   ENDER-DESC . . . . . . . . . .  M776 M787 M792
      607   ERROR-COUNTER. . . . . . . . .  725 M738 767 777 780
      611   ERROR-HOLD . . . . . . . . . .  724 M767 M768 M768 M769 772
      657   ERROR-TOTAL. . . . . . . . . .  M778 M780 M785 M786 M790 M791
      336   EXCUT-COUNTER-06V00. . . . . .  M876 M888 890 M910 922 M924 930 936 M1493 M1511 M1523 1525 M1546 1558 M1560 1566
                                            1573 M2109 M2127 M2139 2141 M2163 2175 M2177 2183 2190
      343   FAIL-SW. . . . . . . . . . . .  929 M940 1565 M1577 2182 M2194
      321   FDW-ALTKEY1-1-10
      320   FDW-ALTKEY1-1-20 . . . . . . .  M868 M1084 1102 M1151 1169 M1216 1236 1460 M1503 M1552 1729 1793 1857 M2119 M2169
                                            2352 2417 2481 2702
      322   FDW-ALTKEY1-1-5
      324   FDW-ALTKEY1-11-13. . . . . . .  M879 918 M1514 1554 M2130 2171
      325   FDW-ALTKEY1-14-20
      323   FDW-ALTKEY1-6-10
      329   FDW-ALTKEY2-1-10
      328   FDW-ALTKEY2-1-20 . . . . . . .  M869 M1285 1303 M1351 1369 M1420 1438 M1504 1922 1986 2053 2074 M2120 2548 2612
                                            2680
      330   FDW-ALTKEY2-1-5
      332   FDW-ALTKEY2-11-13. . . . . . .  M880 M1515 M2131
      333   FDW-ALTKEY2-14-20
      331   FDW-ALTKEY2-6-10
      316   FDW-RECKEY-1-10
      315   FDW-RECKEY-1-13. . . . . . . .  M867 M952 M961 M986 M995 M1020 M1029 M1055 M1121 M1187 M1255 M1321 M1387 M1502
                                            M1551 M2118 M2168 M2727 2738 2761 2784 2794
      317   FDW-RECKEY-11-13 . . . . . . .  M878 917 942 M1513 1553 1579 M2129 2170 2196
      554   FEATURE. . . . . . . . . . . .  M855 M909 M951 M1052 M1252 M1489 M1545 M1589 M1680 M1873 M2105 M2162 M2207 M2302
                                            M2497
      516   FILE-RECORD-INFO . . . . . . .  M715 873 885 M972 M1006 M1040 M1065 1075 M1097 M1131 1143 M1164 M1196 1207 M1231
                                            M1265 1277 M1298 M1331 1343 M1364 M1398 1411 M1435 M1454 1508 1520 M1605 M1636
                                            M1668 M1692 1704 M1724 M1756 1768 M1788 M1820 1832 M1852 M1885 1897 M1917 M1949
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    55
0 Defined   Cross-reference of data names   References

0                                           1961 M1981 M2014 2027 M2050 M2069 2124 2136 M2225 M2257 M2290 M2313 2325 M2346
                                            M2378 2390 M2412 M2443 2454 M2476 M2508 2520 M2543 M2574 2586 M2607 M2639 2652
                                            M2677 M2696 M2723 M2732 M2747 M2755 M2770 M2778
      517   FILE-RECORD-INFO-P1-120
      544   FILE-RECORD-INFO-P121-240
      502   FILE-RECORD-INFO-SKELETON. . .  714
      501   FILE-RECORD-INFORMATION-REC
      118   FOR-INX-START-TEST . . . . . .  115
      685   HYPHEN-LINE. . . . . . . . . .  761 763 807
      651   ID-AGAIN . . . . . . . . . . .  M707
      684   INF-ANSI-REFERENCE . . . . . .  M820 M823 M836 M838
      679   INFO-TEXT. . . . . . . . . . .  M821
      500   INIT-FLAG. . . . . . . . . . .  959 993 1027 1071 1082 1139 1149 1203 1214 1273 1283 1339 1349 1407 1418 1596
                                            1625 1656 1700 1710 1764 1774 1828 1838 1893 1903 1957 1967 2023 2034 2214 2245
                                            2277 2321 2331 2386 2396 2450 2460 2516 2526 2582 2592 2648 2659 M2724 M2740
                                            M2748 M2763 M2771 M2786
      608   INSPECT-COUNTER. . . . . . . .  727 M736 767 789 791
      338   INVKEY-COUNTER . . . . . . . .  M858 M875 M887 890 M1492 M1510 M1522 1525 M2108 M2126 M2138 2141
      203   IX-ALT-KEY1-AREA . . . . . . .  916 M1085 M1152 M1217
      219   IX-ALT-KEY2-AREA . . . . . . .  M1286 M1352 M1421
      205   IX-FDW-ALTKEY1-1-10
      206   IX-FDW-ALTKEY1-1-5
      208   IX-FDW-ALTKEY1-11-13
      209   IX-FDW-ALTKEY1-14-20
      207   IX-FDW-ALTKEY1-6-10
      221   IX-FDW-ALTKEY2-1-10
      222   IX-FDW-ALTKEY2-1-5
      224   IX-FDW-ALTKEY2-11-13
      225   IX-FDW-ALTKEY2-14-20
      223   IX-FDW-ALTKEY2-6-10
      181   IX-FD1 . . . . . . . . . . . .  128 844 905 907 914 946 948 M955 963 969 M989 997 1003 M1023 1031 1037 1058 1086
                                            1093 1124 1153 1160 1190 1218 1227 1258 1287 1294 1324 1353 1360 1390 1422 1430
                                            1449 1476 2729 2732
      204   IX-FD1-ALTKEY1 . . . . . . . .  210 134
      220   IX-FD1-ALTKEY2 . . . . . . . .  226 135
      190   IX-FD1-KEY . . . . . . . . . .  195 133 1059 1125 1191 1259 1325 1391 2729
      191   IX-FD1-KEY-1-10
      192   IX-FD1-KEY-1-5
      194   IX-FD1-KEY-11-13
      193   IX-FD1-KEY-6-10
      186   IX-FD1-REC-120
      187   IX-FD1-REC-121-240
      185   IX-FD1R1-F-G-240 . . . . . . .  M873 874 M885 886 972 1006 1040 1065 M1075 1076 1097 1131 M1143 1144 1164 1196
                                            M1207 1208 1231 1265 M1277 1278 1298 1331 M1343 1344 1364 1398 M1411 1412 1435
                                            1454 M2726
      234   IX-FD2 . . . . . . . . . . . .  137 1478 1541 1543 1550 1584 1586 M1592 1599 1602 M1621 1628 1633 M1652 1659
                                            1665 1685 1713 1720 1749 1777 1784 1813 1841 1848 1878 1906 1913 1942 1970 1977
                                            2006 2037 2045 2064 2092 2752 2755
      265   IX-FD2-ALTKEY1 . . . . . . . .  268 144 1552 M1712 1714 M1776 M1840
      259   IX-FD2-ALTKEY1-AREA. . . . . .  260 264
      260   IX-FD2-ALTKEY1-AREA2
      264   IX-FD2-ALTKEY1-AREA3
      269   IX-FD2-ALTKEY1-1-5 . . . . . .  1842
      261   IX-FD2-ALTKEY1-1-6
      266   IX-FD2-ALTKEY1-10
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    56
0 Defined   Cross-reference of data names   References

0     267   IX-FD2-ALTKEY1-11-20
      270   IX-FD2-ALTKEY1-6-20
      262   IX-FD2-ALTKEY1-7-20
      275   IX-FD2-ALTKEY2 . . . . . . . .  145 M1905 1907 M1969 M2036
      273   IX-FD2-ALTKEY2-AREA. . . . . .  274 277
      274   IX-FD2-ALTKEY2-AREA2
      277   IX-FD2-ALTKEY2-AREA3
      281   IX-FD2-ALTKEY2-1-3 . . . . . .  2038
      278   IX-FD2-ALTKEY2-1-6 . . . . . .  280 1971
      282   IX-FD2-ALTKEY2-4-6
      283   IX-FD2-ALTKEY2-7-20
      249   IX-FD2-KEY . . . . . . . . . .  143 1551 M1590 M1598 1599 M1619 M1627 M1650 M1658 M1683 1686 M1747 1750 M1811
                                            1814 M1876 1879 M1940 1943 M2004 2007 M2751 2752
      241   IX-FD2-REC-120
      242   IX-FD2-REC-121-241
      287   IX-FD2-REC-240 . . . . . . . .  1605 1636 1668 1692 1724 1756 1788 1820 1852 1885 1917 1949 1981 2014 2050 2069
      240   IX-FD2-REC-241 . . . . . . . .  286
      286   IX-FD2-REC-241-240
      243   IX-FD2-RECKEY-AREA . . . . . .  244 247 251
      244   IX-FD2-RECKEY-AREA2
      245   IX-FD2-RECKEY-AREA2-1
      246   IX-FD2-RECKEY-AREA2-2
      247   IX-FD2-RECKEY-AREA3
      251   IX-FD2-RECKEY-AREA4
      253   IX-FD2-RECKEY-REDF . . . . . .  254 1628
      254   IX-FD2-RECKEY-REDF2
      255   IX-FD2-RECKEY-1-6. . . . . . .  1660
      256   IX-FD2-RECKEY-7-13
      268   IX-FD2-REDF-ALTKEY1. . . . . .  1778
      279   IX-FD2-REDF-ALTKEY2-1-6
      239   IX-FD2R1-F-G-241 . . . . . . .  M1508 1509 M1520 1521 M1704 1705 M1768 1769 M1832 1833 M1897 1898 M1961 1962
                                            M2027 2028 M2750
      289   IX-FD3 . . . . . . . . . . . .  147 2094 2158 2160 2167 2202 2204 M2210 2217 2222 M2241 2248 2254 M2273 2280
                                            2287 2307 2334 2342 2372 2399 2408 2437 2463 2472 2502 2529 2539 2568 2595 2603
                                            2632 2662 2672 2691 2719 2775 2778
      302   IX-FD3-ALTKEY1-AREA. . . . . .  155 2169 M2333 2336 M2398 2402 M2462 2466
      305   IX-FD3-ALTKEY2-AREA. . . . . .  157 M2528 2533 M2594 2597 M2661 2665
      300   IX-FD3-KEY . . . . . . . . . .  153 2217 2248 2281
      303   IX-FD3-KEY . . . . . . . . . .  154 2335 2401 2465
      306   IX-FD3-KEY . . . . . . . . . .  156 2531 2597 2663
      296   IX-FD3-REC-120
      297   IX-FD3-REC-121-242
      308   IX-FD3-REC-240
      295   IX-FD3-REC-242 . . . . . . . .  308
      299   IX-FD3-RECKEY-AREA . . . . . .  153 2168 M2208 M2216 2217 M2239 M2247 2249 M2271 M2279 2282 M2305 M2370 M2435
                                            M2500 M2566 M2630 M2774
      309   IX-FD3-240 . . . . . . . . . .  2225 2257 2290 2313 2346 2378 2412 2443 2476 2508 2543 2574 2607 2639 2677 2696
      294   IX-FD3R1-F-G-242 . . . . . . .  M2124 2125 M2136 2137 M2325 2326 M2390 2391 M2454 2455 M2520 2521 M2586 2587
                                            M2652 2653 M2773
      189   IX-REC-KEY-AREA. . . . . . . .  915 M953 M962 M987 M996 M1021 M1030 M1056 M1122 M1188 M1256 M1322 M1388 M2728
      210   IX-REDF-ALTKEY1. . . . . . . .  1087
      226   IX-REDF-ALTKEY2. . . . . . . .  1288
      195   IX-REDF-RECKEY . . . . . . . .  964
      496   KEY-VALUES
      337   KEYSUB . . . . . . . . . . . .  M857 M866 867 868 869 M1491 M1501 1502 1503 1504 M2107 M2117 2118 2119 2120
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    57
0 Defined   Cross-reference of data names   References

0     529   ODO-NUMBER
      556   P-OR-F . . . . . . . . . . . .  M736 M737 M738 M739 746 M749
      558   PAR-NAME . . . . . . . . . . .  M751 M856 M908 M950 M985 M1019 M1054 M1110 M1120 M1186 M1254 M1320 M1386 M1490
                                            M1544 M1588 M1618 M1649 M1682 M1746 M1810 M1875 M1939 M2003 M2106 M2161 M2206
                                            M2238 M2270 M2304 M2369 M2434 M2499 M2565 M2629
      560   PARDOT-X . . . . . . . . . . .  M743
      609   PASS-COUNTER . . . . . . . . .  723 M737 769 771
      178   PRINT-FILE . . . . . . . . . .  126 706 731
      179   PRINT-REC. . . . . . . . . . .  M745 M826 M828
      213   R-ALTKEY1-1-4. . . . . . . . .  1219
      211   R-ALTKEY1-1-6. . . . . . . . .  212 1154
      216   R-ALTKEY1-11-20
      214   R-ALTKEY1-5-6
      215   R-ALTKEY1-7-10
      229   R-ALTKEY2-1-2. . . . . . . . .  1423
      227   R-ALTKEY2-1-3. . . . . . . . .  228 1354
      230   R-ALTKEY2-3-3
      231   R-ALTKEY2-4-20
      198   R-RECKEY-1-5 . . . . . . . . .  1032
      196   R-RECKEY-1-7 . . . . . . . . .  197 998
      199   R-RECKEY-6-7
      200   R-RECKEY-8-13
      212   R-REDF-ALTKEY1-1-6
      228   R-REDF-ALTKEY2-1-3
      197   R-REDF-RECKEY-1-7
      163   RAW-DATA . . . . . . . . . . .  121 696 698 705 719 721 730
      166   RAW-DATA-KEY . . . . . . . . .  125 M697 M720
      165   RAW-DATA-SATZ. . . . . . . . .  703 728
      563   RE-MARK. . . . . . . . . . . .  M740 M752 M894 M898 M932 M934 M944 M967 M977 M1001 M1011 M1035 M1045 M1062 M1067
                                            M1078 M1090 M1094 M1104 M1107 M1128 M1135 M1145 M1157 M1161 M1171 M1174 M1194
                                            M1199 M1210 M1222 M1224 M1228 M1238 M1241 M1262 M1269 M1279 M1291 M1295 M1305
                                            M1308 M1328 M1335 M1345 M1357 M1361 M1371 M1374 M1394 M1402 M1413 M1426 M1431
                                            M1442 M1445 M1450 M1464 M1529 M1533 M1568 M1571 M1581 M1610 M1631 M1641 M1663
                                            M1673 M1689 M1696 M1706 M1717 M1721 M1731 M1734 M1753 M1760 M1770 M1781 M1785
                                            M1795 M1798 M1817 M1824 M1834 M1845 M1849 M1859 M1862 M1882 M1889 M1899 M1910
                                            M1914 M1924 M1927 M1946 M1953 M1963 M1974 M1978 M1988 M1991 M2010 M2018 M2029
                                            M2041 M2046 M2057 M2060 M2065 M2078 M2081 M2145 M2149 M2185 M2188 M2199 M2220
                                            M2230 M2252 M2262 M2285 M2295 M2310 M2317 M2327 M2339 M2343 M2354 M2357 M2375
                                            M2382 M2392 M2405 M2409 M2419 M2422 M2440 M2447 M2456 M2469 M2473 M2483 M2486
                                            M2505 M2512 M2522 M2536 M2540 M2550 M2553 M2571 M2578 M2588 M2600 M2604 M2614
                                            M2617 M2635 M2643 M2654 M2668 M2673 M2684 M2687 M2692 M2705 M2708 M2741 M2764
                                            M2787 M2796
      605   REC-CT . . . . . . . . . . . .  742 744 751 M2198
      604   REC-SKL-SUB. . . . . . . . . .  M710 M713 715
      340   RECKEY-NUM . . . . . . . . . .  M911 917 M925 943 M1547 1553 M1561 1580 M2164 2170 M2178 2197
      497   RECKEY-VALUE . . . . . . . . .  867 1502 2118 2795
      335   RECNO. . . . . . . . . . . . .  M1133 M1198 M1267 M1333 M1400 M1694 M1758 M1822 M1887 M1951 M2016 M2315 M2380
                                            M2445 M2510 M2576 M2641 2795
      613   RECORD-COUNT . . . . . . . . .  M796 797 M809
      344   RECORD-KEY-CONTENT . . . . . .  495
      495   RECORD-KEY-DATA
      539   RECORDS-IN-FILE. . . . . . . .  M854 M1488 M2104
      339   RECORDS-WRITTEN. . . . . . . .  M891 892 899 M1526 1527 1535 M2142 2143 2151
      523   REELUNIT-NUMBER
      564   TEST-COMPUTED. . . . . . . . .  826
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    58
0 Defined   Cross-reference of data names   References

0     579   TEST-CORRECT . . . . . . . . .  828
      632   TEST-ID. . . . . . . . . . . .  M707
      552   TEST-RESULTS . . . . . . . . .  M708 745
      610   TOTAL-ERROR
      527   UPDATE-NUMBER
      319   WRK-FDW-ALTKEY1. . . . . . . .  871 883 M916 1085 M1101 1152 M1168 1217 M1235 1506 1518 M1728 M1792 M1856 2122
                                            2134 M2351 M2416 M2480
      327   WRK-FDW-ALTKEY2. . . . . . . .  872 884 1286 M1302 1352 M1368 1421 M1437 M1459 1507 1519 M1921 M1985 M2052 M2073
                                            2123 2135 M2547 M2611 M2679 M2701
      314   WRK-FDW-RECKEY . . . . . . . .  870 882 M915 953 962 987 996 1021 1030 1056 1122 1188 1256 1322 1388 1505 1517
                                            2121 2133 2728 M2737 M2760 M2783 M2793
      537   XBLOCK-SIZE. . . . . . . . . .  M851 M1485 M2101
      519   XFILE-NAME . . . . . . . . . .  M845 M1479 M2095
      541   XFILE-ORGANIZATION . . . . . .  M852 M1486 M2102
      543   XLABEL-TYPE. . . . . . . . . .  M853 M1487 M2103
      531   XPROGRAM-NAME. . . . . . . . .  M849 M1483 M2099
      546   XRECORD-KEY. . . . . . . . . .  M870 M882 M1505 M1517 M2121 M2133 2737 2760 2783 2793
      533   XRECORD-LENGTH . . . . . . . .  M850 M1484 M2100
      521   XRECORD-NAME . . . . . . . . .  M846 M1480 M2096
      525   XRECORD-NUMBER . . . . . . . .  M847 M865 M881 973 1007 1041 1066 1068 1098 1108 1132 1136 1165 1175 1197 1200
                                            1232 1242 1266 1270 1299 1309 1332 1336 1365 1375 1399 1403 1436 1446 1455 1466
                                            M1481 M1500 M1516 1606 1637 1669 1693 1697 1725 1735 1757 1761 1789 1799 1821
                                            1825 1853 1863 1886 1890 1918 1928 1950 1954 1982 1992 2015 2019 2051 2061 2070
                                            2082 M2097 M2116 M2132 2226 2258 2291 2314 2318 2347 2358 2379 2383 2413 2423
                                            2444 2448 2477 2487 2509 2513 2544 2554 2575 2579 2608 2618 2640 2644 2678 2688
                                            2697 2709 M2725 2735 M2749 2758 M2772 2781
      681   XXCOMPUTED . . . . . . . . . .  M835
      683   XXCORRECT. . . . . . . . . . .  M835
      676   XXINFO . . . . . . . . . . . .  822 837
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    59
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

      831   BAIL-OUT . . . . . . . . . . .  P748
      839   BAIL-OUT-EX. . . . . . . . . .  E748 G833
      834   BAIL-OUT-WRITE . . . . . . . .  G832
      814   BLANK-LINE-PRINT . . . . . . .  P949 P984 P1018 P1053 P1119 P1185 P1253 P1319 P1385 P1587 P1617 P1648 P1681 P1745
                                            P1809 P1874 P1938 P2002 P2205 P2237 P2269 P2303 P2368 P2433 P2498 P2564 P2628
     2800   CCVS-EXIT
      716   CCVS-INIT-EXIT
      712   CCVS-INIT-FILE . . . . . . . .  P711
     2801   CCVS-999999
      694   CCVS1
      840   CCVS1-EXIT . . . . . . . . . .  G717
      718   CLOSE-FILES. . . . . . . . . .  G2802
      758   COLUMN-NAMES-ROUTINE . . . . .  E709
      739   DE-LETE. . . . . . . . . . . .  P902 P980 P1014 P1048 P1115 P1181 P1248 P1315 P1381 P1472 P1538 P1613 P1644 P1676
                                            P1741 P1805 P1869 P1934 P1998 P2088 P2155 P2233 P2265 P2298 P2364 P2429 P2493
                                            P2560 P2624 P2715
     2792   DISPLAY-RECORD-KEYS. . . . . .  P1134 P1268 P1334 P1401 P1695 P1759 P1823 P1888 P1952 P2017 P2316 P2381 P2446
                                            P2511 P2577 P2642
      704   END-E-1. . . . . . . . . . . .  G698 G703
      729   END-E-2. . . . . . . . . . . .  G721 G728
      762   END-ROUTINE. . . . . . . . . .  P731
      766   END-ROUTINE-1
      775   END-ROUTINE-12
      783   END-ROUTINE-13 . . . . . . . .  E731
      764   END-RTN-EXIT
      738   FAIL . . . . . . . . . . . . .  P895 P933 P941 P975 P1009 P1043 P1111 P1177 P1244 P1311 P1377 P1469 P1530 P1569
                                            P1578 P1608 P1639 P1671 P1737 P1801 P1865 P1930 P1994 P2085 P2146 P2186 P2195
                                            P2228 P2260 P2293 P2308 P2350 P2360 P2425 P2467 P2489 P2556 P2620 P2700 P2712
      816   FAIL-ROUTINE . . . . . . . . .  P747
      830   FAIL-ROUTINE-EX. . . . . . . .  E747 G824
      825   FAIL-ROUTINE-WRITE . . . . . .  G818 G819
      753   HEAD-ROUTINE . . . . . . . . .  P709
      736   INSPT
      695   OPEN-FILES
      737   PASS . . . . . . . . . . . . .  P893 P931 P965 P999 P1033 P1099 P1166 P1233 P1300 P1366 P1456 P1528 P1567 P1600
                                            P1629 P1661 P1726 P1790 P1854 P1919 P1983 P2071 P2144 P2184 P2218 P2250 P2283
                                            P2348 P2414 P2478 P2545 P2609 P2698
      741   PRINT-DETAIL . . . . . . . . .  P904 P937 P982 P1016 P1050 P1105 P1117 P1172 P1183 P1239 P1250 P1306 P1317 P1372
                                            P1383 P1443 P1457 P1465 P1474 P1540 P1574 P1582 P1615 P1646 P1678 P1732 P1743
                                            P1796 P1807 P1860 P1871 P1925 P1936 P1989 P2000 P2058 P2079 P2090 P2152 P2156
                                            P2191 P2200 P2235 P2267 P2300 P2355 P2366 P2420 P2431 P2484 P2495 P2551 P2562
                                            P2615 P2626 P2685 P2706 P2717 P2743 P2766 P2789 P2797
     2201   READ-EXIT-F1-O3. . . . . . . .  G2182 G2192
      945   READ-EXIT-F1-01. . . . . . . .  G929 G938
     1583   READ-EXIT-F1-02. . . . . . . .  G1565 G1575
     2193   READ-FAIL-F1-O3. . . . . . . .  P2174
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    60
0 Defined   Cross-reference of procedures   References

0     939   READ-FAIL-F1-01. . . . . . . .  P921
     1576   READ-FAIL-F1-02. . . . . . . .  P1557
     2159   READ-INIT-F1-O3
      906   READ-INIT-F1-01
     1542   READ-INIT-F1-02
     2181   READ-TEST-F1-O3. . . . . . . .  G2167 G2176
     2166   READ-TEST-F1-O3-R1 . . . . . .  G2180
      928   READ-TEST-F1-01. . . . . . . .  G914 G923
      913   READ-TEST-F1-01-R1 . . . . . .  G927
     1564   READ-TEST-F1-02. . . . . . . .  G1550 G1559
     1549   READ-TEST-F1-02-R1 . . . . . .  G1563
      842   SECT-0001-IX215A
      979   START-DELETE-GF-01 . . . . . .  G960
     1013   START-DELETE-GF-02 . . . . . .  G994
     1047   START-DELETE-GF-03 . . . . . .  G1028
     1114   START-DELETE-GF-04 . . . . . .  G1072
     1180   START-DELETE-GF-05 . . . . . .  G1140
     1247   START-DELETE-GF-06 . . . . . .  G1204
     1314   START-DELETE-GF-07 . . . . . .  G1274
     1380   START-DELETE-GF-08 . . . . . .  G1340
     1471   START-DELETE-GF-09 . . . . . .  G1408
     1612   START-DELETE-GF-10 . . . . . .  G1597
     1643   START-DELETE-GF-11 . . . . . .  G1626
     1675   START-DELETE-GF-12 . . . . . .  G1657
     1740   START-DELETE-GF-13 . . . . . .  G1701
     1804   START-DELETE-GF-14 . . . . . .  G1765
     1868   START-DELETE-GF-15 . . . . . .  G1829
     1933   START-DELETE-GF-16 . . . . . .  G1894
     1997   START-DELETE-GF-17 . . . . . .  G1958
     2087   START-DELETE-GF-18 . . . . . .  G2024
     2232   START-DELETE-GF-19 . . . . . .  G2215
     2264   START-DELETE-GF-20 . . . . . .  G2246
     2297   START-DELETE-GF-21 . . . . . .  G2278
     2363   START-DELETE-GF-22 . . . . . .  G2322
     2428   START-DELETE-GF-23 . . . . . .  G2387
     2492   START-DELETE-GF-24 . . . . . .  G2451
     2559   START-DELETE-GF-25 . . . . . .  G2517
     2623   START-DELETE-GF-26 . . . . . .  G2583
     2714   START-DELETE-GF-27 . . . . . .  G2649
      974   START-FAIL-GF-01 . . . . . . .  G957 G971
     1008   START-FAIL-GF-02 . . . . . . .  G991 G1005
     1042   START-FAIL-GF-03 . . . . . . .  G1025 G1039
     1109   START-FAIL-GF-04 . . . . . . .  G1064 G1069 G1080 G1083 G1092 G1096
     1176   START-FAIL-GF-05 . . . . . . .  G1130 G1137 G1147 G1150 G1159 G1163
     1243   START-FAIL-GF-06 . . . . . . .  G1195 G1201 G1212 G1215 G1226 G1230
     1310   START-FAIL-GF-07 . . . . . . .  G1264 G1271 G1281 G1284 G1293 G1297
     1376   START-FAIL-GF-08 . . . . . . .  G1330 G1337 G1347 G1350 G1359 G1363
     1468   START-FAIL-GF-09 . . . . . . .  G1397 G1405 G1416 G1419 G1429 G1434 G1448 G1453
     1607   START-FAIL-GF-10 . . . . . . .  G1594 G1604
     1638   START-FAIL-GF-11 . . . . . . .  G1623 G1635
     1670   START-FAIL-GF-12 . . . . . . .  G1654 G1667
     1736   START-FAIL-GF-13 . . . . . . .  G1691 G1698 G1708 G1711 G1719 G1723
     1800   START-FAIL-GF-14 . . . . . . .  G1755 G1762 G1772 G1775 G1783 G1787
     1864   START-FAIL-GF-15 . . . . . . .  G1819 G1826 G1836 G1839 G1847 G1851
     1929   START-FAIL-GF-16 . . . . . . .  G1884 G1891 G1901 G1904 G1912 G1916
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    61
0 Defined   Cross-reference of procedures   References

0    1993   START-FAIL-GF-17 . . . . . . .  G1948 G1955 G1965 G1968 G1976 G1980
     2084   START-FAIL-GF-18 . . . . . . .  G2013 G2021 G2032 G2035 G2044 G2049 G2063 G2068
     2227   START-FAIL-GF-19 . . . . . . .  G2212 G2224
     2259   START-FAIL-GF-20 . . . . . . .  G2243 G2256
     2292   START-FAIL-GF-21 . . . . . . .  G2275 G2289
     2359   START-FAIL-GF-22 . . . . . . .  G2312 G2319 G2329 G2332 G2341 G2345
     2424   START-FAIL-GF-23 . . . . . . .  G2377 G2384 G2394 G2397 G2407 G2411
     2488   START-FAIL-GF-24 . . . . . . .  G2442 G2449 G2458 G2461 G2471 G2475
     2555   START-FAIL-GF-25 . . . . . . .  G2507 G2514 G2524 G2527 G2538 G2542
     2619   START-FAIL-GF-26 . . . . . . .  G2573 G2580 G2590 G2593 G2602 G2606
     2711   START-FAIL-GF-27 . . . . . . .  G2638 G2646 G2657 G2660 G2671 G2676 G2690 G2695
      947   START-INIT
     2722   START-INIT-FD1 . . . . . . . .  P958 P992 P1026 P1070 P1081 P1138 P1148 P1202 P1272 P1282 P1338 P1348 P1406 P1417
     2739   START-INIT-FD1-ERROR . . . . .  G2731 G2734
     2744   START-INIT-FD1-EXIT. . . . . .  E958 E992 E1026 E1070 E1081 E1138 E1148 E1202 E1272 E1282 E1338 E1348 E1406 E1417
                                            G2736
     2746   START-INIT-FD2 . . . . . . . .  P1595 P1624 P1655 P1699 P1709 P1763 P1773 P1827 P1837 P1892 P1902 P1956 P1966
                                            P2022 P2033
     2762   START-INIT-FD2-ERROR . . . . .  G2754 G2757
     2767   START-INIT-FD2-EXIT. . . . . .  E1595 E1624 E1655 E1699 E1709 E1763 E1773 E1827 E1837 E1892 E1902 E1956 E1966
                                            E2022 E2033 G2759
     2769   START-INIT-FD3 . . . . . . . .  P2213 P2244 P2276 P2320 P2330 P2385 P2395 P2459 P2515 P2525 P2581 P2591 P2647
                                            P2658
     2785   START-INIT-FD3-ERROR . . . . .  G2777 G2780
     2790   START-INIT-FD3-EXIT. . . . . .  E2213 E2244 E2276 E2320 E2330 E2385 E2395 E2459 E2515 E2525 E2581 E2591 E2647
                                            E2658 G2782
      983   START-INIT-GF-02
     1017   START-INIT-GF-03
     1051   START-INIT-GF-04
     1118   START-INIT-GF-05
     1184   START-INIT-GF-06
     1251   START-INIT-GF-07
     1318   START-INIT-GF-08
     1384   START-INIT-GF-09
     1585   START-INIT-GF-10
     1616   START-INIT-GF-11
     1647   START-INIT-GF-12
     1679   START-INIT-GF-13
     1744   START-INIT-GF-14
     1808   START-INIT-GF-15
     1872   START-INIT-GF-16
     1937   START-INIT-GF-17
     2001   START-INIT-GF-18
     2203   START-INIT-GF-19
     2236   START-INIT-GF-20
     2268   START-INIT-GF-21
     2301   START-INIT-GF-22
     2367   START-INIT-GF-23
     2432   START-INIT-GF-24
     2496   START-INIT-GF-25
     2563   START-INIT-GF-26
     2627   START-INIT-GF-27
     2718   START-TERM-GF
     1475   START-TERM-003
     2798   START-TEST-COMPLETE. . . . . .  G2721
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    62
0 Defined   Cross-reference of procedures   References

0    2720   START-TEST-FINISH
      954   START-TEST-GF-01
      988   START-TEST-GF-02
     1022   START-TEST-GF-03
     1057   START-TEST-GF-04
     1123   START-TEST-GF-05
     1189   START-TEST-GF-06
     1257   START-TEST-GF-07
     1323   START-TEST-GF-08
     1389   START-TEST-GF-09
     1591   START-TEST-GF-10
     1620   START-TEST-GF-11
     1651   START-TEST-GF-12
     1684   START-TEST-GF-13
     1748   START-TEST-GF-14
     1812   START-TEST-GF-15
     1877   START-TEST-GF-16
     1941   START-TEST-GF-17
     2005   START-TEST-GF-18
     2209   START-TEST-GF-19
     2240   START-TEST-GF-20
     2272   START-TEST-GF-21
     2306   START-TEST-GF-22
     2371   START-TEST-GF-23
     2436   START-TEST-GF-24
     2501   START-TEST-GF-25
     2567   START-TEST-GF-26
     2631   START-TEST-GF-27
      981   START-WRITE-GF-01. . . . . . .  G968 G978
     1015   START-WRITE-GF-02. . . . . . .  G1002 G1012
     1049   START-WRITE-GF-03. . . . . . .  G1036 G1046
     1116   START-WRITE-GF-04. . . . . . .  G1100 G1113
     1182   START-WRITE-GF-05. . . . . . .  G1167 G1179
     1249   START-WRITE-GF-06. . . . . . .  G1234 G1246
     1316   START-WRITE-GF-07. . . . . . .  G1301 G1313
     1382   START-WRITE-GF-08. . . . . . .  G1367 G1379
     1473   START-WRITE-GF-09. . . . . . .  G1458 G1470
     1614   START-WRITE-GF-10. . . . . . .  G1601 G1611
     1645   START-WRITE-GF-11. . . . . . .  G1632 G1642
     1677   START-WRITE-GF-12. . . . . . .  G1664 G1674
     1742   START-WRITE-GF-13. . . . . . .  G1727 G1739
     1806   START-WRITE-GF-14. . . . . . .  G1791 G1803
     1870   START-WRITE-GF-15. . . . . . .  G1855 G1867
     1935   START-WRITE-GF-16. . . . . . .  G1920 G1932
     1999   START-WRITE-GF-17. . . . . . .  G1984 G1996
     2089   START-WRITE-GF-18. . . . . . .  G2072 G2086
     2234   START-WRITE-GF-19. . . . . . .  G2221 G2231
     2266   START-WRITE-GF-20. . . . . . .  G2253 G2263
     2299   START-WRITE-GF-21. . . . . . .  G2286 G2296
     2365   START-WRITE-GF-22. . . . . . .  G2349 G2362
     2430   START-WRITE-GF-23. . . . . . .  G2415 G2427
     2494   START-WRITE-GF-24. . . . . . .  G2479 G2491
     2561   START-WRITE-GF-25. . . . . . .  G2546 G2558
     2625   START-WRITE-GF-26. . . . . . .  G2610 G2622
     2716   START-WRITE-GF-27. . . . . . .  G2699 G2713
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    63
0 Defined   Cross-reference of procedures   References

0     734   TERMINATE-CALL
      732   TERMINATE-CCVS
      901   WRITE-DELETE-GF-01
     1537   WRITE-DELETE-GF-02
     2154   WRITE-DELETE-GF-03
      859   WRITE-INIT-GF-01-01
     1494   WRITE-INIT-GF-02-01
     2110   WRITE-INIT-GF-03
      843   WRITE-INT-GF-01
     1477   WRITE-INT-GF-02
     2093   WRITE-INT-GF-03
      795   WRITE-LINE . . . . . . . . . .  P745 P746 P754 P755 P756 P757 P759 P760 P761 P763 P765 P774 P782 P788 P793 P794
                                            P822 P826 P828 P837
      889   WRITE-TEST-GF-01 . . . . . . .  G863
      903   WRITE-TEST-GF-01-END . . . . .  G900
      864   WRITE-TEST-GF-01-R1. . . . . .  P860 P862
      877   WRITE-TEST-GF-01-R2. . . . . .  P861
     1524   WRITE-TEST-GF-02 . . . . . . .  G1498
     1539   WRITE-TEST-GF-02-END . . . . .  G1536
     1499   WRITE-TEST-GF-02-R1. . . . . .  P1495 P1497
     1512   WRITE-TEST-GF-02-R2. . . . . .  P1496
     2140   WRITE-TEST-GF-03 . . . . . . .  G2114
     2157   WRITE-TEST-GF-03-END . . . . .  G2153
     2115   WRITE-TEST-GF-03R1 . . . . . .  P2111 P2113
     2128   WRITE-TEST-GF-03R2 . . . . . .  P2112
     2091   WRITE-WRITE-03
      811   WRT-LN . . . . . . . . . . . .  P801 P802 P803 P804 P805 P806 P807 P810 P815
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    64
0 Defined   Cross-reference of programs     References

        3   IX215A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX215A    Date 06/04/2022  Time 12:00:10   Page    65
0LineID  Message code  Message text

    131  IGYDS1298-I   Assignment-name "XXXXX044" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX044" was treated as comments.

    140  IGYDS1298-I   Assignment-name "XXXXX045" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX045" was treated as comments.

    150  IGYDS1298-I   Assignment-name "XXXXX046" was specified in the "ASSIGN" clause, but was not the first assignment-name.
                       "XXXXX046" was treated as comments.

    178  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    181  IGYGR1213-I   The "LABEL" clause was processed as comments for this file definition.

                       Same message on line:    234    289

    234  IGYGR1261-I   The "BLOCK CONTAINS" clause was processed as comments for this file definition.

                       Same message on line:    289
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       9           9
-* Statistics for COBOL program IX215A:
 *    Source records = 2802
 *    Data Division statements = 222
 *    Procedure Division statements = 1786
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1794
0End of compilation 1,  program IX215A,  highest severity 0.
0Return code 0
