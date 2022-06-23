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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * This test checks the positive scenario with building an extended document with correct positions
 * retrieval.
 */
class TestMappingWithMultiDefinitions {

  private static final String DOCUMENT =
      "       IDENTIFICATION DIVISION.\r\n"
          + "       PROGRAM-ID. TEST1.\r\n"
          + "       DATA DIVISION.\r\n"
          + "       WORKING-STORAGE SECTION.\r\n"
          + "       01 {$*PARENT}. COPY {~STRUC}.\r\n"
          + "       01 {$*PARENT2}. COPY {~STRUC}.\r\n"
          + "       COPY {~WITHNEST}.\r\n"
          + "       PROCEDURE DIVISION.\r\n"
          + "           PERFORM {#MAIN-LINE}.\r\n"
          + "       COPY {~PARS}.\r\n"
          + "       {#*MAIN-LINE}.\r\n"
          + "           MOVE 00 TO {$CHILD2} OF {$PARENT}.\r\n"
          + "           MOVE 00 TO {$CHILD3-NESTED} OF {$PARENT-NESTED} OF {$PARENT3}.\r\n"
          + "           PERFORM {#PAR1}.\r\n"
          + "           GOBACK.";

  private static final String STRUC =
      "           02  {$*CHILD1}         PIC 9   VALUE IS '0'.\r\n"
          + "           02  {$*CHILD2}         PIC 99.\r\n";

  private static final String WITHNEST =
      "       01 {$*PARENT3}.\r\n"
          + "           03  {$*CHILD3}         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY {~NESTED}.\r\n"
          + "           03  {$*CHILD4}         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY {~NESTED1}.\r\n"
          + "           03  {$*CHILD5}         PIC 9   VALUE IS '2'.\r\n";

  private static final String NESTED =
      "           03  {$*CHILD6}         PIC 99.\r\n"
          + "           03  {$*CHILD7}         PIC 9   VALUE IS '2'.\r\n";

  private static final String NESTED1 =
      "       03 {$*PARENT-NESTED}.\r\n"
          + "           04  {$*CHILD1-NESTED}         PIC 9   VALUE IS '2'.\r\n"
          + "           04  {$*CHILD2-NESTED}         PIC 9   VALUE IS '2'.\r\n"
          + "           COPY {~NESTED2}.\r\n";

  private static final String NESTED2 =
      "           04  {$*CHILD3-NESTED}         PIC 9   VALUE IS '2'.\r\n"
          + "           04  {$*CHILD4-NESTED}         PIC 9   VALUE IS '2'.\r\n";

  private static final String PARS =
      "       {#*PAR1}.\r\n"
          + "           IF {$CHILD1} OF {$PARENT} EQUAL TO 1\r\n"
          + "           THEN\r\n"
          + "               MOVE 10 TO {$CHILD2} OF {$PARENT}\r\n"
          + "           ELSE\r\n"
          + "               MOVE 11 TO {$CHILD2} OF {$PARENT}\r\n"
          + "           END-IF.\r\n";

  private static final String STRUC_NAME = "STRUC";
  private static final String WITHNEST_NAME = "WITHNEST";
  private static final String PARS_NAME = "PARS";
  private static final String NESTED_NAME = "NESTED";
  private static final String NESTED1_NAME = "NESTED1";
  private static final String NESTED2_NAME = "NESTED2";

  @Test
  void test() {
    UseCaseEngine.runTest(
        DOCUMENT,
        ImmutableList.of(
            new CobolText(STRUC_NAME, STRUC),
            new CobolText(WITHNEST_NAME, WITHNEST),
            new CobolText(NESTED_NAME, NESTED),
            new CobolText(NESTED1_NAME, NESTED1),
            new CobolText(NESTED2_NAME, NESTED2),
            new CobolText(PARS_NAME, PARS)),
        ImmutableMap.of());
  }
}
