1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:24   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:24   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1044.2
   000002         000200 PROGRAM-ID.                                                      IC1044.2
   000003         000300     IC104A.                                                      IC1044.2
   000004         000500*                                                              *  IC1044.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1044.2
   000006         000700*                                                              *  IC1044.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1044.2
   000008         000900*                                                              *  IC1044.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1044.2
   000010         001100*                                                              *  IC1044.2
   000011         001300*                                                              *  IC1044.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1044.2
   000013         001500*                                                              *  IC1044.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1044.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1044.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1044.2
   000017         001900*                                                              *  IC1044.2
   000018         002100*        THE SUBPROGRAM IC104 HAS THREE OPERANDS IN THE           IC1044.2
   000019         002200*    USING PHRASE OF THE PROCEDURE DIVISION HEADER.  TWO          IC1044.2
   000020         002300*    OPERANDS ARE 01 GROUP ITEMS AND THE THIRD OPERAND IS         IC1044.2
   000021         002400*    AN ELEMENTARY 77 ITEM.  THE DATA DESCRIPTIONS OF THESE       IC1044.2
   000022         002500*    OPERANDS IN THE LINKAGE SECTION ARE NOT THE SAME AS THE      IC1044.2
   000023         002600*    DATA DESCRIPTIONS IN THE WORKING-STORAGE SECTION OF THE      IC1044.2
   000024         002700*    CALLING PROGRAM, BUT AN EQUAL NUMBER OF CHARACTER            IC1044.2
   000025         002800*    POSITIONS ARE DEFINED.  THE CALLING PROGRAM IS IC103.        IC1044.2
   000026         002900 ENVIRONMENT DIVISION.                                            IC1044.2
   000027         003000 CONFIGURATION SECTION.                                           IC1044.2
   000028         003100 SOURCE-COMPUTER.                                                 IC1044.2
   000029         003200     XXXXX082.                                                    IC1044.2
   000030         003300 OBJECT-COMPUTER.                                                 IC1044.2
   000031         003400     XXXXX083.                                                    IC1044.2
   000032         003500 INPUT-OUTPUT SECTION.                                            IC1044.2
   000033         003600 FILE-CONTROL.                                                    IC1044.2
   000034         003700     SELECT PRINT-FILE ASSIGN TO                                  IC1044.2 38
   000035         003800     XXXXX055.                                                    IC1044.2
   000036         003900 DATA DIVISION.                                                   IC1044.2
   000037         004000 FILE SECTION.                                                    IC1044.2
   000038         004100 FD  PRINT-FILE.                                                  IC1044.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004200 01  PRINT-REC PICTURE X(120).                                    IC1044.2
   000040         004300 01  DUMMY-RECORD PICTURE X(120).                                 IC1044.2
   000041         004400 WORKING-STORAGE SECTION.                                         IC1044.2
   000042         004500 01  CONSTANT-VALUES.                                             IC1044.2
   000043         004600     02  AN-CONSTANT PIC X(5) VALUE "IC104".                      IC1044.2
   000044         004700     02  NUM-CONSTANT PIC 99V9999 VALUE 0.7654.                   IC1044.2
   000045         004800 LINKAGE SECTION.                                                 IC1044.2
   000046         004900 01  GRP-01.                                                      IC1044.2
   000047         005000     02  AN-FIELD PICTURE X(5).                                   IC1044.2
   000048         005100     02  NUM-DISPLAY PIC 99.                                      IC1044.2
   000049         005200     02  GRP-LEVEL.                                               IC1044.2
   000050         005300         03  A-FIELD PICTURE A(3).                                IC1044.2
   000051         005400 77  ELEM-01 PIC  V9(4) COMPUTATIONAL.                            IC1044.2
   000052         005500 01  GRP-02.                                                      IC1044.2
   000053         005600     02  GRP-03.                                                  IC1044.2
   000054         005700         03  NUM-ITEM PICTURE S99.                                IC1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800         03  EDITED-FIELD  PIC XXBX0X.                            IC1044.2
   000056         005900 PROCEDURE DIVISION USING GRP-01 ELEM-01 GRP-02.                  IC1044.2 46 51 52
   000057         006000 SECT-IC104-0001 SECTION.                                         IC1044.2
   000058         006100*        THIS SECTION SETS THE PARAMETER FIELDS REFERRED TO       IC1044.2
   000059         006200*    IN THE USING PHRASE AND DEFINED IN THE LINKAGE SECTION.      IC1044.2
   000060         006300 CALL-TEST-06.                                                    IC1044.2
   000061         006400     MOVE AN-CONSTANT TO AN-FIELD.                                IC1044.2 43 47
   000062         006500     ADD 25 TO NUM-DISPLAY.                                       IC1044.2 48
   000063         006600     MOVE "YES" TO A-FIELD.                                       IC1044.2 50
   000064         006700     MOVE NUM-CONSTANT TO ELEM-01.                                IC1044.2 44 51
   000065         006800     MOVE NUM-DISPLAY TO NUM-ITEM.                                IC1044.2 48 54
   000066         006900     MOVE "ABCD" TO EDITED-FIELD.                                 IC1044.2 55
   000067         007000 CALL-EXIT-06.                                                    IC1044.2
   000068         007100     EXIT PROGRAM.                                                IC1044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       50   A-FIELD. . . . . . . . . . . .  M63
       43   AN-CONSTANT. . . . . . . . . .  61
       47   AN-FIELD . . . . . . . . . . .  M61
       42   CONSTANT-VALUES
       40   DUMMY-RECORD
       55   EDITED-FIELD . . . . . . . . .  M66
       51   ELEM-01. . . . . . . . . . . .  56 M64
       49   GRP-LEVEL
       46   GRP-01 . . . . . . . . . . . .  56
       52   GRP-02 . . . . . . . . . . . .  56
       53   GRP-03
       44   NUM-CONSTANT . . . . . . . . .  64
       48   NUM-DISPLAY. . . . . . . . . .  M62 65
       54   NUM-ITEM . . . . . . . . . . .  M65
       38   PRINT-FILE . . . . . . . . . .  34
       39   PRINT-REC
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     6
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

       67   CALL-EXIT-06
       60   CALL-TEST-06
       57   SECT-IC104-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     7
0 Defined   Cross-reference of programs     References

        3   IC104A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC104A    Date 06/04/2022  Time 11:56:24   Page     8
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC104A:
 *    Source records = 68
 *    Data Division statements = 15
 *    Procedure Division statements = 7
 *    Generated COBOL statements = 0
 *    Program complexity factor = 7
0End of compilation 1,  program IC104A,  highest severity 0.
0Return code 0
