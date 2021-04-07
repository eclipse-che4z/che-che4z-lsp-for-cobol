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
 * This PARAMETERIZED test checks if all below sql SET statements works correctly.
 *
 * <pre>
 * - SET CONNECTION
 * - SET assignment statement
 * - SET CURRENT ACCELARATOR
 * - SET CURRENT APPLICATION COMPATIBILITY
 * - SET CURRENT ENCODING SCHEMA
 * - SET CURRENT DEBUG
 * - SET CURRENT DECFLOAT ROUNDING MODE
 * - SET CURRENT DEGREE
 * - SET CURRENT EXPLAIN MODE
 * - SET CURRENT GET_ACCEL_ARCHIVE
 * - SET CURRENT LOCALE LC_CTYPE
 * - SET CURRENT MAINTAINED TABLE TYPES FOR OPTIMIZATION
 * - SET CURRENT OPTIMIZATION HINT
 * - SET CURRENT PACKAGE PATH
 * - SET CURRENT PACKAGESET
 * - SET CURRENT PRECISION
 * - SET CURRENT QUERY ACCELERATION
 * - SET CURRENT QUERY ACCELERATION WAITFORDATA
 * - SET CURRENT REFRESH AGE
 * - SET CURRENT ROUTINE VERSION
 * - SET CURRENT RULES
 * - SET CURRENT SQLID
 * - SET CURRENT TEMPORAL BUSINESS_TIME
 * - SET CURRENT TEMPORAL SYSTEM_TIME
 * - SET ENCRYPTION PASSWORD
 * - SET PATH
 * - SET SCHEMA
 * - SET SESSION TIME ZONE
 * </pre>
 */
class TestSqlAllSetStatements {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. HELLO-SQL.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC SQL\n";

  private static final String SET_CONNECTION =
      TEXT + "            SET CONNECTION TOROLAB1;\n" + "           END-EXEC.";

  private static final String SET_ASSIGNMENT_STATE =
      TEXT + "            SET :HVL = CURRENT PATH;\n" + "           END-EXEC.";

  private static final String SET_ASSIGNMENT_STATE2 =
      TEXT
          + "            SET :SERVER = CURRENT PATH,\n"
          + "           :XTIME = CURRENT TIME,\n"
          + "           :MEM = CURRENT MEMBER;\n"
          + "           END-EXEC.";

  private static final String SET_ASSIGNMENT_STATE3 =
      TEXT + "            SET :DETAILS = SUBSTR(:LOCATOR,1,35);\n" + "           END-EXEC.";

  private static final String SET_ASSIGNMENT_STATE4 =
      TEXT
          + "            SELECT SUBSTR(:LOCATOR,1,35)\n"
          + "             INTO :DETAILS\n"
          + "             FROM SYSIBM.SYSDUMMYU;\n"
          + "           END-EXEC.";

  private static final String SET_ASSIGNMENT_STATE5 =
      TEXT + "            SET (SALARY, COMMISSION) = (50000, 8000);\n" + "           END-EXEC.";

  private static final String SET_CURRENT_ACCELARATOR =
      TEXT + "            SET CURRENT ACCELERATOR = ACCEL1;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_APPLICATION_COMPATIBILITY =
      TEXT
          + "             SET CURRENT APPLICATION COMPATIBILITY = 'V11R1';\n"
          + "             SET CURRENT APPLICATION COMPATIBILITY = :HV1;\n"
          + "           END-EXEC.";

  private static final String SET_CURRENT_ENCODING_SCHEMA =
      TEXT
          + "             SET CURRENT APPLICATION ENCODING SCHEME = 'EBCDIC';\n"
          + "             SET CURRENT ENCODING SCHEME  = :HV1;\n"
          + "           END-EXEC.";

