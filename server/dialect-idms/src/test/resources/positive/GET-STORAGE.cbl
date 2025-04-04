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
       01 EMPLMENU-KEPT-STORAGE PIC X(10) VALUE 'CARLA'.                
       01 EOF-PHARM-SW PIC X(1) VALUE 'N'.
       01 EMPLMENU-KEPT-STORAGE-END PIC X(10).
       01 DB-REC-NOT-FOUND PIC X(10) VALUE 'CARLA'.

       PROCEDURE DIVISION.                                      
       100-START.   

           GET STORAGE FOR EMPLMENU-KEPT-STORAGE TO
            EMPLMENU-KEPT-STORAGE-END
            NOWAIT
            KEEP
            SHORT
            SHARED
            STGID '09PA'
            VALUE IS LOW-VALUE
              ON DB-REC-NOT-FOUND                          
              MOVE 'Y' TO EOF-PHARM-SW                     
           END-IF.

       IDMS-STATUS SECTION.
       IDMS-STATUS-EXIT.
           EXIT.

       IDMS-ABORT SECTION.                                  
       IDMS-ABORT-EXIT.                                     
            EXIT.                                                             
