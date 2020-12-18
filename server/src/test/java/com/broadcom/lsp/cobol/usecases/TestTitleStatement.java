package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks that the title before and after IDENTIFICATION DIVISION processed successfully
 */
class TestTitleStatement {
  private static final String TEXT1 =
      "        IDENTIFICATION DIVISION.\n"
          + "          PROGRAM-ID. TITLETEST.\n"
          + "          DATA DIVISION.\n";

  private static final String TEXT2 =
            "          WORKING-STORAGE SECTION.\n"
          + "          PROCEDURE DIVISION.\n";

  private static final String TITLE = "                TITLE 'title'. \n";
  private static final String END = "          END PROGRAM 'TITLETEST'. \n";

  @Test
  void testTitleBeforeIdDivision() {
    UseCaseEngine.runTest(TITLE + TEXT1 + TEXT2 + END, List.of(), Map.of());
  }

  @Test
  void testTitleAfterDataDivision() {
    UseCaseEngine.runTest(TEXT1 + TITLE + TEXT2 + END, List.of(), Map.of());
  }

  @Test
  void testTitleAfterProcedureDivision() {
    UseCaseEngine.runTest(TEXT1 + TEXT2 + TITLE + END, List.of(), Map.of());
  }

}
