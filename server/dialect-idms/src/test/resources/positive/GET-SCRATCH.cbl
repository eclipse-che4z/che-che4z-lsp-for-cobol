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
       01 WORK-PROC-AREA PIC X(10) VALUE 'CARLA'.                
       01 EOF-PHARM-SW PIC X(1) VALUE 'N'.
       01 END-WORK-PROC-AREA PIC X(10).
       01 DB-REC-NOT-FOUND PIC X(10) VALUE 'CARLA'.

       PROCEDURE DIVISION.                                      
       100-START.   

           GET SCRATCH CURRENT INTO WORK-PROC-AREA TO END-WORK-PROC-AREA
              ON DB-REC-NOT-FOUND                          
              MOVE 'Y' TO EOF-PHARM-SW                     
           END-IF.

       IDMS-STATUS SECTION.
       IDMS-STATUS-EXIT.
           EXIT.

       IDMS-ABORT SECTION.                                  
       IDMS-ABORT-EXIT.                                     
            EXIT.                                                             
