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
import org.eclipse.lsp4j.Range;
import org.junit.Test;

import java.util.Collections;
import java.util.List;

import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;
/**
 * This test check that the error is shown if the copybook that is used in the Cobol file contains a
 * link to itself.
 */
public class TestCopybookWithRecursiveDependencyIsDetected extends NegativeUseCase {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \r\n"
          + "        PROGRAM-ID. test1.\r\n"
          + "        DATA DIVISION.\r\n"
          + "        WORKING-STORAGE SECTION.\r\n"
          + "        COPY RECURSIVE-COPY.\n\n"
          + "        PROCEDURE DIVISION.\n\n";

  private static final String RECURSIVE_COPY = "        COPY RECURSIVE-COPY.";

  public TestCopybookWithRecursiveDependencyIsDetected() {
    super(TEXT);

    DataBusBroker databus =
        Guice.createInjector(new DatabusModule()).getInstance(DataBusBroker.class);

    MockCopybookServiceImpl copybookService = new MockCopybookServiceImpl(databus);
    copybookService.setCopybooks(
        () -> Collections.singletonList(new CobolText("RECURSIVE-COPY", RECURSIVE_COPY)));
  }

  @Override
  @Test
  public void test() {
    super.test(singletonList(new CobolText("RECURSIVE-COPY", RECURSIVE_COPY)));
  }

  @Override
  protected void assertRanges(List<Range> ranges) {
    Range range = ranges.get(0);
    assertEquals(4, range.getStart().getLine());
    assertEquals(13, range.getStart().getCharacter());
    assertEquals(4, range.getEnd().getLine());
    assertEquals(27, range.getEnd().getCharacter());
  }
}
