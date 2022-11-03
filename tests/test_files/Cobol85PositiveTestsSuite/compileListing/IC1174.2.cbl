1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:48   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:48   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC117M    Date 06/04/2022  Time 11:56:48   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1174.2
   000002         000200 PROGRAM-ID.                                                      IC1174.2
   000003         000300     IC117M.                                                      IC1174.2
   000004         000500*                                                              *  IC1174.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1174.2
   000006         000700*                                                              *  IC1174.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1174.2
   000008         000900*                                                              *  IC1174.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1174.2
   000010         001100*                                                              *  IC1174.2
   000011         001300*                                                              *  IC1174.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1174.2
   000013         001500*                                                              *  IC1174.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1174.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1174.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1174.2
   000017         001900*                                                              *  IC1174.2
   000018         002100*                                                                 IC1174.2
   000019         002200*        THE SUBPROGRAM IC117 IS CALLED BY THE MAIN PROGRAM IC116.IC1174.2
   000020         002300*    THE SUBPROGRAM IC117 DOES NOT CONTAIN A LINKAGE SECTION OR   IC1174.2
   000021         002400*    AN USING PHRASE IN THE PROCEDURE DIVISION HEADER.  DISPLAY   IC1174.2
   000022         002500*    STATEMENTS ARE USED TO VERIFY THE PROGRAM EXECUTION SEQUENCE.IC1174.2
   000023         002600*    THE SUBPROGRAM IC118 IS CALLED BY THE SUBPROGRAM IC117 AND   IC1174.2
   000024         002700*    THE CALL STATEMENT IN THE SUBPROGRAM ALSO DOES NOT HAVE AN   IC1174.2
   000025         002800*    USING PHRASE.                                                IC1174.2
   000026         002900*                                                                 IC1174.2
   000027         003000*    REFERENCE - AMERICAN NATIONAL STANDARD PROGRAMMING LANGUAGE  IC1174.2
   000028         003100*                    COBOL, X3.23-1974                            IC1174.2
   000029         003200*                SECTION XII, INTER-PROGRAM COMMUNICATION MODULE. IC1174.2
   000030         003300*                                                                 IC1174.2
   000031         003500 ENVIRONMENT DIVISION.                                            IC1174.2
   000032         003600 CONFIGURATION SECTION.                                           IC1174.2
   000033         003700 SOURCE-COMPUTER.                                                 IC1174.2
   000034         003800     XXXXX082.                                                    IC1174.2
   000035         003900 OBJECT-COMPUTER.                                                 IC1174.2
   000036         004000     XXXXX083.                                                    IC1174.2
   000037         004100 DATA DIVISION.                                                   IC1174.2
   000038         004200 WORKING-STORAGE SECTION.                                         IC1174.2
   000039         004300 01  IC117-TEMP1         PICTURE 9.                               IC1174.2
   000040         004400 01  ONE                 PICTURE 9    VALUE 1.                    IC1174.2
   000041         004500 01  IC117-TEMP2         PICTURE 9     VALUE 0.                   IC1174.2
   000042         004600 PROCEDURE DIVISION.                                              IC1174.2
   000043         004700*USNG-TEST-02.                                                    IC1174.2
   000044         004800*                                                                 IC1174.2
   000045         004900*    THIS TEST VERIFIES THAT A SUBPROGRAM PROCEDURE DIVISION      IC1174.2
   000046         005000*    HEADER IS NOT REQUIRED TO HAVE THE OPTIONAL USING PHRASE.    IC1174.2
   000047         005100*                                                                 IC1174.2
   000048         005200 USNG-VERIFY-02.                                                  IC1174.2
   000049         005300     MOVE 1 TO IC117-TEMP1.                                       IC1174.2 39
   000050         005400     ADD ONE TO IC117-TEMP2.                                      IC1174.2 40 41
   000051         005500*                                                                 IC1174.2
   000052         005600*    THE RESULTS OF THE ABOVE STATEMENTS ARE NOT TESTED.          IC1174.2
   000053         005700*                                                                 IC1174.2
   000054         005800 USNG-DISPLAY-02.                                                 IC1174.2
   000055         005900     DISPLAY "  ".                                                IC1174.2
   000056         006000     DISPLAY "IC117M CALLED".                                     IC1174.2
   000057         006100 USNG-TEST-03.                                                    IC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC117M    Date 06/04/2022  Time 11:56:48   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     CALL "IC118M".                                               IC1174.2 EXT
   000059         006300*                                                                 IC1174.2
   000060         006400*    THIS TEST CONTAINS A CALL STATEMENT WITHOUT THE OPTIONAL     IC1174.2
   000061         006500*    USING PHRASE.                                                IC1174.2
   000062         006600*    REFERENCE - X3.23-1995, PAGE X-27, 5.2, THE CALL STATEMENT.  IC1174.2
   000063         006700*                                                                 IC1174.2
   000064         006800 USNG-DISPLAY-03.                                                 IC1174.2
   000065         006900     DISPLAY "RETURNED TO IC117M".                                IC1174.2
   000066         007000 IC117-EXIT.                                                      IC1174.2
   000067         007100     EXIT PROGRAM.                                                IC1174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC117M    Date 06/04/2022  Time 11:56:48   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       39   IC117-TEMP1. . . . . . . . . .  M49
       41   IC117-TEMP2. . . . . . . . . .  M50
       40   ONE. . . . . . . . . . . . . .  50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC117M    Date 06/04/2022  Time 11:56:48   Page     6
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

       66   IC117-EXIT
       54   USNG-DISPLAY-02
       64   USNG-DISPLAY-03
       57   USNG-TEST-03
       48   USNG-VERIFY-02
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC117M    Date 06/04/2022  Time 11:56:48   Page     7
0 Defined   Cross-reference of programs     References

        3   IC117M
 EXTERNAL   IC118M . . . . . . . . . . . .  58
-* Statistics for COBOL program IC117M:
 *    Source records = 67
 *    Data Division statements = 3
 *    Procedure Division statements = 7
 *    Generated COBOL statements = 0
 *    Program complexity factor = 7
0End of compilation 1,  program IC117M,  no statements flagged.
0Return code 0
