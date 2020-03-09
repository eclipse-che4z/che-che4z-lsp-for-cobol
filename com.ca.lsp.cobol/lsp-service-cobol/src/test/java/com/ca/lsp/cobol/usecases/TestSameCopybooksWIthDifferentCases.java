/*
 *
 *  * Copyright (c) 2020 Broadcom.
 *  *
 *  * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *  *
 *  * This program and the accompanying materials are made
 *  * available under the terms of the Eclipse Public License 2.0
 *  * which is available at https://www.eclipse.org/legal/epl-2.0/
 *  *
 *  * SPDX-License-Identifier: EPL-2.0
 *  *
 *  * Contributors:
 *  * Broadcom, Inc. - initial API and implementation
 *  *
 *
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
 * This test checks that there is no error thrown when there are several COPY statements onw by one
 * with one name in different cases.
 */
public class TestSameCopybooksWIthDifferentCases extends PositiveUseCase {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. TEST1.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  PARENT.   COPY STRUCT1.\n"
          + "       COPY Struct1.\n"
          + "       PROCEDURE DIVISION.\n"
          + "       MOVE 00 TO CHILD1 OF PARENT.";

  private static final String STRUCT1 =
      "       02  PARENT2.\n"
          + "           03  CHILD1         PIC 9   VALUE IS '0'.\n"
          + "           03  CHILD2         PIC 9   VALUE IS '1'.\n"
          + "           03  CHILD3         PIC 9   VALUE IS '2'.";

  public TestSameCopybooksWIthDifferentCases() {
    super(TEXT);

    DataBusBroker databus =
        Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);

    MockCopybookServiceImpl copybookService = new MockCopybookServiceImpl(databus);
    copybookService.setCopybooks(
        () -> Collections.singletonList(new CobolText("STRUCT1", STRUCT1)));
  }

  @Override
  @Test
  public void test() {
    super.test(singletonList(new CobolText("STRUCT1", STRUCT1)));
  }
}
