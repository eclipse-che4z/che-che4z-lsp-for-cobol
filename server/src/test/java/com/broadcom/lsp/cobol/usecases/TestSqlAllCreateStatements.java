/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

/**
 * This PARAMETERIZED test checks if all below sql CREATE statements works correctly.
 *
 * <pre>
 * - CREATE ALIAS
 * - CREATE AUXILIARY TABLE
 * - CREATE DATABASE
 * - CREATE FUNCTION
 * - CREATE FUNCTION (compiled SQL scalar)
 * - CREATE FUNCTION (external scalar)
 * - CREATE FUNCTION (external table)
 * - CREATE FUNCTION (inlined SQL scalar)
 * - CREATE FUNCTION (sourced)
 * - CREATE FUNCTION (SQL table)
 * - CREATE GLOBAL TEMPORARY TABLE
 * - CREATE INDEX
 * - CREATE LOB TABLESPACE
 * - CREATE MASK
 * - CREATE PERMISSION
 * - CREATE PROCEDURE (external)
 * - CREATE PROCEDURE (sql native)
 * - CREATE ROLE
 * - CREATE SEQUENCE
 * - CREATE STOGROUP
 * - CREATE TABLE
 * - CREATE TABLESPACE
 * - CREATE TRIGGER (advanced)
 * - CREATE TRIGGER (basic)
 * - CREATE CREATE TRUSTED CONTEXT
 * - CREATE TRUSTED CONTEXT
 * - CREATE CREATE TYPE (array)
 * - CREATE CREATE TYPE (distinct)
 * - CREATE VARIABLE
 * - CREATE VIEW
 * </pre>
 */
class TestSqlAllCreateStatements {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       EXEC SQL\n";
  // CREATE: ALIAS
  private static final String CREATE_ALIAS =
      TEXT
          + "       CREATE ALIAS LATABLES FOR DB2USCALABOA5281.SYSIBM.SYSTABLES;\n"
          + "       END-EXEC.";

  // CREATE AUXILIARY TABLE
  private static final String CREATE_AUX_TABLE =
      TEXT
          + "       CREATE AUX TABLE EMP_PHOTO_ATAB\n"
          + "       IN DSN8D12A.PHOTOLTS\n"
          + "       STORES DSN8C10.EMP\n"
          + "       COLUMN EMP_PHOTO;\n"
          + "       END-EXEC.";

  // CREATE: DATABASE
  private static final String CREATE_DB =
      TEXT
          + "       CREATE DATABASE DSN8D12P\n"
          + "       STOGROUP DSN8G120\n"
          + "       BUFFERPOOL BP8K1\n"
          + "       INDEXBP BP2;\n"
          + "       END-EXEC.";

  private static final String CREATE_DB2 =
      TEXT + "       CREATE DATABASE DSN8TEMP\n" + "       CCSID ASCII;\n" + "       END-EXEC.";

  // CREATE FUNCTION (compiled SQL scalar)
  private static final String CREATE_FUNCTION_COMPILED =
      TEXT
          + "       CREATE FUNCTION REVERSE(INSTR VARCHAR(4000))\n"
          + "         RETURNS VARCHAR(4000)\n"
          + "         DETERMINISTIC NO EXTERNAL ACTION CONTAINS SQL\n"
          + "         BEGIN\n"
          + "         DECLARE REVSTR, RESTSTR VARCHAR(4000) DEFAULT '';\n"
          + "         DECLARE LEN INT;\n"
          + "         IF INSTR IS NULL THEN\n"
          + "         RETURN NULL;\n"
          + "         END IF;\n"
          + "         SET (RESTSTR, LEN) = (INSTR, LENGTH(INSTR));\n"
          + "         WHILE LEN > 0 DO\n"
          + "         SET (REVSTR, RESTSTR, LEN)\n"
          + "           = (SUBSTR(RESTSTR, 1, 1) CONCAT REVSTR,\n"
          + "           SUBSTR(RESTSTR, 2, LEN - 1),\n"
          + "           LEN - 1);\n"
          + "         END WHILE;\n"
          + "        RETURN REVSTR;\n"
          + "        END\n"
          + "       END-EXEC.";

  // CREATE FUNCTION external scalar
  private static final String CREATE_FUNCTION_EXT =
      TEXT
          + "       CREATE FUNCTION NTEST1 (SMALLINT)\n"
          + "          RETURNS SMALLINT\n"
          + "          EXTERNAL NAME 'NTESTMOD'\n"
          + "          SPECIFIC MINENULL1\n"
          + "          LANGUAGE C\n"
          + "           DETERMINISTIC\n"
          + "           NO SQL\n"
          + "           FENCED\n"
          + "           PARAMETER STYLE SQL\n"
          + "           RETURNS NULL ON NULL INPUT\n"
          + "           NO EXTERNAL ACTION;\n"
          + "       END-EXEC.";

  private static final String CREATE_FUNCTION_EXT2 =
      TEXT
          + "       CREATE FUNCTION CENTER (INTEGER, FLOAT)\n"
          + "       RETURNS FLOAT\n"
          + "       EXTERNAL NAME 'MIDDLE'\n"
          + "       LANGUAGE C\n"
          + "       DETERMINISTIC\n"
          + "       NO SQL\n"
          + "       FENCED\n"
          + "       PARAMETER STYLE SQL\n"
          + "       NO EXTERNAL ACTION\n"
          + "       STAY RESIDENT YES;\n"
          + "       END-EXEC.";

  private static final String CREATE_FUNCTION_EXT3 =
      TEXT
          + "       CREATE FUNCTION SMITH.CENTER (FLOAT, FLOAT, FLOAT)\n"
          + "           RETURNS DECIMAL(8,4) CAST FROM FLOAT\n"
          + "           EXTERNAL NAME 'CMOD'\n"
          + "           SPECIFIC FOCUS98\n"
          + "           LANGUAGE C\n"
          + "           DETERMINISTIC\n"
          + "           NO SQL\n"
          + "           FENCED\n"
          + "           PARAMETER STYLE SQL\n"
          + "           NO EXTERNAL ACTION\n"
          + "           SCRATCHPAD\n"
          + "           NO FINAL CALL;\n"
          + "       END-EXEC.";

