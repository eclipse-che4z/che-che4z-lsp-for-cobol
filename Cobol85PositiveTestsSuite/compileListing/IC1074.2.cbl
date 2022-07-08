1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:23   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:23   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1074.2
   000002         000200 PROGRAM-ID.                                                      IC1074.2
   000003         000300     IC107A.                                                      IC1074.2
   000004         000500*                                                              *  IC1074.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1074.2
   000006         000700*                                                              *  IC1074.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1074.2
   000008         000900*                                                              *  IC1074.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1074.2
   000010         001100*                                                              *  IC1074.2
   000011         001300*                                                              *  IC1074.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1074.2
   000013         001500*                                                              *  IC1074.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1074.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1074.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1074.2
   000017         001900*                                                              *  IC1074.2
   000018         002100*        THE SUBPROGRAM IC107 CONTAINS TABLES AND AN INDEX        IC1074.2
   000019         002200*    DATA ITEM WHICH ARE DEFINED IN THE LINKAGE SECTION AND       IC1074.2
   000020         002300*    NAMED AS OPERANDS IN THE USING PHRASE OF THE PROCEDURE       IC1074.2
   000021         002400*    DIVISION HEADER.  ONE OF THE TABLES HAS AN INDEX DEFINED     IC1074.2
   000022         002500*    FOR IT.  THIS INDEX SHOULD BE SEPARATE FROM THE INDEX        IC1074.2
   000023         002600*    DEFINED FOR THE SAME TABLE IN THE MAIN PROGRAM IC106,        IC1074.2
   000024         002700*    BUT NO SPACE SHOULD BE ALLOCATED FOR THE TABLES DEFINED      IC1074.2
   000025         002800*    IN THE LINKAGE SECTION.  THE INDEX DATA ITEM IS SET IN       IC1074.2
   000026         002900*    THE MAIN PROGRAM PRIOR TO CALLING IC107, AND IT IS USED      IC1074.2
   000027         003000*    IN THIS SUBPROGRAM TO SET AN INDEX FOR REFERENCING THE       IC1074.2
   000028         003100*    TABLE IN THE SUBPROGRAM.                                     IC1074.2
   000029         003200 ENVIRONMENT DIVISION.                                            IC1074.2
   000030         003300 CONFIGURATION SECTION.                                           IC1074.2
   000031         003400 SOURCE-COMPUTER.                                                 IC1074.2
   000032         003500     XXXXX082.                                                    IC1074.2
   000033         003600 OBJECT-COMPUTER.                                                 IC1074.2
   000034         003700     XXXXX083.                                                    IC1074.2
   000035         003800 INPUT-OUTPUT SECTION.                                            IC1074.2
   000036         003900 FILE-CONTROL.                                                    IC1074.2
   000037         004000     SELECT PRINT-FILE ASSIGN TO                                  IC1074.2 41
   000038         004100     XXXXX055.                                                    IC1074.2
   000039         004200 DATA DIVISION.                                                   IC1074.2
   000040         004300 FILE SECTION.                                                    IC1074.2
   000041         004400 FD  PRINT-FILE.                                                  IC1074.2

 ==000041==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000042         004500 01  PRINT-REC PICTURE X(120).                                    IC1074.2
   000043         004600 01  DUMMY-RECORD PICTURE X(120).                                 IC1074.2
   000044         004700 WORKING-STORAGE SECTION.                                         IC1074.2
   000045         004800 77  IDN3  USAGE IS INDEX.                                        IC1074.2
   000046         004900 77  S1  PICTURE 99.                                              IC1074.2
   000047         005000 77  AL-CON PICTURE XXX  VALUE "XYZ".                             IC1074.2
   000048         005100 LINKAGE SECTION.                                                 IC1074.2
   000049         005200 77  IDN2  USAGE IS INDEX.                                        IC1074.2
   000050         005300 01  GROUP-1.                                                     IC1074.2
   000051         005400     02  DN1 PICTURE X OCCURS 10 TIMES                            IC1074.2
   000052         005500                       INDEXED BY IN3.                            IC1074.2
   000053         005600 01  GROUP-2.                                                     IC1074.2
   000054         005700     02    GROUP-21.                                              IC1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800         06 DN2 PIC X OCCURS 10 TIMES.                            IC1074.2
   000056         005900     02     GROUP-2-1 REDEFINES GROUP-21.                         IC1074.2 54
   000057         006000         03  FILLER  PICTURE X(7).                                IC1074.2
   000058         006100         03  DN3     PICTURE XXX.                                 IC1074.2
   000059         006200 PROCEDURE DIVISION USING IDN2 GROUP-1 GROUP-2.                   IC1074.2 49 50 53
   000060         006300 SECT-IC107-0001 SECTION.                                         IC1074.2
   000061         006400 LINK-TEST-02-01.                                                 IC1074.2
   000062         006500     SET IN3 TO IDN2.                                             IC1074.2 52 49
   000063         006600     IF DN1 (IN3) EQUAL TO "F"                                    IC1074.2 51 52
   000064      1  006700         MOVE "G" TO DN2 (7).                                     IC1074.2 55
   000065         006800 LINK-TEST-02-02.                                                 IC1074.2
   000066         006900     SET IDN3 TO IDN2.                                            IC1074.2 45 49
   000067         007000     SET IN3 TO IDN3.                                             IC1074.2 52 45
   000068         007100     IF IN3 EQUAL TO 6                                            IC1074.2 52
   000069      1  007200         MOVE "F" TO DN2 (6).                                     IC1074.2 55
   000070         007300*        THE TESTS IN LINK-TEST-02 USE THE INDEX DATA ITEM        IC1074.2
   000071         007400*    WHICH IS DEFINED IN THE LINKAGE SECTION AND WAS SET IN       IC1074.2
   000072         007500*    THE MAIN PROGRAM BEFORE THIS SUBPROGRAM WAS CALLED.          IC1074.2
   000073         007600 LINK-TEST-03-01.                                                 IC1074.2
   000074         007700     SET IN3 TO 1.                                                IC1074.2 52
   000075         007800     MOVE 1 TO S1.                                                IC1074.2 46
   000076         007900     MOVE DN1 (IN3) TO DN2 (S1).                                  IC1074.2 51 52 55 46
   000077         008000 LINK-TEST-03-02.                                                 IC1074.2
   000078         008100     SET IN3 UP BY 1.                                             IC1074.2 52
   000079         008200     ADD 1 TO S1.                                                 IC1074.2 46
   000080         008300     MOVE DN1 (IN3) TO DN2 (S1).                                  IC1074.2 51 52 55 46
   000081         008400*        THE TESTS IN LINK-TEST-03 SET THE INDEX DEFINED IN THE   IC1074.2
   000082         008500*    TABLE IN THE LINKAGE SECTION AND USE THE INDEX TO REFERENCE  IC1074.2
   000083         008600*    THE TABLE ITEMS.                                             IC1074.2
   000084         008700 LINK-TEST-04-01.                                                 IC1074.2
   000085         008800     SET IN3 TO 3.                                                IC1074.2 52
   000086         008900     SET IDN2 TO IN3.                                             IC1074.2 49 52
   000087         009000 LINK-TEST-04-02.                                                 IC1074.2
   000088         009100     IF IDN2 IS EQUAL TO IN3                                      IC1074.2 49 52
   000089      1  009200         MOVE "C" TO DN2 (3).                                     IC1074.2 55
   000090         009300*        THE TESTS IN LINK-TEST-04 RESET THE INDEX DATA ITEM      IC1074.2
   000091         009400*    TO CORRESPOND TO TABLE POSITION 3, AND COMPARES THE          IC1074.2
   000092         009500*    INDEX DATA ITEM TO THE INDEX.                                IC1074.2
   000093         009600 LINK-TEST-05-01.                                                 IC1074.2
   000094         009700     MOVE 4 TO S1.                                                IC1074.2 46
   000095         009800     SET IN3 TO S1.                                               IC1074.2 52 46
   000096         009900     MOVE DN1 (IN3) TO DN2 (S1).                                  IC1074.2 51 52 55 46
   000097         010000 LINK-TEST-05-02.                                                 IC1074.2
   000098         010100     MOVE DN1 (5) TO DN2 (5).                                     IC1074.2 51 55
   000099         010200*        THE TESTS IN LINK-TEST-05 MOVE DATA FROM THE FIRST       IC1074.2
   000100         010300*    TABLE DEFINED IN THE LINKAGE SECTION TO THE SECOND TABLE.    IC1074.2
   000101         010400 LINK-TEST-06.                                                    IC1074.2
   000102         010500     MOVE AL-CON TO DN3.                                          IC1074.2 47 58
   000103         010600*        THIS TEST MOVES DATA TO THE REDEFINED FIELD IN A TABLE   IC1074.2
   000104         010700*    IN THE LINKAGE SECTION.                                      IC1074.2
   000105         010800 EXIT-IC107.                                                      IC1074.2
   000106         010900     EXIT PROGRAM.                                                IC1074.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       47   AL-CON . . . . . . . . . . . .  102
       51   DN1. . . . . . . . . . . . . .  63 76 80 96 98
       55   DN2. . . . . . . . . . . . . .  M64 M69 M76 M80 M89 M96 M98
       58   DN3. . . . . . . . . . . . . .  M102
       43   DUMMY-RECORD
       50   GROUP-1. . . . . . . . . . . .  59
       53   GROUP-2. . . . . . . . . . . .  59
       56   GROUP-2-1
       54   GROUP-21 . . . . . . . . . . .  56
       49   IDN2 . . . . . . . . . . . . .  59 62 66 M86 88
       45   IDN3 . . . . . . . . . . . . .  M66 67
       52   IN3. . . . . . . . . . . . . .  M62 63 M67 68 M74 76 M78 80 M85 86 88 M95 96
       41   PRINT-FILE . . . . . . . . . .  37
       42   PRINT-REC
       46   S1 . . . . . . . . . . . . . .  M75 76 M79 80 M94 95 96
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     6
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

      105   EXIT-IC107
       61   LINK-TEST-02-01
       65   LINK-TEST-02-02
       73   LINK-TEST-03-01
       77   LINK-TEST-03-02
       84   LINK-TEST-04-01
       87   LINK-TEST-04-02
       93   LINK-TEST-05-01
       97   LINK-TEST-05-02
      101   LINK-TEST-06
       60   SECT-IC107-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     7
0 Defined   Cross-reference of programs     References

        3   IC107A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC107A    Date 06/04/2022  Time 11:56:23   Page     8
0LineID  Message code  Message text

     41  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC107A:
 *    Source records = 106
 *    Data Division statements = 13
 *    Procedure Division statements = 23
 *    Generated COBOL statements = 0
 *    Program complexity factor = 23
0End of compilation 1,  program IC107A,  highest severity 0.
0Return code 0
