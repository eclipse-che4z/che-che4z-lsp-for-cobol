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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import org.junit.Test;

import static java.util.Collections.singletonList;

/**
 * This test case checks that there is no semantic error when a variable structure is defined using
 * a copybook. Here COPYBOOK-CONTENT represents a copybook that has a variable definition with a
 * level 02. By idea this variable will be recognized as a child of PARENT variable. if not, there
 * will be an error thrown at CHILD OF PARENT statement.
 */
public class TestVariableStructureIsBuiltWithCopybooks extends PositiveUseCase {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       ENVIRONMENT DIVISION.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT1.  COPY COPYBOOK-CONTENT.\n"
          + "       01  PARENT2.  COPY COPYBOOK-CONTENT.\n"
          + "       PROCEDURE DIVISION.\n"
          + "           MAINLINE.\n"
          + "           MOVE 00 TO CHILD OF PARENT1.\n"
          + "           MOVE 00 TO CHILD OF PARENT2.\n"
          + "           GOBACK.";

  private static final String COPYBOOK_CONTENT = "       02 CHILD PIC X.";

  public TestVariableStructureIsBuiltWithCopybooks() {
    super(TEXT);
  }

  @Override
  @Test
  public void test() {
    super.test(singletonList(new CobolText("COPYBOOK-CONTENT", COPYBOOK_CONTENT)));
  }
}
