1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:16   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:16   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC208A    Date 06/04/2022  Time 11:58:16   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2084.2
   000002         000200 PROGRAM-ID.                                                      IC2084.2
   000003         000300     IC208A.                                                      IC2084.2
   000004         000500*                                                              *  IC2084.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2084.2
   000006         000700*                                                              *  IC2084.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2084.2
   000008         000900*                                                              *  IC2084.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2084.2
   000010         001100*                                                              *  IC2084.2
   000011         001300*                                                              *  IC2084.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2084.2
   000013         001500*                                                              *  IC2084.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2084.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2084.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2084.2
   000017         001900*                                                              *  IC2084.2
   000018         002100*        THE SUBPROGRAM IC208 CONTAINS TABLES AND AN INDEX        IC2084.2
   000019         002200*    DATA ITEM WHICH ARE DEFINED IN THE LINKAGE SECTION           IC2084.2
   000020         002300*    AND NAMED AS OPERANDS IN THE USING PHRASE OF THE             IC2084.2
   000021         002400*    PROCEDURE DIVISION HEADER.  ONE OF THE TABLES IS DEFINED     IC2084.2
   000022         002500*    WITH AN OCCURS DEPENDING ON CLAUSE AND HAS CONDITION-NAME    IC2084.2
   000023         002600*    ENTRIES ASSOCIATED WITH IT.  THE SEARCH STATEMENT IS USED    IC2084.2
   000024         002700*    TO TEST THE VARIABLE LENGTH TABLE CAPABILITY.                IC2084.2
   000025         002900 ENVIRONMENT DIVISION.                                            IC2084.2
   000026         003000 CONFIGURATION SECTION.                                           IC2084.2
   000027         003100 SOURCE-COMPUTER.                                                 IC2084.2
   000028         003200     XXXXX082.                                                    IC2084.2
   000029         003300 OBJECT-COMPUTER.                                                 IC2084.2
   000030         003400     XXXXX083.                                                    IC2084.2
   000031         003500 DATA DIVISION.                                                   IC2084.2
   000032         003600 LINKAGE SECTION.                                                 IC2084.2
   000033         003700 77  INDEX-1 USAGE IS INDEX.                                      IC2084.2
   000034         003800 77  DN3 PICTURE 99.                                              IC2084.2
   000035         003900 01  TABLE-01.                                                    IC2084.2
   000036         004000     02  DN1 PICTURE X                                            IC2084.2
   000037         004100             OCCURS 1 TO 15 TIMES                                 IC2084.2
   000038         004200             DEPENDING ON DN3                                     IC2084.2 34
   000039         004300             INDEXED BY IN1.                                      IC2084.2
   000040         004400         88  CN1 VALUE "A".                                       IC2084.2
   000041         004500         88  CN2 VALUE "H".                                       IC2084.2
   000042         004600         88  CN3 VALUE "O".                                       IC2084.2
   000043         004700 01  TABLE-02.                                                    IC2084.2
   000044         004800     02  DN2 PICTURE X                                            IC2084.2
   000045         004900             OCCURS 8 TIMES.                                      IC2084.2
   000046         005000 PROCEDURE DIVISION USING TABLE-01, TABLE-02, INDEX-1, DN3.       IC2084.2 35 43 33 34
   000047         005100 SECT-IC208-0001 SECTION.                                         IC2084.2
   000048         005200 LINK-TEST-01.                                                    IC2084.2
   000049         005300*    THIS TEST USES THE INDEX DATA ITEM SET IN THE CALLING        IC2084.2
   000050         005400*    PROGRAM TO SET AN INDEX AND REFERENCE A TABLE ITEM.          IC2084.2
   000051         005500     SET IN1 TO INDEX-1.                                          IC2084.2 39 33
   000052         005600     MOVE DN1 (IN1) TO DN2 (1).                                   IC2084.2 36 39 44
   000053         005700*        LINK-TEST-02 TESTS THE VARIABLE LENGTH TABLE CAPABILITY  IC2084.2
   000054         005800*    WITH THE DATA-NAME WHOSE CONTENTS IS THE TABLE LENGTH        IC2084.2
   000055         005900*    DEFINED IN THE LINKAGE SECTION.                              IC2084.2
   000056         006000 LINK-TEST-02-01.                                                 IC2084.2
   000057         006100     SET IN1 TO 1.                                                IC2084.2 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC208A    Date 06/04/2022  Time 11:58:16   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     SEARCH DN1 VARYING IN1                                       IC2084.2 36 39
   000059      1  006300         AT END MOVE "Z" TO DN2 (2)                               IC2084.2 44
   000060         006400         WHEN DN1 (IN1) EQUAL TO "D"                              IC2084.2 36 39
   000061      1  006500             MOVE "D" TO DN2 (2).                                 IC2084.2 44
   000062         006600 LINK-TEST-02-02.                                                 IC2084.2
   000063         006700     SET IN1 TO 1.                                                IC2084.2 39
   000064         006800     SEARCH DN1 VARYING IN1                                       IC2084.2 36 39
   000065      1  006900         AT END MOVE "Y" TO DN2 (3)                               IC2084.2 44
   000066         007000         WHEN DN1 (IN1) EQUAL TO "B"                              IC2084.2 36 39
   000067      1  007100             MOVE "B" TO DN2 (3).                                 IC2084.2 44
   000068         007200 LINK-TEST-02-03.                                                 IC2084.2
   000069         007300     MOVE 7 TO DN3.                                               IC2084.2 34
   000070         007400     SET IN1 TO 1.                                                IC2084.2 39
   000071         007500     SEARCH DN1 VARYING IN1                                       IC2084.2 36 39
   000072      1  007600         AT END MOVE "X" TO DN2 (4)                               IC2084.2 44
   000073         007700         WHEN DN1 (IN1) EQUAL TO "H"                              IC2084.2 36 39
   000074      1  007800             MOVE "H" TO DN2 (4).                                 IC2084.2 44
   000075         007900 LINK-TEST-02-04.                                                 IC2084.2
   000076         008000     SET IN1 TO 1.                                                IC2084.2 39
   000077         008100     SEARCH DN1 VARYING IN1                                       IC2084.2 36 39
   000078      1  008200         AT END MOVE "W" TO DN2 (5)                               IC2084.2 44
   000079         008300         WHEN DN1 (IN1) EQUAL TO "G"                              IC2084.2 36 39
   000080      1  008400             MOVE "G" TO DN2 (5).                                 IC2084.2 44
   000081         008500 LINK-TEST-03.                                                    IC2084.2
   000082         008600     MOVE 10 TO DN3.                                              IC2084.2 34
   000083         008700*        LINK-TEST-03 TESTS THE USE OF CONDITION-NAMES WHICH      IC2084.2
   000084         008800*    WERE DEFINED IN THE LINKAGE SECTION.                         IC2084.2
   000085         008900 LINK-TEST-03-01.                                                 IC2084.2
   000086         009000     IF CN1 (1)  MOVE "A" TO DN2 (6).                             IC2084.2 40 44
   000087         009100 LINK-TEST-03-02.                                                 IC2084.2
   000088         009200     IF CN1 (5)  MOVE "N" TO DN2 (7)                              IC2084.2 40 44
   000089      1  009300         ELSE MOVE "V" TO DN2 (7).                                IC2084.2 44
   000090         009400 LINK-TEST-03-03.                                                 IC2084.2
   000091         009500     IF CN2 (8) MOVE "H" TO DN2 (8).                              IC2084.2 41 44
   000092         009600 LINK-TEST-04.                                                    IC2084.2
   000093         009700*        THIS TEST SETS THE INDEX DATA ITEM AND TABLE LENGTH      IC2084.2
   000094         009800*    FOR REFERENCE IN THE CALLING PROGRAM.                        IC2084.2
   000095         009900     SET IN1 TO 2.                                                IC2084.2 39
   000096         010000     SET INDEX-1 TO IN1.                                          IC2084.2 33 39
   000097         010100     MOVE 9 TO DN3.                                               IC2084.2 34
   000098         010200 EXIT-IC208.                                                      IC2084.2
   000099         010300     EXIT PROGRAM.                                                IC2084.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC208A    Date 06/04/2022  Time 11:58:16   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       40   CN1. . . . . . . . . . . . . .  86 88
       41   CN2. . . . . . . . . . . . . .  91
       42   CN3
       36   DN1. . . . . . . . . . . . . .  52 58 60 64 66 71 73 77 79
       44   DN2. . . . . . . . . . . . . .  M52 M59 M61 M65 M67 M72 M74 M78 M80 M86 M88 M89 M91
       34   DN3. . . . . . . . . . . . . .  38 46 M69 M82 M97
       33   INDEX-1. . . . . . . . . . . .  46 51 M96
       39   IN1. . . . . . . . . . . . . .  M51 52 M57 M58 60 M63 M64 66 M70 M71 73 M76 M77 79 M95 96
       35   TABLE-01 . . . . . . . . . . .  46
       43   TABLE-02 . . . . . . . . . . .  46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC208A    Date 06/04/2022  Time 11:58:16   Page     6
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

       98   EXIT-IC208
       48   LINK-TEST-01
       56   LINK-TEST-02-01
       62   LINK-TEST-02-02
       68   LINK-TEST-02-03
       75   LINK-TEST-02-04
       81   LINK-TEST-03
       85   LINK-TEST-03-01
       87   LINK-TEST-03-02
       90   LINK-TEST-03-03
       92   LINK-TEST-04
       47   SECT-IC208-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC208A    Date 06/04/2022  Time 11:58:16   Page     7
0 Defined   Cross-reference of programs     References

        3   IC208A
-* Statistics for COBOL program IC208A:
 *    Source records = 99
 *    Data Division statements = 9
 *    Procedure Division statements = 31
 *    Generated COBOL statements = 0
 *    Program complexity factor = 32
0End of compilation 1,  program IC208A,  no statements flagged.
0Return code 0
