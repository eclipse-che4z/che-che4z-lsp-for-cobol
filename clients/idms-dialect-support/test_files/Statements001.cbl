      * Java usecases:
      * https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree
      */development/server/dialect-idms/src/test/java/org/eclipse/lsp/cobol
      */dialects/idms/usecases
      * TestAbendCode, TestAccept, TestAttachTaskCode, TestBind,
      * TestChangePriority, TestCheckTerminal, TestCommit, TestDelete,
      * TestEnd, TestEndpage, TestFinish, TestIdmsAcceptDbStatements,
      * TestIdmsBindStatement, TestIdmsConDisconnectStatement,
      * TestIdmsDcStatement, TestIdmsDequeueStatement,
      * TestIdmsEnqueueStatement, TestIdmsEraseStatement,
      * TestIdmsFindObtainStatements, TestIdmsFreeStatement,
      * TestIdmsGetStatement, TestIdmsInquireMapStatement,
      * TestIdmsKeepStatement, TestIdmsLoadStatement,
      * TestIdmsMapInStatement, TestIdmsModifyStatement,
      * TestIdmsPostStatement, TestIdmsPutStatement,
      * TestIdmsReadStatement, TestIdmsReadyStatement,
      * TestIdmsReturnStatement, TestIdmsRollbackStatement,
      * TestIdmsSendStatement, TestIdmsSetStatement,
      * TestIdmsSnapStatement, TestIdmsStartpageStatement,
      * TestIdmsStoreStatement, TestIdmsTransferStatement,
      * TestIdmsWaitStatement, TestIdmsWriteClause.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STATEMENTS-001.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A PIC X(80).
       01 WS-B PIC X(80).
       PROCEDURE DIVISION.
           ABEND CODE '1234'.
           ATTACH TASK CODE 'TASK'.
           BIND TASK.
           CHANGE PRIORITY TO 1.
           CHECK TERMINAL INTO WS-A MAX LENGTH 80.
           COMMIT TASK.
           CONNECT EMPLOYEE TO EMP-SET.
           DC RETURN.
           DEQUEUE ALL.
           DISCONNECT EMPLOYEE FROM EMP-SET.
           END LINE TERMINAL SESSION.
           ENDPAGE SESSION.
           ENQUEUE NOWAIT.
           ERASE EMPLOYEE.
           FIND CALC EMPLOYEE.
           FINISH TASK.
           FREE STORAGE STGID 'A'.
           GET.
           INQUIRE MAP EMPMAP MOVE AID TO WS-A.
           KEEP CURRENT EMPLOYEE.
           LOAD TABLE 'TABLE1' INTO WS-A TO WS-B NOWAIT.
           MAP IN USING EMPMAP INPUT DATA YES.
           MODIFY EMPLOYEE.
           OBTAIN CURRENT EMPLOYEE.
           POST EVENT NAME 'EVENT'.
           PUT QUEUE FROM WS-A LENGTH 1.
           READY AREA-A USAGE-MODE IS RETRIEVAL.
           ROLLBACK TASK CONTINUE.
           SNAP ALL FROM WS-A LENGTH 1.
           STARTPAGE SESSION EMPMAP WAIT.
           STORE EMPLOYEE.
           WAIT EVENT NAME 'EVENT'.
           WRITE JOURNAL WAIT FROM WS-A LENGTH 1.
           READ TERMINAL WAIT INTO WS-A MAX LENGTH 80.
           ACCEPT LTERM ID INTO WS-A.
           DELETE QUEUE.
           RETURN WS-A FROM EMPLOYEE CURRENCY.
           SEND MESSAGE TO USER ID WS-A FROM WS-B LENGTH 1.
           SET ABEND EXIT ON PROGRAM 'PROG'.
           TRANSFER CONTROL TO 'PROG' RETURN.
           DISPLAY NOT-EXISTING.
           STOP RUN.
