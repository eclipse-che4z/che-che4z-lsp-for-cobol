      *****************************************************************
      *                                                               *
      *                                                               *
      *                                                               *
      *     Licensed Materials - Property of IBM                      *
      *                                                               *
      *     "Restricted Materials of IBM"                             *
      *                                                               *
      *     5655-Y04                                                  *
      *                                                               *
      *     (C) Copyright IBM Corp. 1988, 2010"                       *
      *                                                               *
      *                                                               *
      *                                                               *
      *                                                               *
      *   STATUS = 6.9.0                                              *
      *                                                               *
      * CHANGE ACTIVITY :                                             *
      *                                                               *
      *   $SEG(DFHAID),COMP(BMS),PROD(CICS TS ):                      *
      *                                                               *
      *  PN= REASON REL YYMMDD HDXXIII : REMARKS                      *
      * $D1= I07991 670 100820 HDIGPG  : Translate unprintable char   *
      * $L0= Base   210 88     HD1MA   : Base                         *
      *                                                               *
      *****************************************************************
      *
      *
       01    DFHAID.
         02  DFHNULL   PIC  X  VALUE IS X'00'.
         02  DFHENTER  PIC  X  VALUE IS ''''.
         02  DFHCLEAR  PIC  X  VALUE IS '_'.
         02  DFHCLRP   PIC  X  VALUE IS '¦'.
         02  DFHPEN    PIC  X  VALUE IS '='.
         02  DFHOPID   PIC  X  VALUE IS 'W'.
         02  DFHMSRE   PIC  X  VALUE IS 'X'.
         02  DFHSTRF   PIC  X  VALUE IS 'h'.
         02  DFHTRIG   PIC  X  VALUE IS '"'.
         02  DFHPA1    PIC  X  VALUE IS '%'.
         02  DFHPA2    PIC  X  VALUE IS '>'.
         02  DFHPA3    PIC  X  VALUE IS ','.
         02  DFHPF1    PIC  X  VALUE IS '1'.
         02  DFHPF2    PIC  X  VALUE IS '2'.
         02  DFHPF3    PIC  X  VALUE IS '3'.
         02  DFHPF4    PIC  X  VALUE IS '4'.
         02  DFHPF5    PIC  X  VALUE IS '5'.
         02  DFHPF6    PIC  X  VALUE IS '6'.
         02  DFHPF7    PIC  X  VALUE IS '7'.
         02  DFHPF8    PIC  X  VALUE IS '8'.
         02  DFHPF9    PIC  X  VALUE IS '9'.
         02  DFHPF10   PIC  X  VALUE IS ':'.
         02  DFHPF11   PIC  X  VALUE IS '#'.
         02  DFHPF12   PIC  X  VALUE IS '@'.
         02  DFHPF13   PIC  X  VALUE IS 'A'.
         02  DFHPF14   PIC  X  VALUE IS 'B'.
         02  DFHPF15   PIC  X  VALUE IS 'C'.
         02  DFHPF16   PIC  X  VALUE IS 'D'.
         02  DFHPF17   PIC  X  VALUE IS 'E'.
         02  DFHPF18   PIC  X  VALUE IS 'F'.
         02  DFHPF19   PIC  X  VALUE IS 'G'.
         02  DFHPF20   PIC  X  VALUE IS 'H'.
         02  DFHPF21   PIC  X  VALUE IS 'I'.
         02  DFHPF22   PIC  X  VALUE IS '¢'.
         02  DFHPF23   PIC  X  VALUE IS '.'.
         02  DFHPF24   PIC  X  VALUE IS '<'.