  private static final String CREATE_FUNCTION_EXT4 =
      TEXT
          + "       CREATE FUNCTION FINDV (CLOB(100K))\n"
          + "           RETURNS INTEGER\n"
          + "           FENCED\n"
          + "           LANGUAGE JAVA\n"
          + "           PARAMETER STYLE JAVA\n"
          + "           EXTERNAL NAME 'JAVAUDFS.FINDVWL'\n"
          + "           NO EXTERNAL ACTION\n"
          + "           CALLED ON NULL INPUT\n"
          + "           DETERMINISTIC\n"
          + "           NO SQL;\n"
          + "       END-EXEC.";

  // CREATE FUNCTION external table
  private static final String CREATE_FUNCTION_EXT_TABLE =
      TEXT
          + "       CREATE FUNCTION DOCMATCH (VARCHAR(30), VARCHAR(255))\n"
          + "                            RETURNS TABLE (DOC_ID CHAR(16))\n"
          + "        EXTERNAL NAME ABC\n"
          + "        LANGUAGE C\n"
          + "        PARAMETER STYLE SQL\n"
          + "        NO SQL\n"
          + "        DETERMINISTIC\n"
          + "        NO EXTERNAL ACTION\n"
          + "        FENCED\n"
          + "        SCRATCHPAD\n"
          + "        FINAL CALL\n"
          + "        DISALLOW PARALLEL\n"
          + "        CARDINALITY 20;\n"
          + "       END-EXEC.";

  private static final String CREATE_FUNCTION_EXT_TABLE2 =
      TEXT
          + "       CREATE FUNCTION tf6(p1 VARCHAR(10))\n"
          + "       RETURNS GENERIC TABLE\n"
          + "       EXTERNAL NAME 'tf6'\n"
          + "       LANGUAGE C\n"
          + "       PARAMETER STYLE SQL\n"
          + "       DETERMINISTIC\n"
          + "       NO EXTERNAL ACTION\n"
          + "       FENCED\n"
          + "       SCRATCHPAD\n"
          + "       FINAL CALL;\n"
          + "       END-EXEC.";

  // CREATE FUNCTION (inlined SQL scalar)
  private static final String CREATE_FUNCTION_INLINED =
      TEXT
          + "       CREATE FUNCTION TAN (X DOUBLE)\n"
          + "       RETURNS DOUBLE\n"
          + "       LANGUAGE SQL\n"
          + "       CONTAINS SQL\n"
          + "       NO EXTERNAL ACTION\n"
          + "       DETERMINISTIC\n"
          + "       RETURN SIN(X)/COS(X);\n"
          + "       END-EXEC.";

  // CREATE FUNCTION SOURCED
  private static final String CREATE_FUNCTION_SOURCED =
      TEXT
          + "       CREATE FUNCTION AVE (HATSIZE) RETURNS HATSIZE\n"
          + "       SOURCE SYSIBM.AVG (INTEGER);\n"
          + "       END-EXEC.";

  private static final String CREATE_FUNCTION_SOURCED2 =
      TEXT
          + "       CREATE FUNCTION MYCENTER (INTEGER, INTEGER)\n"
          + "       RETURNS FLOAT\n"
          + "       SOURCE SMITH.CENTER (INTEGER, FLOAT);\n"
          + "       END-EXEC.";

  // CREATE FUNCTION (SQL table)
  private static final String CREATE_FUNCTION_SQL_TABLE =
      TEXT
          + "       CREATE FUNCTION JTABLE (COLD_VALUE CHAR(9), T2_FLAG CHAR(1))\n"
          + "           RETURNS TABLE (COLA INT, COLB INT, COLC INT)\n"
          + "           LANGUAGE SQL\n"
          + "           SPECIFIC DEPTINFO\n"
          + "           NOT DETERMINISTIC\n"
          + "           READS SQL DATA\n"
          + "           RETURN\n"
          + "               SELECT A.COLA, B.COLB, B.COLC\n"
          + "               FROM TABLE1 AS A\n"
          + "               LEFT OUTER JOIN\n"
          + "               TABLE2 AS B\n"
          + "               ON A.COL1 = B.COL1 AND T2_FLAG = 'Y'\n"
          + "               WHERE A.COLD = COLD_VALUE;\n"
          + "       END-EXEC.";

  // CREATE FUNCTION (SQL table)
  private static final String CREATE_FUNCTION_SQL_TABLE2 =
      TEXT
          + "       CREATE FUNCTION DEPTEMPLOYEES (DEPTNO CHAR(3))\n"
          + "           RETURNS TABLE (EMPNO CHAR(6), LASTNAME VARCHAR(15),\n"
          + "                            FIRSTNAME VARCHAR(12))\n"
          + "           LANGUAGE SQL\n"
          + "           READS SQL DATA\n"
          + "           NO EXTERNAL ACTION\n"
          + "           DETERMINISTIC\n"
          + "           RETURN\n"
          + "             SELECT EMPNO, LASTNAME, FIRSTNME\n"
          + "             FROM YEMP\n"
          + "                    WHERE YEMP.WORKDEPT = DEPTEMPLOYEES.DEPTNO;\n"
          + "       END-EXEC.";

  // CREATE GLOBAL TEMPORARY TABLE
  private static final String CREATE_GLOBAL_TMP_TABLE =
      TEXT
          + "       CREATE GLOBAL TEMPORARY TABLE CURRENTMAP\n"
          + "         (CODE INTEGER NOT NULL, MEANING VARCHAR(254) NOT NULL);\n"
          + "       END-EXEC.";

