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

import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.mocks.MockCopybookServiceImpl;
import com.google.inject.Guice;
import org.junit.Test;

import java.util.Collections;

import static java.util.Collections.singletonList;

/**
 * This test verifies that the variable structure can be built correctly with copybooks and that
 * error is not thrown if there are no ambiguous definitions, even with skipped hierarchical levels
 * on usage.
 */
public class TestVariableStructureInCopybooksWithMissingLevels extends PositiveUseCase {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT.";

  private static final String STRUCT =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";

  public TestVariableStructureInCopybooksWithMissingLevels() {
    super(TEXT);

    DataBusBroker databus =
        Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);

    MockCopybookServiceImpl copybookService = new MockCopybookServiceImpl(databus);
    copybookService.setCopybooks(() -> Collections.singletonList(new CobolText("STRUCT", STRUCT)));
  }

  @Override
  @Test
  public void test() {
    super.test(singletonList(new CobolText("STRUCT", STRUCT)));
  }
}
