       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    PROG.                                                  
       DATA DIVISION.                                                           
                                                                                
       WORKING-STORAGE SECTION.                                                 
       01  COUNT1 PIC 9(9)  VALUE ZERO.                   
                                                                                
       PROCEDURE DIVISION.                                                      
           DISPLAY 'START'.
       PAR1.                                                     
           DISPLAY 'HANDLE SQL CONDITION'.
           EXEC SQL WHENEVER NOT FOUND GO TO PAR-ERROR1 END-EXEC.
           EXEC SQL WHENEVER SQLERROR  GO TO PAR-ERROR2 END-EXEC.
           EXEC SQL WHENEVER SQLWARNING CONTINUE END-EXEC.
                                                                                
       PAR2.                                                     
           DISPLAY 'PAR2'.
                                                                                
       PAR3.                                                        
           EXEC SQL OPEN C1 END-EXEC.                                           
                                                                                
       PAR4.                                                       
           ADD +1 TO COUNT1.
           GO TO PAR4.                                             
                                                                                
       PAR-ERROR1.                                                           
           DISPLAY 'ERROR'
           GO TO PAR-END.                                                   
                                                                                
       PAR-ERROR2.                                                              
           DISPLAY 'ERROR'.                                                    
           GO TO PAR-END.                                                   
                                                                                
       PAR-END.                                                             
           GOBACK.                                                              

