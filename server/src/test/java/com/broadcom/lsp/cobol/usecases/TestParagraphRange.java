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

import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that performing defined paragraph processed with correct paragraph range */
class TestParagraphRange {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TEST1.\n"
          + "          DATA DIVISION.\n"
          + "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n"
          + "            PERFORM {#GET-DATA}.\n"
          + "            STOP RUN.\n"
          + "          {#*GET-DATA}.\n"
          + "            DISPLAY \"\".\n"
          + "            DISPLAY \"\".\n"
          + "            DISPLAY \"\".\n"
          + "            DISPLAY \"\".";

  @Test
  void test() {
      AnalysisResult analysisResult = UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), ImmutableList.of(), CopybookProcessingMode.ENABLED);
      Map<String, List<Location>> ranges = analysisResult.getParagraphRange();
      assertThat(ranges.size(), equalTo(1));

      Location location = ranges.get("GET-DATA").get(0);
      assertEquals(new Position(7, 10), location.getRange().getStart());
      assertEquals(new Position(11, 23), location.getRange().getEnd());
  }

}
