       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. HLLOWRLD.                                                    
                                                                                
       PROCEDURE DIVISION.
      *     EXEC SQL WHENEVER SQLERROR   GO TO SQL-ERROR-RTN END-EXEC. 
      *     EXEC SQL WHENEVER NOT FOUND  GO TO END-MAIN      END-EXEC.
           PERFORM A THRU C.                                     
           STOP RUN.                                                            
       A.                                                               
       B.                                                                    
           PERFORM X.                                               
       C.                                                                

       X.                                                           
           IF (SQLCODE IS LESS THAN 0)                                          
              DISPLAY 'SQLCODE'
           ELSE                                                                 
              STOP RUN.