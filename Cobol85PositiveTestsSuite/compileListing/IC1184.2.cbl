1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:43   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:43   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC118M    Date 06/04/2022  Time 11:56:43   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1184.2
   000002         000200 PROGRAM-ID.                                                      IC1184.2
   000003         000300     IC118M.                                                      IC1184.2
   000004         000500*                                                              *  IC1184.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1184.2
   000006         000700*                                                              *  IC1184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1184.2
   000008         000900*                                                              *  IC1184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1184.2
   000010         001100*                                                              *  IC1184.2
   000011         001300*                                                              *  IC1184.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1184.2
   000013         001500*                                                              *  IC1184.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1184.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1184.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1184.2
   000017         001900*                                                              *  IC1184.2
   000018         002100*                                                                 IC1184.2
   000019         002200*        THE SUBPROGRAM IC118 IS CALLED BY THE SUBPROGRAM IC117.  IC1184.2
   000020         002300*    THE SUBPROGRAM IC118 DOES NOT CONTAIN A LINKAGE SECTION OR   IC1184.2
   000021         002400*    AN USING PHRASE IN THE PROCEDURE DIVISION HEADER.  A DISPLAY IC1184.2
   000022         002500*    STATEMENT IS EXECUTED TO VERIFY THAT THIS SUBPROGRAM WAS     IC1184.2
   000023         002600*    EXECUTED.                                                    IC1184.2
   000024         002700*                                                                 IC1184.2
   000025         002900 ENVIRONMENT DIVISION.                                            IC1184.2
   000026         003000 CONFIGURATION SECTION.                                           IC1184.2
   000027         003100 SOURCE-COMPUTER.                                                 IC1184.2
   000028         003200     XXXXX082.                                                    IC1184.2
   000029         003300 OBJECT-COMPUTER.                                                 IC1184.2
   000030         003400     XXXXX083.                                                    IC1184.2
   000031         003500 DATA DIVISION.                                                   IC1184.2
   000032         003600 WORKING-STORAGE SECTION.                                         IC1184.2
   000033         003700 01  IC118-TEMP1         PICTURE 9.                               IC1184.2
   000034         003800 01  TWO                 PICTURE 9   VALUE 2.                     IC1184.2
   000035         003900 01  IC118-TEMP2         PICTURE 99   VALUE 97.                   IC1184.2
   000036         004000 PROCEDURE DIVISION.                                              IC1184.2
   000037         004100*USNG-TEST-04.                                                    IC1184.2
   000038         004200*                                                                 IC1184.2
   000039         004300*    THIS TEST VERIFIES THAT A SUBPROGRAM PROCEDURE DIVISION      IC1184.2
   000040         004400*    HEADER IS NOT REQUIRED TO HAVE THE OPTIONAL USING PHRASE.    IC1184.2
   000041         004500*                                                                 IC1184.2
   000042         004600 USNG-VERIFY-04.                                                  IC1184.2
   000043         004700     MOVE 2 TO IC118-TEMP1.                                       IC1184.2 33
   000044         004800     ADD TWO TO IC118-TEMP2.                                      IC1184.2 34 35
   000045         004900*                                                                 IC1184.2
   000046         005000*    THE RESULTS OF THE ABOVE STATEMENTS ARE NOT TESTED.          IC1184.2
   000047         005100*                                                                 IC1184.2
   000048         005200 USNG-DISPLAY-04.                                                 IC1184.2
   000049         005300     DISPLAY "IC118M CALLED".                                     IC1184.2
   000050         005400 IC118-EXIT.                                                      IC1184.2
   000051         005500     EXIT PROGRAM.                                                IC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC118M    Date 06/04/2022  Time 11:56:43   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       33   IC118-TEMP1. . . . . . . . . .  M43
       35   IC118-TEMP2. . . . . . . . . .  M44
       34   TWO. . . . . . . . . . . . . .  44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC118M    Date 06/04/2022  Time 11:56:43   Page     5
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

       50   IC118-EXIT
       48   USNG-DISPLAY-04
       42   USNG-VERIFY-04
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC118M    Date 06/04/2022  Time 11:56:43   Page     6
0 Defined   Cross-reference of programs     References

        3   IC118M
-* Statistics for COBOL program IC118M:
 *    Source records = 51
 *    Data Division statements = 3
 *    Procedure Division statements = 4
 *    Generated COBOL statements = 0
 *    Program complexity factor = 4
0End of compilation 1,  program IC118M,  no statements flagged.
0Return code 0
