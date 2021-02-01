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
package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.stream.Stream;

/**
 * This PARAMETERIZED test checks if all below sql ALTER statements works correctly.
 *
 * <pre>
 * - ALTER DATABASE
 * - ALTER FUNCTION
 * - ALTER FUNCTION (compiled SQL scalar)
 * - ALTER FUNCTION (inlined SQL scalar)
 * - ALTER FUNCTION (SQL table)
 * - ALTER INDEX
 * - ALTER MASK
 * - ALTER PERMISSION
 * - ALTER PROCEDURE (external)
 * - ALTER PROCEDURE (sql native)
 * - ALTER SEQUENCE
 * - ALTER STOGROUP
 * - ALTER TABLE
 * - ALTER TABLESPACE
 * - ALTER TRIGGER (advanced)
 * - ALTER TRIGGER (basic)
 * - ALTER TRUSTED CONTEXT
 * - ALTER VIEW
 * </pre>
 */
class TestSqlAllAlterStatements {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n";

  // ALTER: DATABASE
  private static final String ALTER_DB =
      TEXT
          + "       EXEC SQL ALTER DATABASE ABCDE BUFFERPOOL BP2\n"
          + "       INDEXBP BP2 END-EXEC.";
  // ALTER FUNCTION statement
  private static final String ALTER_FUNCTION_EXT =
      TEXT
          + "       EXEC SQL ALTER SPECIFIC FUNCTION ENGLES.FOCUS1 \n"
          + "       WLM ENVIRONMENT WLMENVNAME2 END-EXEC.";
  private static final String ALTER_FUNCTION_EXT2 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION ENGLES.CENTER (CHAR(25), DEC(5,2),\n"
          + "        INTEGER) RETURNS NULL ON NULL INPUT END-EXEC.";
  // ALTER FUNCTION (compiled SQL scalar)
  private static final String ALTER_FUNCTION_COMPILED =
      TEXT + "       EXEC SQL ALTER FUNCTION MY_UDF1 DETERMINISTIC \n" + "       END-EXEC.";
  private static final String ALTER_FUNCTION_COMPILED2 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION REVERSE\n"
          + "       ALTER ACTIVE VERSION\n"
          + "       NOT DETERMINISTIC\n"
          + "       ALLOW DEBUG MODE END-EXEC.";
  // FYI: reverse is name of function

  private static final String ALTER_FUNCTION_COMPILED3 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION REVERSE(INSTR VARCHAR(4000))\n"
          + "       REPLACE VERSION V2 (INSTR VARCHAR(4000))\n"
          + "       RETURNS VARCHAR(4000)\n"
          + "       DETERMINISTIC\n"
          + "       NO EXTERNAL ACTION\n"
          + "       CONTAINS SQL\n"
          + "       \tBEGIN\n"
          + "       \tDECLARE REVSTR, RESTSTR VARCHAR(4000) DEFAULT '';\n"
          + "       \tDECLARE LEN INT;\n"
          + "       \tIF INSTR IS NULL THEN\n"
          + "       \t\tRETURN NULL;\n"
          + "       \tEND IF;\n"
          + "       \tSET RESTSTR = INSTR;\n"
          + "       \tSET LEN = LENGTH(INSTR);\n"
          + "       \tWHILE LEN > 0 DO\n"
          + "       \t\tSET (REVSTR, RESTSTR, LEN) = (SUBSTR(RESTSTR, 1, 1) CONCAT\n"
          + "       \t\t\t\tREVSTR, SUBSTR(RESTSTR, 2, LEN - 1), LEN - 1);\n"
          + "       \tEND WHILE;\n"
          + "       \tRETURN REVSTR;\n"
          + "        END END-EXEC.";

  private static final String ALTER_FUNCTION_COMPILED4 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION REVERSE(INSTR VARCHAR(4000))\n"
          + "       ADD VERSION V3 (INSTR VARCHAR(4000))\n"
          + "       RETURNS VARCHAR(4000)\n"
          + "       DETERMINISTIC\n"
          + "       NO EXTERNAL ACTION\n"
          + "       CONTAINS SQL\n"
          + "       BEGIN\n"
          + "       DECLARE REVSTR, RESTSTR VARCHAR(4000) DEFAULT '';\n"
          + "       IF INSTR IS NULL THEN\n"
          + "        RETURN NULL;\n"
          + "       END IF;\n"
          + "       SET (RESRSTR, LEN) = (INSTR, LENGTH(INSTR));\n"
          + "       WHILE LEN > 0 DO\n"
          + "        SET (REVSTR, RESTSTR, LEN) = (SUBSTR(RESTSTR, 1, 1) \n"
          + "       CONCAT REVSTR, SUBSTR(RESTSTR, 2, LEN - 1), LEN - 1);\n"
          + "        END WHILE;\n"
          + "       RETURN REVSTR;\n"
          + "       END END-EXEC.";

  private static final String ALTER_FUNCTION_COMPILED5 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION REVERSE(INSTR VARCHAR(4000))\n"
          + "       ACTIVATE VERSION V3;\n"
          + "       END-EXEC.";

  private static final String ALTER_FUNCTION_COMPILED6 =
      TEXT
          + "       EXEC SQL ALTER FUNCTION REVERSE(INSTR VARCHAR(4000))\n"
          + "       REGENERATE ACTIVE VERSION;\n"
          + "       END-EXEC.";

  // ALTER FUNCTION (inlined SQL scalar)
  private static final String ALTER_FUNCTION_INLINED =
      TEXT
          + "       EXEC SQL ALTER FUNCTION MY_UDF1\n"
          + "       DETERMINISTIC;\n"
          + "       END-EXEC.";

  private static final String ALTER_FUNCTION_SQL_TABLE =
      TEXT
          + "       EXEC SQL ALTER FUNCTION GET_TABLE\n"
          + "       RESTRICT CARDINALITY 10000;\n"
          + "       END-EXEC.";

  // ALTER INDEX
  private static final String ALTER_INDEX =
      TEXT
          + "       EXEC SQL ALTER INDEX DSN8C10.XEMP1\n"
          + "       CLOSE NO;\n"
          + "       END-EXEC.";

  private static final String ALTER_INDEX2 =
      TEXT
          + "       EXEC SQL ALTER INDEX DSN8C10.XPROJ1\n"
          + "       BUFFERPOOL BP1\n"
          + "       COPY YES\n"
          + "       PIECESIZE 8M;\n"
          + "       END-EXEC.";

  private static final String ALTER_INDEX3 =
      TEXT + "       EXEC SQL ALTER INDEX X1\n" + "       NOT PADDED;\n" + "       END-EXEC.";

  private static final String ALTER_INDEX4 =
      TEXT
          + "       EXEC SQL ALTER INDEX DSN8C10.XDEPT1\n"
          + "       BUFFERPOOL BP1\n"
          + "       CLOSE YES\n"
          + "       COPY YES\n"
          + "       USING VCAT CATLGG\n"
          + "       FREEPAGE 6\n"
          + "       PCTFREE 11\n"
          + "       GBPCACHE ALL\n"
          + "       ALTER PARTITION 3\n"
          + "       USING VCAT CATLGG\n"
          + "       FREEPAGE 13\n"
          + "       PCTFREE 13,\n"
          + "       ALTER PARTITION 4\n"
          + "       USING VCAT CATLGG\n"
          + "       GBPCACHE CHANGED,\n"
          + "       ALTER PARTITION 5\n"
          + "       USING VCAT CATLGG\n"
          + "       FREEPAGE 25\n"
          + "       PCTFREE 25;\n"
          + "       END-EXEC.";

  // ALTER MASK
  private static final String ALTER_MASK =
      TEXT + "       EXEC SQL ALTER MASK M1 ENABLE\n" + "       END-EXEC.";

  private static final String ALTER_MASK2 =
      TEXT
          + "       EXEC SQL ALTER MASK M1 REGENERATE;\n"
          + "       COMMIT;\n"
          + "       END-EXEC.";

  // ALTER PERMISSION
  private static final String ALTER_PERMISSION =
      TEXT + "       EXEC SQL ALTER PERMISSION P1 ENABLE;\n" + "       END-EXEC.";

  private static final String ALTER_PERMISSION2 =
      TEXT + "       EXEC SQL ALTER PERMISSION P1 REGENERATE;\n" + "       END-EXEC.";

  // ALTER PROCEDURE external
  private static final String ALTER_PROCEDURE_EXT =
      TEXT
          + "       EXEC SQL ALTER PROCEDURE SYSPROC.MYPROC WLM ENVIRONMENT PARTSEC\n"
          + "       END-EXEC.";

  // ALTER PROCEDURE SQL external
  private static final String ALTER_PROCEDURE_SQL_NATIVE =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER PROCEDURE UPDATE_SALARY_1\n"
          + "       ALTER ACTIVE VERSION\n"
          + "       NOT DETERMINISTIC\n"
          + "       CALLED ON NULL INPUT\n"
          + "       ALLOW DEBUG MODE\n"
          + "       ASUTIME LIMIT 10\n"
          + "       END-EXEC.";

  private static final String ALTER_PROCEDURE_SQL_NATIVE2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER PROCEDURE UPDATE_SALARY_1\n"
          + "       REPLACE VERSION V2 (P1 INTEGER, P2 CHAR(5))\n"
          + "       MODIFIES SQL DATA\n"
          + "       UPDATE EMP SET SALARY = SALARY * RATE\n"
          + "        WHERE EMPNO = EMPLOYEE_NUMBER;\n"
          + "       END-EXEC.";

  private static final String ALTER_PROCEDURE_SQL_NATIVE3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER PROCEDURE UPDATE_SALARY_1\n"
          + "       ADD VERSION V3 (P1 INTEGER, P2 CHAR(5))\n"
          + "          UPDATE EMP SET SALARY = SALARY * (RATE*10)\n"
          + "          WHERE EMPNO = EMPLOYEE_NUMBER;\n"
          + "       END-EXEC.";

  private static final String ALTER_PROCEDURE_SQL_NATIVE4 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER PROCEDURE UPDATE_SALARY_1\n"
          + "       ACTIVATE VERSION V3;\n"
          + "       END-EXEC.";
      // ALTER PROCEDURE UPDATE_SALARY_1
      //      ACTIVATE VERSION V3;

  private static final String ALTER_PROCEDURE_SQL_NATIVE5 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER PROCEDURE UPDATE_SALARY_1\n"
          + "       REGENERATE ACTIVE VERSION;\n"
          + "       END-EXEC.";

  // ALTER SEQUENCE
  private static final String ALTER_SEQUENCE =
      TEXT + "       EXEC SQL\n" + "       ALTER SEQUENCE org_seq RESTART;\n" + "       END-EXEC.";

  // ALTER STOGROUP
  private static final String ALTER_STOGROUP =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER STOGROUP DSN8G120\n"
          + "       ADD VOLUMES (DSNV04, DSNV05);\n"
          + "       END-EXEC.";

  private static final String ALTER_STOGROUP2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER STOGROUP DSN8G120\n"
          + "       REMOVE VOLUMES (DSNV04,DSNV05);\n"
          + "       END-EXEC.";

  private static final String ALTER_STOGROUP3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER STOGROUP DSN8G120\n"
          + "       NO KEY LABEL;\n"
          + "       END-EXEC.";

  // ALTER TABLE
  private static final String ALTER_TABLE =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         ALTER COLUMN DEPTNAME SET DATA TYPE VARCHAR(50)\n"
          + "         ADD BLDG CHAR(3) FOR SBCS DATA;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         VALIDPROC DSN8EAEM;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         VALIDPROC NULL;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE4 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         FOREIGN KEY(ADMRDEPT) REFERENCES DSN8C10.DEPT ON DELETE CASCADE;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE5 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         ADD CHECK (SALARY >= 10000);\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE6 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE PRODINFO\n"
          + "         FOREIGN KEY (PRODNAME,PRODVERNO)\n"
          + "         REFERENCES PRODVER_1 (VERNAME,RELNO) ON DELETE RESTRICT;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE7 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.DEPT\n"
          + "         ADD CONSTRAINT KEY_DEPTNAME UNIQUE( DEPTNAME );\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE8 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE TRANSCOUNT ADD MATERIALIZED QUERY\n"
          + "       (SELECT ACCTID, LOCID, YEAR, COUNT(*) as cnt\n"
          + "       FROM TRANS\n"
          + "       GROUP BY ACCTID, LOCID, YEAR )\n"
          + "       DATA INITIALLY DEFERRED\n"
          + "       REFRESH DEFERRED\n"
          + "       MAINTAINED BY USER;\n"
          + "       END-EXEC.\n";

  private static final String ALTER_TABLE9 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE TB1\n"
          + "         ALTER COLUMN COL1\n"
          + "         SET DATA TYPE BINARY(6);\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLE10 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLE DSN8C10.EMP\n"
          + "         KEY LABEL SECUREKEY01;\n"
          + "       END-EXEC.";

  // ALTER TABLESPACE
  private static final String ALTER_TABLESPACE =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLESPACE DSN8D12A.DSN8S12D\n"
          + "         BUFFERPOOL BP2\n"
          + "         LOCKSIZE PAGE;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLESPACE2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLESPACE DSN8D12A.DSN8S12E\n"
          + "         CLOSE NO\n"
          + "         SECQTY -1\n"
          + "         ALTER PARTITION 1 PCTFREE 20;\n"
          + "       END-EXEC.";

  private static final String ALTER_TABLESPACE3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TABLESPACE TS01DB.TS01TS\n"
          + "         MAXPARTITIONS 30;\n"
          + "       END-EXEC.";

  // ALTER TRIGGER ADVANCED
  private static final String ALTER_TRIGGER_ADV =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRIGGER TRIGGER1\n"
          + "         SECURED;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRIGGER_ADV2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRIGGER TRIGGER1\n"
          + "        ALTER ALLOW DEBUG MODE;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRIGGER_ADV3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRIGGER TRIGGER1\n"
          + "        ACTIVATE VERSION V3;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRIGGER_ADV4 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRIGGER TRIGGER1\n"
          + "        REGENERATE ACTIVE VERSION;\n"
          + "       END-EXEC.";

  // ALTER TRUSTED CONTEXT
  private static final String ALTER_TRUSTED_CONTEXT =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRUSTED CONTEXT CTX1\n"
          + "        ALTER DEFAULT ROLE CTXROLE2;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRUSTED_CONTEXT2 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRUSTED CONTEXT CTX3\n"
          + "        DISABLE\n"
          + "        ADD USE FOR BILL;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRUSTED_CONTEXT3 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRUSTED CONTEXT CTX4\n"
          + "        REPLACE USE FOR JOE WITHOUT AUTHENTICATION\n"
          + "        ADD USE FOR PUBLIC WITH AUTHENTICATION,\n"
          + "        TOM ROLE SPLROLE;\n"
          + "       END-EXEC.";

  private static final String ALTER_TRUSTED_CONTEXT4 =
      TEXT
          + "       EXEC SQL\n"
          + "       ALTER TRUSTED CONTEXT REMOTECTX\n"
          + "        ALTER ATTRIBUTES (ADDRESS '9.12.155.200',\n"
          + "        ENCRYPTION 'LOW');\n"
          + "       END-EXEC.";

  // ALTER VIEW
  private static final String ALTER_VIEW =
      TEXT + "       EXEC SQL\n" + "        ALTER VIEW MYVIEW REGENERATE;;\n" + "       END-EXEC.";

  private static final String ALTER_VIEW2 =
      TEXT
          + "       EXEC SQL\n"
          + "        ALTER TRUSTED CONTEXT REMOTECTX\n"
          + "        ALTER ATTRIBUTES (ADDRESS '9.12.155.200',\n"
          + "        ENCRYPTION 'LOW');\n"
          + "       END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        ALTER_DB,
        ALTER_FUNCTION_EXT,
        ALTER_FUNCTION_EXT2,
        ALTER_FUNCTION_COMPILED,
        ALTER_FUNCTION_COMPILED2,
        ALTER_FUNCTION_COMPILED3,
        ALTER_FUNCTION_COMPILED4,
        ALTER_FUNCTION_COMPILED5,
        ALTER_FUNCTION_COMPILED6,
        ALTER_FUNCTION_INLINED,
        ALTER_FUNCTION_SQL_TABLE,
        ALTER_INDEX,
        ALTER_INDEX2,
        ALTER_INDEX3,
        ALTER_INDEX4,
        ALTER_MASK,
        ALTER_MASK2,
        ALTER_PERMISSION,
        ALTER_PERMISSION2,
        ALTER_PROCEDURE_EXT,
        ALTER_PROCEDURE_SQL_NATIVE,
        ALTER_PROCEDURE_SQL_NATIVE2,
        ALTER_PROCEDURE_SQL_NATIVE3,
        ALTER_PROCEDURE_SQL_NATIVE4,
        ALTER_PROCEDURE_SQL_NATIVE5,
        ALTER_SEQUENCE,
        ALTER_STOGROUP,
        ALTER_STOGROUP2,
        ALTER_STOGROUP3,
        ALTER_TABLE,
        ALTER_TABLE2,
        ALTER_TABLE3,
        ALTER_TABLE4,
        ALTER_TABLE5,
        ALTER_TABLE6,
        ALTER_TABLE7,
        ALTER_TABLE8,
        ALTER_TABLE9,
        ALTER_TABLE10,
        ALTER_TABLESPACE,
        ALTER_TABLESPACE2,
        ALTER_TABLESPACE3,
        ALTER_TRIGGER_ADV,
        ALTER_TRIGGER_ADV2,
        ALTER_TRIGGER_ADV3,
        ALTER_TRIGGER_ADV4,
        ALTER_TRUSTED_CONTEXT,
        ALTER_TRUSTED_CONTEXT2,
        ALTER_TRUSTED_CONTEXT3,
        ALTER_TRUSTED_CONTEXT4,
        ALTER_VIEW,
        ALTER_VIEW2);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql alter statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
