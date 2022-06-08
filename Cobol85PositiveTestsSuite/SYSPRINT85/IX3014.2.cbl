1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:14   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:14   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX301M    Date 06/04/2022  Time 11:57:14   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX3014.2
   000002         000200 PROGRAM-ID.                                                      IX3014.2
   000003         000300      IX301M.                                                     IX3014.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF INTERMEDIATE         IX3014.2
   000005         000500*SUBSET FEATURES THAT ARE USED IN LEVEL 1 INDEXED                 IX3014.2
   000006         000600*INPUT-OUTPUT.                                                    IX3014.2
   000007         000700 ENVIRONMENT DIVISION.                                            IX3014.2
   000008         000800 CONFIGURATION SECTION.                                           IX3014.2
   000009         000900 SOURCE-COMPUTER.                                                 IX3014.2
   000010         001000     XXXXX082.                                                    IX3014.2
   000011         001100 OBJECT-COMPUTER.                                                 IX3014.2
   000012         001200     XXXXX083.                                                    IX3014.2
   000013         001300 INPUT-OUTPUT SECTION.                                            IX3014.2
   000014         001400 FILE-CONTROL.                                                    IX3014.2
   000015         001500     SELECT TFIL ASSIGN                                           IX3014.2 28
   000016         001600     XXXXX024                                                     IX3014.2
   000017         001700            ORGANIZATION IS INDEXED                               IX3014.2
   000018         001800*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000019         001900                                                                  IX3014.2
   000020         002000            ACCESS MODE IS RANDOM                                 IX3014.2
   000021         002100*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000022         002200                                                                  IX3014.2
   000023         002300            RECORD KEY IS RKEY.                                   IX3014.2 30
   000024         002400*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000025         002500                                                                  IX3014.2
   000026         002600 DATA DIVISION.                                                   IX3014.2
   000027         002700 FILE SECTION.                                                    IX3014.2
   000028         002800 FD  TFIL.                                                        IX3014.2
   000029         002900 01  FREC.                                                        IX3014.2
   000030         003000     03 RKEY  PIC X(8).                                           IX3014.2
   000031         003100                                                                  IX3014.2
   000032         003200 WORKING-STORAGE SECTION.                                         IX3014.2
   000033         003300 01  VARIABLES.                                                   IX3014.2
   000034         003400   03  STATE     PIC X(4) VALUE SPACES.                           IX3014.2 IMP
   000035         003500                                                                  IX3014.2
   000036         003600 PROCEDURE DIVISION.                                              IX3014.2
   000037         003700                                                                  IX3014.2
   000038         003800 IX301M-CONTROL.                                                  IX3014.2
   000039         003900     OPEN I-O TFIL.                                               IX3014.2 28
   000040         004000     PERFORM IX301M-READ THRU IX301M-DELETE 1 TIMES.              IX3014.2 44 59
   000041         004100     CLOSE TFIL.                                                  IX3014.2 28
   000042         004200     STOP RUN.                                                    IX3014.2
   000043         004300                                                                  IX3014.2
   000044         004400 IX301M-READ.                                                     IX3014.2
   000045         004500     READ TFIL INVALID KEY PERFORM INV-PARA                       IX3014.2 28 64
   000046      1  004600                 NOT INVALID KEY PERFORM DONE-PARA.               IX3014.2 67
   000047         004700*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000048         004800                                                                  IX3014.2
   000049         004900 IX301M-REWRITE.                                                  IX3014.2
   000050         005000     REWRITE FREC INVALID KEY PERFORM INV-PARA                    IX3014.2 29 64
   000051      1  005100                 NOT INVALID KEY PERFORM DONE-PARA.               IX3014.2 67
   000052         005200*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000053         005300                                                                  IX3014.2
   000054         005400 IX301M-WRITE.                                                    IX3014.2
   000055         005500     WRITE FREC INVALID KEY PERFORM INV-PARA                      IX3014.2 29 64
   000056      1  005600                 NOT INVALID KEY PERFORM DONE-PARA.               IX3014.2 67
   000057         005700*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX301M    Date 06/04/2022  Time 11:57:14   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800                                                                  IX3014.2
   000059         005900 IX301M-DELETE.                                                   IX3014.2
   000060         006000     DELETE TFIL INVALID KEY PERFORM INV-PARA                     IX3014.2 28 64
   000061      1  006100                 NOT INVALID KEY PERFORM DONE-PARA.               IX3014.2 67
   000062         006200*Message expected for above statement: NON-CONFORMING STANDARD    IX3014.2
   000063         006300                                                                  IX3014.2
   000064         006400 INV-PARA.                                                        IX3014.2
   000065         006500     MOVE "INVA" TO STATE.                                        IX3014.2 34
   000066         006600                                                                  IX3014.2
   000067         006700 DONE-PARA.                                                       IX3014.2
   000068         006800     MOVE "DONE" TO STATE.                                        IX3014.2 34
   000069         006900                                                                  IX3014.2
   000070         007000*TOTAL NUMBER OF FLAGS EXPECTED = 7.                              IX3014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX301M    Date 06/04/2022  Time 11:57:14   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       29   FREC . . . . . . . . . . . . .  50 55
       30   RKEY . . . . . . . . . . . . .  23
       34   STATE. . . . . . . . . . . . .  M65 M68
       28   TFIL . . . . . . . . . . . . .  15 39 41 45 M60
       33   VARIABLES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX301M    Date 06/04/2022  Time 11:57:14   Page     6
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

       67   DONE-PARA. . . . . . . . . . .  P46 P51 P56 P61
       64   INV-PARA . . . . . . . . . . .  P45 P50 P55 P60
       38   IX301M-CONTROL
       59   IX301M-DELETE. . . . . . . . .  E40
       44   IX301M-READ. . . . . . . . . .  P40
       49   IX301M-REWRITE
       54   IX301M-WRITE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX301M    Date 06/04/2022  Time 11:57:14   Page     7
0 Defined   Cross-reference of programs     References

        3   IX301M
-* Statistics for COBOL program IX301M:
 *    Source records = 70
 *    Data Division statements = 4
 *    Procedure Division statements = 18
 *    Generated COBOL statements = 0
 *    Program complexity factor = 18
0End of compilation 1,  program IX301M,  no statements flagged.
0Return code 0
