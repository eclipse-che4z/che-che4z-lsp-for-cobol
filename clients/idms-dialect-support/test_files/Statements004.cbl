      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases
      * TestAbendCodeOnNextSentence, TestAccept, TestAttachTaskCode,
      * TestBind, TestChangePriority,
      * TestCommit, TestDelete, TestEnd, TestEndpage, TestFinish,
      * TestIdmsDcStatement, TestIdmsDequeueStatement,
      * TestIdmsEnqueueStatement, TestIdmsFreeStatement,
      * TestIdmsPostStatement, TestIdmsRollbackStatement,
      * TestIdmsSetStatement, TestIdmsTransferStatement,
      * TestIdmsWaitStatement.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATEMENTS-004.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
           ATTACH TASK CODE 'TASK' PRIORITY 1
               ON ANY-STATUS CONTINUE END-IF.
           CHANGE PRIORITY TO 1
               ON ANY-STATUS CONTINUE END-IF.
           COMMIT ALL
               ON ANY-STATUS CONTINUE END-IF.
           BIND TRANSACTION STATISTICS
               ON ANY-STATUS CONTINUE END-IF.
           DC RETURN
               ON ANY-STATUS CONTINUE END-IF.
           DEQUEUE ALL
               ON ANY-STATUS CONTINUE END-IF.
           ENQUEUE NOWAIT
               ON ANY-STATUS CONTINUE END-IF.
           END TRANSACTION STATISTICS
               ON ANY-STATUS CONTINUE END-IF.
           ENDPAGE SESSION
               ON ANY-STATUS CONTINUE END-IF.
           FINISH TASK
               ON ANY-STATUS CONTINUE END-IF.
           FREE STORAGE STGID 'A'
               ON ANY-STATUS CONTINUE END-IF.
           POST EVENT NAME 'EVENT'
               ON ANY-STATUS CONTINUE END-IF.
           ROLLBACK TASK CONTINUE
               ON ANY-STATUS CONTINUE END-IF.
           WAIT EVENT NAME 'EVENT'
               ON ANY-STATUS CONTINUE END-IF.
           ACCEPT TRANSACTION STATISTICS LENGTH 500
               ON ANY-STATUS CONTINUE END-IF.
           DELETE QUEUE CURRENT
               ON ANY-ERROR-STATUS
                   DISPLAY 'DELETE ERROR'
           END-IF.
           SET TIMER WAIT INTERVAL 1 SECONDS
               ON ANY-ERROR-STATUS
                   DISPLAY 'TIMER ERROR'
           END-IF.
           TRANSFER CONTROL TO 'PROG' RETURN
               ON ANY-ERROR-STATUS
                   DISPLAY 'TRANSFER ERROR'
           END-IF.
           ABEND CODE '1234'
               ON ANY-STATUS NEXT SENTENCE.
           DISPLAY NOT-EXISTING.
           STOP RUN.