  private static final String SET_CURRENT_DEBUG_MODE =
      TEXT + "             SET CURRENT DEBUG MODE = ALLOW;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_DECFLOAT_ROUNDING_MODE =
      TEXT + "             SET CURRENT DECFLOAT ROUNDING MODE = ROUND_CEILING;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_DEGREE =
      TEXT + "             SET CURRENT DEGREE = '1';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_DEGREE2 =
      TEXT + "             SET CURRENT DEGREE = 'ANY';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_EXPLAIN_MODE =
      TEXT + "             SET CURRENT EXPLAIN MODE = YES;\n" + "           END-EXEC.";
  private static final String SET_CURRENT_GET_ACCEL_ARCHIVE =
      TEXT + "             SET CURRENT GET_ACCEL_ARCHIVE=NO;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_LOCALE_LC_CTYPE =
      TEXT + "             SET CURRENT LOCALE LC_CTYPE = 'En_US';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_LOCALE_LC_CTYPE2 =
      TEXT + "             SET CURRENT LOCALE LC_CTYPE = :HV1;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_MAINTAINED_TABLE =
      TEXT + "             SET CURRENT MAINTAINED TABLE TYPES ALL;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_MAINTAINED_TABLE2 =
      TEXT
          + "             VALUES (CURRENT MAINTAINED TABLE TYPES) INTO :CURMAINTYPES;\n"
          + "           END-EXEC.";
  private static final String SET_CURRENT_MAINTAINED_TABLE3 =
      TEXT + "             SET CURRENT MAINTAINED TABLE TYPES NONE;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_OPTIMIZATION_HINT =
      TEXT + "             SET CURRENT OPTIMIZATION HINT = 'NOHYB';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_OPTIMIZATION_HINT2 =
      TEXT + "             SET CURRENT OPTIMIZATION HINT = '';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_PACKAGE_PATH =
      TEXT + "             SET CURRENT PACKAGE PATH :hvar1;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_PACKAGE_PATH2 =
      TEXT
          + "             SET CURRENT PACKAGE PATH = \n"
          + "             \"COLL1\",\"COLL#2\",\"COLL3\", :hvar1;\n"
          + "           END-EXEC.";

  private static final String SET_CURRENT_PACKAGE_PATH3 =
      TEXT + "             SET CURRENT PACKAGE PATH = ' ';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_PACKAGESET =
      TEXT + "             SET CURRENT PACKAGESET = 'PERSONNEL';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_PACKAGESET2 =
      TEXT + "             SET CURRENT PACKAGESET = '';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_PRECISION =
      TEXT + "             SET CURRENT PRECISION = 'DEC15';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_QUERY_ACCELERATION =
      TEXT + "             SET CURRENT QUERY ACCELERATION NONE;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_QUERY_ACCELERATION_WAITFORDATA =
      TEXT + "             SET CURRENT QUERY ACCELERATION WAITFORDATA = 180.0;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_QUERY_ACCELERATION_WAITFORDATA2 =
      TEXT + "             SET CURRENT QUERY ACCELERATION WAITFORDATA = 2.5;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_REFRESH_AGE =
      TEXT + "             SET CURRENT REFRESH AGE ANY;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_ROUTINE_VERSION =
      TEXT + "             SET CURRENT ROUTINE VERSION = :rvid;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_RULES =
      TEXT + "             SET CURRENT RULES = 'DB2';\n" + "           END-EXEC.";

  private static final String SET_CURRENT_SQLID =
      TEXT + "             SET CURRENT SQLID = SESSION_USER;\n" + "           END-EXEC.";

  private static final String SET_CURRENT_TEMPORAL_BUSINESS_TIME =
      TEXT
          + "             SET CURRENT TEMPORAL BUSINESS_TIME = \n"
          + "                    TIMESTAMP('2008-01-01') + 5 DAYS ;\n"
          + "             SET CURRENT TEMPORAL BUSINESS_TIME = \n"
          + "                   '2008-01-06-00.00.00.000000000000';\n"
          + "           END-EXEC.";

  private static final String SET_CURRENT_TEMPORAL_SYSTEM_TIME2 =
      TEXT
          + "             SET CURRENT TEMPORAL BUSINESS_TIME = \n"
          + "                         CURRENT TIMESTAMP - 1 MONTH\n"
          + "             UPDATE att1 SET c1 = 5 WHERE pk = 100\n"
          + "           END-EXEC.";

  private static final String SET_CURRENT_TEMPORAL_SYSTEM_TIME3 =
      TEXT + "             SET CURRENT TEMPORAL BUSINESS_TIME = NULL\n" + "           END-EXEC.";

  private static final String SET_ENCRYPTION_PASSWORD =
      TEXT + "             SET ENCRYPTION PASSWORD = :hv1\n" + "           END-EXEC.";

