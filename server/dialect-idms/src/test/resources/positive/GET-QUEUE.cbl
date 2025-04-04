       IDENTIFICATION DIVISION.                         
       PROGRAM-ID.  IDDWRK.                             
       ENVIRONMENT DIVISION.                            
       IDMS-CONTROL SECTION.                            
       PROTOCOL. MODE IS BATCH-AUTOSTATUS               
            IDMS-RECORDS MANUAL.                        
       DATA DIVISION.                                   
       FILE SECTION.                                    
       SCHEMA SECTION.                                  
       DB EMPSS01  WITHIN EMPSCHM VERSION 100.          
       WORKING-STORAGE SECTION.   
       01 PEND-RES PIC X(10) VALUE 'CARLA'.                
       01 EOF-PHARM-SW PIC X(1) VALUE 'N'.
       01 TASK-ID PIC X(10).
       01 DB-REC-NOT-FOUND PIC X(10) VALUE 'CARLA'.

       PROCEDURE DIVISION.                                      
       100-START.   

           GET QUEUE ID 'RES-Q' FIRST KEEP INTO PEND-RES MAX LENGTH 125
              ON DB-REC-NOT-FOUND                          
              MOVE 'Y' TO EOF-PHARM-SW                     
           END-IF.

       IDMS-STATUS SECTION.
       IDMS-STATUS-EXIT.
           EXIT.

       IDMS-ABORT SECTION.                                  
       IDMS-ABORT-EXIT.                                     
            EXIT.                                                             
