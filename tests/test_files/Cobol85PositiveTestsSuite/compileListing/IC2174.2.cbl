1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:09   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:09   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC217A    Date 06/04/2022  Time 11:57:09   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2174.2
   000002         000200 PROGRAM-ID.                                                      IC2174.2
   000003         000300     IC217A.                                                      IC2174.2
   000004         000500*                                                              *  IC2174.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2174.2
   000006         000700*                                                              *  IC2174.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2174.2
   000008         000900*                                                              *  IC2174.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2174.2
   000010         001100*                                                              *  IC2174.2
   000011         001300*                                                              *  IC2174.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2174.2
   000013         001500*                                                              *  IC2174.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2174.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2174.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2174.2
   000017         001900*                                                              *  IC2174.2
   000018         002100*    THIS IS SUBPROGRAM IC217.                                    IC2174.2
   000019         002300 ENVIRONMENT DIVISION.                                            IC2174.2
   000020         002400 CONFIGURATION SECTION.                                           IC2174.2
   000021         002500 SOURCE-COMPUTER.                                                 IC2174.2
   000022         002600     XXXXX082.                                                    IC2174.2
   000023         002700 OBJECT-COMPUTER.                                                 IC2174.2
   000024         002800     XXXXX083.                                                    IC2174.2
   000025         002900 DATA DIVISION.                                                   IC2174.2
   000026         003000 LINKAGE SECTION.                                                 IC2174.2
   000027         003100 01  DN1.                                                         IC2174.2
   000028         003200     02  DN2                     PICTURE X(5).                    IC2174.2
   000029         003300     02  DN3                     REDEFINES DN2   PICTURE 9(5).    IC2174.2 28
   000030         003400 01  DN4.                                                         IC2174.2
   000031         003500     02  DN5.                                                     IC2174.2
   000032         003600         03  DN6                 PICTURE X(3).                    IC2174.2
   000033         003700         03  DN7                 PICTURE X(3).                    IC2174.2
   000034         003800         03  DN8                 REDEFINES DN7   PICTURE 9(3).    IC2174.2 33
   000035         003900     02  DN9                     PICTURE XX.                      IC2174.2
   000036         004000 PROCEDURE DIVISION USING DN1, DN4.                               IC2174.2 27 30
   000037         004100 CALL-TEST-1.                                                     IC2174.2
   000038         004200     MOVE 12345 TO DN3.                                           IC2174.2 29
   000039         004300 CALL-TEST-2.                                                     IC2174.2
   000040         004400     MOVE "YES" TO DN6.                                           IC2174.2 32
   000041         004500     MOVE 987 TO DN8.                                             IC2174.2 34
   000042         004600     MOVE "NO" TO DN9.                                            IC2174.2 35
   000043         004700 IC217-EXIT.                                                      IC2174.2
   000044         004800     EXIT PROGRAM.                                                IC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC217A    Date 06/04/2022  Time 11:57:09   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       27   DN1. . . . . . . . . . . . . .  36
       28   DN2. . . . . . . . . . . . . .  29
       29   DN3. . . . . . . . . . . . . .  M38
       30   DN4. . . . . . . . . . . . . .  36
       31   DN5
       32   DN6. . . . . . . . . . . . . .  M40
       33   DN7. . . . . . . . . . . . . .  34
       34   DN8. . . . . . . . . . . . . .  M41
       35   DN9. . . . . . . . . . . . . .  M42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC217A    Date 06/04/2022  Time 11:57:09   Page     5
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

       37   CALL-TEST-1
       39   CALL-TEST-2
       43   IC217-EXIT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC217A    Date 06/04/2022  Time 11:57:09   Page     6
0 Defined   Cross-reference of programs     References

        3   IC217A
-* Statistics for COBOL program IC217A:
 *    Source records = 44
 *    Data Division statements = 9
 *    Procedure Division statements = 5
 *    Generated COBOL statements = 0
 *    Program complexity factor = 5
0End of compilation 1,  program IC217A,  no statements flagged.
0Return code 0