  private static final String SET_ENCRYPTION_PASSWORD2 =
      TEXT + "             SET ENCRYPTION PASSWORD = :hv1 WITH HINT :hv2\n" + "           END-EXEC.";

  private static final String SET_PATH =
      TEXT + "             SET PATH = SCHEMA1,\"SCHEMA#2\", SYSIBM;\n" + "           END-EXEC.";

  private static final String SET_PATH2 =
      TEXT + "             SET PATH = CURRENT PATH, SMITH, SYSPROC;\n" + "           END-EXEC.";

  private static final String SET_SCHEMA =
      TEXT + "             SET SCHEMA RICK;\n" + "           END-EXEC.";

  private static final String SET_SCHEMA2 =
      TEXT
          + "             SELECT CURRENT SCHEMA INTO :CURSCHEMA\n"
          + "              FROM SYSIBM.SYSDUMMY1;\n"
          + "           END-EXEC.";
  private static final String SET_SCHEMA3 =
      TEXT
          + "             SET CURRENT SQLID = 'USRT001';\n"
          + "             SET CURRENT SCHEMA = 'USRT002';\n"
          + "           END-EXEC.";

  private static final String SET_SCHEMA4 =
      TEXT + "             SET CURRENT SCHEMA = 'JOHN';\n" + "           END-EXEC.";

  private static final String SET_SESSION_TIME_ZONE =
      TEXT + "             SET SESSION TIME ZONE = '-8:00';\n" + "           END-EXEC.";

  private static Stream<String> textsToTest() {
    return Stream.of(
        SET_CONNECTION,
        SET_ASSIGNMENT_STATE,
        SET_ASSIGNMENT_STATE2,
        SET_ASSIGNMENT_STATE3,
        SET_ASSIGNMENT_STATE4,
        SET_ASSIGNMENT_STATE5,
        SET_CURRENT_ACCELARATOR,
        SET_CURRENT_APPLICATION_COMPATIBILITY,
        SET_CURRENT_ENCODING_SCHEMA,
        SET_CURRENT_DEBUG_MODE,
        SET_CURRENT_DECFLOAT_ROUNDING_MODE,
        SET_CURRENT_DEGREE,
        SET_CURRENT_DEGREE2,
        SET_CURRENT_EXPLAIN_MODE,
        SET_CURRENT_GET_ACCEL_ARCHIVE,
        SET_CURRENT_LOCALE_LC_CTYPE,
        SET_CURRENT_LOCALE_LC_CTYPE2,
        SET_CURRENT_MAINTAINED_TABLE,
        SET_CURRENT_MAINTAINED_TABLE2,
        SET_CURRENT_MAINTAINED_TABLE3,
        SET_CURRENT_OPTIMIZATION_HINT,
        SET_CURRENT_OPTIMIZATION_HINT2,
        SET_CURRENT_PACKAGE_PATH,
        SET_CURRENT_PACKAGE_PATH2,
        SET_CURRENT_PACKAGE_PATH3,
        SET_CURRENT_PACKAGESET,
        SET_CURRENT_PACKAGESET2,
        SET_CURRENT_PRECISION,
        SET_CURRENT_QUERY_ACCELERATION,
        SET_CURRENT_QUERY_ACCELERATION_WAITFORDATA,
        SET_CURRENT_QUERY_ACCELERATION_WAITFORDATA2,
        SET_CURRENT_REFRESH_AGE,
        SET_CURRENT_ROUTINE_VERSION,
        SET_CURRENT_RULES,
        SET_CURRENT_SQLID,
        SET_CURRENT_TEMPORAL_BUSINESS_TIME,
        SET_CURRENT_TEMPORAL_SYSTEM_TIME2,
        SET_CURRENT_TEMPORAL_SYSTEM_TIME3,
        SET_ENCRYPTION_PASSWORD,
        SET_ENCRYPTION_PASSWORD2,
        SET_PATH,
        SET_PATH2,
        SET_SCHEMA,
        SET_SCHEMA2,
        SET_SCHEMA3,
        SET_SCHEMA4,
        SET_SESSION_TIME_ZONE);
  }

  @ParameterizedTest
  @MethodSource("textsToTest")
  @DisplayName("Parameterized - sql all set statements tests")
  void test(String text) {
    UseCaseEngine.runTest(text, ImmutableList.of(), ImmutableMap.of());
  }
}