  private static final String CREATE_GLOBAL_TMP_TABLE2 =
      TEXT
          + "       CREATE GLOBAL TEMPORARY TABLE EMP\n"
          + "           (TMPDEPTNO   CHAR(3)     NOT NULL,\n"
          + "           TMPDEPTNAME VARCHAR(36) NOT NULL,\n"
          + "           TMPMGRNO    CHAR(6)  ,\n"
          + "           TMPLOCATION CHAR(16))\n"
          + "       END-EXEC.";

  // CREATE INDEX
  private static final String CREATE_INDEX =
      TEXT
          + "       CREATE UNIQUE INDEX DSN8C10.XDEPT1\n"
          + "           ON DSN8C10.DEPT\n"
          + "           (DEPTNO ASC)\n"
          + "           PADDED\n"
          + "           USING STOGROUP DSN8G120\n"
          + "           PRIQTY 512\n"
          + "           SECQTY 64\n"
          + "           ERASE NO\n"
          + "           BUFFERPOOL BP1\n"
          + "           CLOSE YES\n"
          + "           PIECESIZE 1M;\n"
          + "       END-EXEC.";

  private static final String CREATE_INDEX2 =
      TEXT
          + "       CREATE INDEX DSN8C10.XEMP2\n"
          + "           ON DSN8C10.EMP\n"
          + "           (EMPNO ASC)\n"
          + "           USING STOGROUP DSN8G120\n"
          + "           PRIQTY 36\n"
          + "           ERASE NO\n"
          + "           CLUSTER\n"
          + "           PARTITION BY RANGE\n"
          + "           (PARTITION 1 ENDING AT('H99'),\n"
          + "           PARTITION 2 ENDING AT('P99'),\n"
          + "           PARTITION 3 ENDING AT('Z99'),\n"
          + "           PARTITION 4 ENDING AT('999'))\n"
          + "           BUFFERPOOL BP1\n"
          + "           CLOSE YES\n"
          + "           COPY YES;\n"
          + "       END-EXEC.";

  private static final String CREATE_INDEX3 =
      TEXT
          + "       CREATE UNIQUE INDEX DSN8C10.XDEPT1\n"
          + "       ON DSN8C10.DEPT\n"
          + "       (DEPTNO ASC)\n"
          + "       USING VCAT DSNCAT\n"
          + "       PIECESIZE 1048576K;\n"
          + "       END-EXEC.";

  private static final String CREATE_INDEX4 =
      TEXT
          + "       CREATE UNIQUE INDEX DSN8C10.XPHOTO\n"
          + "           ON DSN8C10.EMP_PHOTO_ATAB\n"
          + "           USING VCAT DSNCAT\n"
          + "           COPY YES;\n"
          + "       END-EXEC.";

  // CREATE LOB TABLESPACE
  private static final String CREATE_LOB_TABLESPACE =
      TEXT
          + "       CREATE LOB TABLESPACE PHOTOLTS\n"
          + "           IN DSN8D12A\n"
          + "           USING STOGROUP DSN8G120\n"
          + "                PRIQTY 3200\n"
          + "                SECQTY 1600\n"
          + "            LOCKSIZE LOB\n"
          + "            BUFFERPOOL BP16K0\n"
          + "            GBPCACHE SYSTEM\n"
          + "            NOT LOGGED\n"
          + "            CLOSE NO;\n"
          + "       END-EXEC.";

  // CREATE MASK
  private static final String CREATE_MASK =
      TEXT
          + "        CREATE MASK SSN_MASK ON EMPLOYEE\n"
          + "           FOR COLUMN SSN RETURN\n"
          + "             CASE \n"
          + "                  WHEN (VERIFY_GROUP_FOR_USER\n"
          + "                  (SESSION_USER,'PAYROLL') = 1)\n"
          + "                         THEN SSN\n"
          + "                  WHEN (\n"
          + "                  VERIFY_GROUP_FOR_USER(SESSION_USER,'MGR') = 1)\n"
          + "                   THEN 'XXX-XX-' || SUBSTR(SSN,8,4)\n"
          + "                  ELSE NULL\n"
          + "             END\n"
          + "           ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE EMPLOYEE \n"
          + "            ACTIVATE COLUMN ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT SSN FROM EMPLOYEE \n"
          + "            WHERE EMPNO = 123456;\n"
          + "       END-EXEC.";

  private static final String CREATE_MASK2 =
      TEXT
          + "        CREATE MASK SSN_MASK ON EMPLOYEE\n"
          + "            FOR COLUMN SSN RETURN\n"
          + "              CASE \n"
          + "                   WHEN (1 = 1) \n"
          + "                    THEN 'XXX-XX-' || SUBSTR(SSN,8,4)\n"
          + "                   ELSE NULL\n"
          + "              END\n"
          + "            ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE EMPLOYEE \n"
          + "            ACTIVATE COLUMN ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT 'XXX-XX-' || \n"
          + "         SUBSTR(SSN,8,4) FROM EMPLOYEE \n"
          + "            WHERE EMPNO = 123456;\n"
          + "       END-EXEC.";

  private static final String CREATE_MASK3 =
      TEXT
          + "        CREATE MASK CITY_MASK ON LIBRARY_USAGE\n"
          + "            FOR COLUMN CITY RETURN\n"
          + "              CASE \n"
          + "                   WHEN (LIBRARY_OPT = 'OPT-IN') \n"
          + "                    THEN CITY\n"
          + "                   ELSE ' '\n"
          + "              END\n"
          + "            ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE LIBRARY_USAGE\n"
          + "           ACTIVATE COLUMN ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT CITY, AVG(LIBRARY_TIME) FROM LIBRARY_USAGE \n"
          + "           GROUP BY CITY;\n"
          + "       END-EXEC.";

