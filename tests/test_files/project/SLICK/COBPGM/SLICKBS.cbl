       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID. SLICKBS.                                                     
       AUTHOR.     Ira M. Slick.                                                
                                                                                
      ******************************************************************        
      *DESCRIPTION: Batch Utility - Update Account (Maintenance)       *        
      ******************************************************************        
                                                                                
       ENVIRONMENT DIVISION.                                                    
       CONFIGURATION SECTION.                                                   
       SOURCE-COMPUTER.    IBM-PC.                                              
       OBJECT-COMPUTER.    IBM-PC.                                              
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SELECT ACCTFILE                                                      
               ASSIGN        TO UT-ACCTFILE                                     
               ORGANIZATION  IS INDEXED                                         
               ACCESS MODE   IS DYNAMIC                                         
               RECORD KEY    IS ACCOUNT-KEY                                     
               FILE STATUS   IS FS-ACCTFILE.                                    
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  ACCTFILE                          IS EXTERNAL                        
           DATA RECORD IS ACCOUNT-RECORD.                                       
           COPY ACCTFILE.                                                       
                                                                                
       WORKING-STORAGE SECTION.                                                 
                                                                                
           COPY SLICKCOM.                                                       
                                                                                
       01  WS-INPUT-FIELDS.                                                     
           03  WS-ACCOUNT-ID                 PIC 9(04) VALUE ZERO.              
           03  WS-TELEPHONE-1.                                                  
               05  WS-TEL-1A                 PIC 9(02) VALUE ZERO.              
               05  WS-TEL-1B                 PIC 9(02) VALUE ZERO.              
               05  WS-TEL-1C                 PIC 9(02) VALUE ZERO.              
           03  WS-DATE-OF-SERVICE.                                              
               05  WS-DATE-YY                PIC 9(02) VALUE ZERO.              
               05  WS-DATE-MM                PIC 9(02) VALUE ZERO.              
               05  WS-DATE-DD                PIC 9(02) VALUE ZERO.              
           03  WS-TECHNICIAN                 PIC 9(04) VALUE ZERO.              
           03  WS-PROBLEM-CODE               PIC 9(04) VALUE ZERO.              
           03  WS-RESOLUTION-CODE            PIC 9(04) VALUE ZERO.              
           03  WS-PARTS-REPLACED             PIC 9(04) VALUE ZERO.              
           03  WS-PART-LIST.                                                    
               05  WS-PART-1                 PIC 9(04) VALUE ZERO.              
               05  WS-PART-2                 PIC 9(04) VALUE ZERO.              
               05  WS-PART-3                 PIC 9(04) VALUE ZERO.              
               05  WS-PART-4                 PIC 9(04) VALUE ZERO.              
               05  WS-PART-5                 PIC 9(04) VALUE ZERO.              
           03  WS-SERVICE-CHARGE             PIC 9(06) VALUE ZERO.              
                                                                                
       77  FS-ACCTFILE                       PIC 9(02) VALUE ZERO.              
       77  WS-RETURN-CODE                    PIC 9(02) VALUE ZERO.              
       77  WS-SUB                            PIC 9(02) VALUE ZERO.              
                                                                                
       LINKAGE SECTION.                                                         
                                                                                
       01  LS-COMM                           PIC X(4096).                       
                                                                                
       01  LS-ACCOUNT-ID                     PIC 9(04).                         
                                                                                
       01  LS-TELEPHONE-1.                                                      
           05  LS-TEL-1A                     PIC 9(03).                         
           05  LS-TEL-1B                     PIC 9(03).                         
           05  LS-TEL-1C                     PIC 9(04).                         
                                                                                
       01  LS-DATE.                                                             
           05  LS-DATE-MM                    PIC 9(02).                         
           05  LS-DATE-DD                    PIC 9(02).                         
           05  LS-DATE-YY                    PIC 9(02).                         
                                                                                
       01  LS-TECHNICIAN                     PIC 9(04).                         
                                                                                
       01  LS-PROBLEM-CODE                   PIC 9(04).                         
                                                                                
       01  LS-RESOLUTION-CODE                PIC 9(04).                         
                                                                                
       01  LS-PART-1                         PIC 9(04).                         
                                                                                
       01  LS-PART-2                         PIC 9(04).                         
                                                                                
       01  LS-PART-3                         PIC 9(04).                         
                                                                                
       01  LS-PART-4                         PIC 9(04).                         
                                                                                
       01  LS-PART-5                         PIC 9(04).                         
                                                                                
       01  LS-SERVICE-CHARGE                 PIC 9(06).                         
                                                                                
       PROCEDURE DIVISION                                                       
           USING     LS-COMM                                                    
                     LS-ACCOUNT-ID                                              
                     LS-TELEPHONE-1                                             
                     LS-DATE                                                    
                     LS-TECHNICIAN                                              
                     LS-PROBLEM-CODE                                            
                     LS-RESOLUTION-CODE                                         
                     LS-PART-1                                                  
                     LS-PART-2                                                  
                     LS-PART-3                                                  
                     LS-PART-4                                                  
                     LS-PART-5                                                  
                     LS-SERVICE-CHARGE.                                         
                                                                                
       000-START-PROCESSING.                                                    
                                                                                
           PERFORM 000-INITIALIZATION.                                          
           PERFORM 000-VALIDATE-INPUT-FIELDS.                                   
                                                                                
           IF WS-TECHNICIAN = ZERO                                              
             OR LS-PROBLEM-CODE = ZERO                                          
               DISPLAY '*Warning* Invalid service record.'                      
               MOVE 4 TO WS-RETURN-CODE                                         
           ELSE                                                                 
               PERFORM 000-UPDATE-ACCOUNT.                                      
                                                                                
           MOVE WS-RETURN-CODE        TO RETURN-CODE.                           
           GOBACK.                                                              
                                                                                
       000-INITIALIZATION.                                                      
                                                                                
           MOVE LS-COMM               TO SLICK-COMM.                            
           MOVE LS-ACCOUNT-ID         TO WS-ACCOUNT-ID.                         
           MOVE LS-TELEPHONE-1        TO WS-TELEPHONE-1.                        
           MOVE LS-DATE-YY            TO WS-DATE-YY.                            
           MOVE LS-DATE-MM            TO WS-DATE-MM.                            
           MOVE LS-DATE-DD            TO WS-DATE-DD.                            
           MOVE LS-TECHNICIAN         TO WS-TECHNICIAN.                         
           MOVE LS-PROBLEM-CODE       TO WS-PROBLEM-CODE.                       
           MOVE LS-RESOLUTION-CODE    TO WS-RESOLUTION-CODE.                    
           MOVE LS-PART-1             TO WS-PART-1.                             
           MOVE LS-PART-2             TO WS-PART-2.                             
           MOVE LS-PART-3             TO WS-PART-3.                             
           MOVE LS-PART-4             TO WS-PART-4.                             
           MOVE LS-PART-5             TO WS-PART-5.                             
           MOVE LS-SERVICE-CHARGE     TO WS-SERVICE-CHARGE.                     
                                                                                
       000-VALIDATE-INPUT-FIELDS.                                               
                                                                                
      * Service Charge (Optional)                                               
           MOVE 6                       TO WS-FIELD-SIZE.                       
           MOVE 2                       TO WS-DECIMAL-DIGITS.                   
           MOVE WS-SERVICE-CHARGE       TO CH-ARRAY.                            
           PERFORM 000-MONEY-FIELD.                                             
           MOVE CH-ARRAY                TO WS-SERVICE-CHARGE.                   
                                                                                
      * Parts Replaced                                                          
           MOVE ZERO                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Part 5 (Optional)                                                       
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE 0                       TO WS-DECIMAL-DIGITS.                   
           MOVE WS-PART-5               TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PART-5.                           
                                                                                
           IF WS-PART-5 NOT = ZERO                                              
               ADD 1                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Part 4 (Optional)                                                       
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-PART-4               TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PART-4.                           
                                                                                
           IF WS-PART-4 NOT = ZERO                                              
               ADD 1                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Part 3 (Optional)                                                       
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-PART-3               TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PART-3.                           
                                                                                
           IF WS-PART-3 NOT = ZERO                                              
               ADD 1                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Part 2 (Optional)                                                       
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-PART-2               TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PART-2.                           
                                                                                
           IF WS-PART-2 NOT = ZERO                                              
               ADD 1                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Part 1 (Optional)                                                       
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-PART-1               TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PART-1.                           
                                                                                
           IF WS-PART-1 NOT = ZERO                                              
               ADD 1                    TO WS-PARTS-REPLACED.                   
                                                                                
      * Problem Code (Required)                                                 
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-PROBLEM-CODE         TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-PROBLEM-CODE.                     
                                                                                
      * Resolution Code (Required)                                              
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-RESOLUTION-CODE      TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-RESOLUTION-CODE.                  
                                                                                
      * Technician Id (Required)                                                
           MOVE 4                       TO WS-FIELD-SIZE.                       
           MOVE WS-TECHNICIAN           TO CH-ARRAY.                            
           PERFORM 000-NUM-FIELD.                                               
           MOVE CH-ARRAY                TO WS-TECHNICIAN.                       
                                                                                
      * Service Date                                                            
           MOVE WS-DATE-YY            TO WORK-YY.                               
           MOVE WS-DATE-MM            TO WORK-MM.                               
           MOVE WS-DATE-DD            TO WORK-DD.                               
           MOVE 8                     TO WS-FIELD-SIZE.                         
           MOVE WORK-DATE             TO DT-ARRAY.                              
           PERFORM 000-DATE-FIELD.                                              
           MOVE WORK-YY               TO WS-DATE-YY.                            
           MOVE WORK-MM               TO WS-DATE-MM.                            
           MOVE WORK-DD               TO WS-DATE-DD.                            
                                                                                
           DIVIDE WS-DATE-YY BY 4                                               
               GIVING    DUMMY-QUOTIENT                                         
               REMAINDER DUMMY-REMAINDER.                                       
                                                                                
           IF LEAP-YEAR                                                         
               MOVE 29 TO MONTH-DAYS (2)                                        
           ELSE                                                                 
               MOVE 28 TO MONTH-DAYS (2).                                       
                                                                                
           IF WORK-MM = ZERO                                                    
           OR WORK-DD = ZERO                                                    
           OR WORK-MM > 12                                                      
           OR WORK-DD > MONTH-DAYS (WORK-MM)                                    
               MOVE COMM-TRAN-DATE  TO WS-DATE-OF-SERVICE.                      
                                                                                
       000-UPDATE-ACCOUNT.                                                      
                                                                                
           ADD 1                    TO A-S-MAINTENANCE-ENTRIES.                 
           MOVE WS-DATE-OF-SERVICE  TO A-S-LAST-MAINTENANCE.                    
                                                                                
           IF WS-SERVICE-CHARGE NOT ZERO                                        
               PERFORM 000-UPDATE-NEXT-PAYMENT-DATE.                            
                                                                                
           COMPUTE A-S-BALANCE = A-S-BALANCE + WS-SERVICE-CHARGE.               
                                                                                
           REWRITE ACCOUNT-STATISTICS-RECORD.                                   
                                                                                
           IF FS-ACCTFILE NOT ZERO                                              
               DISPLAY '*Error* Updating ACCTFILE for service.'                 
               MOVE 8 TO WS-RETURN-CODE                                         
           ELSE                                                                 
                                                                                
               SET ACCOUNT-MAINTENANCE TO TRUE                                  
                                                                                
               COMPUTE A-M-RECORD-NUMBER =                                      
                   (A-S-MAINTENANCE-ENTRIES - 1) / 10                           
                                                                                
               COMPUTE WS-SUB =                                                 
                  A-S-MAINTENANCE-ENTRIES - (A-M-RECORD-NUMBER * 10)            
                                                                                
               IF WS-SUB = 1                                                    
                   PERFORM 000-WRITE-MAINTENANCE-RECORD                         
                                                                                
               ELSE                                                             
                   PERFORM 000-UPDATE-MAINTENANCE-RECORD.                       
                                                                                
           IF FS-ACCTFILE = ZERO                                                
               DISPLAY 'Account updated successfully.'.                         
                                                                                
       000-UPDATE-NEXT-PAYMENT-DATE.                                            
                                                                                
           ADD 1                       TO WS-DATE-MM.                           
           MOVE 15                     TO WS-DATE-DD.                           
                                                                                
           IF WS-DATE-MM > 12                                                   
               MOVE 1                  TO WS-DATE-MM                            
               ADD 1                   TO WS-DATE-YY                            
           END-IF.                                                              
                                                                                
           MOVE WS-DATE-OF-SERVICE     TO A-S-PAYMENT-DUE.                      
           MOVE A-S-LAST-MAINTENANCE   TO WS-DATE-OF-SERVICE.     

            PERFORM 000-DATE-EXTRACT                                    
               VARYING I FROM I BY 1                               
                 UNTIL I > WS-FIELD-SIZE                                
                    OR DT-X (I) = '/' OR '-'.                     
                                                                                
       000-WRITE-MAINTENANCE-RECORD.                                            
                                                                                
           INITIALIZE A-M-DATA.                                                 
           MOVE WS-DATE-OF-SERVICE      TO A-M-DATE-OF-SERVICE  (1).            
           MOVE WS-TECHNICIAN           TO A-M-TECHNICIAN       (1).            
           MOVE WS-PROBLEM-CODE         TO A-M-PROBLEM-CODE     (1).            
           MOVE WS-RESOLUTION-CODE      TO A-M-RESOLUTION-CODE  (1).            
           MOVE WS-PARTS-REPLACED       TO A-M-PARTS-REPLACED   (1).            
           MOVE WS-PART-LIST            TO A-M-PART-LIST        (1).            
           MOVE WS-SERVICE-CHARGE       TO A-M-SERVICE-CHARGE   (1).            
           WRITE ACCOUNT-PAYMENT-RECORD.                                        
                                                                                
           IF FS-ACCTFILE NOT ZERO                                              
               DISPLAY '*ERROR* Adding service record.'                         
               MOVE 8 TO WS-RETURN-CODE.                                        
                                                                                
       000-UPDATE-MAINTENANCE-RECORD.                                           
                                                                                
           READ ACCTFILE.                                                       
                                                                                
           IF FS-ACCTFILE NOT ZERO                                              
               DISPLAY '*ERROR* Reading service record.'                        
               MOVE 8 TO WS-RETURN-CODE   
                                                     
                                                                                
           ELSE                                                                 
               MOVE WS-DATE-OF-SERVICE  TO A-M-DATE-OF-SERVICE  (WS-SUB)        
               MOVE WS-TECHNICIAN       TO A-M-TECHNICIAN       (WS-SUB)        
               MOVE WS-PROBLEM-CODE     TO A-M-PROBLEM-CODE     (WS-SUB)        
               MOVE WS-RESOLUTION-CODE  TO A-M-RESOLUTION-CODE  (WS-SUB)        
               MOVE WS-PARTS-REPLACED   TO A-M-PARTS-REPLACED   (WS-SUB)        
               MOVE WS-PART-LIST        TO A-M-PART-LIST        (WS-SUB)        
               MOVE WS-SERVICE-CHARGE   TO A-M-SERVICE-CHARGE   (WS-SUB)        
               REWRITE ACCOUNT-MAINTENANCE-RECORD                               
                                                                                
               IF FS-ACCTFILE NOT ZERO                                          
                   DISPLAY '*ERROR* Updating service record.'                   
                   MOVE 8 TO WS-RETURN-CODE.      
                    PERFORM 000-DATE-EXTRACT                                    
                       VARYING I FROM I BY 1                               
                         UNTIL I > WS-FIELD-SIZE                                
                            OR DT-X (I) = '/' OR '-'.                       
                                                                                
           COPY SLICKNUM.                                                       
