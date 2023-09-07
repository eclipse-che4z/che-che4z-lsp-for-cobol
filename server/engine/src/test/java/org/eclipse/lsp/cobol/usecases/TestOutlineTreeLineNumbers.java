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

import com.google.common.collect.ImmutableMap;
import lombok.Value;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.service.utils.BuildOutlineTreeFromSyntaxTree;
import org.eclipse.lsp.cobol.test.engine.UseCase;
import org.eclipse.lsp.cobol.test.engine.UseCaseUtils;
import org.eclipse.lsp4j.DocumentSymbol;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks that Outline tree has correct lines numbers for elements */
class TestOutlineTreeLineNumbers {
  private static final String TEXT =
      "01     COPY BAR.\n"
          + "02     IDENTIFICATION DIVISION.\n"
          + "02     PROGRAM-ID. TEST.\n"
          + "03     DATA DIVISION.\n"
          + "04     WORKING-STORAGE SECTION.\n"
          + "05     01 STRUCTNAME.\n"
          + "06     03 VARNAME  PIC X(20).";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseUtils.analyze(
            UseCase.builder().text(TEXT).copybook(new CobolText("BAR", "")).build());

    Map<String, LineRange> expectedRanges =
        new ImmutableMap.Builder<String, LineRange>()
            .put("COPY BAR", new LineRange(0, 0))
            .put("PROGRAM: TEST", new LineRange(1, 6))
            .put("IDENTIFICATION DIVISION", new LineRange(1, 2))
            .put("PROGRAM-ID TEST", new LineRange(2, 2))
            .put("DATA DIVISION", new LineRange(3, 6))
            .put("LINKAGE SECTION", new LineRange(3, 6))
            .put("WORKING-STORAGE SECTION", new LineRange(4, 6))
            .put("STRUCTNAME", new LineRange(5, 6))
            .put("VARNAME", new LineRange(6, 6))
            .build();
    assertEquals(
        expectedRanges,
        extractLineRange(
            BuildOutlineTreeFromSyntaxTree.convert(
                result.getRootNode(), result.getRootNode().getLocality().getUri())));
  }

  @Test
  void testWhenCicsTranslateIsDisabled() {
    AnalysisResult result =
            UseCaseUtils.analyze(
                    UseCase.builder().text(TEXT).cicsTranslator(false).copybook(new CobolText("BAR", "")).build());

    Map<String, LineRange> expectedRanges =
            new ImmutableMap.Builder<String, LineRange>()
                    .put("COPY BAR", new LineRange(0, 0))
                    .put("PROGRAM: TEST", new LineRange(1, 6))
                    .put("IDENTIFICATION DIVISION", new LineRange(1, 2))
                    .put("PROGRAM-ID TEST", new LineRange(2, 2))
                    .put("DATA DIVISION", new LineRange(3, 6))
                    .put("WORKING-STORAGE SECTION", new LineRange(4, 6))
                    .put("STRUCTNAME", new LineRange(5, 6))
                    .put("VARNAME", new LineRange(6, 6))
                    .build();
    assertEquals(
            expectedRanges,
            extractLineRange(
                    BuildOutlineTreeFromSyntaxTree.convert(
                            result.getRootNode(), result.getRootNode().getLocality().getUri())));
  }

  private Map<String, LineRange> extractLineRange(List<DocumentSymbol> documentSymbols) {
    Map<String, LineRange> result = new HashMap<>();
    for (DocumentSymbol documentSymbol : documentSymbols) {
      result.put(
          documentSymbol.getName(),
          new LineRange(
              documentSymbol.getRange().getStart().getLine(),
              documentSymbol.getRange().getEnd().getLine()));
      result.putAll(extractLineRange(documentSymbol.getChildren()));
    }
    return result;
  }

  @Value
  private static class LineRange {
    int start;
    int stop;
  }
}
