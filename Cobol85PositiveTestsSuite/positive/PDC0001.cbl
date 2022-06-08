       Identification Division.
       Program-Id. 'P1'.
       Data Division.
       Working-Storage Section.
       01 FOO PIC 9.
       COPY SQLCA.
       Procedure Division.
       Mainline Section.
           MOVE 6 to FOO.
