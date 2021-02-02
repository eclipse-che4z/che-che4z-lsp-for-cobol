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

import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.Value;
import org.eclipse.lsp4j.DocumentSymbol;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that Outline tree has correct lines numbers for elements */
public class TestOutlineTreeLineNumbers {
  private static final String TEXT =
      "00     IDENTIFICATION DIVISION.\n"
          + "01     DATA DIVISION.\n"
          + "02     WORKING-STORAGE SECTION.\n"
          + "03     01 STRUCTNAME.\n"
          + "04     03 VARNAME  PIC X(20).\n"
          + "05     COPY BAR.";

  @Test
  void test() {
    AnalysisResult result = UseCaseUtils.analyze(UseCaseUtils.DOCUMENT_URI, TEXT, ImmutableList.of(
        new CobolText("BAR", "")
    ));
    Map<String, LineRange> expectedRanges = new ImmutableMap.Builder<String, LineRange>()
        .put("PROGRAM", new LineRange(0, 4))
        .put("IDENTIFICATION DIVISION", new LineRange(0, 0))
        .put("DATA DIVISION", new LineRange(1, 4))
        .put("WORKING-STORAGE SECTION", new LineRange(2, 4))
        .put("STRUCTNAME", new LineRange(3, 4))
        .put("VARNAME", new LineRange(4, 4))
        .put("COPY BAR", new LineRange(5, 5))
        .build();
    assertEquals(expectedRanges, extractLineRange(result.getOutlineTree()));
  }

  private Map<String, LineRange> extractLineRange(List<DocumentSymbol> documentSymbols) {
    Map<String, LineRange> result = new HashMap<>();
    for (DocumentSymbol documentSymbol: documentSymbols) {
      result.put(documentSymbol.getName(),
          new LineRange(documentSymbol.getRange().getStart().getLine(), documentSymbol.getRange().getEnd().getLine()));
      result.putAll(extractLineRange(documentSymbol.getChildren()));
    }
    return result;
  }

  @Value
  private class LineRange {
    int start;
    int stop;
  }
}
