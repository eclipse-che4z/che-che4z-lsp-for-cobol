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
       01 OUTPUT-LINE PIC X(10) VALUE 'CARLA'.                
       01 EOF-PHARM-SW PIC X(1) VALUE 'N'.
       01 END-INPUT-LINE PIC X(10).
       01 INPUT-LINE PIC X(10).
       01 LINE-LENGTH PIC X(10).
       01 DB-REC-NOT-FOUND  PIC X(10)  VALUE '0326'.

       PROCEDURE DIVISION.                                      
       100-START.   

           WRITE THEN READ TERMINAL
            WAIT FROM OUTPUT-LINE TO END-INPUT-LINE
            INTO INPUT-LINE MAX LENGTH 80 RETURN LENGTH INTO LINE-LENGTH
              {ON|1} DB-REC-NOT-FOUND                          
              MOVE 'Y' TO EOF-PHARM-SW                     
           END-IF.

       IDMS-STATUS SECTION.
       IDMS-STATUS-EXIT.
           EXIT.

       IDMS-ABORT SECTION.                                  
       IDMS-ABORT-EXIT.                                     
            EXIT.                                                             
