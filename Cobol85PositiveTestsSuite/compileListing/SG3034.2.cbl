1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:10   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:10   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG303M    Date 06/04/2022  Time 11:57:10   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         SG3034.2
   000002         000200 PROGRAM-ID.                                                      SG3034.2
   000003         000300     SG303M.                                                      SG3034.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF                      SG3034.2
   000005         000500*OBSOLETE FEATURES THAT ARE USED IN SEGMENTATION LEVEL 2.         SG3034.2
   000006         000600 ENVIRONMENT DIVISION.                                            SG3034.2
   000007         000700 CONFIGURATION SECTION.                                           SG3034.2
   000008         000800 SOURCE-COMPUTER.                                                 SG3034.2
   000009         000900     XXXXX082.                                                    SG3034.2
   000010         001000 OBJECT-COMPUTER.                                                 SG3034.2
   000011         001100     XXXXX083                                                     SG3034.2
   000012         001200     SEGMENT-LIMIT IS 20.                                         SG3034.2
   000013         001300*Message expected for above statement: OBSOLETE                   SG3034.2
   000014         001400 DATA DIVISION.                                                   SG3034.2
   000015         001500 PROCEDURE DIVISION.                                              SG3034.2
   000016         001600                                                                  SG3034.2
   000017         001700 NUMBER1 SECTION 18.                                              SG3034.2
   000018         001800*Message expected for above statement: OBSOLETE                   SG3034.2
   000019         001900                                                                  SG3034.2
   000020         002000 SG303M-CONTROL.                                                  SG3034.2
   000021         002100     EXIT.                                                        SG3034.2
   000022         002200                                                                  SG3034.2
   000023         002300 NUMBER2 SECTION 19.                                              SG3034.2
   000024         002400*Message expected for above statement: OBSOLETE                   SG3034.2
   000025         002500                                                                  SG3034.2
   000026         002600 SG303M-DUMMY1.                                                   SG3034.2
   000027         002700     DISPLAY "THIS IS A DUMMY PARAGRAPH".                         SG3034.2
   000028         002800                                                                  SG3034.2
   000029         002900 NUMBER3 SECTION 18.                                              SG3034.2
   000030         003000*Message expected for above statement: OBSOLETE                   SG3034.2
   000031         003100                                                                  SG3034.2
   000032         003200 SG303M-DUMMY2.                                                   SG3034.2
   000033         003300     DISPLAY "THIS IS A DUMMY PARAGRAPH TOO!".                    SG3034.2
   000034         003400                                                                  SG3034.2
   000035         003500                                                                  SG3034.2
   000036         003600                                                                  SG3034.2
   000037         003700*TOTAL NUMBER OF FLAGS EXPECTED = 4.                              SG3034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG303M    Date 06/04/2022  Time 11:57:10   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG303M    Date 06/04/2022  Time 11:57:10   Page     5
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

       17   NUMBER1
       23   NUMBER2
       29   NUMBER3
       20   SG303M-CONTROL
       26   SG303M-DUMMY1
       32   SG303M-DUMMY2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG303M    Date 06/04/2022  Time 11:57:10   Page     6
0 Defined   Cross-reference of programs     References

        3   SG303M
-* Statistics for COBOL program SG303M:
 *    Source records = 37
 *    Data Division statements = 0
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program SG303M,  no statements flagged.
0Return code 0
