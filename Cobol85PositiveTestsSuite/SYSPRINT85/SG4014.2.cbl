1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:28   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:28   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG401M    Date 06/04/2022  Time 11:57:28   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         SG4014.2
   000002         000200 PROGRAM-ID.                                                      SG4014.2
   000003         000300     SG401M.                                                      SG4014.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF LEVEL 2              SG4014.2
   000005         000500*FEATURES OF THE SEGMENTATION MODULE.                             SG4014.2
   000006         000600 ENVIRONMENT DIVISION.                                            SG4014.2
   000007         000700 CONFIGURATION SECTION.                                           SG4014.2
   000008         000800 SOURCE-COMPUTER.                                                 SG4014.2
   000009         000900     XXXXX082.                                                    SG4014.2
   000010         001000 OBJECT-COMPUTER.                                                 SG4014.2
   000011         001100     XXXXX083                                                     SG4014.2
   000012         001200     SEGMENT-LIMIT IS 18.                                         SG4014.2
   000013         001300*Message expected for above statement: NON-CONFORMING STANDARD    SG4014.2
   000014         001400                                                                  SG4014.2
   000015         001500                                                                  SG4014.2
   000016         001600 DATA DIVISION.                                                   SG4014.2
   000017         001700 PROCEDURE DIVISION.                                              SG4014.2
   000018         001800                                                                  SG4014.2
   000019         001900 NUMBER1 SECTION 18.                                              SG4014.2
   000020         002000                                                                  SG4014.2
   000021         002100 SG401M-CONTROL.                                                  SG4014.2
   000022         002200     EXIT.                                                        SG4014.2
   000023         002300                                                                  SG4014.2
   000024         002400 NUMBER2 SECTION 19.                                              SG4014.2
   000025         002500                                                                  SG4014.2
   000026         002600 SG401M-DUMMY.                                                    SG4014.2
   000027         002700     DISPLAY "THIS IS A DUMMY PARAGRAPH".                         SG4014.2
   000028         002800                                                                  SG4014.2
   000029         002900 NUMBER3 SECTION 18.                                              SG4014.2
   000030         003000*Message expected for above statement: NON-CONFORMING STANDARD    SG4014.2
   000031         003100 SG401M-DUMMY2.                                                   SG4014.2
   000032         003200     DISPLAY "THIS IS A DUMMY PARAGRAPH TOO!".                    SG4014.2
   000033         003300                                                                  SG4014.2
   000034         003400                                                                  SG4014.2
   000035         003500* A MESSAGE IS EXPECTED FOR THE EXISTENCE OF TWO SECTIONS         SG4014.2
   000036         003600* WITH THE SAME SECTION NUMBER THAT ARE NOT                       SG4014.2
   000037         003700* "PHYSICALLY CONTIGUOUS IN THE SOURCE PROGRAM".                  SG4014.2
   000038         003800                                                                  SG4014.2
   000039         003900*TOTAL NUMBER OF FLAGS EXPECTED = 2.                              SG4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG401M    Date 06/04/2022  Time 11:57:28   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG401M    Date 06/04/2022  Time 11:57:28   Page     5
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

       19   NUMBER1
       24   NUMBER2
       29   NUMBER3
       21   SG401M-CONTROL
       26   SG401M-DUMMY
       31   SG401M-DUMMY2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SG401M    Date 06/04/2022  Time 11:57:28   Page     6
0 Defined   Cross-reference of programs     References

        3   SG401M
-* Statistics for COBOL program SG401M:
 *    Source records = 39
 *    Data Division statements = 0
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program SG401M,  no statements flagged.
0Return code 0
