1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:25   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:25   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC4014.2
   000002         000200 PROGRAM-ID.                                                      IC4014.2
   000003         000300      IC401M IS INITIAL.                                          IC4014.2
   000004         000400*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000005         000500                                                                  IC4014.2
   000006         000600*The following program tests the flagging of high                 IC4014.2
   000007         000700*subset Features that are used in inter-program                   IC4014.2
   000008         000800*communication.                                                   IC4014.2
   000009         000900 ENVIRONMENT DIVISION.                                            IC4014.2
   000010         001000 CONFIGURATION SECTION.                                           IC4014.2
   000011         001100 SOURCE-COMPUTER.                                                 IC4014.2
   000012         001200     XXXXX082.                                                    IC4014.2
   000013         001300 OBJECT-COMPUTER.                                                 IC4014.2
   000014         001400     XXXXX083.                                                    IC4014.2
   000015         001500 DATA DIVISION.                                                   IC4014.2
   000016         001600 WORKING-STORAGE SECTION.                                         IC4014.2
   000017         001700                                                                  IC4014.2
   000018         001800 01 GLOB IS GLOBAL   PIC IS X(2) VALUE IS "HI".                   IC4014.2
   000019         001900*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000020         002000                                                                  IC4014.2
   000021         002100 01 EXTE IS EXTERNAL PIC IS X(5).                                 IC4014.2
   000022         002200*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000023         002300                                                                  IC4014.2
   000024         002400 PROCEDURE DIVISION.                                              IC4014.2
   000025         002500                                                                  IC4014.2
   000026         002600 DECLARATIVES.                                                    IC4014.2
   000027         002700                                                                  IC4014.2
   000028         002800 IC401M-USE SECTION.                                              IC4014.2
   000029         002900     USE GLOBAL AFTER STANDARD ERROR PROCEDURE ON I-O.            IC4014.2
   000030         003000*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000031         003100                                                                  IC4014.2
   000032         003200 END DECLARATIVES.                                                IC4014.2

 ==000032==> IGYPS2036-I A paragraph-name was missing after the "USE" statement.

   000033         003300 IC401M-NONDECL SECTION.                                          IC4014.2
   000034         003400 IC401M-CONTROL.                                                  IC4014.2
   000035         003500     PERFORM IC401M-CANCEL THRU IC401M-BYCONT.                    IC4014.2 38 48
   000036         003600     STOP RUN.                                                    IC4014.2
   000037         003700                                                                  IC4014.2
   000038         003800 IC401M-CANCEL.                                                   IC4014.2
   000039         003900     CANCEL "NESTEDPROG".                                         IC4014.2 57
   000040         004000*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000041         004100                                                                  IC4014.2
   000042         004200                                                                  IC4014.2
   000043         004300 IC401M-BYREF.                                                    IC4014.2
   000044         004400     CALL "NESTEDPROG" USING BY REFERENCE GLOB.                   IC4014.2 57 18
   000045         004500*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000046         004600                                                                  IC4014.2
   000047         004700                                                                  IC4014.2
   000048         004800 IC401M-BYCONT.                                                   IC4014.2
   000049         004900     CALL "FIC401M" USING BY CONTENT GLOB.                        IC4014.2 EXT 18
   000050         005000*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000051         005100                                                                  IC4014.2
   000052         005200                                                                  IC4014.2
   000053   1     005300 IDENTIFICATION DIVISION.                                         IC4014.2
   000054   1     005400*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055   1     005500                                                                  IC4014.2
   000056   1     005600 PROGRAM-ID.                                                      IC4014.2
   000057   1     005700     NESTEDPROG IS COMMON.                                        IC4014.2
   000058   1     005800*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000059   1     005900                                                                  IC4014.2
   000060   1     006000 ENVIRONMENT DIVISION.                                            IC4014.2
   000061   1     006100 DATA DIVISION.                                                   IC4014.2
   000062   1     006200 LINKAGE SECTION.                                                 IC4014.2
   000063   1     006300 01  GLOB-2  PIC X(2).                                            IC4014.2
   000064   1     006400                                                                  IC4014.2
   000065   1     006500 PROCEDURE DIVISION USING GLOB-2.                                 IC4014.2 63
   000066   1     006600 DUMMY-PARA.                                                      IC4014.2
   000067   1     006700     DISPLAY "HELLO".                                             IC4014.2
   000068   1     006800                                                                  IC4014.2
   000069   1     006900 END-PARA.                                                        IC4014.2
   000070   1     007000*TOTAL NUMBER OF FLAGS EXPECTED = 11.                             IC4014.2
   000071   1     007100 END PROGRAM NESTEDPROG.                                          IC4014.2 57
   000072   1     007200*Message expected for above statement: NON-CONFORMING STANDARD    IC4014.2
   000073   1     007300*Message expected for following statement: NON-CONFORMING STANDARDIC4014.2
   000074         007400 END PROGRAM IC401M.                                              IC4014.2 3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       21   EXTE
       18   GLOB . . . . . . . . . . . . .  44 49
       63   GLOB-2 . . . . . . . . . . . .  65
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     6
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

       66   DUMMY-PARA
       69   END-PARA
       48   IC401M-BYCONT. . . . . . . . .  E35
       43   IC401M-BYREF
       38   IC401M-CANCEL. . . . . . . . .  P35
       34   IC401M-CONTROL
       33   IC401M-NONDECL
       28   IC401M-USE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     7
0 Defined   Cross-reference of programs     References

 EXTERNAL   FIC401M. . . . . . . . . . . .  49
        3   IC401M . . . . . . . . . . . .  74
       57   NESTEDPROG . . . . . . . . . .  71 39 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC401M    Date 06/04/2022  Time 11:56:25   Page     8
0LineID  Message code  Message text

     32  IGYPS2036-I   A paragraph-name was missing after the "USE" statement.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC401M:
 *    Source records = 74
 *    Data Division statements = 3
 *    Procedure Division statements = 7
 *    Generated COBOL statements = 0
 *    Program complexity factor = 7
0End of compilation 1,  program IC401M,  highest severity 0.
0Return code 0
