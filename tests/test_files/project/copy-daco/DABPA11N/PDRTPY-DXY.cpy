**WWW**    * ----------------------------------------------------------*
     1 01  PDRTPY-DXY.                                                     320
     2     03 DPRTYPVLG-XDY.                                                 1
     3       05 DPRTYPKEY-XDY.                                               1
     4         07 DPRSRT-XDY           PIC X(2)    VALUE SPACE.              1
     5         07 DPRSPCIND-XDY        PIC X       VALUE SPACE.              3
     6         07 MRTKODSPC-XDY        PIC X(3)    VALUE SPACE.              4
     7         07 DPRIDE-XDY.                                                7
     8           09 TYPKOD-XDY         PIC X(6)    VALUE SPACE.              7
     9           09 SUBTYPIDE-XDY      PIC X       OCCURS 3.                13
    10         07 INGYMD-BDY           PIC S9(8)   VALUE ZERO  COMP.        16
    11         07 INGUMS-BDY           PIC S9(6)   VALUE ZERO  COMP.        20
    12       05 TYPNAMMRT-XDY          PIC X(15)   VALUE SPACE.             24
    13       05 TYPCLSKOD-XDY          PIC X(6)    VALUE SPACE.             39
    14       05 DPRSPCSRT-XDY          PIC X       VALUE SPACE.             45
    15       05 KOLFASEENKOD-XDY       PIC X       VALUE SPACE.             46
    31       05 FILLER                 PIC X(10)   VALUE SPACE.            110
    32       05 TYPNAM-XDY             PIC X(15)   VALUE SPACE.            120
    33       05 BVSPDTSRT-XDY          PIC X       VALUE SPACE.            135
    34       05 OPBIND-XDY             PIC X       VALUE SPACE.            136
    35       05 OPBSET-XDY             PIC X       VALUE SPACE.            137
    36       05 CTRYON-XDY             PIC X       VALUE 'Y'.              138
    37       05 FILLER                 PIC X(2)    VALUE SPACE.            139
    38     03 KOLFASEENNEW-XDY         PIC X       VALUE SPACE.            141
    39     03 KOLKZEMDLNEW-XDY         PIC X       VALUE SPACE.            142
    40     03 DPRSPCSRTNEW-XDY         PIC X       VALUE SPACE.            143
    41     03 FILLER                   PIC X(9)    VALUE SPACE.            144
    42     03 LATWYZYMD-BDY            PIC S9(8)   VALUE ZERO  COMP.       153
    43     03 FILLER                   PIC X(4)    VALUE SPACE.            157
    44     03 FILLER                   PIC X(3)    VALUE SPACE.            161
    45     03 FILLER                   PIC X(15)   VALUE SPACE.            164
    46     03 FILLER                   PIC X       VALUE SPACE.            179
    47     03 BSSGEWMUI-BDY            PIC S9(5)   VALUE ZERO  COMP.       180
    48     03 BSSGEWMUIKRR-BDY         PIC S9(5)   VALUE ZERO  COMP.       184
    49     03 BSSGEWMUIIND-XDY         PIC X       VALUE SPACE.            188
    50     03 BSSGEW-BDY               PIC S9(5)   VALUE ZERO  COMP.       189
    51     03 BSSGEWDPR-BDY            PIC S9(5)   VALUE ZERO  COMP.       193
    52     03 FILLER                   PIC X(92)   VALUE SPACE.            197
    53     03 OPVGEG-XDY.                                                  289
    54       05 OPVYMD-BDY             PIC S9(8)   VALUE ZERO  COMP.       289
    55       05 OPVUMS-BDY             PIC S9(6)   VALUE ZERO  COMP.       293
    56       05 OPVUSRIDE-XDY          PIC X(8)    VALUE SPACE.            297
    57     03 WYZGEG-XDY.                                                  305
    58       05 WYZYMD-BDY             PIC S9(8)   VALUE ZERO  COMP.       305
    59       05 WYZUMS-BDY             PIC S9(6)   VALUE ZERO  COMP.       309
    60       05 WYZUSRIDE-XDY          PIC X(8)    VALUE SPACE.            313
