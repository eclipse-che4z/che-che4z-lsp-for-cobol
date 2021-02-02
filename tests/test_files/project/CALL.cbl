       Identification Division.
       Program-id. HELLO-WORLD.
       Data Division.
       Working-Storage Section.
       01 Variable PIC 9(9).
       01 Name PIC 9(9).
       Procedure Division.
           call 'SUB1'.
           call 'SUB2'.
           call 'SUB3'.
       End program HELLO-WORLD.