  private static final String CREATE_MASK4 =
      TEXT
          + "        CREATE MASK SALARY_MASK ON EMPLOYEE\n"
          + "           FOR COLUMN SALARY RETURN \n"
          + "               CASE \n"
          + "                    WHEN (BONUS < 10000) \n"
          + "                     THEN SALARY\n"
          + "                    ELSE NULL\n"
          + "               END\n"
          + "           ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        CREATE MASK BONUS_MASK ON EMPLOYEE\n"
          + "           FOR COLUMN BONUS RETURN\n"
          + "               CASE \n"
          + "                    WHEN (BONUS > 5000) \n"
          + "                     THEN NULL\n"
          + "                    ELSE BONUS\n"
          + "               END\n"
          + "           ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE EMPLOYEE \n"
          + "            ACTIVATE COLUMN ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT SALARY FROM EMPLOYEE \n"
          + "            WHERE EMPNO = 123456;\n"
          + "       END-EXEC.";

  private static final String CREATE_MASK5 =
      TEXT
          + "        CREATE TABLE EMPLOYEE (EMPID INT,\n"
          + "                         DEPTID CHAR(8),\n"
          + "                         SALARY DEC(9,2) NOT NULL,\n"
          + "                         BONUS DEC(9,2));\n"
          + "        \n"
          + "        CREATE MASK SALARY_MASK ON EMPLOYEE\n"
          + "            FOR COLUMN SALARY RETURN\n"
          + "               CASE \n"
          + "                    WHEN SALARY < 10000 \n"
          + "                     THEN CAST(SALARY*2 AS DEC(9,2))\n"
          + "                    ELSE COALESCE(CAST(SALARY/2 \n"
          + "                    AS DEC(9,2)), BONUS)\n"
          + "               END\n"
          + "            ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        CREATE MASK BONUS_MASK ON EMPLOYEE\n"
          + "            FOR COLUMN BONUS RETURN \n"
          + "              CASE \n"
          + "                  WHEN BONUS > 1000 \n"
          + "                   THEN BONUS\n"
          + "                  ELSE NULL\n"
          + "              END\n"
          + "            ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE EMPLOYEE\n"
          + "            ACTIVATE COLUMN ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT SALARY FROM DEPT \n"
          + "            LEFT JOIN EMPLOYEE ON DEPTNO = DEPTID;\n"
          + "        \n"
          + "       \n"
          + "        SELECT CASE WHEN SALARY IS NULL THEN NULL\n"
          + "                    WHEN SALARY < 10000 THEN \n"
          + "                    CAST(SALARY*2 AS DEC(9,2))\n"
          + "                    ELSE COALESCE(CAST(SALARY/2 AS DEC(9,2)), \n"
          + "                    BONUS)\n"
          + "               END SALARY\n"
          + "               FROM DEPT \n"
          + "                 LEFT JOIN EMPLOYEE ON DEPTNO = DEPTID;\n"
          + "       END-EXEC.";

  // CREATE PERMISSION
  private static final String CREATE_PERMISSION =
      TEXT
          + "        CREATE PERMISSION SALARY_ROW_ACCESS ON EMPLOYEE\n"
          + "           FOR ROWS WHERE VERIFY_GROUP_FOR_USER\n"
          + "         (SESSION_USER,'MGR','ACCOUNTING') = 1\n"
          + "                    AND\n"
          + "                    ACCOUNTING_UDF(SALARY) < 120000\n"
          + "           ENFORCED FOR ALL ACCESS\n"
          + "           ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE EMPLOYEE \n"
          + "        \tACTIVATE ROW ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT SALARY FROM EMPLOYEE \n"
          + "           WHERE EMPNO = 123456;\n"
          + "       END-EXEC.";

  private static final String CREATE_PERMISSION2 =
      TEXT
          + "        CREATE PERMISSION TELLER_ROW_ACCESS ON CUSTOMER\n"
          + "           FOR ROWS WHERE VERIFY_GROUP_FOR_USER\n"
          + "             (SESSION_USER,'TELLER') = 1\n"
          + "                    AND\n"
          + "            BRANCH = (SELECT HOME_BRANCH FROM INTERNAL_INFO\n"
          + "                  WHERE EMP_ID = SESSION_USER)\n"
          + "            ENFORCED FOR ALL ACCESS\n"
          + "            ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        CREATE PERMISSION CSR_ROW_ACCESS ON CUSTOMER\n"
          + "           FOR ROWS WHERE \n"
          + "             VERIFY_GROUP_FOR_USER(SESSION_USER,'CSR') = 1\n"
          + "           ENFORCED FOR ALL ACCESS\n"
          + "           ENABLE;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        ALTER TABLE CUSTOMER \n"
          + "           ACTIVATE ROW ACCESS CONTROL;\n"
          + "        \n"
          + "        COMMIT;\n"
          + "        \n"
          + "        SELECT * FROM CUSTOMER;\n"
          + "       END-EXEC.";

  // CREATE PROCEDURE external
  private static final String CREATE_PROCEDURE_EXT =
      TEXT
          + "        CREATE PROCEDURE SYSPROC.MYPROC(IN INT, OUT INT,\n"
          + "           OUT DECIMAL(7,2))\n"
          + "                 LANGUAGE COBOL\n"
          + "                 EXTERNAL NAME MYMODULE\n"
          + "                 PARAMETER STYLE GENERAL\n"
          + "                 WLM ENVIRONMENT PARTSA\n"
          + "                 DYNAMIC RESULT SETS 1;\n"
          + "       END-EXEC.";

  private static final String CREATE_PROCEDURE_EXT2 =
      TEXT
          + "        CREATE PROCEDURE \n"
          + "        SYSPROC.MYPROC(IN INT, OUT INT, OUT DECIMAL(7,2))\n"
          + "            LANGUAGE COBOL\n"
          + "            EXTERNAL NAME MYMODULE\n"
          + "            PARAMETER STYLE SQL\n"
          + "            WLM ENVIRONMENT PARTSA\n"
          + "            DYNAMIC RESULT SETS 1\n"
          + "            RUN OPTIONS \n"
          + "       'HEAP(,,ANY),BELOW(4K,,),ALL31(ON),STACK(,,ANY,)';\n"
          + "       END-EXEC.";

