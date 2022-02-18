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
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.utils.BuildOutlineTreeFromSyntaxTree;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
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
            .put("COPY BAR#COBOL", new LineRange(0, 0))
            .put("PROGRAM", new LineRange(1, 5))
            .put("IDENTIFICATION DIVISION", new LineRange(1, 1))
            .put("DATA DIVISION", new LineRange(2, 5))
            .put("WORKING-STORAGE SECTION", new LineRange(3, 5))
            .put("STRUCTNAME", new LineRange(4, 5))
            .put("VARNAME", new LineRange(5, 5))
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
