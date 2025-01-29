       IDENTIFICATION DIVISION.                    
       PROGRAM-ID. TEST10.                     
       DATA DIVISION.                              
       WORKING-STORAGE SECTION.  

       01 GrpHdr.
           02 A1.
           03 MsgId                         PIC X(50) VALUE SPACES.
           03 Test3.
               05 Test31.
                    07 Test32               PIC X(10) VALUE SPACES.
               05 Test4.
                   07 Test5.
                        09 Test6.
                          11 Test7          PIC X(10) VALUE SPACES.

        01  OUTPUT-XML                    PIC X(5000).

       PROCEDURE DIVISION.                   
       MAIN-PARA.
    
           MOVE 'MESSAGE ID'          TO MsgId.
           MOVE 'TEST32'                TO Test32.
           MOVE SPACES               TO Test7.
    
           INITIALIZE OUTPUT-XML.
    
      *    XML GENERATE OUTPUT-XML from Grphdr
      *     SUPPRESS Test31 EVERY NONUMERIC ELEMENT WHEN SPACES
      *     ON EXCEPTION
      *         DISPLAY 'GENERATE XML Error-Header'
      *     NOT ON EXCEPTION
      *         CONTINUE
      *    END-XML

           XML GENERATE OUTPUT-XML from Grphdr
            SUPPRESS EVERY NONNUMERIC ELEMENT WHEN SPACES
            ON EXCEPTION
             DISPLAY 'GENERATE XML Error-Header'
            NOT ON EXCEPTION
                CONTINUE
           END-XML
            
           DISPLAY 'OUTPUT:' OUTPUT-XML .

       MAIN-EXIT.
           EXIT.