  private static final String CREATE_PROCEDURE_EXT3 =
      TEXT
          + "        CREATE PROCEDURE PARTS_ON_HAND(IN PARTNUM INT, \n"
          + "                 OUT COST DECIMAL(7,2), \n"
          + "                 OUT QUANTITY INT)\n"
          + "                 LANGUAGE JAVA\n"
          + "                 EXTERNAL NAME 'PARTS.ONHAND'\n"
          + "                 PARAMETER STYLE JAVA;\n"
          + "       END-EXEC.";

  // CREATE PROCEDURE SQL external
  private static final String CREATE_PROCEDURE_SQL_NATIVE =
      TEXT
          + "        CREATE PROCEDURE UPDATE_SALARY_1\n"
          + "         (IN EMPLOYEE_NUMBER CHAR(10),\n"
          + "         IN RATE DECIMAL(6,2))\n"
          + "         LANGUAGE SQL\n"
          + "         MODIFIES SQL DATA\n"
          + "          UPDATE EMP\n"
          + "          SET SALARY = SALARY * RATE\n"
          + "          WHERE EMPNO = EMPLOYEE_NUMBER\n"
          + "       END-EXEC.";

  private static final String CREATE_PROCEDURE_SQL_NATIVE2 =
      TEXT
          + "        CREATE PROCEDURE UPDATE_SALARY_1\n"
          + "         (IN EMPLOYEE_NUMBER CHAR(10),\n"
          + "         IN RATE DECIMAL(6,2))\n"
          + "         LANGUAGE SQL\n"
          + "         MODIFIES SQL DATA\n"
          + "         DETERMINISTIC\n"
          + "         COMMIT ON RETURN YES\n"
          + "           UPDATE EMP\n"
          + "           SET SALARY = SALARY * RATE\n"
          + "           WHERE EMPNO = EMPLOYEE_NUMBER\n"
          + "       END-EXEC.";

  // CREATE ROLE
  private static final String CREATE_ROLE =
      TEXT + "        CREATE ROLE TELLER;\n" + "       END-EXEC.";

  // CREATE SEQUENCE
  private static final String CREATE_SEQUENCE =
      TEXT
          + "           CREATE SEQUENCE ORDER_SEQ\n"
          + "           START WITH 1\n"
          + "           INCREMENT BY 1\n"
          + "           NO MAXVALUE\n"
          + "           NO CYCLE\n"
          + "           CACHE 24;\n"
          + "       END-EXEC.";

  private static final String CREATE_SEQUENCE2 =
      TEXT
          + "        CREATE SEQUENCE ORDER_SEQ\n"
          + "              START WITH 1\n"
          + "              INCREMENT BY 1\n"
          + "              NO MAXVALUE\n"
          + "              NO CYCLE\n"
          + "              CACHE 20;\n"
          + "             INSERT INTO ORDERS (ORDERNO, CUSTNO)\n"
          + "               VALUES (NEXT VALUE FOR ORDER_SEQ, 123456);\n"
          + "       END-EXEC.";

  // CREATE STOGROUP
  private static final String CREATE_STOGROUP =
      TEXT
          + "        CREATE STOGROUP DSN8G120\n"
          + "             VOLUMES (ABC005,DEF008)\n"
          + "             VCAT DSNCAT;\n"
          + "       END-EXEC.";

  private static final String CREATE_STOGROUP2 =
      TEXT
          + "        CREATE STOGROUP DSNCG100\n"
          + "             VOLUMES (ABC001,DEF003) VCAT DSNCAT\n"
          + "             KEY LABEL STG01KLABEL;\n"
          + "       END-EXEC.";

