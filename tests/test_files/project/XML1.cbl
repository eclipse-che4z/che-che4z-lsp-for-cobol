PROCESS XMLPARSE(XMLSS)       
       IDENTIFICATION DIVISION.                                   
       PROGRAM-ID.    XML1.                                       
       AUTHOR.        RRR.                                     
       DATE-WRITTEN.  28 SEPT 2006.                               
      ***********************************                         
       ENVIRONMENT DIVISION.                                     
      ***********************************                         
       DATA DIVISION.                                             
       WORKING-STORAGE SECTION.                                   
       01 XML-RECORD.                                             
           02 FILLER  PIC X(21) VALUE '<?XML VERSION="1.0"?>'.     
           02 FILLER  PIC X(10) VALUE '<EMPLOYEE>'.               
           02 FILLER  PIC X(21) VALUE '<FNAME>RAGHU</FNAME>'.     
           02 FILLER  PIC X(23) VALUE '<LNAME>POLNATI</LNAME>'.   
           02 FILLER  PIC X(17) VALUE '<SAL>25624</SAL>'.         
           02 FILLER  PIC X(11) VALUE '</EMPLOYEE>'.               
       01 EMP-RECORD.                                             
           02 FNAME1   PIC X(10).                                 
           02 LNAME1   PIC X(10).   
           02 SAL1     PIC X(10).                               
       01 CURRENT-ELEMENT PIC X(105).                         
       PROCEDURE DIVISION.                                     
       PARA1.                                                 
      *     DISPLAY 'XML EVENT             XML TEXT    '       
             XML PARSE XML-RECORD RETURNING NATIONAL
               PROCESSING PROCEDURE EVENT-HANDLER                 
               ON EXCEPTION                                       
                DISPLAY 'XML DOC ERROR'      XML-CODE           
               NOT ON EXCEPTION                                   
                DISPLAY 'XML DOC SUCCFULLY'                     
            END-XML                                             
                             
            DISPLAY "END OF THE PROGRAM"   
               GOBACK.                                                 
 

       EVENT-HANDLER SECTION.                                       
               IF XML-CODE  = 0                                         
                   DISPLAY XML-EVENT  XML-TEXT                             
                                               
               EVALUATE XML-EVENT                                     
               WHEN 'START-OF-DOCUMENT'                               
                                                   
      *       DISPLAY 'START OF DOCUMENT TAG: <' XML-TEXT '>'       
                   MOVE XML-TEXT TO CURRENT-ELEMENT                     
                   DISPLAY CURRENT-ELEMENT                               
                   DISPLAY "3"                                           
               WHEN 'CONTENT-CHARACTERS'                               
                                                   
                  DISPLAY XML-EVENT                                     
                                                     
      *        DISPLAY 'CONTENT CHARACTERS: <' XML-TEXT '>'         
               EVALUATE CURRENT-ELEMENT                             
                                             
                    WHEN 'FNAME'   
                        MOVE XML-TEXT TO FNAME1                   
                        DISPLAY FNAME1                           
                    WHEN 'LNAME'                                 
                        MOVE XML-TEXT TO LNAME1                   
                        DISPLAY LNAME1                           
                    WHEN 'SAL'                                   
                        MOVE XML-TEXT TO SAL1                     
                        DISPLAY SAL1                               
                    END-EVALUATE                                 
                WHEN 'END-OF-DOCUMENT'                         
                    MOVE SPACES TO CURRENT-ELEMENT               
                                   
                WHEN OTHER                                     
                    DISPLAY " EVLT OTHER"                       
                END-EVALUATE                                   
               ELSE                                           
                DISPLAY XML-CODE                               
                DISPLAY "ERROR IN PROGRAM"                     
               END-IF                                         
                .                               
             
       END PROGRAM XML1.
      *    STOP RUN.   