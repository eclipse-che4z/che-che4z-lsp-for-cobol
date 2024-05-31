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
package org.eclipse.lsp.cobol.dialects.idms.usecases;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.dialects.idms.utils.DialectConfigs;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * These test for COPY IDMS statements in FILE SECTION, WS/LINKAGE SECTIONS AND PROCEDURE DIVISION
 */
class TestIdmsCopy {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*EMPLOYEE} PIC X(10).\n";

  private static final String TEXT_IDMS_COPY_FILE =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "       INPUT-OUTPUT SECTION.\n"
          + "       FILE-CONTROL.\n"
          + "             SELECT {$EMP-FILE} ASSIGN TO DUMMY\n"
          + "             ORGANIZATION IS LINE SEQUENTIAL\n"
          + "             ACCESS MODE IS SEQUENTIAL.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        01 {$*EMPLOYEE} PIC X(10).\n";

  private static final String COPY_IDMS_FILE =
      "        FILE SECTION.\n" + "            COPY IDMS FILE {~FL002!IDMS} VERSION 1.\n";

  private static final String COPY_IDMS_WS1 =
      "       WORKING-STORAGE SECTION.\n"
          + "             01 COPY IDMS {~EMPLOYEE!IDMS} VERSION 03.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 'MYNAME' TO {$EMPNAME}.";

  private static final String COPY_IDMS_WS2 =
      "        WORKING-STORAGE SECTION.\n"
          + "             COPY IDMS {~SUBSCHEMA-RECORDS!IDMS}\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 'JAVA' TO {$SKILL-NAME-0455}.";

  private static final String COPY_IDMS_WS3 =
      "        WORKING-STORAGE SECTION.\n"
          + "             COPY IDMS MAP {~ABCMAP!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 'ABC' TO {$MRB-ABCMAP-ID}.\n";

  private static final String COPY_IDMS_WS4 =
      "        WORKING-STORAGE SECTION.\n"
          + "             COPY IDMS {~MAPS!IDMS}. \n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 'ABC' TO {$MRB-ABCMAP-ID}.\n";

  private static final String COPY_IDMS_WS5 =
      "        WORKING-STORAGE SECTION.\n"
          + "             COPY IDMS MAP-CONTROL {~ABCMAP!IDMS}.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MOVE 'ABC' TO {$MRB-ABCMAP-ID}.\n";

  private static final String COPY_IDMS_SUBSCHEMA_NAMES =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        ENVIRONMENT DIVISION.\n"
          + "        IDMS-CONTROL SECTION.\n"
          + "            PROTOCOL. MODE ABC.\n"
          + "            IDMS-RECORDS MANUAL\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "             01 COPY IDMS {~SUBSCHEMA-NAMES!IDMS}.\n";

  private static final String COPY_IDMS_LEVELS =
      "       WORKING-STORAGE SECTION.\n"
          + "         01 COPY IDMS {~EMPLOYEE!IDMS} VERSION 03.\n";

  private static final String CB_NAME1 = "EMPLOYEE";
  private static final String CB1 = "          01 {$*EMPNAME}    PIC X(8).\n";

  private static final String CB_NAME2 = "SUBSCHEMA-RECORDS";
  private static final String CB2 =
      "       01  {$*SKILL}.\n"
          + "         02  {$*SKILL-ID-0455}           PIC 9(4).\n"
          + "         02  {$*SKILL-NAME-0455}         PIC X(12).\n"
          + "         02  {$*SKILL-DESCRIPTION-0455}  PIC X(60).\n";

  private static final String CB_NAME3 = "ABCMAP";
  private static final String CB_NAME3A = "MAPS";
  private static final String CB3 =
      "       01  {$*MRB-ABCMAP}.\n" + "            03  {$*MRB-ABCMAP-ID}          PIC X(8).\n";

  private static final String CB_NAME5 = "FL002";
  private static final String CB5 = "       FD {$*EMP-FILE}\n" + "       RECORD CONTAINS 80.\n";
  private static final String CB6 =
      "       05  {$*SKILL}.\n"
          + "         10  {$*SKILL-ID-0455}           PIC 9(4).\n";

  private static final String COMMENTED_TEXT = "      * Commented text \n";
  private static final String CB7 =
      "     1 01  {$*EMPLOYEE}.                                                       560  \n"
          + "     2     03 {$*EMPNAME}                  PIC S9(4)   VALUE ZERO  COMP.         1  \n";

  @Test
  void testIdmsCopyWS1() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS1, ImmutableList.of(new CobolText(CB_NAME1, IdmsDialect.NAME, CB1)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyWS2() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS2, ImmutableList.of(new CobolText(CB_NAME2, IdmsDialect.NAME, CB2)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyWS3() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS3, ImmutableList.of(new CobolText(CB_NAME3, IdmsDialect.NAME, CB3)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyWS4() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS4, ImmutableList.of(new CobolText(CB_NAME3A, IdmsDialect.NAME, CB3)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyWS5() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS5, ImmutableList.of(new CobolText(CB_NAME3, IdmsDialect.NAME, CB3)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyFile() {
    UseCaseEngine.runTest(
            TEXT_IDMS_COPY_FILE + COPY_IDMS_FILE, ImmutableList.of(new CobolText(CB_NAME5, IdmsDialect.NAME, CB5)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopySubschemaNames() {
    UseCaseEngine.runTest(
        COPY_IDMS_SUBSCHEMA_NAMES, ImmutableList.of(new CobolText("SUBSCHEMA-NAMES", IdmsDialect.NAME, "")), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyWithComments() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS1, ImmutableList.of(new CobolText(CB_NAME1, IdmsDialect.NAME, COMMENTED_TEXT + CB1, null, true)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyCleanup() {
    UseCaseEngine.runTest(
        TEXT + COPY_IDMS_WS1, ImmutableList.of(new CobolText(CB_NAME1, IdmsDialect.NAME,  CB7, null, true)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());
  }

  @Test
  void testIdmsCopyVariableLevel() throws Exception {
    AnalysisResult result = UseCaseEngine.runTest(
        TEXT + COPY_IDMS_LEVELS, ImmutableList.of(new CobolText(CB_NAME1, IdmsDialect.NAME, CB6)), ImmutableMap.of(), ImmutableList.of(), DialectConfigs.getIDMSAnalysisConfig());

    ElementaryItemNode copybookNode = result.getRootNode()
        .getDepthFirstStream()
        .filter(n -> n.getNodeType() == NodeType.VARIABLE)
        .filter(n -> n instanceof ElementaryItemNode)
        .map(ElementaryItemNode.class::cast)
        .filter(n -> n.getName().equals("SKILL-ID-0455"))
        .findFirst()
        .orElseThrow(Exception::new);

    assertEquals(6, copybookNode.getLevel());
  }

}