  // CREATE TABLE
  private static final String CREATE_TABLE =
      TEXT
          + "        CREATE TABLE DSN8C10.DEPT\n"
          + "             (DEPTNO   CHAR(3)     NOT NULL,\n"
          + "              DEPTNAME VARCHAR(36) NOT NULL,\n"
          + "              MGRNO    CHAR(6)             ,\n"
          + "              ADMRDEPT CHAR(3)     NOT NULL,\n"
          + "              LOCATION CHAR(16)            ,\n"
          + "              PRIMARY KEY(DEPTNO)          )\n"
          + "             IN DSN8D12A.DSN8S12D;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE2 =
      TEXT
          + "        CREATE TABLE DSN8C10.PROJ\n"
          + "             (PROJNO   CHAR(6)      NOT NULL,\n"
          + "              PROJNAME VARCHAR(24)  NOT NULL,\n"
          + "              DEPTNO   CHAR(3)      NOT NULL,\n"
          + "              RESPEMP  CHAR(6)      NOT NULL,\n"
          + "              PRSTAFF  DECIMAL(5,2)         ,\n"
          + "              PRSTDATE DATE                 ,\n"
          + "              PRENDATE DATE                 ,\n"
          + "              MAJPROJ  CHAR(6)      NOT NULL)\n"
          + "             IN DATABASE DSN8D12A\n"
          + "             VALIDPROC DSN8EAPR;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE3 =
      TEXT
          + "        CREATE TABLE ACTIVITY\n"
          + "             (PROJNO   CHAR(6)      NOT NULL,\n"
          + "              ACTNO    SMALLINT     NOT NULL,\n"
          + "              ACTDEPT  CHAR(3)      NOT NULL,\n"
          + "              ACTOWNER CHAR(6)      NOT NULL,\n"
          + "              ACSTAFF  DECIMAL(5,2)         ,\n"
          + "              ACSTDATE DATE         NOT NULL,\n"
          + "              ACENDATE DATE                 ,\n"
          + "              FOREIGN KEY (ACTDEPT,ACTOWNER)\n"
          + "                 REFERENCES PROJECT (DEPTNO,RESPEMP) ON DELETE RESTRICT)\n"
          + "             IN DSN8D12A.DSN8S12D;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE4 =
      TEXT
          + "        CREATE TABLE DSN8C10.EMP_PHOTO_RESUME\n"
          + "             (EMPNO      CHAR(6)     NOT NULL,\n"
          + "              EMP_ROWID  ROWID NOT NULL GENERATED ALWAYS,\n"
          + "              EMP_PHOTO  BLOB(110K),\n"
          + "              RESUME     CLOB(5K),\n"
          + "              PRIMARY KEY (EMPNO))\n"
          + "             IN DSN8D12A.DSN8S12E\n"
          + "             CCSID EBCDIC;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE5 =
      TEXT
          + "        CREATE TABLE EMPLOYEE\n"
          + "             (EMPNO      INTEGER GENERATED ALWAYS AS IDENTITY,\n"
          + "              ID         SMALLINT,\n"
          + "              NAME       CHAR(30),\n"
          + "              SALARY     DECIMAL(5,2),\n"
          + "              DEPTNO     SMALLINT)\n"
          + "             IN DSN8D12A.DSN8S12D;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE6 =
      TEXT
          + "        CREATE TABLE STRANS AS\n"
          + "             (SELECT YEAR AS SYEAR, MONTH AS SMONTH,\n"
          + "              DAY AS SDAY, SUM(AMOUNT) AS SSUM\n"
          + "              FROM TRANS\n"
          + "              GROUP BY YEAR, MONTH, DAY)\n"
          + "              DATA INITIALLY DEFERRED REFRESH DEFERRED;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE7 =
      TEXT
          + "        CREATE TABLE TS01TB\n"
          + "               (C1 SMALLINT,\n"
          + "                C2 DECIMAL(9,2),\n"
          + "                C3 CHAR(4))\n"
          + "            APPEND YES\n"
          + "            IN TS01DB.TS01TS;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE8 =
      TEXT
          + "        CREATE TABLE TS02TB\n"
          + "               (C1 SMALLINT,\n"
          + "                C2 DECIMAL(9,2),\n"
          + "                C3 CHAR(4))\n"
          + "             PARTITION BY SIZE EVERY 4G\n"
          + "             IN DATABASE DSNDB04;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE9 =
      TEXT
          + "        CREATE TABLE EMP_INFO\n"
          + "               (EMPNO CHAR(6) NOT NULL,\n"
          + "                EMP_INFOCHANGE NOT NULL\n"
          + "                   GENERATED ALWAYS FOR EACH ROW ON UPDATE\n"
          + "                   AS ROW CHANGE TIMESTAMP,\n"
          + "                EMP_ADDRESS VARCHAR(300),\n"
          + "                EMP_PHONENO CHAR(4),\n"
          + "                PRIMARY KEY (EMPNO));\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLE10 =
      TEXT
          + "        CREATE TABLE TB01 (                     \n"
          + "           ACCT_NUM         INTEGER,            \n"
          + "           CUST_LAST_NM     CHAR(15),           \n"
          + "           LAST_ACTIVITY_DT VARCHAR(25),        \n"
          + "           COL2             CHAR(10),           \n"
          + "           COL3             CHAR(25),           \n"
          + "           COL4             CHAR(25),           \n"
          + "           COL5             CHAR(25),           \n"
          + "           COL6             CHAR(55),           \n"
          + "           STATE            CHAR(55))           \n"
          + "         IN DBB.TS01                            \n"
          + "                                                \n"
          + "          PARTITION BY (ACCT_NUM)               \n"
          + "           (PARTITION 1 ENDING AT (199),        \n"
          + "            PARTITION 2 ENDING AT (299),        \n"
          + "            PARTITION 3 ENDING AT (399),        \n"
          + "            PARTITION 4 ENDING AT (MAXVALUE));\n"
          + "       END-EXEC.";

  // CREATE TABLESPACE
  private static final String CREATE_TABLESPACE =
      TEXT
          + "        CREATE TABLESPACE DSN8S12D\n"
          + "             IN DSN8D12A\n"
          + "             USING STOGROUP DSN8G120\n"
          + "               PRIQTY 52\n"
          + "               SECQTY 20\n"
          + "               ERASE NO\n"
          + "             LOCKSIZE PAGE\n"
          + "             BUFFERPOOL BP1\n"
          + "             CLOSE YES;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLESPACE2 =
      TEXT
          + "        CREATE TABLESPACE SALESHX\n"
          + "             IN DSN8D12A\n"
          + "             USING STOGROUP DSN8G120\n"
          + "               PRIQTY 4000\n"
          + "               SECQTY 130\n"
          + "               ERASE NO\n"
          + "             NUMPARTS 82\n"
          + "             (PARTITION 80\n"
          + "               COMPRESS YES,\n"
          + "              PARTITION 81\n"
          + "               COMPRESS YES,\n"
          + "              PARTITION 82\n"
          + "               COMPRESS YES\n"
          + "               ERASE YES)\n"
          + "             LOCKSIZE PAGE\n"
          + "             BUFFERPOOL BP1\n"
          + "             CLOSE NO;\n"
          + "       END-EXEC.";

  private static final String CREATE_TABLESPACE3 =
      TEXT
          + "        CREATE TABLESPACE TS1\n"
          + "             IN DSN8D12A\n"
          + "             USING STOGROUP DSN8G120\n"
          + "             NUMPARTS 55\n"
          + "             SEGSIZE 16\n"
          + "             LOCKSIZE ANY; \n"
          + "       END-EXEC.";

  private static final String CREATE_TABLESPACE4 =
      TEXT
          + "        CREATE TABLESPACE TS2\n"
          + "             IN DSN8D12A\n"
          + "             USING STOGROUP DSN8G120\n"
          + "             NUMPARTS 7\n"
          + "             (\n"
          + "              PARTITION 1 COMPRESS YES,\n"
          + "              PARTITION 3 COMPRESS YES,\n"
          + "              PARTITION 5 COMPRESS YES,\n"
          + "              PARTITION 7 COMPRESS YES\n"
          + "             )\n"
          + "             SEGSIZE 64\n"
          + "             DEFINE NO; \n"
          + "       END-EXEC.";

