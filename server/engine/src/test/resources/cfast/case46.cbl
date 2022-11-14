       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID.     M285552A.                                        
       ENVIRONMENT DIVISION.                                            
       CONFIGURATION SECTION.                                           
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
                                                                        
           SELECT TRAVCONV-FILE     ASSIGN TO UT-S-TRAVCONV.            
                                                                        
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
                                                                        
       FD  TRAVCONV-FILE                                                
           LABEL RECORDS ARE STANDARD                                   
           BLOCK CONTAINS 0 RECORDS                                     
           RECORDING MODE IS F                                          
           DATA RECORD IS FD-TRAVCONV-RECORD.                           
       01  FD-TRAVCONV-RECORD             PIC X(380).                   
       WORKING-STORAGE SECTION.                                         
       01  TRAVELERS-CONV-RECORD.                                       
           05  OUT-REC-TYPE                PIC X(02).                   
           05  C-INP-REC-CNT               PIC X(02).                   
       PROCEDURE DIVISION.                                              
       P8000-READ-TABLE.                                                
                                                                        
           READ TRAVCONV-FILE INTO TRAVELERS-CONV-RECORD                
             AT END GO TO P8000-EXIT.                                   
                    MOVE 'Y' TO OUT-REC-TYPE.                           
                    PERFORM X1.                                         
        X1.
           DISPLAY 'HAHAH'.                                             
                                                                        
       P8000-EXIT.                                                      
           EXIT. 
