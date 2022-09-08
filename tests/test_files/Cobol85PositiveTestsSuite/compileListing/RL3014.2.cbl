1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:02   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:02   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL301M    Date 06/04/2022  Time 11:57:02   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         RL3014.2
   000002         000200 PROGRAM-ID.                                                      RL3014.2
   000003         000300      RL301M.                                                     RL3014.2
   000004         000400*The following program tests the flagging of intermediate         RL3014.2
   000005         000500*subset features that are used in relative                        RL3014.2
   000006         000600*input-output.                                                    RL3014.2
   000007         000700 ENVIRONMENT DIVISION.                                            RL3014.2
   000008         000800 CONFIGURATION SECTION.                                           RL3014.2
   000009         000900 SOURCE-COMPUTER.                                                 RL3014.2
   000010         001000     XXXXX082.                                                    RL3014.2
   000011         001100 OBJECT-COMPUTER.                                                 RL3014.2
   000012         001200     XXXXX083.                                                    RL3014.2
   000013         001300 INPUT-OUTPUT SECTION.                                            RL3014.2
   000014         001400 FILE-CONTROL.                                                    RL3014.2
   000015         001500     SELECT TFIL ASSIGN                                           RL3014.2 24
   000016         001600     XXXXX021                                                     RL3014.2
   000017         001700            ORGANIZATION IS RELATIVE                              RL3014.2
   000018         001800*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000019         001900            ACCESS MODE IS RANDOM                                 RL3014.2
   000020         002000*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000021         002100            RELATIVE KEY IS RKEY.                                 RL3014.2 31
   000022         002200 DATA DIVISION.                                                   RL3014.2
   000023         002300 FILE SECTION.                                                    RL3014.2
   000024         002400 FD  TFIL.                                                        RL3014.2
   000025         002500 01  FREC.                                                        RL3014.2
   000026         002600     03 GUBBINS  PIC 9(8).                                        RL3014.2
   000027         002700                                                                  RL3014.2
   000028         002800 WORKING-STORAGE SECTION.                                         RL3014.2
   000029         002900 01  VARIABLES.                                                   RL3014.2
   000030         003000   03  STATE     PIC X(4) VALUE SPACES.                           RL3014.2 IMP
   000031         003100   03  RKEY      PIC 9(8) VALUE ZERO.                             RL3014.2 IMP
   000032         003200                                                                  RL3014.2
   000033         003300 PROCEDURE DIVISION.                                              RL3014.2
   000034         003400                                                                  RL3014.2
   000035         003500 RL301M-CONTROL.                                                  RL3014.2
   000036         003600     OPEN I-O TFIL.                                               RL3014.2 24
   000037         003700     PERFORM RL301M-READ THRU RL301M-DELETE 1 TIMES.              RL3014.2 41 56
   000038         003800     CLOSE TFIL.                                                  RL3014.2 24
   000039         003900     STOP RUN.                                                    RL3014.2
   000040         004000                                                                  RL3014.2
   000041         004100 RL301M-READ.                                                     RL3014.2
   000042         004200     READ TFIL INVALID KEY PERFORM INV-PARA                       RL3014.2 24 61
   000043      1  004300                 NOT INVALID KEY PERFORM DONE-PARA.               RL3014.2 64
   000044         004400*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000045         004500                                                                  RL3014.2
   000046         004600 RL301M-REWRITE.                                                  RL3014.2
   000047         004700     REWRITE FREC INVALID KEY PERFORM INV-PARA                    RL3014.2 25 61
   000048      1  004800                 NOT INVALID KEY PERFORM DONE-PARA.               RL3014.2 64
   000049         004900*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000050         005000                                                                  RL3014.2
   000051         005100 RL301M-WRITE.                                                    RL3014.2
   000052         005200     WRITE FREC INVALID KEY PERFORM INV-PARA                      RL3014.2 25 61
   000053      1  005300                 NOT INVALID KEY PERFORM DONE-PARA.               RL3014.2 64
   000054         005400*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000055         005500                                                                  RL3014.2
   000056         005600 RL301M-DELETE.                                                   RL3014.2
   000057         005700     DELETE TFIL INVALID KEY PERFORM INV-PARA                     RL3014.2 24 61
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL301M    Date 06/04/2022  Time 11:57:02   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058      1  005800                 NOT INVALID KEY PERFORM DONE-PARA.               RL3014.2 64
   000059         005900*Message expected for above statement: NON-CONFORMING STANDARD    RL3014.2
   000060         006000                                                                  RL3014.2
   000061         006100 INV-PARA.                                                        RL3014.2
   000062         006200     MOVE "INVA" TO STATE.                                        RL3014.2 30
   000063         006300                                                                  RL3014.2
   000064         006400 DONE-PARA.                                                       RL3014.2
   000065         006500     MOVE "DONE" TO STATE.                                        RL3014.2 30
   000066         006600                                                                  RL3014.2
   000067         006700*TOTAL NUMBER OF FLAGS EXPECTED = 6.                              RL3014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL301M    Date 06/04/2022  Time 11:57:02   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       25   FREC . . . . . . . . . . . . .  47 52
       26   GUBBINS
       31   RKEY . . . . . . . . . . . . .  21
       30   STATE. . . . . . . . . . . . .  M62 M65
       24   TFIL . . . . . . . . . . . . .  15 36 38 42 M57
       29   VARIABLES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL301M    Date 06/04/2022  Time 11:57:02   Page     6
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

       64   DONE-PARA. . . . . . . . . . .  P43 P48 P53 P58
       61   INV-PARA . . . . . . . . . . .  P42 P47 P52 P57
       35   RL301M-CONTROL
       56   RL301M-DELETE. . . . . . . . .  E37
       41   RL301M-READ. . . . . . . . . .  P37
       46   RL301M-REWRITE
       51   RL301M-WRITE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL301M    Date 06/04/2022  Time 11:57:02   Page     7
0 Defined   Cross-reference of programs     References

        3   RL301M
-* Statistics for COBOL program RL301M:
 *    Source records = 67
 *    Data Division statements = 5
 *    Procedure Division statements = 18
 *    Generated COBOL statements = 0
 *    Program complexity factor = 18
0End of compilation 1,  program RL301M,  no statements flagged.
0Return code 0