  // CREATE TRIGGER ADVANCED
  private static final String CREATE_TRIGGER_ADV =
      TEXT
          + "        CREATE TRIGGER NEW_HIRE\n"
          + "              AFTER INSERT ON EMPLOYEE\n"
          + "              FOR EACH ROW\n"
          + "              BEGIN ATOMIC\n"
          + "                UPDATE COMPANY_STATS SET NBEMP = NBEMP + 1;\n"
          + "              END\n"
          + "       END-EXEC.";

  private static final String CREATE_TRIGGER_ADV2 =
      TEXT
          + "        CREATE TRIGGER REORDER\n"
          + "             AFTER UPDATE OF ON_HAND, MAX_STOCKED ON PARTS\n"
          + "             REFERENCING NEW AS NROW\n"
          + "             FOR EACH ROW\n"
          + "             WHEN (NROW.ON_HAND < 0.10 * NROW.MAX_STOCKED)\n"
          + "             BEGIN ATOMIC\n"
          + "               DECLARE QTY_ORDERED INTEGER;\n"
          + "        \n"
          + "               VALUES(ISSUE_SHIP_REQUEST(NROW.MAX_STOCKED \n"
          + "               - NROW.ON_HAND, NROW.PARTNO))\n"
          + "                 INTO QTY_ORDERED;\n"
          + "             END\n"
          + "       END-EXEC.";

  private static final String CREATE_TRIGGER_ADV3 =
      TEXT
          + "        CREATE TRIGGER REORDER\n"
          + "             AFTER UPDATE OF ON_HAND, MAX_STOCKED ON PARTS\n"
          + "             REFERENCING NEW_TABLE AS NTABLE\n"
          + "             FOR EACH STATEMENT\n"
          + "               BEGIN ATOMIC\n"
          + "                 DECLARE QTY_ORDERED INTEGER;\n"
          + "        \n"
          + "                 SELECT ISSUE_SHIP_REQUEST(MAX_STOCKED - \n"
          + "                    ON_HAND, PARTNO) \n"
          + "                   INTO QTY_ORDERED\n"
          + "                   FROM NTABLE\n"
          + "                 WHERE (ON_HAND < 0.10 * MAX_STOCKED);\n"
          + "             END\n"
          + "       END-EXEC.";

  private static final String CREATE_TRIGGER_ADV4 =
      TEXT
          + "       CREATE TRIGGER SAL_ADJ\n"
          + "            AFTER UPDATE OF SALARY ON EMPLOYEE\n"
          + "            REFERENCING OLD AS OLD_EMP\n"
          + "                        NEW AS NEW_EMP\n"
          + "            FOR EACH ROW\n"
          + "            WHEN (NEW_EMP.SALARY > (OLD_EMP.SALARY * 1.20))\n"
          + "              BEGIN ATOMIC\n"
          + "                SIGNAL SQLSTATE '75001' \n"
          + "                ('Invalid Salary Increase - Exceeds 20');\n"
          + "              END\n"
          + "       END-EXEC.";

  private static final String CREATE_TRIGGER_ADV5 =
      TEXT
          + "        CREATE TABLE WEATHER\n"
          + "              (CITY VARCHAR(25),\n"
          + "               TEMPF DECIMAL(5,2));\n"
          + "           CREATE VIEW CELSIUS_WEATHER (CITY, TEMPC) AS\n"
          + "              SELECT CITY, (TEMPF-32)/1.8 \n"
          + "              FROM WEATHER;\n"
          + "       END-EXEC.";

  // CREATE TRUSTED CONTEXT
  private static final String CREATE_TRUSTED_CONTEXT =
      TEXT
          + "        CREATE TRUSTED CONTEXT CTX1\n"
          + "               BASED UPON CONNECTION USING SYSTEM AUTHID ADMF001\n"
          + "               ATTRIBUTES (ADDRESS '9.30.131.203',\n"
          + "                           ENCRYPTION 'LOW')\n"
          + "               DEFAULT ROLE CTXROLE\n"
          + "               ENABLE\n"
          + "               WITH USE FOR SAM, JOE ROLE ROLE1 WITH AUTHENTICATION;\n"
          + "       END-EXEC.";

  private static final String CREATE_TRUSTED_CONTEXT2 =
      TEXT
          + "       CREATE TRUSTED CONTEXT CTX2\n"
          + "            BASED UPON CONNECTION USING SYSTEM AUTHID ADMF002\n"
          + "            ATTRIBUTES (JOBNAME 'WASPROD')\n"
          + "            DEFAULT ROLE CTXROLE WITH ROLE AS OBJECT OWNER \n"
          + "            AND QUALIFIER\n"
          + "            ENABLE\n"
          + "            WITH USE FOR SALLY;\n"
          + "       END-EXEC.";

  // CREATE TYPE array
  private static final String CREATE_TYPE_ARRAY =
      TEXT + "        CREATE TYPE PHONENUMBERS AS DECIMAL(10,0) ARRAY[50];\n" + "       END-EXEC.";

  private static final String CREATE_TYPE_ARRAY2 =
      TEXT + "        CREATE TYPE GENERIC.NUMBERS AS DECFLOAT(34) ARRAY[];\n" + "       END-EXEC.";

  private static final String CREATE_TYPE_ARRAY3 =
      TEXT
          + "        CREATE TYPE PERSONAL_PHONENUMBERS AS DECIMAL(16,0) \n"
          + "                 ARRAY[VARCHAR(8)];\n"
          + "       END-EXEC.";

