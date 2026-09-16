      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases
      * TestBind, TestIdmsBindStatement, TestCheckTerminal,
      * TestIdmsLoadStatement, TestIdmsMapInStatement,
      * TestIdmsMapOutStatement, TestIdmsMapOutInStatement,
      * TestIdmsModifyMapStatement, TestDelete, TestIdmsPutStatement,
      * TestIdmsReadStatement, TestIdmsWriteClause.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATEMENTS-002.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 WS-B PIC X(80).
       01 WS-C PIC X(80).
       01 WS-LENGTH PIC 9(4) COMP.
       PROCEDURE DIVISION.
           BIND RUN-UNIT
               FOR WS-A
               DBNODE 'NODE'
               DBNAME 'DBNAME'.
           CHECK TERMINAL GET STORAGE INTO WS-A
               MAX LENGTH 80
               RETURN LENGTH INTO WS-LENGTH.
           LOAD TABLE 'TABLE1' INTO WS-A TO WS-B
               DICTNODE 'NODE'
               DICTNAME 'DICT'
               LOADLIB 'LOADLIB'
               NOWAIT.
           MAP IN USING EMPMAP NOIO DATASTREAM FROM WS-A
               LENGTH WS-LENGTH
               DETAIL FIRST RETURNKEY WS-B.
           MAP OUT USING EMPMAP NOIO DATASTREAM INTO WS-A
               TO WS-B
               RETURN LENGTH INTO WS-LENGTH
               OUTPUT DATA ATTRIBUTE ERASE LITERALS.
           MAP OUTIN USING EMPMAP
               OUTPUT DATA YES
               INPUT DATA YES
               MESSAGE IS WS-A LENGTH WS-LENGTH.
           MODIFY MAP EMPMAP
               FOR DFLD WS-A
               OUTPUT DATA YES
               ATTRIBUTES BRIGHT.
           DELETE SCRATCH AREA ID 'AREA'
               RECORD ID WS-A
               RETURN RECORD ID INTO WS-B.
           PUT SCRATCH AREA ID 'AREA'
               FROM WS-A LENGTH WS-LENGTH
               RECORD ID 1 REPLACE
               RETURN RECORD ID INTO WS-B.
           READ TERMINAL WAIT MODIFIED FROM POSITION 1
               GET STORAGE INTO WS-A
               MAX LENGTH 80
               RETURN LENGTH INTO WS-LENGTH.
           WRITE THEN READ TERMINAL WAIT ERASE FREE STORAGE
               FROM WS-A LENGTH WS-LENGTH
               MODIFIED FROM POSITION 1
               GET STORAGE INTO WS-B
               MAX LENGTH 80
               RETURN LENGTH INTO WS-LENGTH.
           DISPLAY NOT-EXISTING.
           STOP RUN.
