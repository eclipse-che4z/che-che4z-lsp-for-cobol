1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:15   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:15   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC111A    Date 06/04/2022  Time 11:57:15   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1114.2
   000002         000200 PROGRAM-ID.                                                      IC1114.2
   000003         000300     IC111A.                                                      IC1114.2
   000004         000500*                                                              *  IC1114.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1114.2
   000006         000700*                                                              *  IC1114.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1114.2
   000008         000900*                                                              *  IC1114.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1114.2
   000010         001100*                                                              *  IC1114.2
   000011         001300*                                                              *  IC1114.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1114.2
   000013         001500*                                                              *  IC1114.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1114.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1114.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1114.2
   000017         001900*                                                              *  IC1114.2
   000018         002100*        THE SUBPROGRAM IC111 IS THE LAST SUBPROGRAM CALLED       IC1114.2
   000019         002200*    IN A SEQUENCE OF SUBPROGRAM CALLS WHICH IS STARTED IN        IC1114.2
   000020         002300*    MAIN PROGRAM IC108.  THE SUBPROGRAM IC111 IS CALLED BY       IC1114.2
   000021         002400*    THE SUBPROGRAM IC110.                                        IC1114.2
   000022         002500 ENVIRONMENT DIVISION.                                            IC1114.2
   000023         002600 CONFIGURATION SECTION.                                           IC1114.2
   000024         002700 SOURCE-COMPUTER.                                                 IC1114.2
   000025         002800     XXXXX082.                                                    IC1114.2
   000026         002900 OBJECT-COMPUTER.                                                 IC1114.2
   000027         003000     XXXXX083.                                                    IC1114.2
   000028         003100 DATA DIVISION.                                                   IC1114.2
   000029         003200 LINKAGE SECTION.                                                 IC1114.2
   000030         003300 77  LS1 PICTURE X.                                               IC1114.2
   000031         003400 77  LS2 PICTURE X.                                               IC1114.2
   000032         003500 01  GRP-01.                                                      IC1114.2
   000033         003600     02  SUB-CALLED.                                              IC1114.2
   000034         003700         03  DN1 PICTURE X(6).                                    IC1114.2
   000035         003800         03  DN2 PICTURE X(6).                                    IC1114.2
   000036         003900         03  DN3 PICTURE X(6).                                    IC1114.2
   000037         004000     02  TIMES-CALLED.                                            IC1114.2
   000038         004100         03  DN4 PICTURE S999.                                    IC1114.2
   000039         004200         03  DN5 PICTURE S999.                                    IC1114.2
   000040         004300         03  DN6 PICTURE S999.                                    IC1114.2
   000041         004400     02  SPECIAL-FLAGS.                                           IC1114.2
   000042         004500         03  DN7 PICTURE X.                                       IC1114.2
   000043         004600         03  DN8 PICTURE X.                                       IC1114.2
   000044         004700         03  DN9 PICTURE X.                                       IC1114.2
   000045         004800 PROCEDURE DIVISION USING LS1 GRP-01 LS2.                         IC1114.2 30 32 31
   000046         004900 SECT-IC111-0001 SECTION.                                         IC1114.2
   000047         005000 PARA-IC111.                                                      IC1114.2
   000048         005100     MOVE "IC111A" TO DN3.                                        IC1114.2 36
   000049         005200     ADD 1 TO DN6.                                                IC1114.2 40
   000050         005300     MOVE "A" TO LS2.                                             IC1114.2 31
   000051         005400     MOVE "A" TO LS1.                                             IC1114.2 30
   000052         005500 EXIT-IC111.                                                      IC1114.2
   000053         005600     EXIT PROGRAM.                                                IC1114.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC111A    Date 06/04/2022  Time 11:57:15   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       34   DN1
       35   DN2
       36   DN3. . . . . . . . . . . . . .  M48
       38   DN4
       39   DN5
       40   DN6. . . . . . . . . . . . . .  M49
       42   DN7
       43   DN8
       44   DN9
       32   GRP-01 . . . . . . . . . . . .  45
       30   LS1. . . . . . . . . . . . . .  45 M51
       31   LS2. . . . . . . . . . . . . .  45 M50
       41   SPECIAL-FLAGS
       33   SUB-CALLED
       37   TIMES-CALLED
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC111A    Date 06/04/2022  Time 11:57:15   Page     5
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

       52   EXIT-IC111
       47   PARA-IC111
       46   SECT-IC111-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC111A    Date 06/04/2022  Time 11:57:15   Page     6
0 Defined   Cross-reference of programs     References

        3   IC111A
-* Statistics for COBOL program IC111A:
 *    Source records = 53
 *    Data Division statements = 15
 *    Procedure Division statements = 5
 *    Generated COBOL statements = 0
 *    Program complexity factor = 5
0End of compilation 1,  program IC111A,  no statements flagged.
0Return code 0