  private static final String CREATE_TYPE_ARRAY4 =
      TEXT
          + "        CREATE TYPE CAPITALSARRAY AS VARCHAR(30) ARRAY[VARCHAR(20)];\n"
          + "       END-EXEC.";

  private static final String CREATE_TYPE_ARRAY5 =
      TEXT + "        CREATE TYPE PRODUCTS AS VARCHAR(40) ARRAY[INTEGER];\n" + "       END-EXEC.";

  // CREATE TYPE distinct
  private static final String CREATE_TYPE_DISTINCT =
      TEXT + "        CREATE TYPE SHOESIZE AS INTEGER;\n" + "       END-EXEC.";

  private static final String CREATE_TYPE_DISTINCT2 =
      TEXT + "        CREATE TYPE MILES AS DOUBLE;\n" + "       END-EXEC.";

  // CREATE VARIABLE
  private static final String CREATE_VARIABLE =
      TEXT
          + "        CREATE VARIABLE MYSCHEMA.MYJOB_PRINTER VARCHAR(30)\n"
          + "         DEFAULT 'Default printer';\n"
          + "       END-EXEC.";

  private static final String CREATE_VARIABLE2 =
      TEXT
          + "        CREATE VARIABLE SCHEMA1.GV_DEPTNO INTEGER\n"
          + "         DEFAULT 'Unassigned';\n"
          + "       END-EXEC.";

  // CREATE VIEW
  private static final String CREATE_VIEW =
      TEXT
          + "        CREATE VIEW DSN8C10.VPROJRE1\n"
          + "             (PROJNO,PROJNAME,PROJDEP,RESPEMP,\n"
          + "              FIRSTNME,MIDINIT,LASTNAME)\n"
          + "             AS SELECT ALL\n"
          + "             PROJNO,PROJNAME,DEPTNO,EMPNO,\n"
          + "             FIRSTNME,MIDINIT,LASTNAME\n"
          + "             FROM DSN8C10.PROJ, DSN8C10.EMP\n"
          + "             WHERE RESPEMP = EMPNO;\n"
          + "       END-EXEC.";

  private static final String CREATE_VIEW2 =
      TEXT
          + "        CREATE VIEW DSN8C10.FIRSTQTR (SNO, CHARGES, DATE) AS\n"
          + "          SELECT SNO, CHARGES, DATE\n"
          + "          FROM MONTH1\n"
          + "          WHERE DATE BETWEEN '01/01/2000' and '01/31/2000' \n"
          + "            UNION All\n"
          + "          SELECT SNO, CHARGES, DATE\n"
          + "          FROM MONTH2\n"
          + "          WHERE DATE BETWEEN '02/01/2000' and '02/29/2000' \n"
          + "            UNION All\n"
          + "          SELECT SNO, CHARGES, DATE\n"
          + "          FROM MONTH3\n"
          + "          WHERE DATE BETWEEN '03/01/2000' and '03/31/2000';  \n"
          + "       END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        CREATE_ALIAS,
        CREATE_AUX_TABLE,
        CREATE_DB,
        CREATE_DB2,
        CREATE_FUNCTION_COMPILED,
        CREATE_FUNCTION_EXT,
        CREATE_FUNCTION_EXT2,
        CREATE_FUNCTION_EXT3,
        CREATE_FUNCTION_EXT4,
        CREATE_FUNCTION_EXT_TABLE,
        CREATE_FUNCTION_EXT_TABLE2,
        CREATE_FUNCTION_INLINED,
        CREATE_FUNCTION_SOURCED,
        CREATE_FUNCTION_SOURCED2,
        CREATE_FUNCTION_SQL_TABLE,
        CREATE_FUNCTION_SQL_TABLE2,
        CREATE_GLOBAL_TMP_TABLE,
        CREATE_GLOBAL_TMP_TABLE2,
        CREATE_INDEX,
        CREATE_INDEX2,
        CREATE_INDEX3,
        CREATE_INDEX4,
        CREATE_LOB_TABLESPACE,
        CREATE_MASK,
        CREATE_MASK2,
        CREATE_MASK3,
        CREATE_MASK4,
        CREATE_MASK5,
        CREATE_PERMISSION,
        CREATE_PERMISSION2,
        CREATE_PROCEDURE_EXT,
        CREATE_PROCEDURE_EXT2,
        CREATE_PROCEDURE_EXT3,
        CREATE_PROCEDURE_SQL_NATIVE,
        CREATE_PROCEDURE_SQL_NATIVE2,
        CREATE_ROLE,
        CREATE_SEQUENCE,
        CREATE_SEQUENCE2,
        CREATE_STOGROUP,
        CREATE_STOGROUP2,
        CREATE_TABLE,
        CREATE_TABLE2,
        CREATE_TABLE3,
        CREATE_TABLE4,
        CREATE_TABLE5,
        CREATE_TABLE6,
        CREATE_TABLE7,
        CREATE_TABLE8,
        CREATE_TABLE9,
        CREATE_TABLE10,
        CREATE_TABLESPACE,
        CREATE_TABLESPACE2,
        CREATE_TABLESPACE3,
        CREATE_TABLESPACE4,
        CREATE_TRIGGER_ADV,
        CREATE_TRIGGER_ADV2,
        CREATE_TRIGGER_ADV3,
        CREATE_TRIGGER_ADV4,
        CREATE_TRIGGER_ADV5,
        CREATE_TRUSTED_CONTEXT,
        CREATE_TRUSTED_CONTEXT2,
        CREATE_TYPE_ARRAY,
        CREATE_TYPE_ARRAY2,
        CREATE_TYPE_ARRAY3,
        CREATE_TYPE_ARRAY4,
        CREATE_TYPE_ARRAY5,
        CREATE_TYPE_DISTINCT,
        CREATE_TYPE_DISTINCT2,
        CREATE_VARIABLE,
        CREATE_VARIABLE2,
        CREATE_VIEW,
        CREATE_VIEW2);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql create statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, List.of(), Map.of());
  }
}
