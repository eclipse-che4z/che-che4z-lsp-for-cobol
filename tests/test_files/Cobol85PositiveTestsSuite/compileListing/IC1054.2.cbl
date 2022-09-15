1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:19   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:19   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC105A    Date 06/04/2022  Time 11:56:19   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1054.2
   000002         000200 PROGRAM-ID.                                                      IC1054.2
   000003         000300     IC105A.                                                      IC1054.2
   000004         000500*                                                              *  IC1054.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1054.2
   000006         000700*                                                              *  IC1054.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1054.2
   000008         000900*                                                              *  IC1054.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1054.2
   000010         001100*                                                              *  IC1054.2
   000011         001300*                                                              *  IC1054.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1054.2
   000013         001500*                                                              *  IC1054.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1054.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1054.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1054.2
   000017         001900*                                                              *  IC1054.2
   000018         002100*        THE SUBPROGRAM IC105 HAS TWO OPERANDS IN THE             IC1054.2
   000019         002200*    PROCEDURE DIVISION HEADER AND THE ROUTINE CONTAINS           IC1054.2
   000020         002300*    FOUR EXIT PROGRAM STATEMENTS.  THE CALLING PROGRAM           IC1054.2
   000021         002400*    IS IC103.                                                    IC1054.2
   000022         002500 ENVIRONMENT DIVISION.                                            IC1054.2
   000023         002600 CONFIGURATION SECTION.                                           IC1054.2
   000024         002700 SOURCE-COMPUTER.                                                 IC1054.2
   000025         002800     XXXXX082.                                                    IC1054.2
   000026         002900 OBJECT-COMPUTER.                                                 IC1054.2
   000027         003000     XXXXX083.                                                    IC1054.2
   000028         003100 DATA DIVISION.                                                   IC1054.2
   000029         003200 LINKAGE SECTION.                                                 IC1054.2
   000030         003300 77  DN1 PICTURE 999.                                             IC1054.2
   000031         003400 77  DN2 PICTURE S99 COMPUTATIONAL.                               IC1054.2
   000032         003500 PROCEDURE DIVISION  USING DN1 DN2.                               IC1054.2 30 31
   000033         003600*        THIS SUBPROGRAM CONTANS FOUR EXIT PROGRAM STATEMENTS.    IC1054.2
   000034         003700*    REFERENCE  X3.23-1974, SECTION XII, 3.4.                     IC1054.2
   000035         003800 SECT-IC105-0001 SECTION.                                         IC1054.2
   000036         003900 EXIT-TEST-001.                                                   IC1054.2
   000037         004000     IF DN1 IS NOT EQUAL TO 1                                     IC1054.2 30
   000038      1  004100          GO TO EXIT-TEST-002.                                    IC1054.2 42
   000039         004200     MOVE 1 TO DN2.                                               IC1054.2 31
   000040         004300 EXIT-STATEMENT-001.                                              IC1054.2
   000041         004400     EXIT PROGRAM.                                                IC1054.2
   000042         004500 EXIT-TEST-002.                                                   IC1054.2
   000043         004600     IF DN1 IS NOT EQUAL TO 2                                     IC1054.2 30
   000044      1  004700          GO TO EXIT-TEST-003.                                    IC1054.2 48
   000045         004800     MOVE 2 TO DN2.                                               IC1054.2 31
   000046         004900 EXIT-STATEMENT-002.                                              IC1054.2
   000047         005000     EXIT PROGRAM.                                                IC1054.2
   000048         005100 EXIT-TEST-003.                                                   IC1054.2
   000049         005200     IF DN1 NOT EQUAL TO 3                                        IC1054.2 30
   000050      1  005300          GO TO EXIT-TEST-004.                                    IC1054.2 54
   000051         005400     MOVE 3 TO DN2.                                               IC1054.2 31
   000052         005500 EXIT-STATEMENT-003.                                              IC1054.2
   000053         005600     EXIT PROGRAM.                                                IC1054.2
   000054         005700 EXIT-TEST-004.                                                   IC1054.2
   000055         005800     MOVE 4 TO DN2.                                               IC1054.2 31
   000056         005900     GO TO EXIT-STATEMENT-004.                                    IC1054.2 60
   000057         006000 EXTRANEOUS-PARAGRAPH.                                            IC1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC105A    Date 06/04/2022  Time 11:56:19   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006100*        THIS PARAGRAPH IS NEVER EXECUTED.                        IC1054.2
   000059         006200     MOVE 5 TO DN2.                                               IC1054.2 31
   000060         006300 EXIT-STATEMENT-004.                                              IC1054.2
   000061         006400     EXIT PROGRAM.                                                IC1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC105A    Date 06/04/2022  Time 11:56:19   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       30   DN1. . . . . . . . . . . . . .  32 37 43 49
       31   DN2. . . . . . . . . . . . . .  32 M39 M45 M51 M55 M59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC105A    Date 06/04/2022  Time 11:56:19   Page     6
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

       40   EXIT-STATEMENT-001
       46   EXIT-STATEMENT-002
       52   EXIT-STATEMENT-003
       60   EXIT-STATEMENT-004 . . . . . .  G56
       36   EXIT-TEST-001
       42   EXIT-TEST-002. . . . . . . . .  G38
       48   EXIT-TEST-003. . . . . . . . .  G44
       54   EXIT-TEST-004. . . . . . . . .  G50
       57   EXTRANEOUS-PARAGRAPH
       35   SECT-IC105-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC105A    Date 06/04/2022  Time 11:56:19   Page     7
0 Defined   Cross-reference of programs     References

        3   IC105A
-* Statistics for COBOL program IC105A:
 *    Source records = 61
 *    Data Division statements = 2
 *    Procedure Division statements = 16
 *    Generated COBOL statements = 0
 *    Program complexity factor = 16
0End of compilation 1,  program IC105A,  no statements flagged.
0Return code 0
